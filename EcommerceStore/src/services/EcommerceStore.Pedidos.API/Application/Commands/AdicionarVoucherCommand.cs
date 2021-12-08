using EcommerceStore.Core.Messages;
using EcommerceStore.Pedidos.Domain.Vouchers;
using FluentValidation;

namespace EcommerceStore.Pedidos.API.Application.Commands
{
    public class AdicionarVoucherCommand : Command
    {
        public string Codigo { get; set; }
        public decimal? ValorDesconto { get; set; }
        public decimal? Percentual { get; set; }
        public int? Quantidade { get; set; }
        public TipoDescontoVoucher TipoDescontoVoucher { get; set; }
        public int? ValidadeEmDias { get; set; }

        public override bool EhValido()
        {
            ValidationResult = new AdicionarVoucherValidator().Validate(this);

            return ValidationResult.IsValid;
        }

        public class AdicionarVoucherValidator : AbstractValidator<AdicionarVoucherCommand>
        {
            public AdicionarVoucherValidator()
            {
                RuleFor(v => v.Codigo)
                    .NotNull()
                    .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório");

                RuleFor(v => v.ValorDesconto)
                    .NotNull()
                    .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório")
                    .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que 0")
                    .When(v => v.Percentual == null);

                RuleFor(v => v.Percentual)
                    .NotNull()
                    .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório")
                    .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que 0")
                    .When(v => v.ValorDesconto == null);

                RuleFor(v => v.Quantidade)
                    .NotNull().WithMessage("Campo '{PropertyName}' é obrigatório")
                    .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que 0");

                RuleFor(v => v.ValidadeEmDias)
                    .NotNull().WithMessage("Campo '{PropertyName}' é obrigatório")
                    .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que 0");
            }
        }
    }
}
