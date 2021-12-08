namespace EcommerceStore.Pagamentos.Pag
{
    public class PagarmeService
    {
        public readonly string ApiKey;
        public readonly string EncryptionKey;

        public PagarmeService(string apiKey, string encryptionKey)
        {
            ApiKey = apiKey;
            EncryptionKey = encryptionKey;
        }
    }

}
