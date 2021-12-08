using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Linq;
using System.Security.Claims;

namespace EcommerceStore.WebApi.Core.Identidade
{
    public class CustomAuthorization
    {
        public static bool ExistirClaimsUsuario(HttpContext context, string claimType, string claimValue)
        {   
            return context.User.Identity.IsAuthenticated &&
                context.User.Claims.Any(claim => claim.Type == claimType && claim.Value.Contains(claimValue));
        }
    }

    public class ClaimsAuthorizeAttribute : TypeFilterAttribute
    {
        public ClaimsAuthorizeAttribute(string claimType, string claimValue) : base(typeof(RequisitoClaimFilter))
        {
            Arguments = new object[] { new Claim(claimType, claimValue) };
        }
    }

    public class RequisitoClaimFilter : IAuthorizationFilter
    {
        private readonly Claim _claim;

        public RequisitoClaimFilter(Claim claim)
        {
            _claim = claim;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            if (!context.HttpContext.User.Identity.IsAuthenticated)
            {
                context.Result = new StatusCodeResult(401);

                return;
            }

            if(!CustomAuthorization.ExistirClaimsUsuario(context.HttpContext, _claim.Type, _claim.Value))
            {
                context.Result = new StatusCodeResult(403);
            }
        }
    }
}
