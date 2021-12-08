using EcommerceStore.Core.DomainObjects;
using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.MessageBus;
using EcommerceStore.Pagamentos.API.Models;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace EcommerceStore.Pagamentos.API.Service
{
    public class PagamentoIntegrationHandler : BackgroundService
    {
        private readonly IMessageBus _bus;
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<PagamentoIntegrationHandler> _logger;

        public PagamentoIntegrationHandler(
            IMessageBus bus,
            IServiceProvider serviceProvider,
            ILogger<PagamentoIntegrationHandler> logger)
        {
            _bus = bus;
            _serviceProvider = serviceProvider;
            _logger = logger;
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            SetResponder();
            SetSubscribers();
            return Task.CompletedTask;
        }

        private void SetResponder()
        {
            _bus.RespondAsync<PedidoIniciadoIntegrationEvent, ResponseMessage>(async request =>
                await AutorizarPagamento(request));
        }

        private void SetSubscribers()
        {
            _bus.SubscribeAsync<PedidoCanceladoIntegrationEvent>("PedidoCancelado", async request =>
            await CancelarPagamento(request));

            _bus.SubscribeAsync<PedidoBaixadoEstoqueIntegrationEvent>("PedidoBaixadoEstoque", async request =>
            await CapturarPagamento(request));
        }      
        private async Task<ResponseMessage> AutorizarPagamento(PedidoIniciadoIntegrationEvent message)
        {
            ResponseMessage response;

            using (var scope = _serviceProvider.CreateScope())
            {
                var pagamentoService = scope.ServiceProvider.GetRequiredService<IPagamentoService>();

                var pagamento = new Pagamento
                {
                    PedidoId = message.PedidoId,
                    TipoPagamento = (TipoPagamento)message.TipoPagamento,
                    Valor = message.Valor,
                    CartaoCredito = 
                        new CartaoCredito(message.NomeCartao, message.NumeroCartao, message.MesAnoVencimento, message.CVV)
                };

                response = await pagamentoService.AutorizarPagamento(pagamento);
            }

            return response;
        }

        private async Task CancelarPagamento(PedidoCanceladoIntegrationEvent message)
        {
            _logger.LogError($"Cancelando o pagamento do pedido {message.PedidoId}");
            using (var scope = _serviceProvider.CreateScope())
            {
                var pagamentoService = scope.ServiceProvider.GetRequiredService<IPagamentoService>();

                _logger.LogError($"Enviando para API cancelar");
                var response = await pagamentoService.CancelarPagamento(message.PedidoId);

                if (!response.ValidationResult.IsValid)
                    throw new DomainException($"Falha ao cancelar o pagamento do pedido {message.PedidoId}");
            }
        }

        private async Task CapturarPagamento(PedidoBaixadoEstoqueIntegrationEvent message)
        {
            using (var scope = _serviceProvider.CreateScope())
            {
                var pagamentoService = scope.ServiceProvider.GetRequiredService<IPagamentoService>();

                var response = await pagamentoService.CapturarPagamento(message.PedidoId);

                if (!response.ValidationResult.IsValid)
                    throw new DomainException($"Falha ao capturar o pagamento do pedido {message.PedidoId}");

                await _bus.PublishAsync(new PedidoPagoIntegrationEvent(message.ClienteId, message.PedidoId));
            }
        }
    }
}
