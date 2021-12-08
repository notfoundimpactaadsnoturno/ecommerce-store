using System.Threading.Tasks;

namespace EcommerceStore.Core.Data
{
    public interface IUnitOfWork
    {
        Task<bool> Commit();
    }
}
