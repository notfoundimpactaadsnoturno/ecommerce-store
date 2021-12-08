using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EcommerceStore.WebApp.MVC.Models;
using EcommerceStore.WebApp.MVC.Models.Enums;
using EcommerceStore.WebApp.MVC.Models.Validators;
using EcommerceStore.WebApp.MVC.Services;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;


namespace EcommerceStore.WebApp.MVC.Controllers
{
    public class PedidoController : MainController
    {
        private readonly IClienteService _clienteService;
        private readonly IComprasBffService _comprasBffService;

        public PedidoController(IClienteService clienteService,
            IComprasBffService comprasBffService)
        {
            _clienteService = clienteService;
            _comprasBffService = comprasBffService;
        }

        [HttpGet]
        [Route("endereco-de-entrega")]
        public async Task<IActionResult> EnderecoEntrega()
        {
            var carrinho = await _comprasBffService.ObterCarrinho();
            if (carrinho.Itens.Count == 0) return RedirectToAction("Index", "Carrinho");

            var endereco = await _clienteService.ObterEndereco();
            var pedido = _comprasBffService.MapearParaPedido(carrinho, endereco);

            return View(pedido);
        }

        [HttpGet]
        [Route("pagamento")]
        public async Task<IActionResult> Pagamento()
        {
            var carrinho = await _comprasBffService.ObterCarrinho();
            if (carrinho.Itens.Count == 0) return RedirectToAction("Index", "Carrinho");

            var pedido = _comprasBffService.MapearParaPedido(carrinho, null);

            return View(pedido);
        }

        [HttpPost]
        [Route("finalizar-pedido")]
        public async Task<IActionResult> FinalizarPedido(PedidoTransacaoViewModel pedidoTransacao)
        {
            if (!ModelState.IsValid)
                return View("Pagamento", _comprasBffService.MapearParaPedido(await _comprasBffService.ObterCarrinho(), null));

            var result = await _comprasBffService.FinalizarPedido(pedidoTransacao);

            if (ResponsePossuiErros(result))
            {
                var carrinho = await _comprasBffService.ObterCarrinho();
                if (carrinho.Itens.Count == 0) return RedirectToAction("Index", "Carrinho");

                var pedidoMap = _comprasBffService.MapearParaPedido(carrinho, null);
                return View("Pagamento", pedidoMap);
            }

            return RedirectToAction("PedidoConcluido");
        }

        [HttpGet]
        [Route("pedido-concluido")]
        public async Task<IActionResult> PedidoConcluido()
        {
            var pedido = await _comprasBffService.ObterUltimoPedido();

            return View("ConfirmacaoPedido", pedido);
        }

        [HttpGet("meus-pedidos-clientes")]
        public async Task<IActionResult> MeusPedidosClientes()
        {
            var pedidos = await _comprasBffService.ObterListaDePedidosPorClienteId();

            return View(pedidos);
        }

        [HttpGet("meus-pedidos-admin")]
        public async Task<IActionResult> MeusPedidosAdmin([FromQuery] int ps = 15, [FromQuery] int page = 1, [FromQuery] string q = null)
        {
            var pedidos = await _comprasBffService.ObterListaComTodosPedidos(ps, page);

            pedidos.ReferenceAction = "MeusPedidosAdmin";

            return View(pedidos);
        }

        [HttpGet("listar-vouchers")]
        public async Task<IActionResult> MeusVouchers([FromQuery] int ps = 15, [FromQuery] int page = 1, [FromQuery] string q = null)
        {
            var vouchers = await _comprasBffService.ObterVouchers(ps, page, q);

            vouchers.ReferenceAction = "MeusVouchers";

            return View(vouchers);
        }

        [HttpGet("gerar-voucher")]
        public IActionResult CriarVoucher()
        {
            return View(new CriarVoucherViewModel());
        }

        [HttpPost("gerar-voucher")]
        public async Task<IActionResult> CriarVoucher(CriarVoucherViewModel criarVoucherViewModel)
        {
            if (criarVoucherViewModel.EhTotal)
                criarVoucherViewModel.TipoDescontoVoucher = TipoDescontoVoucher.Valor;
            else
            {
                criarVoucherViewModel.TipoDescontoVoucher = TipoDescontoVoucher.Porcentagem;
                criarVoucherViewModel.Percentual = criarVoucherViewModel.ValorDesconto;                
                criarVoucherViewModel.ValorDesconto = null;
            }

            if (!RequisicaoValida<CriarVoucherViewModelValidator>(criarVoucherViewModel))
                return View(criarVoucherViewModel);

            var voucher = await _comprasBffService.ObterVoucherPorCodigo(criarVoucherViewModel.Codigo);
            if (!ExistirVoucher(null))
                return View(criarVoucherViewModel);

            var response = await _comprasBffService.AdicionarVoucher(criarVoucherViewModel);
            if (ResponsePossuiErros(response))
                return View(criarVoucherViewModel);            

            return RedirectToAction("Index","Catalogo");            
        }

        private bool ExistirVoucher(VoucherViewModel voucherViewModel)
        {
            if (voucherViewModel != null)
            {
                var erros = new List<ValidationFailure>()
                {
                    new ValidationFailure("Codigo", "Código existente, digite outro código")
                };

                RequisicaoInvalida(erros);

                return false;
            }

            return true;
        }
        private bool RequisicaoValida<T>(CriarVoucherViewModel criarVoucherViewModel) where T : AbstractValidator<CriarVoucherViewModel>, new()
        {
            var validation = new T();

            var validationResult = validation.Validate(criarVoucherViewModel);

            if (!validationResult.IsValid)
            {
                RequisicaoInvalida(validationResult);

                return validationResult.IsValid;
            }

            return validationResult.IsValid;
        }
        private void RequisicaoInvalida(ValidationResult validation)
        {
            var erros = validation.Errors.ToList();

            RequisicaoInvalida(erros);
        }
        private void RequisicaoInvalida(List<ValidationFailure> validations)
        {
            if (!ModelState.IsValid)
                ModelState.Clear();

            foreach (var erro in validations)
            {
                ModelState.AddModelError(erro.PropertyName, erro.ErrorMessage);
            }
        }
    }
}