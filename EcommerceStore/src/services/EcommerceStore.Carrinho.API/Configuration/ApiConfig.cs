using EcommerceStore.Carrinho.API.Data;
using EcommerceStore.Carrinho.API.Services.gRPC;
using EcommerceStore.WebApi.Core.Identidade;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace EcommerceStore.Carrinho.API.Configuration
{
    public static class ApiConfig
    {
        public static void AddConfigurationApi(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<CarrinhoContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

            services.AddControllers();

            services.AddGrpc();

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
                endpoints.MapGrpcService<CarrinhoGrpcService>().RequireCors("Total");
            });
        }
    }
}
