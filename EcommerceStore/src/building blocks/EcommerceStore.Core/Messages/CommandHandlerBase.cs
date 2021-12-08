using EcommerceStore.Core.Data;
using FluentValidation.Results;
using System.Threading.Tasks;

namespace EcommerceStore.Core.Messages
{
    public abstract class CommandHandlerBase
    {
        protected ValidationResult ValidationResult;

        public CommandHandlerBase()
        {
            ValidationResult = new ValidationResult();
        }

        protected void AdicionarErro(string mensagem)
        {
            ValidationResult.Errors.Add(new ValidationFailure(string.Empty,mensagem));
        }

        protected async Task<ValidationResult> PersistirDados(IUnitOfWork uow)
        {
            if (!await uow.Commit()) AdicionarErro("Erro ao persistir os dados");

            return ValidationResult;
        }
    }
}
