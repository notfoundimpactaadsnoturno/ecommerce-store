using FluentValidation;
using System;
using System.Text.Json.Serialization;

namespace EcommerceStore.Carrinho.API.Model
{
    public class CarrinhoItem
    {
        public Guid Id { get; set; }
        public Guid ProdutoId { get; set; }
        public string Nome { get; set; }
        public int Quantidade { get; set; }
        public decimal Valor { get; set; }
        public string Imagem { get; set; }
        public Guid CarrinhoId { get; set; }

        [JsonIgnore]
        public CarrinhoCliente CarrinhoCliente { get; set; }

        public CarrinhoItem()
        {
            Id = Guid.NewGuid();
        }

        internal void AssociarCarrinho(Guid carrinhoId)
        {
            CarrinhoId = carrinhoId;
        }

        internal decimal CalcularValor()
        {
            return Quantidade * Valor;
        }

        internal void AdicionarUnidades(int unidades)
        {
            Quantidade += unidades;
        }

        internal void AtualizarUnidades(int unidades)
        {
            Quantidade = unidades;
        }        

        internal bool EhValido()
        {
            return new ItemCarrinhoValidation().Validate(this).IsValid;
        }

        public class ItemCarrinhoValidation : AbstractValidator<CarrinhoItem>
        {
            public ItemCarrinhoValidation()
            {
                RuleFor(carrinhoItem => carrinhoItem.ProdutoId)
                    .NotEqual(Guid.Empty)
                    .WithMessage("O id do produto é inválido");

                RuleFor(carrinhoCliente => carrinhoCliente.Nome)
                    .NotEmpty()
                    .WithMessage("O nome do produto não foi informado");

                RuleFor(carrinhoItem => carrinhoItem.Quantidade)
                    .GreaterThan(0)
                    .WithMessage(carrinhoItem => $"A quantidade mínima para o {carrinhoItem.Nome} é 1");

                RuleFor(carrinhoItem => carrinhoItem.Quantidade)
                    .LessThanOrEqualTo(CarrinhoCliente.MAX_QUANTIDADE_ITEM)
                    .WithMessage(carrinhoItem => $"A quantidade máxima para o {carrinhoItem.Nome} é {CarrinhoCliente.MAX_QUANTIDADE_ITEM}");

                RuleFor(carrinhoItem => carrinhoItem.Valor)
                    .GreaterThan(0)
                    .WithMessage(carrinhoItem => $"O valor do {carrinhoItem.Nome} precisa ser maior que 0");
            }            
        }
    }
}
