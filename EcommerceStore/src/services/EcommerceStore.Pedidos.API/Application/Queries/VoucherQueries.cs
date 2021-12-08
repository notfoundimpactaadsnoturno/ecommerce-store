using EcommerceStore.Pedidos.API.Application.DTO;
using EcommerceStore.Pedidos.Domain.Vouchers;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace EcommerceStore.Pedidos.API.Application.Queries
{
    public class VoucherQueries : IVoucherQueries
    {
        private IVoucherRepository _voucherRepository;
        public VoucherQueries(IVoucherRepository voucherRepository)
        {
            _voucherRepository = voucherRepository;
        }

        public async Task<VoucherDTO> ObterVoucherPorCodigo(string codigo)
        {
            var voucher = await _voucherRepository.ObterVoucherPorCodigo(codigo);

            if (voucher == null) return null;

            // Validar voucher valido
            if (!voucher.EstaValidoParaUtilizacao()) return null;

            return new VoucherDTO
            {
                Codigo = codigo,
                TipoDesconto = (int)voucher.TipoDesconto,
                Percentual = voucher.Percentual,
                ValorDesconto = voucher.ValorDesconto
            };
        }

        public async Task<PagedResult<Voucher>> ObterVouchers(int pageSize, int page)
        {
            var vouchers = await _voucherRepository.ObterVouchers(pageSize, page);

            var totalVouchres = await _voucherRepository.ObterQuantiadeTotalVouchers();

            var pagedResult = new PagedResult<Voucher>();

            if (vouchers.Any())
                pagedResult.List = vouchers;
            else
                pagedResult.List = new List<Voucher>();

            pagedResult.List = vouchers;
            pagedResult.PageIndex = page;
            pagedResult.PageSize = pageSize;
            pagedResult.TotalResults = totalVouchres;
            pagedResult.Query = null;

            return pagedResult;
        }
    }
}
