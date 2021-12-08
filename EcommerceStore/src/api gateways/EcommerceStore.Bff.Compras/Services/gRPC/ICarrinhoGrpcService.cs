using EcommerceStore.Bff.Compras.Models;
using System.Threading.Tasks;

namespace EcommerceStore.Bff.Compras.Services.gRPC
{
    public interface ICarrinhoGrpcService
    {
        Task<CarrinhoDTO> ObterCarrinho();
    }
}