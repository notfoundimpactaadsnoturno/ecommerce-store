using EcommerceStore.Bff.Compras.Models;
using EcommerceStore.Core.Communication;
using System;
using System.Threading.Tasks;

namespace EcommerceStore.Bff.Compras.Services
{
    public interface ICarrinhoService
    {
        Task<CarrinhoDTO> ObterCarrinho();        
        Task<ResponseResult> AdicionarItemCarrinho(ItemCarrinhoDTO produto);
        Task<ResponseResult> AtualizarItemCarrinho(Guid produtoId, ItemCarrinhoDTO produto);
        Task<ResponseResult> RemoverItemCarrinho(Guid produtoId);
        Task<ResponseResult> AplicarVoucherCarrinho(VoucherDTO voucher);
    }
}
