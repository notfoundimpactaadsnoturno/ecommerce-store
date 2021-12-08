﻿using Grpc.Core;
using Grpc.Core.Interceptors;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.Bff.Compras.Services.gRPC
{
    public class GrpcServiceInterceptor : Interceptor
    {
        private readonly ILogger<GrpcServiceInterceptor> _looger;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public GrpcServiceInterceptor(
            ILogger<GrpcServiceInterceptor> looger, 
            IHttpContextAccessor httpContextAccessor)
        {
            _looger = looger;
            _httpContextAccessor = httpContextAccessor;
        }

        public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(
            TRequest request, 
            ClientInterceptorContext<TRequest, TResponse> context, 
            AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
        {
            var token = _httpContextAccessor.HttpContext.Request.Headers["Authorization"];

            var headers = new Metadata()
            {
                {"Authorization", token }
            };

            var options = context.Options.WithHeaders(headers);

            context = new ClientInterceptorContext<TRequest, TResponse>(context.Method, context.Host, options);

            return base.AsyncUnaryCall(request, context, continuation);
        }
    }
}
