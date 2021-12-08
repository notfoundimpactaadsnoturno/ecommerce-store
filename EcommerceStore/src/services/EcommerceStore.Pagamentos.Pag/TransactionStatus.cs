namespace EcommerceStore.Pagamentos.Pag
{
    public enum TransactionStatus
    {
        Authorized = 1,
        Paid = 2,
        Refused = 3,
        Chargedback = 4,
        Cancelled = 5
    }

}
