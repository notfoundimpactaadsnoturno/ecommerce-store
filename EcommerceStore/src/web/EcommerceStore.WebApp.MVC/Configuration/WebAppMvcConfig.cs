using EcommerceStore.WebApp.MVC.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Localization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Globalization;
using System.IO;

namespace EcommerceStore.WebApp.MVC.Configuration
{
    public static class WebAppMvcConfig
    {
        public static void AddWebAppMvcConfig(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddControllersWithViews();

            services.AddDataProtection()
                .PersistKeysToFileSystem(new DirectoryInfo(@"/var/dpkeys/data_protection_keys/"))
                .SetApplicationName("EcommerceStore");

            services.Configure<ForwardedHeadersOptions>(options => 
            {
                options.ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
            });

            services.Configure<AppSettings>(configuration);
        }

        public static void UseWebAppMvcConfig(this IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseForwardedHeaders();

            //if (env.IsDevelopment())
            //{
            //    app.UseDeveloperExceptionPage();
            //}
            //else
            //{
                
            //}

            app.UseExceptionHandler("/erro/500");
            app.UseStatusCodePagesWithRedirects("/erro/{0}");
            app.UseHsts();

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthenticationMvcConfig();

            var supoortedCulteres = new[] { new CultureInfo("pt-BR") };
            app.UseRequestLocalization(new RequestLocalizationOptions 
            {
                DefaultRequestCulture = new RequestCulture("pt-BR"),
                SupportedCultures = supoortedCulteres,
                SupportedUICultures = supoortedCulteres
            });

            app.UseMiddleware<ExceptionsMiddleware>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Catalogo}/{action=Index}/{id?}");
            });
        }
    }
}
