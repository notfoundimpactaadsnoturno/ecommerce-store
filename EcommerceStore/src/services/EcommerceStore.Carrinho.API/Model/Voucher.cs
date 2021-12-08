namespace EcommerceStore.Carrinho.API.Model
{
    public class Voucher
    {
        public decimal? Percentual { get; set; }
        public decimal? ValorDesconto { get; set; }
        public string Codigo { get; set; }        
        public TipoDescontoVoucher TipoDescontoVoucher { get; set; }
    }

    public class VoucherVideModel
    {
        public decimal? Percentual { get; set; }
        public decimal? ValorDesconto { get; set; }
        public string Codigo { get; set; }        
        public int TipoDesconto { get; set; }        
    }
}
