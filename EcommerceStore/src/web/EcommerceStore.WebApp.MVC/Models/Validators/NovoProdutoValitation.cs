using FluentValidation;

namespace EcommerceStore.WebApp.MVC.Models.Validators
{
    public class NovoProdutoValitation : AbstractValidator<ProdutoViewModel>
    {
        public NovoProdutoValitation()
        {
            RuleFor(p => p.Nome)
                .Must(EstaNulloOuVazio).WithMessage("Campo '{PropertyName}' é obrigatório")
                .Length(2, 250).WithMessage("Campo '{PropertyName}' precisa ter entre 2 e 200 caracteres");

            RuleFor(p => p.Descricao)
                .Must(EstaNulloOuVazio).WithMessage("Campo '{PropertyName}' é obrigatório")
                .Length(2, 500).WithMessage("Campo '{PropertyName}' precisa ter entre 2 e 200 caracteres");

            RuleFor(p => p.Ativo)
                .NotNull()
                .NotEmpty().WithMessage("Campo '{PropertyName}' é obrigatório");

            RuleFor(p => p.Valor)
                .NotNull().WithMessage("Campo '{PropertyName}' inválido, digite um valor válido")
                .GreaterThan(0).WithMessage("Campo '{PropertyName}' deve ser maior que zero");

            RuleFor(p => p.QuantidadeEstoque)
                .NotNull().WithMessage("Campo '{PropertyName}' é obrigatório")
                .GreaterThanOrEqualTo(0).WithMessage("Campo '{PropertyName}' deve ser maior que zero");

            RuleFor(p => p.ImagemUpload)
                .NotNull().WithMessage("Campo '{PropertyName}' é obrigatório")
                .Must(ValidatorsUtils.EhImagemValida).WithMessage("Imagem deve conter apenas arquivos .png | .jpeg | .jpg")
                .Must(ValidatorsUtils.ImagemMuitoGrande).WithMessage("São aceitas apenas imagens até 1 MB");
        }

        private bool EstaNulloOuVazio(string valor)
            => !string.IsNullOrWhiteSpace(valor);    

    }
}
