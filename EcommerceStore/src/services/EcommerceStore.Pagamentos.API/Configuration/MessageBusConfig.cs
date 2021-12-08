using EcommerceStore.Core.Utils;
using EcommerceStore.MessageBus;
using EcommerceStore.Pagamentos.API.Service;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace EcommerceStore.Pagamentos.API.Configuration
{
    public static class MessageBusConfig
    {
        public static void AddMessageBusConfiguraiton(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddMessageBus(configuration.GetMessageQueueConnection("MessageBus"))
                .AddHostedService<PagamentoIntegrationHandler>();                
        }
    }
}
