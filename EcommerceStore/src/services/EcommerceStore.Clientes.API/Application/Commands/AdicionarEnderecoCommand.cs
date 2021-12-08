using EcommerceStore.Core.Messages;
using FluentValidation;
using System;

namespace EcommerceStore.Clientes.API.Application.Commands
{
    public class AdicionarEnderecoCommand : Command
    {
        public Guid ClienteId { get; set; }
        public string Logradouro { get; set; }
        public string Numero { get; set; }
        public string Complemento { get; set; }
        public string Bairro { get; set; }
        public string Cep { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }

        public AdicionarEnderecoCommand()
        { }

        public AdicionarEnderecoCommand(Guid clienteId, string logradouro, string numero, string complemento, string bairro, string cep, string cidade, string estado)
        {
            AggregateId = clienteId;
            ClienteId = clienteId;
            Logradouro = logradouro;
            Numero = numero;
            Complemento = complemento;
            Bairro = bairro;
            Cep = cep;
            Cidade = cidade;
            Estado = estado;
        }

        public override bool EhValido()
        {
            ValidationResult = new EnderecoValidation().Validate(this);

            return ValidationResult.IsValid;
        }

        public class EnderecoValidation : AbstractValidator<AdicionarEnderecoCommand>
        {
            public EnderecoValidation()
            {
                RuleFor(e => e.Logradouro)
                    .NotEmpty()
                    .WithMessage("Informe o Logradouro");

                RuleFor(e => e.Numero)
                    .NotEmpty()
                    .WithMessage("Informe o Número");

                RuleFor(e => e.Cep)
                    .NotEmpty()
                    .WithMessage("Informe o CEP");

                RuleFor(e => e.Bairro)
                    .NotEmpty()
                    .WithMessage("Informe o Bairro");

                RuleFor(e => e.Cidade)
                  .NotEmpty()
                  .WithMessage("Informe a Cidade");

                RuleFor(e => e.Estado)
                  .NotEmpty()
                  .WithMessage("Informe o Estado");

            }
        }
    }
}
