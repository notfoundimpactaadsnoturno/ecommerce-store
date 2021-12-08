using EcommerceStore.Clientes.API.Application.Commands;
using EcommerceStore.Clientes.API.Models;
using EcommerceStore.Core.Mediator;
using EcommerceStore.WebApi.Core.ControllerBase;
using EcommerceStore.WebApi.Core.Usuario;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace EcommerceStore.Clientes.API.Controllers
{
    public class ClientesController : MainController
    {
        private readonly IMediatorHandler _mediatorHandler;
        private readonly IClienteRepository _clienteRepository;
        private readonly IAspNetUser _user;

        public ClientesController(IMediatorHandler mediatorHandler, IClienteRepository clienteRepository, IAspNetUser user)
        {
            _mediatorHandler = mediatorHandler;
            _clienteRepository = clienteRepository;
            _user = user;
        }

        [HttpGet("cliente/endereco")]
        public async Task<IActionResult> ObterEndereco()
        {
            var endereco = await _clienteRepository.ObterEnderecoPorClienteId(_user.ObterUserId());

            return endereco == null ? NotFound() : CustomResponse(endereco);
        }

        [HttpPost("cliente/endereco")]
        public async Task<IActionResult> AdicionarEndereco(AdicionarEnderecoCommand endereco)
        {
            endereco.ClienteId = _user.ObterUserId();

            return CustomResponse(await _mediatorHandler.EnviarCommando(endereco));
        }
    }

}
