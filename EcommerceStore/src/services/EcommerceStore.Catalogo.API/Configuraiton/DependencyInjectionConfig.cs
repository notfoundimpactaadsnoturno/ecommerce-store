using EcommerceStore.Catalogo.API.Data;
using EcommerceStore.Catalogo.API.Data.Repository;
using EcommerceStore.Catalogo.API.Models;
using Microsoft.Extensions.DependencyInjection;

namespace EcommerceStore.Catalogo.API.Configuraiton
{
    public static class DependencyInjectionConfig
    {
        public static void RegisterServices(this IServiceCollection services)
        {
            services.AddScoped<IProdutoRepository, ProdutoRepository>();
            services.AddScoped<CatalogoContext>();
        }
    }
}
