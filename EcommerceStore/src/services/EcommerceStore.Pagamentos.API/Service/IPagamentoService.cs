using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.Pagamentos.API.Models;
using System;
using System.Threading.Tasks;

namespace EcommerceStore.Pagamentos.API.Service
{
    public interface IPagamentoService
    {
        Task<ResponseMessage> AutorizarPagamento(Pagamento pagamento);
        Task<ResponseMessage> CapturarPagamento(Guid pedidoId);
        Task<ResponseMessage> CancelarPagamento(Guid pedidoId);
    }
}
