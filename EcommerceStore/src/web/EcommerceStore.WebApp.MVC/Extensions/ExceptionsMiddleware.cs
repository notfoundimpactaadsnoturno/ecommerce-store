using EcommerceStore.WebApp.MVC.Services;
using Grpc.Core;
using Microsoft.AspNetCore.Http;
using Polly.CircuitBreaker;
using Refit;
using System;
using System.Net;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Extensions
{
    public class ExceptionsMiddleware
    {
        private readonly RequestDelegate _next;
        private static IAutenticacaoService _autenticacaoService;

        public ExceptionsMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(
            HttpContext httpContext, 
            IAutenticacaoService autenticacaoService)
        {
            _autenticacaoService = autenticacaoService;

            try
            {
                await _next(httpContext);
            }
            catch (CustomHttpResponseException ex)
            {
                HandlerRequestExceptionAsyn(httpContext, ex.StatusCode);
            }
            catch (ValidationApiException ex)
            {
                HandlerRequestExceptionAsyn(httpContext, ex.StatusCode);
            }
            catch (ApiException ex)
            {
                HandlerRequestExceptionAsyn(httpContext, ex.StatusCode);
            }
            catch (BrokenCircuitException)
            {
                HandlerCircuitBrokenExceptionAsyn(httpContext);
            }
            catch (RpcException ex)
            {
                // Catch para obter erros de GRPC para quando o mesmo estiver com token invalido
                // gRPC trabalha com status code diferentes segue mapeamento dos status

                // 400 Bad Request          INTERNAL
                // 401 Unauthorized         UNAUTHENTICATED
                // 403 Forbidden            PERMISSION_DENIED
                // 404 Not Found            UNIMPLEMENTED

                var statusCode = ex.StatusCode switch
                {
                    StatusCode.Internal => 400,
                    StatusCode.Unauthenticated => 401,
                    StatusCode.PermissionDenied => 403,
                    StatusCode.Unimplemented => 404,
                    _ => 500
                };

                var httpStatusCode = (HttpStatusCode)Enum.Parse(typeof(HttpStatusCode), statusCode.ToString());

                HandlerRequestExceptionAsyn(httpContext, httpStatusCode);
            };
        }

        private static void HandlerRequestExceptionAsyn(HttpContext context, HttpStatusCode statusCode)
        {
            if(statusCode == HttpStatusCode.Unauthorized)
            {
                if (_autenticacaoService.TokenExpirado())
                {
                    if (_autenticacaoService.RefreshTokenValido().Result)
                    {
                        context.Response.Redirect(context.Request.Path);                        
                        return;
                    }
                }

                _autenticacaoService.Logout();

                context.Response.Redirect($"/login?ReturnUrl={context.Request.Path}");
                return;
            }

            context.Response.StatusCode = (int)statusCode;
        }

        private static void HandlerCircuitBrokenExceptionAsyn(HttpContext context)
        {  
                context.Response.Redirect($"/sistema-indisponivel");
        }
    }
}
