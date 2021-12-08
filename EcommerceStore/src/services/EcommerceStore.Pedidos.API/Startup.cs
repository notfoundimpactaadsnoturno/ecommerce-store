using EcommerceStore.Pedidos.API.Configuration;
using EcommerceStore.WebApi.Core.Identidade;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Pedidos.API
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IWebHostEnvironment hostEnvironment)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(hostEnvironment.ContentRootPath)
                .AddJsonFile("appsettings.json")
                .AddJsonFile($"appsettings.{hostEnvironment.EnvironmentName}.json")
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
            
            services.AddMediatR(typeof(Startup));

            services.RegisterServices();

            services.AddMessageBusConfiguraiton(Configuration);
        }
        
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseConfigurationSwagger();

            app.UseConfigurationApi(env);
        }
    }
}
