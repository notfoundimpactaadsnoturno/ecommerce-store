using EcommerceStore.Identidade.API.Services;
using EcommerceStore.WebApi.Core.Identidade;
using EcommerceStore.WebApi.Core.Usuario;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using NetDevPack.Security.JwtSigningCredentials.AspNetCore;

namespace EcommerceStore.Identidade.API.Configuration
{
    public static class ApiConfig
    {
        public static IServiceCollection AddConfigurationApi(this IServiceCollection services)
        {
            services.AddControllers();

            services.AddScoped<AuthenticationService>();

            services.AddScoped<IAspNetUser, AspNetUser>();

            return services;
        }

        public static IApplicationBuilder UseConfigurationApi(this IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseConfigurationAuth();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseJwksDiscovery();

            return app;
        }
    }
}
