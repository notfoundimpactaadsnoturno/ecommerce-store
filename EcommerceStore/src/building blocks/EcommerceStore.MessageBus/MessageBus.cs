using EasyNetQ;
using EcommerceStore.Core.Messages.Integration;
using Polly;
using RabbitMQ.Client.Exceptions;
using System;
using System.Threading.Tasks;

namespace EcommerceStore.MessageBus
{
    // install-package polly -version 7.2.2
    public class MessageBus : IMessageBus
    {
        private IBus _bus;
        private IAdvancedBus _advancedBus;

        private readonly string _connectionString;

        public MessageBus(string connectionString)
        {
            _connectionString = connectionString;

            TryConnect();
        }

        public bool IsConnected => _bus?.IsConnected ?? false;
        public IAdvancedBus AdvancedBus => _bus?.Advanced;

        public void Publish<T>(T message) where T : IntegrationEvent
        {
            TryConnect();

            _bus.Publish(message);
        }

        public async Task PublishAsync<T>(T message) where T : IntegrationEvent
        {
            TryConnect();

            await _bus.PublishAsync(message);
        }

        public void Subscribe<T>(string subscribeId, Action<T> onMessage) where T : class
        {
            TryConnect();

            _bus.Subscribe(subscribeId, onMessage);
        }

        public void SubscribeAsync<T>(string subscribeId, Func<T, Task> onMessage) where T : class
        {
            TryConnect();

            _bus.SubscribeAsync(subscribeId, onMessage);
        }

        public TResponse Request<TRequest, TResponse>(TRequest request)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage
        {
            TryConnect();

            return _bus.Request<TRequest, TResponse>(request);
        }

        public async Task<TResponse> RequestAsync<TRequest, TResponse>(TRequest request)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage
        {
            TryConnect();

            return await _bus.RequestAsync<TRequest, TResponse>(request);
        }

        public IDisposable Respond<TRequest, TResponse>(Func<TRequest, TResponse> request)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage
        {
            TryConnect();

            return _bus.Respond<TRequest, TResponse>(request);
        }

        public IDisposable RespondAsync<TRequest, TResponse>(Func<TRequest, Task<TResponse>> request)
            where TRequest : IntegrationEvent
            where TResponse : ResponseMessage
        {
            TryConnect();

            return _bus.RespondAsync<TRequest, TResponse>(request);
        }

        private void TryConnect()
        {
            if (IsConnected) return;

            var policy = Policy.Handle<EasyNetQException>()
                .Or<BrokerUnreachableException>()                
                .WaitAndRetry(3, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));

            policy.Execute(() =>
            {
                _bus = RabbitHutch.CreateBus(_connectionString);
                _advancedBus = _bus.Advanced;
                _advancedBus.Disconnected += OnDisconnect;
            });
        }

        private void OnDisconnect(object s, EventArgs e)
        {
            var policy = Policy.Handle<EasyNetQException>()
                  .Or<BrokerUnreachableException>()
                  .RetryForever();

            policy.Execute(TryConnect);
        }

        public void Dispose()
        {
            _bus?.Dispose();
        }
    }
}
