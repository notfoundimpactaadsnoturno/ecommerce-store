using EcommerceStore.Pagamentos.API.Data;
using EcommerceStore.Pagamentos.API.Data.Repository;
using EcommerceStore.Pagamentos.API.Facade;
using EcommerceStore.Pagamentos.API.Models;
using EcommerceStore.Pagamentos.API.Service;
using EcommerceStore.WebApi.Core.Usuario;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace EcommerceStore.Pagamentos.API.Configuration
{
    public static class DependencyInjectionConfig
    {
        public static void RegisterServices(this IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IAspNetUser, AspNetUser>();

            services.AddScoped<IPagamentoService, PagamentoService>();
            services.AddScoped<IPagamentoFacade, PagamentoCartaoCreditoFacade>();

            services.AddScoped<IPagamentoRepository, PagamentoRepository>();
            services.AddScoped<PagamentosContext>();
        }
    }
}               
