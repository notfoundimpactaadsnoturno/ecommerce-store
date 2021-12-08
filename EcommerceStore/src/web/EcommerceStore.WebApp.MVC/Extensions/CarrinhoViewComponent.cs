using EcommerceStore.WebApp.MVC.Services;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Extensions
{
    public class CarrinhoViewComponent : ViewComponent
    {
        private readonly IComprasBffService _comprasBffService;

        public CarrinhoViewComponent(IComprasBffService carrinhoService)
        {
            _comprasBffService = carrinhoService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _comprasBffService.ObterQuantidadeCarrinho());
        }
    }
}
