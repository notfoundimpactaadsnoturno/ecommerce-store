using EcommerceStore.Carrinho.API.Data;
using EcommerceStore.WebApi.Core.Usuario;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace EcommerceStore.Carrinho.API.Configuration
{
    public static class DependencyInjectionConfig
    {
        public static void RegisterServices(this IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IAspNetUser, AspNetUser>();
            services.AddDbContext<CarrinhoContext>();
        }
    }
}
