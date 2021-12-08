using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Security.Claims;

namespace EcommerceStore.WebApi.Core.Usuario
{
    public interface IAspNetUser
    {
        string Admin { get; }
        string Name { get; }
        Guid ObterUserId();
        string ObterUserEmail();
        string ObterUserToken();
        string ObterUserRefreshToken();
        bool EstaAutenticado();
        bool PossuiRole(string role);
        IEnumerable<Claim> ObterClaims();
        HttpContext ObterHttpContext();

        bool EhAdmin();
    }
}
