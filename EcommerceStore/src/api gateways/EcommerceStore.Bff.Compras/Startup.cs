using EcommerceStore.Bff.Compras.Configuration;
using EcommerceStore.WebApi.Core.Identidade;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Bff.Compras
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IWebHostEnvironment hostEnvironment)
        {
            var builder = new ConfigurationBuilder()
               .SetBasePath(hostEnvironment.ContentRootPath)
               .AddJsonFile("appsettings.json", true, true)
               .AddJsonFile($"appsettings.{hostEnvironment.EnvironmentName}.json", true, true)
               .AddEnvironmentVariables();

            if (hostEnvironment.IsDevelopment())
                builder.AddUserSecrets<Startup>();

            Configuration = builder.Build();
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddConfigurationApi(Configuration);

            services.AddConfigurationJwt(Configuration);

            services.AddConfigurationSwagger(Configuration);

            services.RegisterServices();

            services.ConfigureGrpcServices(Configuration);

            services.AddMessageBusConfiguraiton(Configuration);
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseConfigurationSwagger();

            app.UseConfigurationApi(env);
        }
    }
}
