using EcommerceStore.Clientes.API.Application.Events;
using EcommerceStore.Clientes.API.Models;
using EcommerceStore.Core.Messages;
using FluentValidation.Results;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace EcommerceStore.Clientes.API.Application.Commands
{
    public class ClienteCommandHandler
        : CommandHandlerBase,
          IRequestHandler<RegistrarClienteCommand, ValidationResult>,
          IRequestHandler<AdicionarEnderecoCommand, ValidationResult>
    {
        private readonly IClienteRepository _clienteRepository;

        public ClienteCommandHandler(IClienteRepository clienteRepository)
        {
            _clienteRepository = clienteRepository;
        }

        public async Task<ValidationResult> Handle(RegistrarClienteCommand message, CancellationToken cancellationToken)
        {
            if (message.EhValido()) return message.ValidationResult;

            var cliente = new Cliente(message.Id, message.Nome, message.Email, message.Cpf);

            var clienteExistente = await _clienteRepository.ObterPorCpf(cliente.Cpf.Numero);

            if (clienteExistente != null)
            {
                AdicionarErro("Este cpf já esta em uso");

                return ValidationResult;
            }

            _clienteRepository.Adicionar(cliente);

            cliente.AdicionarEvento(new ClienteRegistradoEvent(message.Id, message.Nome, message.Email, message.Cpf));

            return await PersistirDados(_clienteRepository.UnitOfWork);
        }

        public async Task<ValidationResult> Handle(AdicionarEnderecoCommand message, CancellationToken cancellationToken)
        {
            if (!message.EhValido()) return message.ValidationResult;

            var endereco = await _clienteRepository.ObterEnderecoPorClienteId(message.ClienteId);

            if (endereco == null)
            {
                endereco = new Endereco(message.Logradouro, message.Numero, message.Complemento, message.Bairro, message.Cep, message.Cidade, message.Estado, message.ClienteId);
                _clienteRepository.AdicionarEndereco(endereco);
            }
            else
            {
                endereco.AlterarEndereco(message.Logradouro, message.Numero, message.Complemento, message.Bairro, message.Cep, message.Cidade, message.Estado);
                _clienteRepository.AtualizarEndereco(endereco);
            }

            return await PersistirDados(_clienteRepository.UnitOfWork);
        }
    }
}
