using EcommerceStore.Core.Communication;
using EcommerceStore.WebApp.MVC.Models;
using System;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public interface ICatalogoService
    {
        Task<PagedViewModel<ProdutoViewModel>> ObterTodos(int pageSize, int pageIndex, string query = null);
        Task<ProdutoViewModel> ObterPorId(Guid id);
        Task<ResponseResult> Adicionar(ProdutoViewModel produtoViewModel);
        Task<ResponseResult> Atualizar(ProdutoViewModel produtoViewModel);
        Task<ResponseResult> AtualizarEstoque(Guid id, ProdutoViewModel quantidadeEstoque);
    }
}
