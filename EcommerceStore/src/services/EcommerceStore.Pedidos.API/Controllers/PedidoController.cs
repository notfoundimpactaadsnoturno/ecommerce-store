using EcommerceStore.Core.Mediator;
using EcommerceStore.Pedidos.API.Application.Commands;
using EcommerceStore.Pedidos.API.Application.Queries;
using EcommerceStore.WebApi.Core.ControllerBase;
using EcommerceStore.WebApi.Core.Usuario;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.API.Controllers
{
    [Authorize]
    public class PedidoController : MainController
    {
        private readonly IPedidoQueries _pedidoQueries;
        private readonly IAspNetUser _user;
        private readonly IMediatorHandler _mediatorHandler;

        public PedidoController(
            IPedidoQueries pedidoQueries, 
            IAspNetUser user, 
            IMediatorHandler mediatorHandler)
        {
            _pedidoQueries = pedidoQueries;
            _user = user;
            _mediatorHandler = mediatorHandler;
        }
        
        [HttpPost("pedido")]
        public async Task<IActionResult> AdicionarPedido(AdicionarPedidoCommand pedido)
        {
            pedido.ClienteId = _user.ObterUserId();

            var result = await _mediatorHandler.EnviarCommando(pedido);

            return CustomResponse(result);
        }

        [HttpGet("pedido/ultimo")]
        public async Task<IActionResult> UltimoPedido()
        {           
            var pedido = await _pedidoQueries.ObterUltimoPedido(_user.ObterUserId());

            return pedido == null ? NotFound() : CustomResponse(pedido);
        }

        [HttpGet("pedido/lista-cliente")]
        public async Task<IActionResult> ListaPorCliente()
        {
            var pedido = await _pedidoQueries.ObterListaPorClienteId(_user.ObterUserId());

            return pedido == null ? NotFound() : CustomResponse(pedido);
        }

        [HttpGet("pedido/lista-pedido")]
        public async Task<IActionResult> ListaDeTodosOsPedidos([FromQuery] int pageSize, [FromQuery] int page)
        {
            var pedidos = await _pedidoQueries.ObterTodosOsPedidos(pageSize, page);

            return CustomResponse(pedidos);
        }
    }
}
