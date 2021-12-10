using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using NetDevPack.Security.JwtExtensions;
using System.Net.Http;
using System.Text;

namespace EcommerceStore.WebApi.Core.Identidade
{
    public static class JwtConfig
    {
        public static void AddConfigurationJwt(this IServiceCollection services, IConfiguration configuration)
        {
            // JWT
            var appSettingsSection = configuration.GetSection("AppSettings");
            services.Configure<AppSettings>(appSettingsSection);

            var appSettings = appSettingsSection.Get<AppSettings>();
            // Autenticação JWT Padrão
            //var key = Encoding.ASCII.GetBytes(appSettings.Secret);

            services.AddAuthentication(optins =>
            {
                optins.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                optins.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(bearerOptions =>
            {
                bearerOptions.RequireHttpsMetadata = false;
                bearerOptions.BackchannelHttpHandler = new HttpClientHandler { ServerCertificateCustomValidationCallback = delegate { return true; }};
                bearerOptions.SaveToken = true;
                // Utilização de JWKS
                bearerOptions.SetJwksOptions(new JwkOptions(appSettings.AutenticacaoJwksUrl));

                // Autenticação JWT Padrão
                //bearerOptions.TokenValidationParameters = new TokenValidationParameters
                //{
                //    ValidateIssuerSigningKey = true,
                //    IssuerSigningKey = new SymmetricSecurityKey(key),
                //    ValidateIssuer = true,
                //    ValidateAudience = true,
                //    ValidAudience = appSettings.ValidaEm,
                //    ValidIssuer = appSettings.Emissor
                //};
            });
        }

        public static void UseConfigurationAuth(this IApplicationBuilder app)
        {
            app.UseAuthentication();
            app.UseAuthorization();
        }
    }
}
