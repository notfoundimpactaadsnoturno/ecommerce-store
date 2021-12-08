using EcommerceStore.Core.Communication;
using EcommerceStore.WebApp.MVC.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public interface IComprasBffService
    {
        // Carrinho
        Task<CarrinhoViewModel> ObterCarrinho();
        Task<int> ObterQuantidadeCarrinho();
        Task<ResponseResult> AdicionarItemCarrinho(ItemCarrinhoViewModel produto);
        Task<ResponseResult> AtualizarItemCarrinho(Guid produtoId, ItemCarrinhoViewModel produto);
        Task<ResponseResult> RemoverItemCarrinho(Guid produtoId);
        Task<ResponseResult> AplicarVoucherCarrinho(string voucher);

        // Pedido
        Task<ResponseResult> FinalizarPedido(PedidoTransacaoViewModel pedidoTransacao);
        Task<PedidoViewModel> ObterUltimoPedido();
        Task<IEnumerable<PedidoViewModel>> ObterListaDePedidosPorClienteId();
        Task<PagedViewModel<PedidoViewModel>> ObterListaComTodosPedidos(int pageSize, int page);
        PedidoTransacaoViewModel MapearParaPedido(CarrinhoViewModel carrinho, EnderecoViewModel endereco);

        // Voucher
        Task<VoucherViewModel> ObterVoucherPorCodigo(string codigo);
        Task<PagedViewModel<ListarVoucherViewModel>> ObterVouchers(int ps = 2, int page = 1, string q = null);
        Task<ResponseResult> AdicionarVoucher(CriarVoucherViewModel criarVoucherViewModel);
    }
}
