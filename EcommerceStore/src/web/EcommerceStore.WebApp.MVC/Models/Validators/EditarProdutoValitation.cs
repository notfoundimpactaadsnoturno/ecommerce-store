using FluentValidation;

namespace EcommerceStore.WebApp.MVC.Models.Validators
{
    public class EditarProdutoValitation : AbstractValidator<ProdutoViewModel>
    {
        public EditarProdutoValitation()
        {
            RuleFor(p => p.Id)
                .NotNull()
                .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório");

            RuleFor(p => p.Nome)
                .Must(ValidatorsUtils.EstaNulloOuVazio).WithMessage("Campo '{PropertyName}' é obrigatório")
                .Length(2, 250).WithMessage("Campo '{PropertyName}' precisa ter entre 2 e 200 caracteres");

            RuleFor(p => p.Descricao)
                .Must(ValidatorsUtils.EstaNulloOuVazio).WithMessage("Campo '{PropertyName}' é obrigatório")
                .Length(2, 500).WithMessage("Campo '{PropertyName}' precisa ter entre 2 e 200 caracteres");

            RuleFor(p => p.Ativo)
                .NotNull()
                .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório");

            RuleFor(p => p.Valor)
                .NotNull().WithMessage("Campo '{PropertyName}' inválido, digite um valor válido")
                .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que zero");

            RuleFor(p => p.QuantidadeEstoque)
                .NotNull()
                .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório")
                .GreaterThanOrEqualTo(0).WithMessage("Campo '{PropertyName}' deve ser maior que zero"); ;

            RuleFor(p => p.ImagemUpload)
               .NotNull().WithMessage("Campo '{PropertyName}' é obrigatório")
               .Must(ValidatorsUtils.EhImagemValida).WithMessage("Imagem deve conter apenas arquivos .png | .jpeg | .jpg")
               .Must(ValidatorsUtils.ImagemMuitoGrande).WithMessage("São aceitas apenas imagens até 1 MB")
               .When(p => p.ImagemUpload != null);
        }
    }
}
