using EcommerceStore.WebApp.MVC.Models;
using Microsoft.AspNetCore.Mvc;

namespace EcommerceStore.WebApp.MVC.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [Route("sistema-indisponivel")]
        public IActionResult SistemaIndisponivel()
        {
            var modelErro = new ErrorViewModel
            {
                Mensagem = "Sistema indisponível temporariamente devido a sobrecarga de usuários :( !!!",
                Titulo = "Sistema indisponível.",
                ErroCode = 500
            };

            return View("Error", modelErro);
        }

        [Route("erro/{id:length(3,3)}")]
        public IActionResult Error(int id)
        {
            var modelErro = new ErrorViewModel();

            if (id == 500)
            {
                modelErro.Mensagem = "<br />Ocorreu um erro! Tente novamente mais tarde ou contate o nosso suporte :( !!!";
                modelErro.Titulo = "Ocorreu um erro!";
                modelErro.ErroCode = id;
            }
            else if (id == 404)
            {
                modelErro.Mensagem = "<br />A página que está procurando não existe! <br /> <br />Em caso de dúvidas entre em contato com nosso suporte :( !!!";
                modelErro.Titulo = "Ops! Página não encontrado.";
                modelErro.ErroCode = id;
            }
            else if (id == 403)
            {
                modelErro.Mensagem = "<br />Você não ter permissão para fazer isso. :( !!!";
                modelErro.Titulo = "Acesso Negado";
                modelErro.ErroCode = id;
            }
            else
            {
                StatusCode(404);
            }

            return View("Error", modelErro);
        }
    }
}
