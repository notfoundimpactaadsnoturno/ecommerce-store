using FluentValidation;

namespace EcommerceStore.WebApp.MVC.Models.Validators
{
    public class CriarVoucherViewModelValidator : AbstractValidator<CriarVoucherViewModel>
    {
        public CriarVoucherViewModelValidator()
        {
            RuleFor(v => v.Codigo)
                .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório");

            RuleFor(v => v.ValorDesconto)
                .NotNull().WithMessage("Campo '{PropertyName}' inválido")
                .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que 0")
                .When(v=> v.EhTotal);

            RuleFor(v => v.Percentual)
                .NotNull().WithMessage("Campo Valor Desconto inválido")
                .GreaterThan(0).WithMessage("Campo Valor Desconto deve ser maior que 0")
                .When(v => v.EhPercentual);

            RuleFor(v => v.EhTotal)                
                .Equal(false).WithMessage("Escolha apenas uma das formas de desconto")
                .When(v => v.EhTotal == true && v.EhPercentual == true);

            RuleFor(v => v.Quantidade)
                .NotNull().WithMessage("Campo '{PropertyName}' é obrigatório")
                .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que 0");

            RuleFor(v => v.ValidadeEmDias)
                .NotNull().WithMessage("Campo '{PropertyName}' é obrigatório")
                .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que 0");
        }
    }
}
