using System.Collections.Generic;

namespace EcommerceStore.Core.Communication
{
    public class ResponseErrorMessages
    {
        public List<string> Mensagens { get; set; }

        public ResponseErrorMessages()
        {
            Mensagens = new List<string>();
        }
    }
}
