using EcommerceStore.WebApp.MVC.Models.Enums;
using System.ComponentModel;

namespace EcommerceStore.WebApp.MVC.Models
{
    public class CriarVoucherViewModel
    {
        [DisplayName("Código")]
        public string Codigo { get; set; }

        [DisplayName("Percentual%")]
        public bool EhPercentual { get; set; }        

        [DisplayName("Total")]
        public bool EhTotal { get; set; }

        [DisplayName("Valor Desconto")]
        public decimal? ValorDesconto { get; set; }

        public decimal? Percentual { get; set; }

        [DisplayName("Quantos voucher deseja criar ?")]
        public int? Quantidade { get; set; }               

        public TipoDescontoVoucher TipoDescontoVoucher { get; set; }

        [DisplayName("Válido por quantos dias a partir de hoje ?")]
        public int? ValidadeEmDias { get; set; }
    }   
}
