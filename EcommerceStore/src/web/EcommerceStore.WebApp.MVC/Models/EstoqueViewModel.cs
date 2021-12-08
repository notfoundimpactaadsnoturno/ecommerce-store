using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace EcommerceStore.WebApp.MVC.Models
{
    public class EstoqueViewModel
    {
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public Guid Id { get; set; }                
        
        [DisplayName("Quantidade em Estoque")]
        [Range(0, 10000, ErrorMessage = "Valor inválido")]
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public int QuantidadeEstoque { get; set; }        
    }

}
