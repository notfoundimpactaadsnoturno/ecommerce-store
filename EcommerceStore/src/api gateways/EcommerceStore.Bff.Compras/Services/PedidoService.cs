using EcommerceStore.Bff.Compras.Extensions;
using EcommerceStore.Bff.Compras.Models;
using EcommerceStore.Core.Communication;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace EcommerceStore.Bff.Compras.Services
{
    public class PedidoService : Service, IPedidoService
    {
        private readonly HttpClient _httpClient;

        public PedidoService(HttpClient httpClient, IOptions<AppServicesSettings> settings)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri(settings.Value.PedidoUrl);
        }

        public async Task<ResponseResult> FinalizarPedido(PedidoDTO pedido)
        {
            var pedidoContent = ObterConteudo(pedido);

            var response = await _httpClient.PostAsync("pedido", pedidoContent);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }

        public async Task<PedidoDTO> ObterUltimoPedido()
        {
            var response = await _httpClient.GetAsync("pedido/ultimo");

            if (response.StatusCode == HttpStatusCode.NotFound) return null;

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<PedidoDTO>(response);
        }

        public async Task<IEnumerable<PedidoDTO>> ObterListaPorClienteId()
        {
            var response = await _httpClient.GetAsync("pedido/lista-cliente");

            if (response.StatusCode == HttpStatusCode.NotFound) return null;

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<IEnumerable<PedidoDTO>>(response);
        }

        public async Task<PagedResult<PedidoDTO>> ObterTodosOsPedidos(int pageSize, int page)
        {
            var response = await _httpClient.GetAsync($"pedido/lista-pedido?pageSize={pageSize}&page={page}");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<PagedResult<PedidoDTO>>(response);
        }

        public async Task<VoucherDTO> ObterVoucherPorCodigo(string codigo)
        {
            var response = await _httpClient.GetAsync($"voucher/{codigo}");

            if (response.StatusCode == HttpStatusCode.NotFound) return null;

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<VoucherDTO>(response);
        }

        public async Task<PagedResult<ListarVoucherDTO>> ObterVouchers(int pageSize, int page)
        {
            var response = await _httpClient.GetAsync($"listar-vouchers?pageSize={pageSize}&page={page}");

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<PagedResult<ListarVoucherDTO>>(response);
        }

        public async Task<ResponseResult> AdicionarVoucher(CriarVoucherDTO criarVoucherDTO)
        {
            var voucherContent = ObterConteudo(criarVoucherDTO);

            var response = await _httpClient.PostAsync($"voucher", voucherContent);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }
    }
}
