using EcommerceStore.Bff.Compras.Services.gRPC;
using EcommerceStore.Carrinho.API.Services.gRPC;
using EcommerceStore.WebApi.Core.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace EcommerceStore.Bff.Compras.Configuration
{
    public static class GrpcConfi
    {
        public static void ConfigureGrpcServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<GrpcServiceInterceptor>();

            services.AddScoped<ICarrinhoGrpcService, CarrinhoGrpcService>();

            services.AddGrpcClient<CarrinhoCompras.CarrinhoComprasClient>(options =>
            {
                options.Address = new Uri(configuration["CarrinhoUrl"]);
            })
            .AddInterceptor<GrpcServiceInterceptor>()
            .PermitirCertificadosAutoAssinados();
        }
    }
}
