using EcommerceStore.Identidade.API.Configuration;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Identidade.API
{
    // Packages instaladas
    // install-package microsoft.aspnetcore.authentication.jwtbearer -version 3.1.3
    // install-package microsoft.aspnetcore.identity.entityframeworkcore -version 3.1.3
    // install-package microsoft.aspnetcore.identity.UI -version 3.1.3
    // install-package microsoft.entityframeworkcore -version 3.1.3
    // install-package microsoft.entityframeworkcore.abstractions -version 3.1.3
    // install-package microsoft.entityframeworkcore.relational -version 3.1.3
    // install-package microsoft.entityframeworkcore.sqlserver -version 3.1.3
    // install-package microsoft.entityframeworkcore.tools -version 3.1.3
    // install-package swashbuckle.aspnetcore -version 5.3.3 ---- swagger
    // install-package Microsoft.AspNetCore.Authentication.JwtBearer -version 3.1.3
    // install-package EasyNetQ -version 5.1.1
    // install-package NetDevPack.Security.JwtSigningCredentials.Store.EntityFrameworkCore -verison 1.0.3
    // install-package NetDevPack.Security.JwtSigningCredentials.AspNetCore -verison 1.0.3

    public class Startup
    {
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
            services.AddConfigurationIdentity(Configuration);

            services.AddConfigurationApi();

            services.AddConfigurationSwagger();

            services.AddMessageBusConfiguraiton(Configuration);
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseConfigurationSwagger(env);

            app.UseConfigurationApi(env);
        }
    }
}
