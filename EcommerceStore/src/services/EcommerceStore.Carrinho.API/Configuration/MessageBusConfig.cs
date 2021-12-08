using EcommerceStore.Carrinho.API.Services;
using EcommerceStore.Core.Utils;
using EcommerceStore.MessageBus;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace EcommerceStore.Carrinho.API.Configuration
{
    public static class MessageBusConfig
    {
        public static void AddMessageBusConfiguraiton(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddMessageBus(configuration.GetMessageQueueConnection("MessageBus"))
                .AddHostedService<CarrinhoIntegrationHandler>();
        }
    }
}
