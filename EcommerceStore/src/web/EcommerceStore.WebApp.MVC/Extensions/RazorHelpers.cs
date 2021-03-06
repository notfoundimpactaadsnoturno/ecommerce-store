using EcommerceStore.WebApi.Core.Usuario;
using Microsoft.AspNetCore.Mvc.Razor;
using System;
using System.Security.Cryptography;
using System.Text;
using System.Threading;

namespace EcommerceStore.WebApp.MVC.Extensions
{
    public static class RazorHelpers
    {
        public static string HashEmailForGravatar(this RazorPage page, string email)
        {
            var md5Hasher = MD5.Create();
            var data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(email));
            var sBuilder = new StringBuilder();
            foreach (var t in data)
            {
                sBuilder.Append(t.ToString("x2"));
            }
            return sBuilder.ToString();
        }

        public static string FormatoMoeda(this RazorPage page, decimal valor)
        {
            return valor > 0 ? string.Format(Thread.CurrentThread.CurrentCulture, "{0:C}", valor) : "Gratuito";
        }

        public static string MensagemEstoque(this RazorPage page, int quantidade)
        {
            return quantidade > 0 ? $"Apenas {quantidade} em estoque!" : "Produto esgotado!";
        }

        public static string UnidadesPorProduto(this RazorPage page, int unidades)
        {
            return unidades > 1 ? $"{unidades} uniades" : $"{unidades} unidade";
        }

        public static string SelectOptionsPorQuantidade(this RazorPage page, int quantidade, int valorSelecionado = 0)
        {
            var sb = new StringBuilder();

            for (int i = 0; i <= quantidade; i++)
            {
                var selected = "";
                
                if (i == valorSelecionado) 
                    selected = "selected";

                sb.Append($"<option {selected} value='{i}'>{i}</option>");
            }

            return sb.ToString();
        }

        public static string UnidadesPorProdutoValorTotal(this RazorPage page, int unidades, decimal valor)
        {
            return $"{unidades}x {FormatoMoeda(valor)} = Total: {FormatoMoeda(valor * unidades)}";
        }

        private static string FormatoMoeda(decimal valor)
        {
            return string.Format(Thread.CurrentThread.CurrentCulture, "{0:C}", valor);
        }

        public static string ExibeStatus(this RazorPage page, int status)
        {
            var statusMensagem = "";
            var statusClasse = "";

            switch (status)
            {
                case 1:
                    statusClasse = "info";
                    statusMensagem = "Em aprovação";
                    break;
                case 2:
                    statusClasse = "primary";
                    statusMensagem = "Aprovado";
                    break;
                case 3:
                    statusClasse = "danger";
                    statusMensagem = "Recusado";
                    break;
                case 4:
                    statusClasse = "success";
                    statusMensagem = "Entregue";
                    break;
                case 5:
                    statusClasse = "warning";
                    statusMensagem = "Cancelado";
                    break;

            }

            return $"<span class='badge badge-{statusClasse}'>{statusMensagem}</span>";
        }

        public static string ObterNomeUsuario(this RazorPage page,IAspNetUser user)
        {
            return $"{user.ObterUserEmail()}";
        }

        public static string ObterDescricaoStatus(this RazorPage page, int status)
        {
            switch (status)
            {
                case 1: return PedidoStatus.Autorizado.ToString();
                case 2: return PedidoStatus.Pago.ToString();
                case 3: return PedidoStatus.Recusado.ToString();
                case 4: return PedidoStatus.Entregue.ToString();
                case 5: return PedidoStatus.Cancelado.ToString();
                default:
                    throw new ArgumentException("Status inexistente");
            }
        }

        public static string ObterDescricaoPedido(this RazorPage page, int quantidade, string palavra)
        {
            return quantidade > 1 ? palavra + "s" : palavra;
        }
    }

    public enum PedidoStatus
    {
        Autorizado = 1,
        Pago = 2,
        Recusado = 3,
        Entregue = 4,
        Cancelado = 5
    }
}
