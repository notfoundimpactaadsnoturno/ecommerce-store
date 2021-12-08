using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace EcommerceStore.WebApp.MVC.Models
{
    public partial class PedidoViewModel
    {
        [DisplayName("Código")]
        public int Codigo { get; set; }
        #region Status

        // Autorizado = 1,
        // Pago = 2,
        // Recusado = 3,
        // Entregue = 4,
        // Cancelado = 5
        #endregion
        [DisplayName("Status")]
        public int Status { get; set; }
        [DisplayName("Criado")]
        public DateTime Data { get; set; }
        [DisplayName("Valor Total")]
        public decimal ValorTotal { get; set; }
        [DisplayName("Desconto")]
        public decimal Desconto { get; set; }
        [DisplayName("Utilizou Voucher")]
        public bool VoucherUtilizado { get; set; }
        public List<ItemPedidoViewModel> PedidoItens { get; set; } = new List<ItemPedidoViewModel>();
        public EnderecoViewModel Endereco { get; set; }        
    }
}