using EcommerceStore.Core.Communication;
using EcommerceStore.WebApp.MVC.Extensions;
using EcommerceStore.WebApp.MVC.Models;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public class ComprasBffService : Service, IComprasBffService
    {
        private readonly HttpClient _httpClient;

        public ComprasBffService(HttpClient httpClient, IOptions<AppSettings> settings)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri(settings.Value.ComprasBffUrl);
        }

        // Carrinho
        public async Task<CarrinhoViewModel> ObterCarrinho()
        {
            var response = await _httpClient.GetAsync("compras/carrinho");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<CarrinhoViewModel>(response);
        }
        public async Task<int> ObterQuantidadeCarrinho()
        {
            var response = await _httpClient.GetAsync("compras/carrinho-quantidade");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<int>(response);
        }
        public async Task<ResponseResult> AdicionarItemCarrinho(ItemCarrinhoViewModel produto)
        {
            var itemContent = ObterConteudo(produto);

            var response = await _httpClient.PostAsync("compras/carrinho/itens", itemContent);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }
        public async Task<ResponseResult> AtualizarItemCarrinho(Guid produtoId, ItemCarrinhoViewModel produto)
        {
            var itemContent = ObterConteudo(produto);

            var response = await _httpClient.PutAsync($"compras/carrinho/itens/{produto.ProdutoId}", itemContent);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }
        public async Task<ResponseResult> RemoverItemCarrinho(Guid produtoId)
        {
            var response = await _httpClient.DeleteAsync($"compras/carrinho/itens/{produtoId}");

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }
        public async Task<ResponseResult> AplicarVoucherCarrinho(string voucher)
        {
            var itemContent = ObterConteudo(voucher);

            var response = await _httpClient.PostAsync("compras/carrinho/aplicar-voucher", itemContent);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }

        // Pedido
        public async Task<ResponseResult> FinalizarPedido(PedidoTransacaoViewModel pedidoTransacao)
        {
            var pedidoContent = ObterConteudo(pedidoTransacao);

            var response = await _httpClient.PostAsync("compras/pedido", pedidoContent);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }
        public async Task<PedidoViewModel> ObterUltimoPedido()
        {
            var response = await _httpClient.GetAsync("compras/pedido/ultimo");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<PedidoViewModel>(response);
        }
        public async Task<IEnumerable<PedidoViewModel>> ObterListaDePedidosPorClienteId()
        {
            var response = await _httpClient.GetAsync("compras/pedido/lista-cliente");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<IEnumerable<PedidoViewModel>>(response);
        }

        public async Task<PagedViewModel<PedidoViewModel>> ObterListaComTodosPedidos(int pageSize, int pageIndex)
        {
            var response = await _httpClient.GetAsync($"compras/pedido/lista-pedidos?pageSize={pageSize}&page={pageIndex}");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<PagedViewModel<PedidoViewModel>>(response);
        }

        // Voucher
        public async Task<PagedViewModel<ListarVoucherViewModel>> ObterVouchers(int pageSize = 2, int pageIndex = 1, string query = null)
        {
            var response = await _httpClient.GetAsync($"compras/pedido/lista-vouchers?pageSize={pageSize}&page={pageIndex}");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<PagedViewModel<ListarVoucherViewModel>>(response);
        }

        public async Task<VoucherViewModel> ObterVoucherPorCodigo(string codigo)
        {
            var response = await _httpClient.GetAsync($"compras/pedido/voucher/{codigo}");

            if (response.StatusCode == HttpStatusCode.NotFound) return null;

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<VoucherViewModel>(response);
        }

        public async Task<ResponseResult> AdicionarVoucher(CriarVoucherViewModel criarVoucherViewModel)
        {
            var content = ObterConteudo(criarVoucherViewModel);

            var response = await _httpClient.PostAsync("compras/pedido/voucher", content);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }

        public PedidoTransacaoViewModel MapearParaPedido(CarrinhoViewModel carrinho, EnderecoViewModel endereco)
        {
            var pedido = new PedidoTransacaoViewModel
            {
                ValorTotal = carrinho.ValorTotal,
                Itens = carrinho.Itens,
                Desconto = carrinho.Desconto,
                VoucherUtilizado = carrinho.VoucherUtilizado,
                VoucherCodigo = carrinho.Voucher?.Codigo
            };

            if (endereco != null)
            {
                pedido.Endereco = new EnderecoViewModel
                {
                    Logradouro = endereco.Logradouro,
                    Numero = endereco.Numero,
                    Bairro = endereco.Bairro,
                    Cep = endereco.Cep,
                    Complemento = endereco.Complemento,
                    Cidade = endereco.Cidade,
                    Estado = endereco.Estado
                };
            }

            return pedido;
        }


    }
}
