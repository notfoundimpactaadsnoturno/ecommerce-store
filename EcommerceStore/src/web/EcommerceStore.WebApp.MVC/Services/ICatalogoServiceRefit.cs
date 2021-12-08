using EcommerceStore.WebApp.MVC.Models;
using Refit;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public interface ICatalogoServiceRefit
    {
        [Get("/catalogo/produtos")]
        Task<IEnumerable<ProdutoViewModel>> ObterTodos();

        [Get("/catalogo/produtos/{id}")]
        Task<ProdutoViewModel> ObterPorId(Guid id);
    }
}
