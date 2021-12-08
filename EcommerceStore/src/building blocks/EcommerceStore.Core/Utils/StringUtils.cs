using System.Linq;

namespace EcommerceStore.Core.Utils
{
    public static class StringUtils
    {
        public static string ApenasNumero(this string str, string input)
        {
            return new string(input.Where(char.IsDigit).ToArray());
        }
    }
}
