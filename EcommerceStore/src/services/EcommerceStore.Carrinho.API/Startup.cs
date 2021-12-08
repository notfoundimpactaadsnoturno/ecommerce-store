using EcommerceStore.Carrinho.API.Configuration;
using EcommerceStore.WebApi.Core.Identidade;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Carrinho.API
{
    // install-package microsoft.entityframeworkcore -version 3.1.3
    // install-package microsoft.entityframeworkcore.abstractions -version 3.1.3
    // install-package microsoft.entityframeworkcore.relational -version 3.1.3
    // install-package microsoft.entityframeworkcore.sqlserver -version 3.1.3
    // install-package microsoft.entityframeworkcore.design -version 3.1.3
    // install-package swashbuckle.aspnetcore -version 5.3.3
    // install-package mediatr.extensions.microsoft.dependencyinjection -version 8.0.0 -- para registrar o mediatr no startup

    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IWebHostEnvironment  hostEnvironment)
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
