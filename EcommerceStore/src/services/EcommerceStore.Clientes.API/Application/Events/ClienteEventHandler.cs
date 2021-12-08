using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace EcommerceStore.Clientes.API.Application.Events
{
    public class ClienteEventHandler : INotificationHandler<ClienteRegistradoEvent>
    {
        public Task Handle(ClienteRegistradoEvent message, CancellationToken cancellationToken)
        {
            // Mensagem de boas vindas

            return Task.CompletedTask;
        }
    }
}
