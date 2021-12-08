using EcommerceStore.Core.Data;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.Domain.Pedidos
{
    public interface IPedidoRepository : IRepository<Pedido>
    {   
        Task<Pedido> ObterPorId(Guid id);
        Task<int> ObterQuantidadePedidosPedidos();
        Task<IEnumerable<Pedido>> ObterTodosPedidos(int pageSize, int page);
        Task<IEnumerable<Pedido>> ObterListaPorClienteId(Guid clienteId);
        void Adicionar(Pedido pedido);
        void Atualizar(Pedido pedido);
        DbConnection ObterConexao();
        // Pedido Item
        Task<PedidoItem> ObterItemPorId(Guid id);
        Task<PedidoItem> ObterItemPorPedido(Guid pedidoId, Guid produtoId);
    }
}
