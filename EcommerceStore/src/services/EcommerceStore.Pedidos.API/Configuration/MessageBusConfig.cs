using EcommerceStore.Core.Utils;
using EcommerceStore.MessageBus;
using EcommerceStore.Pedidos.API.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace EcommerceStore.Pedidos.API.Configuration
{
    public static class MessageBusConfig
    {
        public static void AddMessageBusConfiguraiton(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddMessageBus(configuration.GetMessageQueueConnection("MessageBus"))
                .AddHostedService<PedidoOrquestradorIntegrationHandler>()
                .AddHostedService<PedidoIntegrationHandler>();
        }
    }
}
