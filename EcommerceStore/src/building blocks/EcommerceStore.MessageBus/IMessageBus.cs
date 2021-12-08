using EasyNetQ;
using EcommerceStore.Core.Messages.Integration;
using System;
using System.Threading.Tasks;

namespace EcommerceStore.MessageBus
{
    // install-package EasyNetQ -version 5.1.1
    public interface IMessageBus : IDisposable
    {
        bool IsConnected { get; }
        IAdvancedBus AdvancedBus { get; }

        void Publish<T>(T message) where T : IntegrationEvent;
        Task PublishAsync<T>(T message) where T : IntegrationEvent;
        void Subscribe<T>(string subscribeId, Action<T> onMessage) where T : class;
        void SubscribeAsync<T>(string subscribeId, Func<T, Task> onMessage) where T : class;

        TResponse Request<TRequest, TResponse>(TRequest request)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage;

        Task<TResponse> RequestAsync<TRequest, TResponse>(TRequest request)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage;

        IDisposable Respond<TRequest, TResponse>(Func<TRequest, TResponse> responder)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage;

        IDisposable RespondAsync<TRequest, TResponse>(Func<TRequest, Task<TResponse>> responder)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage;
    }
}