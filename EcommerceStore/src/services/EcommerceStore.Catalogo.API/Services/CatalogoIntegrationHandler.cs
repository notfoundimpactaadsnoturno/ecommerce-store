using EcommerceStore.Catalogo.API.Models;
using EcommerceStore.Core.DomainObjects;
using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.MessageBus;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace EcommerceStore.Catalogo.API.Services
{
    public class CatalogoIntegrationHandler : BackgroundService
    {
        private readonly IMessageBus _bus;
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<CatalogoIntegrationHandler> _logger;

        public CatalogoIntegrationHandler(
            IMessageBus bus, 
            IServiceProvider serviceProvider,
            ILogger<CatalogoIntegrationHandler> logger)
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
            _bus.SubscribeAsync<PedidoAutorizadoIntegrationEvent>("PedidoAutorizado", async request => 
            await BaixarEstoque(request));
        }

        private async Task BaixarEstoque(PedidoAutorizadoIntegrationEvent message)
        {
            _logger.LogInformation($"Baixando estoque do pedido {message.PedidoId}");
            using (var scope = _serviceProvider.CreateScope())
            {
                var produtosComEstoque = new List<Produto>();
                var produtoRepository = scope.ServiceProvider.GetRequiredService<IProdutoRepository>();
                var idsProdutos = string.Join(",", message.Itens.Select(item => item.Key));
                var produtos = await produtoRepository.ObterPordutosPorId(idsProdutos);

                _logger.LogInformation($"Validando quantidade de produtos");
                if (produtos.Count != message.Itens.Count)
                {
                    CancelarPedidoSemEstoque(message);
                    return;
                }

                _logger.LogInformation($"Validando se há estouqe para os produtos");
                foreach (var produto in produtos)
                {
                    var quantidadeProduto = message.Itens.FirstOrDefault(prod => prod.Key == produto.Id).Value;
                    if (produto.EstaDisponivel(quantidadeProduto))
                    {
                        produto.RetirarEstoque(quantidadeProduto);
                        produtosComEstoque.Add(produto);
                    }
                }

                if(produtosComEstoque.Count != message.Itens.Count)
                {
                    _logger.LogError($"Não há estoque suficiente cancelar pedido");
                    CancelarPedidoSemEstoque(message);
                    return;
                }

                foreach (var produto in produtosComEstoque)                
                    produtoRepository.Atualizar(produto);                

                if(!await produtoRepository.UnitOfWork.Commit())                
                    throw new DomainException($"Problemas ao atualizar estoque do pedido {message.PedidoId}");                

                var pedidoBaixado = new PedidoBaixadoEstoqueIntegrationEvent(message.ClienteId, message.PedidoId);

                await _bus.PublishAsync(pedidoBaixado);
            }
        }

        private async void CancelarPedidoSemEstoque(PedidoAutorizadoIntegrationEvent message)
        {
            _logger.LogError($"Lançando evento de pedido cancelado");
            var pedidoCancelado = new PedidoCanceladoIntegrationEvent(message.ClienteId, message.PedidoId);

            await _bus.PublishAsync(pedidoCancelado);
        }
    }
}
