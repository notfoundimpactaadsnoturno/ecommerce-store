using EcommerceStore.Pedidos.API.Application.Commands;
using EcommerceStore.Pedidos.Domain.Vouchers;
using System;

namespace EcommerceStore.Pedidos.API.Application.Factory
{
    public static class VoucherFactory
    {
        public static Voucher CriarVoucher(AdicionarVoucherCommand message)
        {
            DateTime dataCriacao = DateTime.Now;

            DateTime? dataUtilizacao = null;

            bool ativo = true;

            bool utilizado = false;

            var dataValida = DateTime.Now.AddDays(message.ValidadeEmDias.Value);

            var voucher = new Voucher(
                message.Codigo,
                message.Percentual,
                message.ValorDesconto,
                message.Quantidade.Value,
                message.TipoDescontoVoucher,
                dataCriacao,
                dataUtilizacao,
                dataValida,
                ativo,
                utilizado
                );

            return voucher;
        }
    }

}
