using EcommerceStore.Core.DomainObjects;
using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.MessageBus;
using EcommerceStore.Pedidos.Domain.Pedidos;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.API.Services
{
    public class PedidoIntegrationHandler : BackgroundService
    {
        private readonly IMessageBus _bus;
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<PedidoIntegrationHandler> _logger;

        public PedidoIntegrationHandler(
            IMessageBus bus, 
            IServiceProvider serviceProvider,
            ILogger<PedidoIntegrationHandler> logger)
        {
            _bus = bus;
            _serviceProvider = serviceProvider;
            _logger = logger;
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            SetSubscribers();

            return Task.CompletedTask;
        }

        private void SetSubscribers()
        {
            _bus.SubscribeAsync<PedidoCanceladoIntegrationEvent>("PedidoCancelado", async request =>
            await CancelarPedido(request));

            _bus.SubscribeAsync<PedidoPagoIntegrationEvent>("PedidoPago", async request =>
            await FinalizarPedido(request));
        }     

        private async Task CancelarPedido(PedidoCanceladoIntegrationEvent message)
        {
            _logger.LogError($"Inicio de cancelamento de pedido");
            using (var scope = _serviceProvider.CreateScope())
            {
                var pedidoRepository = scope.ServiceProvider.GetRequiredService<IPedidoRepository>();

                _logger.LogError($"Obtendo Id para cancelar");
                var pedido = await pedidoRepository.ObterPorId(message.PedidoId);

                _logger.LogError($"Pedido cancelado");
                pedido.CancelarPedido();

                _logger.LogError($"Atualizando no banco de dados");
                pedidoRepository.Atualizar(pedido);

                _logger.LogError($"Comitando a transação");
                if (!await pedidoRepository.UnitOfWork.Commit())
                {
                    throw new DomainException($"Problemas ao Cancelar o pedido {message.PedidoId}");
                }
            }
        }

        private async Task FinalizarPedido(PedidoPagoIntegrationEvent message)
        {
            using (var scope = _serviceProvider.CreateScope())
            {
                var pedidoRepository = scope.ServiceProvider.GetRequiredService<IPedidoRepository>();

                var pedido = await pedidoRepository.ObterPorId(message.PedidoId);
                pedido.FinalizarPedido();

                pedidoRepository.Atualizar(pedido);

                if(!await pedidoRepository.UnitOfWork.Commit())
                {
                    throw new DomainException($"Problemas ao finalizar o pedido {message.PedidoId}");
                }
            }
        }
    }
}
