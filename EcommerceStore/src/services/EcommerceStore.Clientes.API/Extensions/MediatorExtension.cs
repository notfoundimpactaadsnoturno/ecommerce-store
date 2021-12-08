using EcommerceStore.Core.DomainObjects;
using EcommerceStore.Core.Mediator;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.Clientes.API.Extensions
{
    public static  class MediatorExtension
    {
        public static async Task PublicarEventos<T>(this IMediatorHandler mediatorHandler, T context) where T : DbContext
        {
            var domainEntities = context.ChangeTracker
                .Entries<Entity>()
                .Where(ent => ent.Entity.Notificacoes != null && ent.Entity.Notificacoes.Any());

            var domainEvents = domainEntities
                .SelectMany(ent => ent.Entity.Notificacoes)
                .ToList();

            domainEntities.ToList()
                .ForEach(entity => entity.Entity.LimparEventos());

            var tasks = domainEvents
                .Select(async (domainEvent) =>
                {
                    await mediatorHandler.PublicarEvento(domainEvent);
                });

            await Task.WhenAll(tasks);
        }
    }
}
