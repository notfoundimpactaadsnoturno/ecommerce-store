using System;
using System.ComponentModel;

namespace EcommerceStore.WebApp.MVC.Models
{
    public class ListarVoucherViewModel
    {
        [DisplayName("Código")]
        public string Codigo { get; set; }        

        [DisplayName("Total")]
        public decimal? ValorDesconto { get; set; }

        [DisplayName("Percentual")]
        public decimal? Percentual { get; set; }

        [DisplayName("Quantidade")]
        public int? Quantidade { get; set; }

        [DisplayName("Criado em")]
        public DateTime DataCriacao { get;  set; }        
        
        [DisplayName("Válido até")]
        public DateTime DataValidade { get;  set; }

        [DisplayName("Ativo")]
        public bool Ativo { get;  set; }

        [DisplayName("Utilizado")]
        public bool Utilizado { get;  set; }
    }
}
