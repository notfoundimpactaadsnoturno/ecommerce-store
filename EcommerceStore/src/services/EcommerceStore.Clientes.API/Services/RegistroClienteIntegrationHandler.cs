using EcommerceStore.Clientes.API.Application.Commands;
using EcommerceStore.Core.Mediator;
using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.MessageBus;
using FluentValidation.Results;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace EcommerceStore.Clientes.API.Services
{
    public class RegistroClienteIntegrationHandler : BackgroundService
    {
        private IMessageBus _bus;
        private readonly IServiceProvider _provider;

        public RegistroClienteIntegrationHandler(IServiceProvider provider, IMessageBus bus)
        {
            _provider = provider;
            _bus = bus;
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            SetResponder();

            return Task.CompletedTask;
        }     

        private void SetResponder()
        {
            _bus.RespondAsync<UsuarioRegistradoIntegrationEvent, ResponseMessage>(async request =>
              await RegistrarCliente(request));

            _bus.AdvancedBus.Connected += OnConnect;
        }

        private void OnConnect(object s, EventArgs e)
        {
            SetResponder();
        }

        private async Task<ResponseMessage> RegistrarCliente(UsuarioRegistradoIntegrationEvent message)
        {
            var clientCommand = new RegistrarClienteCommand(message.Id, message.Nome, message.Email, message.Cpf);

            ValidationResult sucesso;

            using (var scope = _provider.CreateScope())
            {
                var mediator = scope.ServiceProvider.GetRequiredService<IMediatorHandler>();

                sucesso = await mediator.EnviarCommando(clientCommand);
            }

            return new ResponseMessage(sucesso);
        }
    }
}
