using EcommerceStore.Core.Data;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.Clientes.API.Models
{
    public interface IClienteRepository : IRepository<Cliente>
    {   
        Task<IEnumerable<Cliente>> ObterTodos();
        Task<Cliente> ObterPorCpf(string cpf);
        void Adicionar(Cliente cliente);
        Task<Endereco> ObterEnderecoPorClienteId(Guid clienteId);
        void AdicionarEndereco(Endereco endereco);
        void AtualizarEndereco(Endereco endereco);
    }
}
