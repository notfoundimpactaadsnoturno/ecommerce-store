using EcommerceStore.Core.DomainObjects;
using EcommerceStore.Pedidos.Domain.Vouchers.Specs;
using System;

namespace EcommerceStore.Pedidos.Domain.Vouchers
{
    public class Voucher : Entity, IAggregateRoot
    {
        public string Codigo { get; private set; }
        public decimal? Percentual { get; private set; }
        public decimal? ValorDesconto { get; private set; }
        public int Quantidade { get; private set; }
        public TipoDescontoVoucher TipoDesconto { get; private set; }
        public DateTime DataCriacao { get; private set; }
        public DateTime? DataUtilizacao { get; private set; }
        public DateTime DataValidade { get; private set; }
        public bool Ativo { get; private set; }        
        public bool Utilizado { get; private set; }

        public Voucher() { }

        public Voucher(
            string codigo, 
            decimal? percentual, 
            decimal? valorDesconto, 
            int quantidade, 
            TipoDescontoVoucher tipoDesconto, 
            DateTime dataCriacao, 
            DateTime? dataUtilizacao, 
            DateTime dataValidade, 
            bool ativo, 
            bool utilizado)
        {
            Codigo = codigo;
            Percentual = percentual;
            ValorDesconto = valorDesconto;
            Quantidade = quantidade;
            TipoDesconto = tipoDesconto;
            DataCriacao = dataCriacao;
            DataUtilizacao = dataUtilizacao;
            DataValidade = dataValidade;
            Ativo = ativo;
            Utilizado = utilizado;
        }

        public bool EstaValidoParaUtilizacao()
        {
            return new VoucherValidation().Validate(this).IsValid;
        }

        public void DebitarQuantidade()
        {
            Quantidade -= 1;
            if (Quantidade >= 1) return;

            MarcarComoUtilizado();
        }

        public void MarcarComoUtilizado()
        {
            Ativo = false;
            Utilizado = true;
            Quantidade = 0;
            DataUtilizacao = DateTime.Now;
        }     
    }
}
