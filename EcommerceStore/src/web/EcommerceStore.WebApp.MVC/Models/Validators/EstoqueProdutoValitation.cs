using FluentValidation;

namespace EcommerceStore.WebApp.MVC.Models.Validators
{
    public class EstoqueProdutoValitation : AbstractValidator<ProdutoViewModel>
    {
        public EstoqueProdutoValitation()
        {
            RuleFor(p => p.Id)
                .NotNull()
                .NotEmpty().WithMessage("O campo '{PropertyName}' é obrigatório");           

            RuleFor(p => p.QuantidadeEstoque)
                .NotNull()
                .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório");
        }

    }
}
