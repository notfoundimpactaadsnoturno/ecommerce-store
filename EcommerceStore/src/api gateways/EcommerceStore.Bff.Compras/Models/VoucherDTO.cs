namespace EcommerceStore.Bff.Compras.Models
{
    public class VoucherDTO
    {
        public string Codigo { get; set; }
        public int TipoDesconto { get; set; }
        public decimal? Percentual { get; set; }
        public decimal? ValorDesconto { get; set; }
    }
}
