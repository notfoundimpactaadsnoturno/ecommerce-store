using EcommerceStore.Core.Messages;
using System;

namespace EcommerceStore.Pedidos.API.Application.Events
{
    public class PedidoRealizadoEvent : Event
    {
        public Guid PedidoId { get; private set; }
        public Guid ClienteId { get; private set; }

        public PedidoRealizadoEvent(Guid pedidoId, Guid clienteId)
        {
            AggregateId = pedidoId;
            PedidoId = pedidoId;
            ClienteId = clienteId;
        }
    }
}
