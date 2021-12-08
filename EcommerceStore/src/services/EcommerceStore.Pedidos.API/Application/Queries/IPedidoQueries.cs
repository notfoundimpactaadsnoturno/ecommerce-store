using EcommerceStore.Pedidos.API.Application.DTO;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.API.Application.Queries
{
    public interface IPedidoQueries
    {
        Task<PedidoDTO> ObterUltimoPedido(Guid clienteId);
        Task<IEnumerable<PedidoDTO>> ObterListaPorClienteId(Guid clienteId);
        Task<PagedResult<PedidoDTO>> ObterTodosOsPedidos(int pageSize, int page);
        Task<PedidoDTO> ObterPedidosAutorizados();
    }
}
