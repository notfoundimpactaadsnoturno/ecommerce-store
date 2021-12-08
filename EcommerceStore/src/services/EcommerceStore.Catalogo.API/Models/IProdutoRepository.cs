using EcommerceStore.Core.Data;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.Catalogo.API.Models
{
    public interface IProdutoRepository : IRepository<Produto>
    {
        Task<PagedResult<Produto>> ObterTodos(int pageSize, int pageIndex, string query = null);
        Task<Produto> ObterPorId(Guid id);
        Task<List<Produto>> ObterPordutosPorId(string ids);

        void Adicionar(Produto produto);
        void Atualizar(Produto produto);
    }
}
