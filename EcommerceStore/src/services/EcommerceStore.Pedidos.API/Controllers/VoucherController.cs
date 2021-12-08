using EcommerceStore.Core.Mediator;
using EcommerceStore.Pedidos.API.Application.Commands;
using EcommerceStore.Pedidos.API.Application.DTO;
using EcommerceStore.Pedidos.API.Application.Queries;
using EcommerceStore.WebApi.Core.ControllerBase;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.API.Controllers
{
    [Authorize]
    public class VoucherController : MainController
    {
        private readonly IVoucherQueries _voucherQueries;
        private readonly IMediatorHandler _mediatorHandler;

        public VoucherController(
            IVoucherQueries voucherQueries, 
            IMediatorHandler mediatorHandler)
        {
            _voucherQueries = voucherQueries;
            _mediatorHandler = mediatorHandler;
        }

        [HttpGet("voucher/{codigo}")]
        [ProducesResponseType(typeof(VoucherDTO), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<IActionResult> ObterPorCodigo(string codigo)
        {
            if (string.IsNullOrEmpty(codigo)) return NotFound();

            var voucher = await _voucherQueries.ObterVoucherPorCodigo(codigo);

            return voucher == null ? NotFound() : CustomResponse(voucher);
        }
     
        [HttpPost("voucher")]
        public async Task<IActionResult> AdicionarVoucher(AdicionarVoucherCommand adicionarVoucherCommand)
        {
            var result = await _mediatorHandler.EnviarCommando(adicionarVoucherCommand);

            return CustomResponse(result);
        }

        [HttpGet("listar-vouchers")]
        public async Task<IActionResult> ObterVouchers([FromQuery] int pageSize, [FromQuery] int page)
        {
            var result = await _voucherQueries.ObterVouchers(pageSize, page);

            return CustomResponse(result);
        }
    }
}
