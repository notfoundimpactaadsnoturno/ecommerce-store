using System;

namespace EcommerceStore.Bff.Compras.Models
{
    public class ListarVoucherDTO
    {
        public string Codigo { get; set; }        
        public decimal? ValorDesconto { get; set; }        
        public decimal? Percentual { get; set; }        
        public int? Quantidade { get; set; }        
        public DateTime DataCriacao { get; set; }        
        public DateTime DataValidade { get; set; }
        public bool Ativo { get; set; }        
        public bool Utilizado { get; set; }
    }
}
