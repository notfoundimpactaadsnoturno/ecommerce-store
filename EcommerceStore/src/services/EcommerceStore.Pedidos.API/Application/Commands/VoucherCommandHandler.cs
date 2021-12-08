using EcommerceStore.Core.Messages;
using EcommerceStore.Pedidos.API.Application.Factory;
using EcommerceStore.Pedidos.Domain.Vouchers;
using EcommerceStore.Pedidos.Domain.Vouchers.Specs;
using FluentValidation.Results;
using MediatR;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace EcommerceStore.Pedidos.API.Application.Commands
{
    public class VoucherCommandHandler : CommandHandlerBase,
        IRequestHandler<AdicionarVoucherCommand, ValidationResult>
    {
        private readonly IVoucherRepository _voucherRepository;

        public VoucherCommandHandler(IVoucherRepository voucherRepository)
        {
            _voucherRepository = voucherRepository;
        }

        public async Task<ValidationResult> Handle(AdicionarVoucherCommand message, CancellationToken cancellationToken)
        {
            if (!message.EhValido()) return message.ValidationResult;

            var voucher = VoucherFactory.CriarVoucher(message);

            var voucherValidation = new VoucherValidation().Validate(voucher);

            if (!voucherValidation.IsValid)
            {
                voucherValidation.Errors.ToList().ForEach(v => AdicionarErro(v.ErrorMessage));
                
                return message.ValidationResult;
            }
            
            _voucherRepository.Adicionar(voucher);
            
            return await PersistirDados(_voucherRepository.UnitOfWork);
        }
    }
}
