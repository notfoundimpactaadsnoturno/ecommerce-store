using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using System;

namespace EcommerceStore.Identidade.API.Configuration
{
    public static class SwaggerConfig
    {
        public static IServiceCollection AddConfigurationSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(swagger =>
            {
                swagger.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "Ecommerce 404 not found API Identidade",
                    Description = "Está api é responsável pela autenticação",
                    Contact = new OpenApiContact() { Name = "404-NotFound", Email = "404notfound@gmail.com" },
                    License = new OpenApiLicense() { Name = "MIT", Url = new Uri("https://opensource.org/licenses/MIT") }
                });
            });

            return services;
        }

        public static IApplicationBuilder UseConfigurationSwagger(this IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSwagger();
            app.UseSwaggerUI(swagger =>
            {
                swagger.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
            });

            return app;
        }
    }
}
