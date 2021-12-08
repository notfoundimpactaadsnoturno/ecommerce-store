using EcommerceStore.Core.Data;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.Domain.Vouchers
{
    public interface IVoucherRepository : IRepository<Voucher>
    {
        Task<IEnumerable<Voucher>> ObterVouchers(int pageSize, int pageIndex);
        Task<Voucher> ObterVoucherPorCodigo(string codigo);
        void Adicionar(Voucher voucher);
        void Atualizar(Voucher voucher);
        Task<int> ObterQuantiadeTotalVouchers();
    }
}
