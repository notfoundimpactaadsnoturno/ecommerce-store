namespace EcommerceStore.Bff.Compras.Models
{
    public class CriarVoucherDTO
    {
        public string Codigo { get; set; }
        public decimal? ValorDesconto { get; set; }
        public decimal? Percentual { get; set; }
        public int? Quantidade { get; set; }
        public TipoDescontoVoucher TipoDescontoVoucher { get; set; }
        public int? ValidadeEmDias { get; set; }
    }
}
