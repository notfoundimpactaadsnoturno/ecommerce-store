using EcommerceStore.WebApi.Core.Usuario;
using EcommerceStore.WebApp.MVC.Extensions;
using EcommerceStore.WebApp.MVC.Services;
using EcommerceStore.WebApp.MVC.Services.Handlers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.DataAnnotations;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Polly;
using Polly.Extensions.Http;
using Polly.Retry;
using System;
using System.Net.Http;

namespace EcommerceStore.WebApp.MVC.Configuration
{
    public static class DependencyInjectionConfig
    {
        public static void RegisterServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<IValidationAttributeAdapterProvider, CpfValidationAttributeAdapterProvider>();
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IAspNetUser, AspNetUser>();


            #region HttpServices
            
            services.AddTransient<HttpClientAuthorizationDelegatingHandler>();

            services.AddHttpClient<IAutenticacaoService, AutenticacaoService>()                                 
                .AddPolicyHandler(PollyExtensions.EsperarTentar())
                .AddTransientHttpErrorPolicy(policy => policy.CircuitBreakerAsync(5, TimeSpan.FromSeconds(30)));

            services.AddHttpClient<ICatalogoService, CatalogoService>()
                .AddHttpMessageHandler<HttpClientAuthorizationDelegatingHandler>()
                //.AddTransientHttpErrorPolicy(policy => policy.WaitAndRetryAsync(3, _ => TimeSpan.FromSeconds(600)));
                .AddPolicyHandler(PollyExtensions.EsperarTentar())
                .AddTransientHttpErrorPolicy(policy => policy.CircuitBreakerAsync(5, TimeSpan.FromSeconds(30)));            

            services.AddHttpClient<IClienteService, ClienteService>()
              .AddHttpMessageHandler<HttpClientAuthorizationDelegatingHandler>()
              .AddPolicyHandler(PollyExtensions.EsperarTentar())
              .AddTransientHttpErrorPolicy(policy => policy.CircuitBreakerAsync(5, TimeSpan.FromSeconds(30)));

            services.AddHttpClient<IComprasBffService, ComprasBffService>()
               .AddHttpMessageHandler<HttpClientAuthorizationDelegatingHandler>()
               .AddPolicyHandler(PollyExtensions.EsperarTentar())
               .AddTransientHttpErrorPolicy(policy => policy.CircuitBreakerAsync(5, TimeSpan.FromSeconds(30)));

            #region REFIT

            // Configuração de REFIT
            //services.AddHttpClient("Refit", options => 
            //{
            //    options.BaseAddress = new Uri(configuration.GetSection("CatalogoUrl").Value);
            //})
            //.AddHttpMessageHandler<HttpClientAuthorizationDelegatingHandler>()
            //.AddTypedClient(Refit.RestService.For<ICatalogoServiceRefit>);
            #endregion

            #endregion
        }
    }

    public static class PollyExtensions
    {
        public static AsyncRetryPolicy<HttpResponseMessage> EsperarTentar()
        {
            var retryWaitPolicy = HttpPolicyExtensions
                .HandleTransientHttpError()
                .WaitAndRetryAsync(new[]
                {
                    TimeSpan.FromSeconds(1),
                    TimeSpan.FromSeconds(5),
                    TimeSpan.FromSeconds(10)
                }, (outcome, timespan, retryCount, context) =>
                {
                    Console.ForegroundColor = ConsoleColor.Blue;
                    Console.WriteLine($"Tentando pela {retryCount} vez");
                    Console.ForegroundColor = ConsoleColor.White;
                });

            return retryWaitPolicy;
        }
    }
}
