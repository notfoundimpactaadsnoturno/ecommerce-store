using EcommerceStore.Core.Mediator;
using EcommerceStore.Pedidos.API.Application.Commands;
using EcommerceStore.Pedidos.API.Application.Events;
using EcommerceStore.Pedidos.API.Application.Queries;
using EcommerceStore.Pedidos.Domain.Pedidos;
using EcommerceStore.Pedidos.Domain.Vouchers;
using EcommerceStore.Pedidos.Infraestructure.Data;
using EcommerceStore.Pedidos.Infraestructure.Data.Repository;
using EcommerceStore.WebApi.Core.Usuario;
using FluentValidation.Results;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace EcommerceStore.Pedidos.API.Configuration
{
    public static class DependencyInjectionConfig
    {
        public static void RegisterServices(this IServiceCollection services)
        {
            // API
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IAspNetUser, AspNetUser>();         

            // Commands
            services.AddScoped<IRequestHandler<AdicionarPedidoCommand, ValidationResult>, PedidoCommandHandler>();

            // Events
            services.AddScoped<INotificationHandler<PedidoRealizadoEvent>, PedidoEventHandler>();

            // Application
            services.AddScoped<IMediatorHandler, MediatorHandler>();
            services.AddScoped<IVoucherQueries, VoucherQueries>();
            services.AddScoped<IPedidoQueries, PedidoQueries>();

            // Data
            services.AddScoped<IPedidoRepository, PedidoRepository>();
            services.AddScoped<IVoucherRepository, VoucherRepository>();
            services.AddDbContext<PedidosContext>();

        }
    }
}
