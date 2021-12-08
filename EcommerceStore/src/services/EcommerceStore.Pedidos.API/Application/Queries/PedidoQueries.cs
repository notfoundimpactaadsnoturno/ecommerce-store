using Dapper;
using EcommerceStore.Pedidos.API.Application.DTO;
using EcommerceStore.Pedidos.Domain.Pedidos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.API.Application.Queries
{
    public class PedidoQueries : IPedidoQueries
    {
        private readonly IPedidoRepository _pedidoRepository;

        public PedidoQueries(IPedidoRepository pedidoRepository)
        {
            _pedidoRepository = pedidoRepository;
        }

        public async Task<PedidoDTO> ObterUltimoPedido(Guid clienteId)
        {
            const string sql = @"SELECT 
		                                P.ID AS 'ProdutoId', P.CODIGO, P.VOUCHERUTILIZADO, P.DESCONTO, P.VALORTOTAL, P.PEDIDOSTATUS,
		                                P.LOGRADOURO, P.NUMERO, P.BAIRRO, P.CEP, P.COMPLEMENTO, P.CIDADE, P.ESTADO,
		                                PIT.ID AS 'ProdutoItemId', PIT.PRODUTONOME, PIT.QUANTIDADE, PIT.PRODUTOIMAGEM, PIT.VALORUNITARIO
                                FROM		PEDIDOS P
                                INNER JOIN  PedidoItem PIT ON P.Id = PIT.PedidoId
                                WHERE	
	                                P.ClienteId = @clienteId
	                                AND	P.DataCadastro BETWEEN DATEADD(MINUTE, -3, GETDATE()) AND DATEADD(MINUTE, 0, GETDATE())
	                                AND	P.PedidoStatus = 1
	                                ORDER BY P.DataCadastro DESC";

            var pedido = await _pedidoRepository.ObterConexao()
                .QueryAsync<dynamic>(sql, new { clienteId });

            return MapearPedido(pedido);
        }

        public async Task<IEnumerable<PedidoDTO>> ObterListaPorClienteId(Guid clienteId)
        {
            var pedidos = await _pedidoRepository.ObterListaPorClienteId(clienteId);

            return pedidos.Select(pedido => PedidoDTO.ParaPedidoDTO(pedido));
        }

        public async Task<PagedResult<PedidoDTO>> ObterTodosOsPedidos(int pageSize, int page)
        {
            var pedidos = await _pedidoRepository.ObterTodosPedidos(pageSize, page);

            var totalPedidos = await _pedidoRepository.ObterQuantidadePedidosPedidos();

            var pagedResult = new PagedResult<PedidoDTO>();

            if (pedidos.Any())
            {
                var pedidosDTO = pedidos.Select(pedido => PedidoDTO.ParaPedidoDTO(pedido, false));
                pagedResult.List = pedidosDTO;
            }
            else
                pagedResult.List = new List<PedidoDTO>();

            pagedResult.PageSize = pageSize;
            pagedResult.PageIndex = page;
            pagedResult.Query = null;
            pagedResult.TotalResults = totalPedidos;

            return pagedResult;
        }

        public async Task<PedidoDTO> ObterPedidosAutorizados()
        {
            const string sql = @"SELECT TOP 1
                                P.ID AS 'PedidoId', P.ID, P.CLIENTEID, 
                                PI.ID AS 'PedidoItemId', PI.ID, PI.ProdutoId, PI.QUANTIDADE
                                FROM PEDIDOS P
                                INNER JOIN PedidoItem PI ON P.ID = PI.PEDIDOID
                                WHERE P.PEDIDOSTATUS = 1
                                ORDER BY P.DATACADASTRO";

            var pedidoDTO = await _pedidoRepository.ObterConexao()
                .QueryAsync<PedidoDTO, PedidoItemDTO, PedidoDTO>(sql,
                (pedido, pedidoItem) =>
                {
                    pedido.PedidoItens = new List<PedidoItemDTO>();
                    pedido.PedidoItens.Add(pedidoItem);

                    return pedido;
                }, splitOn: "PedidoId,PedidoItemId");

            return pedidoDTO.FirstOrDefault();
        }

        private PedidoDTO MapearPedido(dynamic result)
        {
            var pedido = new PedidoDTO
            {
                Codigo = result[0].CODIGO,
                Status = result[0].PEDIDOSTATUS,
                ValorTotal = result[0].VALORTOTAL,
                Desconto = result[0].DESCONTO,
                VoucherUtilizado = result[0].VOUCHERUTILIZADO,

                PedidoItens = new List<PedidoItemDTO>(),

                Endereco = new EnderecoDTO
                {
                    Logradouro = result[0].LOGRADOURO,
                    Bairro = result[0].BAIRRO,
                    Cep = result[0].CEP,
                    Cidade = result[0].CIDADE,
                    Complemento = result[0].COMPLEMENTO,
                    Estado = result[0].ESTADO,
                    Numero = result[0].NUMERO
                }
            };

            foreach (var item in result)
            {
                var pedidoItem = new PedidoItemDTO
                {
                    Nome = item.PRODUTONOME,
                    Valor = item.VALORUNITARIO,
                    Quantidade = item.QUANTIDADE,
                    Imagem = item.PRODUTOIMAGEM
                };

                pedido.PedidoItens.Add(pedidoItem);
            }

            return pedido;
        }
    }
}
