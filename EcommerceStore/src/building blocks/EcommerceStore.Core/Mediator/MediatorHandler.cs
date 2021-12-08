using EcommerceStore.Core.Messages;
using FluentValidation.Results;
using MediatR;

using System.Threading.Tasks;

namespace EcommerceStore.Core.Mediator
{
    public class MediatorHandler : IMediatorHandler
    {
        private IMediator _mediator;

        public MediatorHandler(IMediator mediator)
        {
            _mediator = mediator;
        }

        public async Task PublicarEvento<T>(T evento) where T : Event
        {
            await _mediator.Publish(evento);
        }

        public async Task<ValidationResult> EnviarCommando<T>(T command) where T : Command
        {
            return await _mediator.Send(command);            
        }        
    }
}
