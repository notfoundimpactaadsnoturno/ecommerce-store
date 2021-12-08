using EcommerceStore.Bff.Compras.Models;
using System.Threading.Tasks;

namespace EcommerceStore.Bff.Compras.Services
{
    public interface IClienteService
    {
        Task<EnderecoDTO> ObterEndereco();
    }
}
