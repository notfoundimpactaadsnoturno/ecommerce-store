using EcommerceStore.Core.Data;
using EcommerceStore.Pedidos.Domain.Vouchers;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.Infraestructure.Data.Repository
{
    public class VoucherRepository : IVoucherRepository
    {
        private readonly PedidosContext _context;

        public VoucherRepository(PedidosContext context)
        {
            _context = context;
        }

        public IUnitOfWork UnitOfWork => _context;

        public async Task<IEnumerable<Voucher>> ObterVouchers(int pageSize, int page)
        {
            return await _context.Vouchers.AsNoTracking()
                .Skip(pageSize * (page - 1))
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<int> ObterQuantiadeTotalVouchers()
        {
            return await _context.Vouchers.CountAsync();
        }

        public async Task<Voucher> ObterVoucherPorCodigo(string codigo)
        {
            return await _context.Vouchers.FirstOrDefaultAsync(voucher => voucher.Codigo == codigo);
        }

        public void Adicionar(Voucher voucher)
        {
            _context.Vouchers.Add(voucher);
        }

        public void Atualizar(Voucher voucher)
        {
            _context.Vouchers.Update(voucher);
        }

        public void Dispose()
        {
            _context?.Dispose();
        }
    }
}
