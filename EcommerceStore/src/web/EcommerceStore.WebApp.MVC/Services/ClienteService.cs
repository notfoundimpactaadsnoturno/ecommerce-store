using EcommerceStore.Core.Communication;
using EcommerceStore.WebApp.MVC.Extensions;
using EcommerceStore.WebApp.MVC.Models;
using Microsoft.Extensions.Options;
using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public class ClienteService : Service, IClienteService
    {
        private readonly HttpClient _httpClient;

        public ClienteService(HttpClient httpClient, IOptions<AppSettings> settings)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri(settings.Value.ClienteUrl);
        }

        public async Task<EnderecoViewModel> ObterEndereco()
        {
            var response = await _httpClient.GetAsync("cliente/endereco");

            if (response.StatusCode == HttpStatusCode.NotFound) return null;

            TratarErrosResponse(response);

            return await DeserializeObjetoResponse<EnderecoViewModel>(response);
        }

        public async Task<ResponseResult> AdicionarEndereco(EnderecoViewModel endereco)
        {
            var enderecoContent = ObterConteudo(endereco);

            var response = await _httpClient.PostAsync("cliente/endereco", enderecoContent);

            if (!TratarErrosResponse(response)) return await DeserializeObjetoResponse<ResponseResult>(response);

            return RetornoOk();
        }       
    }
}
