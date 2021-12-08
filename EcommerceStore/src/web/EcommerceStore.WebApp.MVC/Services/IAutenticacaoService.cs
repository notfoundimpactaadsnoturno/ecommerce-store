using EcommerceStore.WebApp.MVC.Models;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Services
{
    public interface IAutenticacaoService
    {
        Task<UsuarioRespostaLogin> Login(UsuarioLogin usuarioLogin);
        Task<UsuarioRespostaLogin> Registro(UsuarioRegistro usuarioRegistro);
        Task RealizarLogin(UsuarioRespostaLogin usuarioRespostaLogin);
        Task Logout();
        bool TokenExpirado();        
        Task<bool> RefreshTokenValido();
    }
}
