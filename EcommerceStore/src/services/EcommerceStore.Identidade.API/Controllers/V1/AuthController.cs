using EcommerceStore.Core.Messages.Integration;
using EcommerceStore.Identidade.API.Models;
using EcommerceStore.Identidade.API.Services;
using EcommerceStore.MessageBus;
using EcommerceStore.WebApi.Core.ControllerBase;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace EcommerceStore.Identidade.API.Controllers.V1
{
    [Route("api/identidade")]
    public class AuthController : MainController
    {
        private readonly AuthenticationService _authenticationService;
        private IMessageBus _bus;

        public AuthController(
            AuthenticationService authenticationService,
            IMessageBus bus)
        {
            _authenticationService = authenticationService;
            _bus = bus;
        }

        [HttpPost("nova-conta")]
        public async Task<ActionResult> Registrar(UsuarioRegistro usuarioRegistro)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var user = new IdentityUser
            {
                UserName = usuarioRegistro.Email,
                Email = usuarioRegistro.Email,
                EmailConfirmed = true
            };

            var result = await _authenticationService.UserManager.CreateAsync(user, usuarioRegistro.Senha);

            if (result.Succeeded)
            {
                var claim = new Claim("Catalogo", "Ler");

                var claimResult = await _authenticationService.UserManager.AddClaimAsync(user, claim);

                var clienteResult = await RegistrarCliente(usuarioRegistro);

                if (!clienteResult.ValidationResult.IsValid)
                {
                    await _authenticationService.UserManager.DeleteAsync(user);

                    return CustomResponse(clienteResult.ValidationResult);
                }

                return CustomResponse(await _authenticationService.GerarJwt(usuarioRegistro.Email));
            }

            foreach (var error in result.Errors)
                AdicionarErroProcessamento(error.Description);

            return CustomResponse();
        }

        [HttpPost("autenticar")]
        public async Task<ActionResult> Login(UsuarioLogin usuarioLogin)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var result = await _authenticationService.SignInManager.PasswordSignInAsync(usuarioLogin.Email, usuarioLogin.Senha, false, true);

            if (result.Succeeded)
            {
                return CustomResponse(await _authenticationService.GerarJwt(usuarioLogin.Email));
            }

            if (result.IsLockedOut)
            {
                AdicionarErroProcessamento("Usuário bloqueado por tentativas inválidas");
                return CustomResponse();
            }

            AdicionarErroProcessamento("Usuário ou senha incorretos");

            return CustomResponse();
        }

        [HttpPost("refresh-token")]
        public async Task<ActionResult> RefreshToken([FromBody] string refreshToken)
        {
            if (string.IsNullOrEmpty(refreshToken))
            {
                AdicionarErroProcessamento("Refresh token inválido");

                return CustomResponse();
            }

            var token = await _authenticationService.ObterRefreshToken(Guid.Parse(refreshToken));

            if(token is null)
            {
                AdicionarErroProcessamento("Refresh Token expirado");

                return CustomResponse();
            }

            return CustomResponse(await _authenticationService.GerarJwt(token.Username));
        }



        private async Task<ResponseMessage> RegistrarCliente(UsuarioRegistro usuarioRegistro)
        {
            var usuario = await _authenticationService.UserManager.FindByEmailAsync(usuarioRegistro.Email);

            var usuarioRegistrado =
                new UsuarioRegistradoIntegrationEvent(Guid.Parse(usuario.Id), usuarioRegistro.Nome, usuarioRegistro.Email, usuarioRegistro.Cpf);

            try
            {
                var retorno = await _bus.RequestAsync<UsuarioRegistradoIntegrationEvent, ResponseMessage>(usuarioRegistrado);

                return retorno;
            }
            catch
            {
                await _authenticationService.UserManager.DeleteAsync(usuario);

                throw;
            }
        }
    }
}
