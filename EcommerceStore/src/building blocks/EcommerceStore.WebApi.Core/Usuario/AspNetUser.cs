using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Security.Claims;

namespace EcommerceStore.WebApi.Core.Usuario
{
    public class AspNetUser : IAspNetUser
    {
        public string Admin { get => "admin@admin.com"; }

        private readonly IHttpContextAccessor _accessor;

        public AspNetUser(IHttpContextAccessor httpContextAccessor)
        {
            _accessor = httpContextAccessor;
        }

        public string Name => _accessor.HttpContext.User.Identity.Name;

        public Guid ObterUserId()
        {
            return EstaAutenticado() ? Guid.Parse(_accessor.HttpContext.User.GetUserId()) : Guid.Empty;
        }

        public string ObterUserEmail()
        {
            return EstaAutenticado() ? _accessor.HttpContext.User.GetUserEmail() : "";
        }
        public string ObterUserToken()
        {
            return EstaAutenticado() ? _accessor.HttpContext.User.GetUserToken() : "";
        }

        public string ObterUserRefreshToken()
        {
            return EstaAutenticado() ? _accessor.HttpContext.User.GetUserRefreshToken() : "";
        }

        public bool PossuiRole(string role)
        {
            return _accessor.HttpContext.User.IsInRole(role);
        }
        public IEnumerable<Claim> ObterClaims()
        {
            return _accessor.HttpContext.User.Claims;
        }

        public HttpContext ObterHttpContext()
        {
            return _accessor.HttpContext;
        }
      
        public bool EstaAutenticado()
        {
            return _accessor.HttpContext.User.Identity.IsAuthenticated;
        }

        public bool EhAdmin()
            => ObterUserEmail().ToLower() == Admin;
    }
}
