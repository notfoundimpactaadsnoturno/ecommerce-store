using Microsoft.Extensions.DependencyInjection;
using System;
using System.Net.Http;

namespace EcommerceStore.WebApi.Core.Extensions
{
    public static class HttpExtensions
    {
        public static IHttpClientBuilder PermitirCertificadosAutoAssinados(this IHttpClientBuilder builder)
        {
            if (builder == null)
            {
                throw new ArgumentException(nameof(builder));
            }

            return builder.ConfigureHttpMessageHandlerBuilder(builder =>
            {
                builder.PrimaryHandler =
                        new HttpClientHandler { ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator };
            });
        }
    }
}
