using EcommerceStore.Core.Data;
using EcommerceStore.Pedidos.Domain.Pedidos;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.Infraestructure.Data.Repository
{
    public class PedidoRepository : IPedidoRepository
    {
        private readonly PedidosContext _context;

        public PedidoRepository(PedidosContext context)
        {
            _context = context;
        }

        public IUnitOfWork UnitOfWork => _context;

        public DbConnection ObterConexao()
        {
            return _context?.Database.GetDbConnection();
        }

        public async Task<int> ObterQuantidadePedidosPedidos()
        {
            return await _context.Pedidos.CountAsync();
        }

        public async Task<IEnumerable<Pedido>> ObterTodosPedidos(int pageSize, int page)
        {

            return await _context.Pedidos
                .Include(pedido => pedido.PedidoItens)
                .AsNoTracking()
                .Skip(pageSize * (page - 1))
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<Pedido> ObterPorId(Guid id)
        {
            return await _context.Pedidos.AsNoTracking().FirstOrDefaultAsync(p => p.Id == id);
        }

        public async Task<IEnumerable<Pedido>> ObterListaPorClienteId(Guid clienteId)
        {
            return await _context.Pedidos
                    .Include(pedido => pedido.PedidoItens)
                    .AsNoTracking()
                    .Where(pedido => pedido.ClienteId == clienteId)
                    .ToListAsync();
        }
        public void Adicionar(Pedido pedido)
        {
            _context.Pedidos.Add(pedido);
        }

        public void Atualizar(Pedido pedido)
        {
            _context.Pedidos.Update(pedido);
        }

        public async Task<PedidoItem> ObterItemPorId(Guid id)
        {
            return await _context.PedidoItens.FirstOrDefaultAsync(pi => pi.Id == id);
        }

        public async Task<PedidoItem> ObterItemPorPedido(Guid pedidoId, Guid produtoId)
        {
            return await _context.PedidoItens
                .FirstOrDefaultAsync(pi => pi.ProdutoId == produtoId && pi.PedidoId == pedidoId);
        }

        public void Dispose()
        {
            _context?.Dispose();
        }
    }
}
