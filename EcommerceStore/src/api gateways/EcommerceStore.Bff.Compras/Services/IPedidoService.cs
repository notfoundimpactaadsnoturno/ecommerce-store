using EcommerceStore.Bff.Compras.Models;
using EcommerceStore.Core.Communication;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.Bff.Compras.Services
{
    public interface IPedidoService
    {
        Task<ResponseResult> FinalizarPedido(PedidoDTO pedido);
        Task<PedidoDTO> ObterUltimoPedido();
        Task<IEnumerable<PedidoDTO>> ObterListaPorClienteId();
        Task<PagedResult<PedidoDTO>> ObterTodosOsPedidos(int pageSize, int page);

        Task<PagedResult<ListarVoucherDTO>> ObterVouchers(int pageSize, int pageIndex);
        Task<VoucherDTO> ObterVoucherPorCodigo(string codigo);
        Task<ResponseResult> AdicionarVoucher(CriarVoucherDTO criarVoucherDTO);
    }
}
