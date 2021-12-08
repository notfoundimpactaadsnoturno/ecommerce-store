using EcommerceStore.Identidade.API.Data;
using EcommerceStore.Identidade.API.Extensions;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NetDevPack.Security.JwtSigningCredentials;

namespace EcommerceStore.Identidade.API.Configuration
{
    public static class IdentityConfig
    {
        public static IServiceCollection AddConfigurationIdentity(this IServiceCollection services, IConfiguration configuration)
        {
            var appSettingsSection = configuration.GetSection("AppTokenSettings");
            services.Configure<AppTokenSettings>(appSettingsSection);

            services.AddJwksManager(options => options.Algorithm =  Algorithm.ES256)
                .PersistKeysToDatabaseStore<ApplicationDbContext>();

            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

            services.AddDefaultIdentity<IdentityUser>()
                .AddRoles<IdentityRole>()
                .AddErrorDescriber<IdentityMensagensPortugues>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();

            // Removido esta configuração devido a mudar a forma de autenticação para JWKS
            // utilizando um biblioteca que controla a geração deste token
            //services.AddConfigurationJwt(configuration);

            return services;
        }
    }
}
