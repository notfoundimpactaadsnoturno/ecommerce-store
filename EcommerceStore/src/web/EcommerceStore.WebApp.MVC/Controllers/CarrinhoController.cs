using EcommerceStore.WebApp.MVC.Models;
using EcommerceStore.WebApp.MVC.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Controllers
{
    public class CarrinhoController : MainController
    {
        private readonly IComprasBffService _comprasBffService;        

        public CarrinhoController(IComprasBffService carrinhoService)
        {
            _comprasBffService = carrinhoService;            
        }

        [HttpGet]
        [Route("carrinho")]
        public async Task<IActionResult> Index()
        {
            return View(await _comprasBffService.ObterCarrinho());
        }

        [HttpPost]
        [Route("carrinho/adicionar-item")]
        public async Task<IActionResult> AdicionarItemCarrinho(ItemCarrinhoViewModel itemProduto)
        {   
            var response = await _comprasBffService.AdicionarItemCarrinho(itemProduto);

            if (ResponsePossuiErros(response)) return View("Index", await _comprasBffService.ObterCarrinho());

            return RedirectToAction("Index");
        }

        [HttpPost]
        [Route("carrinho/atualizar-item")]
        public async Task<IActionResult> AtualizarItemCarrinho(Guid produtoId, int quantidade)
        {
            var itemProduto = new ItemCarrinhoViewModel { ProdutoId = produtoId, Quantidade = quantidade };

            var response = await _comprasBffService.AtualizarItemCarrinho(produtoId, itemProduto);

            if (ResponsePossuiErros(response)) return View("Index", await _comprasBffService.ObterCarrinho());

            return RedirectToAction("Index");
        }

        [HttpPost]
        [Route("carrinho/remover-item")]
        public async Task<IActionResult> RemoverItemCarrinho(Guid produtoId)
        {  
            var response = await _comprasBffService.RemoverItemCarrinho(produtoId);

            if (ResponsePossuiErros(response)) return View("Index", await _comprasBffService.ObterCarrinho());

            return RedirectToAction("Index");
        }      

        [HttpPost]
        [Route("carrinho/aplicar-voucher")]
        public async Task<IActionResult> AplicarVoucher(string voucherCodigo)
        {
            var response = await _comprasBffService.AplicarVoucherCarrinho(voucherCodigo);

            if (ResponsePossuiErros(response)) return View("Index", await _comprasBffService.ObterCarrinho());

            return RedirectToAction("Index");
        }
    }
}
