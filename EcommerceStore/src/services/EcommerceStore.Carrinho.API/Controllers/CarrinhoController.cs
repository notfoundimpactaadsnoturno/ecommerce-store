using EcommerceStore.Carrinho.API.Data;
using EcommerceStore.Carrinho.API.Model;
using EcommerceStore.WebApi.Core.ControllerBase;
using EcommerceStore.WebApi.Core.Usuario;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.Carrinho.API.Controllers
{
    [Authorize]
    public class CarrinhoController : MainController
    {
        private readonly IAspNetUser _user;
        private readonly CarrinhoContext _context;

        public CarrinhoController(IAspNetUser user, CarrinhoContext context)
        {
            _user = user;
            _context = context;
        }

        [HttpGet("carrinho")]
        public async Task<CarrinhoCliente> ObterCarrinho()
        {
            return await ObterCarrinhoCliente() ?? new CarrinhoCliente();
        }

        [HttpPost("carrinho")]
        public async Task<IActionResult> AdicionarItemCarrinho(CarrinhoItem item)
        {
            var carrinho = await ObterCarrinhoCliente();

            if (carrinho == null)
                ManipularNovoCarrinho(item);
            else
                ManipularCarrinhoExistente(carrinho, item);

            if (!OperacaoValida()) return CustomResponse();

            await PersistirDados();
            return CustomResponse();
        }

        [HttpPut("carrinho/{produtoId}")]
        public async Task<IActionResult> AtualizarItemCarrinho(Guid produtoId, CarrinhoItem item)
        {
            var carrinho = await ObterCarrinhoCliente();
            var itemCarrinho = await ObterItemCarrinhoValidado(produtoId, carrinho, item);
            if (itemCarrinho == null) return CustomResponse();

            carrinho.AtualizarUnidades(itemCarrinho, item.Quantidade);

            ValidarCarrinho(carrinho);
            if (!OperacaoValida()) return CustomResponse();

            _context.CarrinhoItens.Update(itemCarrinho);
            _context.CarrinhoCliente.Update(carrinho);

            await PersistirDados();
            return CustomResponse();
        }

        [HttpDelete("carrinho/{produtoId}")]
        public async Task<IActionResult> RemoverItemCarrinho(Guid produtoId)
        {
            var carrinho = await ObterCarrinhoCliente();

            var itemCarrinho = await ObterItemCarrinhoValidado(produtoId, carrinho);
            if (itemCarrinho == null) return CustomResponse();

            ValidarCarrinho(carrinho);
            if (!OperacaoValida()) return CustomResponse();

            carrinho.RemoverItem(itemCarrinho);

            if (carrinho.Itens.Any())
            {
                _context.CarrinhoItens.Remove(itemCarrinho);
                _context.CarrinhoCliente.Update(carrinho);
            }
            else
                _context.CarrinhoCliente.Remove(carrinho);

            await PersistirDados();
            return CustomResponse();
        }

        [HttpPost]
        [Route("carrinho/aplicar-voucher")]
        public async Task<IActionResult> AplicarVoucher(VoucherVideModel voucherViewModel)
        {
            var carrinho = await ObterCarrinhoCliente();

            if (carrinho.VoucherUtilizado)
            {
                AdicionarErroProcessamento("É permitido apenas um voucher por pedido");
                return CustomResponse();
            }

            var voucher = new Voucher()
            {
                Codigo = voucherViewModel.Codigo,
                Percentual = voucherViewModel.Percentual,
                ValorDesconto = voucherViewModel.ValorDesconto
            };

            if (voucherViewModel.TipoDesconto == TipoDescontoVoucher.Porcentagem.GetHashCode())
                voucher.TipoDescontoVoucher = TipoDescontoVoucher.Porcentagem;
            else if (voucherViewModel.TipoDesconto == TipoDescontoVoucher.Valor.GetHashCode())
                voucher.TipoDescontoVoucher = TipoDescontoVoucher.Valor;

            carrinho.AplicarVoucher(voucher);

            _context.CarrinhoCliente.Update(carrinho);

            await PersistirDados();

            return CustomResponse();
        }

        private async Task<CarrinhoCliente> ObterCarrinhoCliente()
        {
            return await _context.CarrinhoCliente
                .Include(carrinho => carrinho.Itens)
                .FirstOrDefaultAsync(carrinho => carrinho.ClienteId == _user.ObterUserId());
        }
        private void ManipularNovoCarrinho(CarrinhoItem item)
        {
            var carrinho = new CarrinhoCliente(_user.ObterUserId());
            carrinho.AdicionarItem(item);

            ValidarCarrinho(carrinho);
            _context.CarrinhoCliente.Add(carrinho);
        }
        private void ManipularCarrinhoExistente(CarrinhoCliente carrinho, CarrinhoItem item)
        {
            var produtoItemExistente = carrinho.CarrinhoItemExistente(item);

            carrinho.AdicionarItem(item);
            ValidarCarrinho(carrinho);

            if (produtoItemExistente)
                _context.CarrinhoItens.Update(carrinho.ObterPorProdutoId(item.ProdutoId));
            else
                _context.CarrinhoItens.Add(item);

            _context.CarrinhoCliente.Update(carrinho);

        }
        private async Task<CarrinhoItem> ObterItemCarrinhoValidado(Guid produtoId, CarrinhoCliente carrinho, CarrinhoItem item = null)
        {
            if (item != null && produtoId != item.ProdutoId)
            {
                AdicionarErroProcessamento("O item não corresponde ao informado");
                return null;
            }

            if (carrinho == null)
            {
                AdicionarErroProcessamento("Carrinho não encontrado");
                return null;
            }

            var itemCarrinho = await _context.CarrinhoItens
                .FirstOrDefaultAsync(carrinhoItem => carrinhoItem.CarrinhoId == carrinho.Id && carrinhoItem.ProdutoId == produtoId);

            if (itemCarrinho == null || !carrinho.CarrinhoItemExistente(itemCarrinho))
            {
                AdicionarErroProcessamento("O item não está no carrinho");
                return null;
            }

            return itemCarrinho;
        }
        private async Task PersistirDados()
        {
            var result = await _context.SaveChangesAsync();
            if (result <= 0) AdicionarErroProcessamento("Não foi possível persistir os dados no banco");
        }
        private bool ValidarCarrinho(CarrinhoCliente carrinho)
        {
            if (carrinho.EhValido()) return true;

            carrinho.ValidationResult.Errors
                .ToList()
                .ForEach(erro => AdicionarErroProcessamento(erro.ErrorMessage));

            return false;
        }
    }
}
