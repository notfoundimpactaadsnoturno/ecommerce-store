using EcommerceStore.WebApp.MVC.Models;
using Microsoft.AspNetCore.Mvc;

namespace EcommerceStore.WebApp.MVC.Extensions
{
    public class PaginacaoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(IPagedList modeloPaginado)
        {
            return View(modeloPaginado);
        }
    }
}
