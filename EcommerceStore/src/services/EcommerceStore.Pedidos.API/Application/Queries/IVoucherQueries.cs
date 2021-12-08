using EcommerceStore.Pedidos.API.Application.DTO;
using EcommerceStore.Pedidos.Domain.Vouchers;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.API.Application.Queries
{
    public interface IVoucherQueries
    {
        Task<VoucherDTO> ObterVoucherPorCodigo(string codigo);
        Task<PagedResult<Voucher>> ObterVouchers(int pageSize, int page);
    }
}
