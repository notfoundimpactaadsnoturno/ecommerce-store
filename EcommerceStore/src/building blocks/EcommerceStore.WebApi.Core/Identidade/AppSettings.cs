namespace EcommerceStore.WebApi.Core.Identidade
{
    public class AppSettings
    {
        // Autenticação JWT Padrão
        //public string Secret { get; set; }
        //public int  ExpiracaoHoras { get; set; }
        //public string Emissor { get; set; }
        //public string ValidaEm { get; set; }

        // Para usar com JWKS
        public string AutenticacaoJwksUrl { get; set; }
    }
}
