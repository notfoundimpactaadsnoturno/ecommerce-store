using EcommerceStore.Clientes.API.Models;
using EcommerceStore.Core.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.Clientes.API.Data.Repository
{
    public class ClienteRepository : IClienteRepository
    {
        private readonly ClientesContext _context;

        public ClienteRepository(ClientesContext context)
        {
            _context = context;
        }

        public IUnitOfWork UnitOfWork => _context;

        public async Task<IEnumerable<Cliente>> ObterTodos()
        {
            return await _context.Clientes.AsNoTracking().ToListAsync();
        }

        public Task<Cliente> ObterPorCpf(string cpf)
        {
            return _context.Clientes.FirstOrDefaultAsync(c => c.Cpf.Numero == cpf);
        }

        public void Adicionar(Cliente cliente)
        {
            _context.Clientes.Add(cliente);
        }        

        public async Task<Endereco> ObterEnderecoPorClienteId(Guid clienteId)
        {
            return await _context.Enderecos.FirstOrDefaultAsync(endereco => endereco.ClienteId == clienteId);
        }

        public void AdicionarEndereco(Endereco endereco)
        {
            _context.Enderecos.Add(endereco);
        }

        public void AtualizarEndereco(Endereco endereco)
        {
            _context.Enderecos.Update(endereco);
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
