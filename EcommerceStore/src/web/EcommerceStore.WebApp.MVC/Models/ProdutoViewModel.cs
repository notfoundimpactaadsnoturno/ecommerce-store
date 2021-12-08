using Microsoft.AspNetCore.Http;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace EcommerceStore.WebApp.MVC.Models
{
    public class ProdutoViewModel
    {
        public Guid Id { get; set; }
        
        [DisplayName("Nome")]
        public string Nome { get; set; }

        [DisplayName("Descrição")]
        public string Descricao { get; set; }

        [DisplayName("Ativo?")]
        public bool Ativo { get; set; }
        
        public decimal? Valor { get; set; }

        [ScaffoldColumn(false)]
        public DateTime DataCadastro { get; set; }

        [DisplayName("Quantidade em Estoque")]        
        public int? QuantidadeEstoque { get; set; }

        [DisplayName("Imagem")]        
        public IFormFile ImagemUpload { get; set; }

        [ScaffoldColumn(false)]
        public string Imagem { get; set; }
    }

}
