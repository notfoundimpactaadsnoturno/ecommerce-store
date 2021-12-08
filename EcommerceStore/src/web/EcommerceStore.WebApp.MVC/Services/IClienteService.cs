using EcommerceStore.Core.Communication;
using EcommerceStore.WebApp.MVC.Models;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public interface IClienteService
    {
        Task<EnderecoViewModel> ObterEndereco();
        Task<ResponseResult> AdicionarEndereco(EnderecoViewModel endereco);
    }
}
