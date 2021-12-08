using EcommerceStore.Core.DomainObjects;
using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.Pagamentos.API.Facade;
using EcommerceStore.Pagamentos.API.Models;
using FluentValidation.Results;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.Pagamentos.API.Service
{
    public class PagamentoService : IPagamentoService
    {
        private readonly IPagamentoFacade _pagamentoFacade;
        private readonly IPagamentoRepository _pagamentoRepository;
        private readonly ILogger<PagamentoService> _logger;

        public PagamentoService(
            IPagamentoFacade pagamentoFacade, 
            IPagamentoRepository pagamentoRepository,
            ILogger<PagamentoService> logger)
        {
            _pagamentoFacade = pagamentoFacade;
            _pagamentoRepository = pagamentoRepository;
            _logger = logger;
        }

        public async Task<ResponseMessage> AutorizarPagamento(Pagamento pagamento)
        {
            var transacao = await _pagamentoFacade.AutorizarPagamento(pagamento);

            var validationResult = new ValidationResult();

            if(transacao.Status != StatusTransacao.Autorizado)
            {
                validationResult.Errors.Add(new ValidationFailure("Pagamento",
                    "Pagamento recusado, entre em contato com sua operado de cartão"));

                return new ResponseMessage(validationResult);
            }

            pagamento.AdicionarTransacao(transacao);

            _pagamentoRepository.AdicionarPagamento(pagamento);

            if(!await _pagamentoRepository.UnitOfWork.Commit())
            {
                validationResult.Errors.Add(new ValidationFailure("Pagamento",
                    "Houve um erro ao realizar o pagamento"));

                //TODO: Comunicar com o gateway para realizar estorno.

                return new ResponseMessage(validationResult);
            }

            return new ResponseMessage(validationResult);
        }

        public async Task<ResponseMessage> CapturarPagamento(Guid pedidoId)
        {
            var transacoes = await _pagamentoRepository.ObterTransacaoesPorPedidoId(pedidoId);

            var transacaoAutorizada = transacoes?.FirstOrDefault(tr => tr.Status == StatusTransacao.Autorizado);
            var validationResult = new ValidationResult();

            if(transacaoAutorizada == null) throw new DomainException($"Transação não encontrada para o pedido {pedidoId}");

            var transacao = await _pagamentoFacade.CapturarPagamento(transacaoAutorizada);

            if(transacao.Status != StatusTransacao.Pago)
            {
                validationResult.Errors.Add(new ValidationFailure("Pagamento",
                    $"Não foi possível capturar o pagamento do pedido {pedidoId}"));

                return new ResponseMessage(validationResult);
            }

            transacao.PagamentoId = transacaoAutorizada.PagamentoId;
            _pagamentoRepository.AdicionarTransacao(transacao);

            if(! await _pagamentoRepository.UnitOfWork.Commit())
            {
                validationResult.Errors.Add(new ValidationFailure("Pagamento",
                    $"Não foi possível persistir a captura do pagamento do pedido {pedidoId}"));

                return new ResponseMessage(validationResult);
            }

            return new ResponseMessage(validationResult);
        }

        public async Task<ResponseMessage> CancelarPagamento(Guid pedidoId)
        {
            _logger.LogInformation("Iniciando processo de cancelamento de transação");

            _logger.LogInformation("Obtendo Id da transação");
            var transacoes = await _pagamentoRepository.ObterTransacaoesPorPedidoId(pedidoId);

            var transacaoAutorizada = transacoes?.FirstOrDefault(t => t.Status == StatusTransacao.Autorizado);

            var validationResult = new ValidationResult();

            _logger.LogInformation("Validando id da transação");
            if (transacaoAutorizada == null) throw new DomainException($"Transação não encontrada para o pedido {pedidoId}");

            _logger.LogInformation("Chamando facade de cancelamento de pagamento");
            var transacao = await _pagamentoFacade.CancelarAutorizacao(transacaoAutorizada);

            if (transacao.Status != StatusTransacao.Cancelado)
            {
                validationResult.Errors.Add(new ValidationFailure("Pagamento",
                    $"Não foi possível cancelar o pagamento do pedido {pedidoId}"));

                return new ResponseMessage(validationResult);
            }

            _logger.LogInformation("Adicionando transação cancelada");
            transacao.PagamentoId = transacaoAutorizada.PagamentoId;
            _pagamentoRepository.AdicionarTransacao(transacao);


            _logger.LogInformation("Comitando a transação cancelada");
            if (!await _pagamentoRepository.UnitOfWork.Commit())
            {
                validationResult.Errors.Add(new ValidationFailure("Pagamento",
                    $"Não foi possível persistir o cancelamento do pagamento do pedido {pedidoId}"));

                return new ResponseMessage(validationResult);
            }

            return new ResponseMessage(validationResult);
        }     
    }
}
