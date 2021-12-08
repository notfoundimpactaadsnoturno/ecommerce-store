using System;

namespace EcommerceStore.Core.Messages.Integration
{
    public class PedidoRealizadoIntegrationEvent : IntegrationEvent
    {
        public Guid ClienteId { get; set; }

        public PedidoRealizadoIntegrationEvent(Guid clienteId)
        {
            AggregateId = clienteId;
            ClienteId = clienteId;
        }
    }
}
