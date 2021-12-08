using EcommerceStore.Core.Messages;
using FluentValidation.Results;
using System.Threading.Tasks;

namespace EcommerceStore.Core.Mediator
{
    public interface IMediatorHandler
    {
        Task PublicarEvento<T>(T evento) where T : Event;
        Task<ValidationResult> EnviarCommando<T>(T command) where T : Command;
    }
}
