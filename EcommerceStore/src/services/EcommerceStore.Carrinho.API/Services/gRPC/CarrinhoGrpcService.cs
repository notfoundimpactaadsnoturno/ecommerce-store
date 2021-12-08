using EcommerceStore.Carrinho.API.Data;
using EcommerceStore.Carrinho.API.Model;
using EcommerceStore.WebApi.Core.Usuario;
using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;

namespace EcommerceStore.Carrinho.API.Services.gRPC
{
    [Authorize]
    public class CarrinhoGrpcService : CarrinhoCompras.CarrinhoComprasBase
    {
        private readonly ILogger<CarrinhoGrpcService> _logger;
        private readonly IAspNetUser _aspNetUser;
        private readonly CarrinhoContext _context;

        public CarrinhoGrpcService(
            ILogger<CarrinhoGrpcService> logger,
            IAspNetUser aspNetUser,
            CarrinhoContext context)
        {
            _logger = logger;
            _aspNetUser = aspNetUser;
            _context = context;
        }

        public override async Task<CarrinhoClienteResponse> ObterCarrinho(ObterCarrinhoRequest request, ServerCallContext context)
        {
            _logger.LogInformation("Chamando obter carrinho por gRPC");

            var carrinho = await ObterCarrinhoCliente() ?? new CarrinhoCliente();

            var carrinhoProto = MapCarrinhoClienteToProtoResponse(carrinho);

            return carrinhoProto;
        }

        private async Task<CarrinhoCliente> ObterCarrinhoCliente()
        {
            return await _context.CarrinhoCliente
                .Include(carrinho => carrinho.Itens)
                .FirstOrDefaultAsync(carrinho => carrinho.ClienteId == _aspNetUser.ObterUserId());
        }

        private static CarrinhoClienteResponse MapCarrinhoClienteToProtoResponse(CarrinhoCliente carrinho)
        {
            var carrinhoProto = new CarrinhoClienteResponse
            {
                Id = carrinho.Id.ToString(),
                Clienteid = carrinho.ClienteId.ToString(),
                Valortotal = (double)carrinho.ValorTotal,
                Desconto = (double)carrinho.Desconto,
                Voucherutilizado = carrinho.VoucherUtilizado
            };

            if (carrinho.Voucher != null)
            {
                carrinhoProto.Voucher = new VoucherResponse
                {
                    Codigo = carrinho.Voucher.Codigo,
                    Percentual = (double?)carrinho.Voucher.Percentual ?? 0,
                    Valordesconto = (double?)carrinho.Voucher.ValorDesconto ?? 0,
                    Tipodesconto = (int)carrinho.Voucher.TipoDescontoVoucher
                };
            }

            foreach (var item in carrinho.Itens)
            {
                carrinhoProto.Itens.Add(new CarrinhoItemResponse
                {
                    Id = carrinho.Id.ToString(),
                    Nome = item.Nome,
                    Imagem = item.Imagem,
                    Produtoid = item.ProdutoId.ToString(),
                    Quantidade = item.Quantidade,
                    Valor = (double)item.Valor
                });
            }

            return carrinhoProto;
        }
    }
}
