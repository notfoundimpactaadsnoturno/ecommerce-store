using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EcommerceStore.Core.Messages;
using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.MessageBus;
using EcommerceStore.Pedidos.API.Application.DTO;
using EcommerceStore.Pedidos.API.Application.Events;
using EcommerceStore.Pedidos.Domain.Pedidos;
using EcommerceStore.Pedidos.Domain.Vouchers;
using EcommerceStore.Pedidos.Domain.Vouchers.Specs;
using FluentValidation.Results;
using MediatR;

namespace EcommerceStore.Pedidos.API.Application.Commands
{
    public class PedidoCommandHandler : CommandHandlerBase,
        IRequestHandler<AdicionarPedidoCommand, ValidationResult>
    {
        private readonly IVoucherRepository _voucherRepository;
        private readonly IPedidoRepository _pedidoRepository;
        private readonly IMessageBus _bus;

        public PedidoCommandHandler(
            IVoucherRepository voucherRepository,
            IPedidoRepository pedidoRepository,
            IMessageBus bus)
        {
            _voucherRepository = voucherRepository;
            _pedidoRepository = pedidoRepository;
            _bus = bus;
        }

        public async Task<ValidationResult> Handle(AdicionarPedidoCommand message, CancellationToken cancellationToken)
        {
            // Validação do comando
            if (!message.EhValido()) return message.ValidationResult;

            // Mapear pedido
            var pedido = MapearPedido(message);

            // Aplicar voucher se houver
            if (!await AplicarVoucher(message, pedido)) return ValidationResult;

            // validar Pedido
            if (!ValidarPedido(pedido)) return ValidationResult;

            // Processar Pagamento
            if (!await ProcessarPagamento(pedido, message)) return ValidationResult;

            // Se pagamento ok 
            pedido.AutorizarPedido();

            // Adicionar evento
            pedido.AdicionarEvento(new PedidoRealizadoEvent(pedido.Id, pedido.ClienteId));

            // Adicionar Pedido Repositorio
            _pedidoRepository.Adicionar(pedido);

            // Persistir dados do pedido e voucher
            return await PersistirDados(_pedidoRepository.UnitOfWork);
        }

        private Pedido MapearPedido(AdicionarPedidoCommand message)
        {
            var endereco = new Endereco
            {
                Logradouro = message.Endereco.Logradouro,
                Numero = message.Endereco.Numero,
                Complemento = message.Endereco.Complemento,
                Bairro = message.Endereco.Bairro,
                Cep = message.Endereco.Cep,
                Cidade = message.Endereco.Cidade,
                Estado = message.Endereco.Estado
            };

            var pedido = new Pedido(message.ClienteId, message.ValorTotal, message.PedidoItens.Select(PedidoItemDTO.ParaPedidoItem).ToList(), message.VoucherUtilizado, message.Desconto);

            pedido.AtribuirEndereco(endereco);

            return pedido;
        }

        private async Task<bool> AplicarVoucher(AdicionarPedidoCommand message, Pedido pedido)
        {
            if (!message.VoucherUtilizado) return true;

            var voucher = await _voucherRepository.ObterVoucherPorCodigo(message.VoucherCodigo);
            if (voucher == null)
            {
                AdicionarErro("O voucher informado não existe");
                return false;
            }

            var voucherValidation = new VoucherValidation().Validate(voucher);
            if (!voucherValidation.IsValid)
            {
                voucherValidation.Errors.ToList().ForEach(v => AdicionarErro(v.ErrorMessage));
                return false;
            }

            pedido.AtribuirVoucher(voucher);
            voucher.DebitarQuantidade();

            _voucherRepository.Atualizar(voucher);

            return true;
        }

        private bool ValidarPedido(Pedido pedido)
        {
            var pedidoValorOriginal = pedido.ValorTotal;
            var pedidoDesconto = pedido.Desconto;

            pedido.CalcularValorPedido();

            if (pedido.ValorTotal != pedidoValorOriginal)
            {
                AdicionarErro("O valor total do pedido não confere com o cáluclo do pedido");
                return false;
            }

            if (pedido.Desconto != pedidoDesconto)
            {
                AdicionarErro("O valor total não confere com o cáluclo do pedido");
                return false;
            }

            return true;
        }

        public async Task<bool> ProcessarPagamento(Pedido pedido, AdicionarPedidoCommand message)
        {
            var pedidoIniciado = new PedidoIniciadoIntegrationEvent
            {
                PedidoId = pedido.Id,
                ClienteId = pedido.ClienteId,
                Valor = pedido.ValorTotal,
                TipoPagamento = 1, // Alterar se tiver mais tipos
                NomeCartao = message.NomeCartao,
                NumeroCartao = message.NumeroCartao,
                MesAnoVencimento = message.ExpiracaoCartao,
                CVV = message.CvvCartao
            };

            var result = await _bus
                .RequestAsync<PedidoIniciadoIntegrationEvent, ResponseMessage>(pedidoIniciado);

            if (result.ValidationResult.IsValid) return true;

            foreach (var erro in result.ValidationResult.Errors)
            {
                AdicionarErro(erro.ErrorMessage);
            }

            return false;
        }
    }
}
