using EcommerceStore.Core.DomainObjects;
using System;

namespace EcommerceStore.Core.Data
{
    public interface IRepository<T> : IDisposable where T : IAggregateRoot
    {
        IUnitOfWork UnitOfWork { get; }
    }
}
