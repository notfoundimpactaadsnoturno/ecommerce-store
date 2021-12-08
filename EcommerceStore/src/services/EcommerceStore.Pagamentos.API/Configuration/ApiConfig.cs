using EcommerceStore.Pagamentos.API.Data;
using EcommerceStore.Pagamentos.API.Facade;
using EcommerceStore.WebApi.Core.Identidade;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Pagamentos.API.Configuration
{
    public static class ApiConfig
    {
        public static void AddConfigurationApi(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<PagamentosContext>(options =>
               options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

            services.AddControllers();

            services.Configure<PagamentoConfig>(configuration.GetSection("PagamentoConfig"));

            services.AddCors(options =>
            {
                options.AddPolicy("Total", builder =>
                    builder
                    .AllowAnyOrigin()
                    .AllowAnyMethod()
                    .AllowAnyHeader());
            });
        }

        public static void UseConfigurationApi(this IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseConfigurationAuth();

            app.UseCors("Total");

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
