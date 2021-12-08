using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Linq;

namespace EcommerceStore.WebApp.MVC.Models.Validators
{
    public static class ValidatorsUtils
    {
        public static bool EstaNulloOuVazio(string valor)
           => !string.IsNullOrWhiteSpace(valor);

        public static bool EhImagemValida(IFormFile file)
        {
            if (file == null) return false;

            file?.Name.Contains("");

            return ImagensPermitidas().Select(ext => !file.FileName.Contains(ext)).FirstOrDefault();
        }

        public static List<string> ImagensPermitidas()
        {
            return new List<string>()
            {
                ".png",
                ".jpeg",
                ".jpg"
            };
        }

        public static bool ImagemMuitoGrande(IFormFile file)
        {
            return file?.Length < 1048576 + 1;
        }
    }
}
