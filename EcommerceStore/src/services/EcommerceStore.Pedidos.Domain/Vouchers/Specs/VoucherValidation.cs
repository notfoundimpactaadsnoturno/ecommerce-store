using FluentValidation;
using System;

namespace EcommerceStore.Pedidos.Domain.Vouchers.Specs
{
    public class VoucherValidation : AbstractValidator<Voucher>
    {
        public VoucherValidation()
        {
            RuleFor(v => v.DataValidade)
                .Must(VoucherValido).WithMessage("Este voucher está expirado");

            RuleFor(v => v.Quantidade)
                .Must(VoucherNaoUtilizado).WithMessage("Este voucher já foi utilizado");

            RuleFor(v => v.Ativo)
                .Equal(true).WithMessage("Este voucher não está mais ativo");
        }

        private bool VoucherValido(DateTime validade) => validade >= DateTime.Now;

        private bool VoucherNaoUtilizado(int quantidade) => quantidade >= 0;
    }
}
