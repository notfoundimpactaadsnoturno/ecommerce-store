using EcommerceStore.Core.Communication;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace EcommerceStore.Bff.Compras.Services
{
    public abstract class Service
    {
        protected StringContent ObterConteudo(object dado)
        {
            return new StringContent(
                         JsonSerializer.Serialize(dado),
                         Encoding.UTF8,
                         "application/json");
        }

        protected async Task<T> DeserializeObjetoResponse<T>(HttpResponseMessage responseMessage)
        {
            var json = await responseMessage.Content.ReadAsStringAsync();

            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            };

            return JsonSerializer.Deserialize<T>(json, options);
        }

        protected bool TratarErrosResponse(HttpResponseMessage response)
        {
            if (response.StatusCode == HttpStatusCode.BadRequest) return false;

            response.EnsureSuccessStatusCode();
            return true;
        }

        protected ResponseResult RetornoOk()
        {
            return new ResponseResult();
        }
    }

}
