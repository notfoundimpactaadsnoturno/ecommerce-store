using EcommerceStore.Catalogo.API.Services;
using EcommerceStore.Core.Utils;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using EcommerceStore.MessageBus;


namespace EcommerceStore.Catalogo.API.Configuration
{
    public static class MessageBusConfig
    {
        public static void AddMessageBusConfiguraiton(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddMessageBus(configuration.GetMessageQueueConnection("MessageBus"))
                .AddHostedService<CatalogoIntegrationHandler>(); 
        }
    }
}
