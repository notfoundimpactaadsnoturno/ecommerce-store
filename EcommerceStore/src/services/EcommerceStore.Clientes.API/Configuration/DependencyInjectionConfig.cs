using EcommerceStore.Clientes.API.Application.Commands;
using EcommerceStore.Clientes.API.Application.Events;
using EcommerceStore.Clientes.API.Data;
using EcommerceStore.Clientes.API.Data.Repository;
using EcommerceStore.Clientes.API.Models;
using EcommerceStore.Core.Mediator;
using EcommerceStore.WebApi.Core.Usuario;
using FluentValidation.Results;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;


namespace EcommerceStore.Clientes.API.Configuration
{
    public static class DependencyInjectionConfig
    {
        public static void RegisterServices(this IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IAspNetUser, AspNetUser>();

            services.AddScoped<IMediatorHandler, MediatorHandler>();

            services.AddScoped<IRequestHandler<RegistrarClienteCommand, ValidationResult>, ClienteCommandHandler>();
            services.AddScoped<IRequestHandler<AdicionarEnderecoCommand, ValidationResult>, ClienteCommandHandler>();

            services.AddScoped <INotificationHandler<ClienteRegistradoEvent>, ClienteEventHandler>();

            services.AddScoped<IClienteRepository, ClienteRepository>();
            services.AddDbContext<ClientesContext>();            
        }
    }
}
