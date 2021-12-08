using EcommerceStore.Core.Communication;
using EcommerceStore.WebApi.Core.Usuario;
using EcommerceStore.WebApp.MVC.Extensions;
using EcommerceStore.WebApp.MVC.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public class AutenticacaoService : Service, IAutenticacaoService
    {
        private readonly HttpClient _httpClient;
        private readonly IAspNetUser _aspNetUser;
        private readonly IAuthenticationService _authenticationService;

        public AutenticacaoService(HttpClient httpClient, 
                                   IOptions<AppSettings> settings,
                                   IAspNetUser aspNetUser,
                                   IAuthenticationService authenticationService)
        {
            _httpClient = httpClient;    
            _httpClient.BaseAddress = new Uri(settings.Value.AutenticacaoUrl);

            _aspNetUser = aspNetUser;
            _authenticationService = authenticationService;
        }

        public async Task<UsuarioRespostaLogin> Login(UsuarioLogin usuarioLogin)
        {
            var loginContent = ObterConteudo(usuarioLogin);

            var response = await _httpClient.PostAsync($"api/identidade/autenticar", loginContent);           

            if (!TratarErrosResponse(response))
            {
                return new UsuarioRespostaLogin()
                {
                    ResponseResult = await DeserializeObjetoResponse<ResponseResult>(response)
                };
            }

            return await DeserializeObjetoResponse<UsuarioRespostaLogin>(response);
        }

        public async Task<UsuarioRespostaLogin> Registro(UsuarioRegistro usuarioRegistro)
        {
            var registroContent = ObterConteudo(usuarioRegistro);

            var response = await _httpClient.PostAsync($"api/identidade/nova-conta", registroContent);           

            if (!TratarErrosResponse(response))
            {
                return new UsuarioRespostaLogin()
                {
                    ResponseResult = await DeserializeObjetoResponse<ResponseResult>(response)
                };
            }

            return await DeserializeObjetoResponse<UsuarioRespostaLogin>(response);
        }

        public async Task<UsuarioRespostaLogin> UtilizarRefreshToken(string refreshToken)
        {
            var refreshTokenContent = ObterConteudo(refreshToken);

            var response = await _httpClient.PostAsync($"api/identidade/refresh-token", refreshTokenContent);

            if (!TratarErrosResponse(response))
            {
                return new UsuarioRespostaLogin()
                {
                    ResponseResult = await DeserializeObjetoResponse<ResponseResult>(response)
                };
            }

            return await DeserializeObjetoResponse<UsuarioRespostaLogin>(response);
        }

        public async Task RealizarLogin(UsuarioRespostaLogin usuarioRespostaLogin)
        {
            var token = ObterTokenFormatado(usuarioRespostaLogin.AccessToken);

            var claims = new List<Claim>();
            claims.Add(new Claim("JWT", usuarioRespostaLogin.AccessToken));
            claims.Add(new Claim("RefreshToken", usuarioRespostaLogin.RefreshToken));
            claims.AddRange(token.Claims);

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var authProperties = new AuthenticationProperties
            {
                ExpiresUtc = DateTimeOffset.UtcNow.AddHours(8),
                IsPersistent = true
            };            

            await _authenticationService.SignInAsync(
                _aspNetUser.ObterHttpContext(),
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(claimsIdentity),
                authProperties);
        }

        public async Task Logout()
        {
            await _authenticationService.SignOutAsync(
                _aspNetUser.ObterHttpContext(),
                CookieAuthenticationDefaults.AuthenticationScheme,
                null);            
        }

        public JwtSecurityToken ObterTokenFormatado(string jwtToken)
        {
            return new JwtSecurityTokenHandler().ReadToken(jwtToken) as JwtSecurityToken;
        }

        public bool TokenExpirado()
        {
            var jwt = _aspNetUser.ObterUserToken();
            
            if (string.IsNullOrWhiteSpace(jwt)) return false;

            var token = ObterTokenFormatado(jwt);

            var dataToken = token.ValidTo.ToLocalTime();

            return dataToken < DateTime.Now;
        }

        public async Task<bool> RefreshTokenValido()
        {
            var response = await UtilizarRefreshToken(_aspNetUser.ObterUserRefreshToken());

            if(response.AccessToken != null && response.ResponseResult is null)
            {
                await RealizarLogin(response);

                return true;
            }

            return false;
        }
    }
}
