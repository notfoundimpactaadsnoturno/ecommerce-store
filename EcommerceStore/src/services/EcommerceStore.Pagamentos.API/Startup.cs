using EcommerceStore.Pagamentos.API.Configuration;
using EcommerceStore.WebApi.Core.Identidade;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Pagamentos.API
{
    public class Startup
    {
        public Startup(IHostEnvironment hostEnvironment)
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

        public IConfiguration Configuration { get; }
        
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddConfigurationApi(Configuration);

            services.AddConfigurationJwt(Configuration);

            services.AddConfigurationSwagger(Configuration);

            services.RegisterServices();

            services.AddMessageBusConfiguraiton(Configuration);

            //services.AddMediatR(typeof(Startup));
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseConfigurationSwagger();

            app.UseConfigurationApi(env);
        }
    }
}
