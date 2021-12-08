using EcommerceStore.Core.DomainObjects;
using EcommerceStore.Core.Messages;
using FluentValidation;
using System;

namespace EcommerceStore.Clientes.API.Application.Commands
{
    public class RegistrarClienteCommand : Command
    {
        public Guid Id { get; private set; }
        public string Nome { get; private set; }
        public string Email { get; private set; }
        public string Cpf { get; private set; }

        public override bool EhValido()
        {
            ValidationResult = new RegistrarClienteValidation().Validate(this);

            return ValidationResult.IsValid;
        }

        public RegistrarClienteCommand(Guid id, string nome, string email, string cpf)
        {
            AggregateId = id;
            Id = id;
            Nome = nome;
            Email = email;
            Cpf = cpf;
        }
    }

    public class RegistrarClienteValidation : AbstractValidator<RegistrarClienteCommand>
    {
        public RegistrarClienteValidation()
        {
            RuleFor(command => command.Id)
                .NotEqual(Guid.Empty)
                .WithMessage("Id do cliente inválido");

            RuleFor(command => command.Nome)
                .NotEmpty()
                .WithMessage("O nome do cliente não foi informado");

            RuleFor(command => command.Cpf)
                .Must(TerCpfValido)
                .WithMessage("O cpf informado é inválido");

            RuleFor(command => command.Email)
                .Must(TerCpfValido)
                .WithMessage("O email informado é inválido");
        }

        protected static bool TerCpfValido(string cpf)
        {
            return Cpf.Validar(cpf);
        }

        protected static bool TerEmailValido(string cpf)
        {
            return Email.Validar(cpf);
        }
    }
}
