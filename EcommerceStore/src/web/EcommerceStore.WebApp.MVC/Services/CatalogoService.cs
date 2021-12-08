using EcommerceStore.Core.Communication;
using EcommerceStore.WebApp.MVC.Extensions;
using EcommerceStore.WebApp.MVC.Models;
using Microsoft.Extensions.Options;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public class CatalogoService : Service, ICatalogoService
    {
        private readonly HttpClient _httpClient;

        public CatalogoService(HttpClient httpClient,
                                   IOptions<AppSettings> settings)
        {
            _httpClient = httpClient;

            _httpClient.BaseAddress = new Uri(settings.Value.CatalogoUrl);
        }

        public async Task<PagedViewModel<ProdutoViewModel>> ObterTodos(int pageSize, int pageIndex, string query = null)
        {
            var response = await _httpClient.GetAsync($"catalogo/produtos?ps={pageSize}&page={pageIndex}&q={query}");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<PagedViewModel<ProdutoViewModel>>(response);
        }

        public async Task<ProdutoViewModel> ObterPorId(Guid id)
        {
            var response = await _httpClient.GetAsync($"catalogo/produtos/{id}");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<ProdutoViewModel>(response);
        }

        public async Task<ResponseResult> Adicionar(ProdutoViewModel produtoViewModel)
        {
            var content = ObterConteudo(produtoViewModel);

            var response = await _httpClient.PostAsync($"catalogo/produtos", content);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }

        public async Task<ResponseResult> Atualizar(ProdutoViewModel produtoViewModel)
        {
            var content = ObterConteudo(produtoViewModel);

            var response = await _httpClient.PutAsync($"catalogo/produtos/{produtoViewModel.Id}", content);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }

        public async Task<ResponseResult> AtualizarEstoque(Guid id, ProdutoViewModel produto)
        {
            var content = ObterConteudo(produto);

            var response = await _httpClient.PutAsync($"catalogo/produtos/alterar-estoque/{id}", content);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }
    }
}
