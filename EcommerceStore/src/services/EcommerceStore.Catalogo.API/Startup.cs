using EcommerceStore.Catalogo.API.Configuraiton;
using EcommerceStore.Catalogo.API.Configuration;
using EcommerceStore.WebApi.Core.Identidade;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Catalogo.API
{
    public class Startup
    {
        // install-package microsoft.entityframeworkcore -version 3.1.3
        // install-package microsoft.entityframeworkcore.abstractions -version 3.1.3
        // install-package microsoft.entityframeworkcore.relational -version 3.1.3
        // install-package microsoft.entityframeworkcore.sqlserver -version 3.1.3
        // install-package microsoft.entityframeworkcore.design -version 3.1.3
        // install-package swashbuckle.aspnetcore -version 5.3.3

        public IConfiguration Configuration { get; }
        
        public Startup(IHostEnvironment hostEnvironment)
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

            services.AddMessageBusConfiguraiton(Configuration);

            services.RegisterServices();

            services.AddMemoryCache();

        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseConfigurationSwagger();

            app.UseConfigurationApi(env);
        }
    }
}
