using EcommerceStore.Core.Messages;
using EcommerceStore.Pedidos.API.Application.DTO;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EcommerceStore.Pedidos.API.Application.Commands
{
    public class AdicionarPedidoCommand : Command
    {
        // Pedido
        public Guid ClienteId { get; set; }
        public decimal ValorTotal { get; set; }
        public List<PedidoItemDTO> PedidoItens { get; set; }

        // Voucher
        public string VoucherCodigo { get; set; }
        public bool VoucherUtilizado { get; set; }
        public decimal Desconto { get; set; }

        // Endereco
        public EnderecoDTO Endereco { get; set; }

        // Cartao
        public string NumeroCartao { get; set; }
        public string NomeCartao { get; set; }
        public string ExpiracaoCartao { get; set; }
        public string CvvCartao { get; set; }

        public override bool EhValido()
        {
            ValidationResult = new AdicionarPedidoValidator().Validate(this);

            return ValidationResult.IsValid;
        }

        public class AdicionarPedidoValidator : AbstractValidator<AdicionarPedidoCommand>
        {
            public AdicionarPedidoValidator()
            {
                RuleFor(com => com.ClienteId)
                    .NotEqual(Guid.Empty)
                    .WithMessage("Id do cliente inválido");

                RuleFor(com => com.PedidoItens.Count())
                    .GreaterThan(0)
                    .WithMessage("O pedido precisa ter no mínimo 1 item");

                RuleFor(com => com.ValorTotal)
                    .GreaterThan(0)
                    .WithMessage("Valor do pedido inválido");

                RuleFor(com => com.NumeroCartao)
                    .CreditCard()
                    .WithMessage("Número de cartão inválido");

                RuleFor(com => com.NomeCartao)
                    .NotNull()
                    .WithMessage("Nome do portador do cartão requerido");

                RuleFor(com => com.CvvCartao.Length)
                    .GreaterThan(2)
                    .LessThan(5)
                    .WithMessage("O CVV do cartão precisa ter 3 ou 4 números");

                RuleFor(com => com.ExpiracaoCartao)
                    .NotNull()
                    .WithMessage("Data de expiração do cartão requerida");
            }
        }
    }
}
