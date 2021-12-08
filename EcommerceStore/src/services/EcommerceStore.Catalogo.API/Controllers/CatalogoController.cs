using EcommerceStore.Catalogo.API.Models;
using EcommerceStore.WebApi.Core.ControllerBase;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcommerceStore.Catalogo.API.Controllers
{
    [Authorize]
    public class CatalogoController : MainController
    {
        private readonly IProdutoRepository _produtoRepository;
        private readonly IMemoryCache _memoryCache;       

        public CatalogoController(
            IProdutoRepository produtoRepository, 
            IMemoryCache memoryCache)
        {
            _produtoRepository = produtoRepository;
            _memoryCache = memoryCache;
        }

        [AllowAnonymous]
        [HttpGet("catalogo/produtos")]
        public async Task<PagedResult<Produto>> Index([FromQuery] int ps = 8, [FromQuery] int page = 1, [FromQuery] string q = null)
        {
            var pagedResult = await _produtoRepository.ObterTodos(ps, page, q);

            return pagedResult;
        }

        [HttpGet("catalogo/produtos/{id}")]
        public async Task<Produto> ProdutosDetalhe(Guid id)
        {
            return await _produtoRepository.ObterPorId(id);
        }

        [HttpGet("catalogo/produtos/lista/{ids}")]
        public async Task<IEnumerable<Produto>> ObterProdutosPorId(string ids)
        {
            return await _produtoRepository.ObterPordutosPorId(ids);
        }

        [HttpPost("catalogo/produtos")]
        public async Task<IActionResult> Criar(Produto produto)
        {
            _produtoRepository.Adicionar(produto);

            if (!await _produtoRepository.UnitOfWork.Commit())
            {
                var validationResult = new ValidationResult();

                validationResult.Errors.Add(new ValidationFailure(string.Empty, "Não foi possível inserir o produto no banco"));

                CustomResponse(validationResult);
            }

            return CreatedAtAction("ProdutosDetalhe", new { id = produto.Id }, produto);
        }

        [HttpPut("catalogo/produtos/{id}")]
        public async Task<IActionResult> Editar(Guid id, Produto produtoNovo)
        {
            var produto = await _produtoRepository.ObterPorId(id);

            if (produto == null) return NotFound();

            produto.Nome = produtoNovo.Nome;
            produto.Descricao = produtoNovo.Descricao;            
            produto.Valor = produtoNovo.Valor;
            produto.QuantidadeEstoque = produtoNovo.QuantidadeEstoque;
            produto.Ativo = produtoNovo.Ativo;

            if (!string.IsNullOrWhiteSpace(produtoNovo.Imagem))
                produto.Imagem = produtoNovo.Imagem;

            _produtoRepository.Atualizar(produto);

            if (!await _produtoRepository.UnitOfWork.Commit())
            {
                var validationResult = new ValidationResult();

                validationResult.Errors.Add(new ValidationFailure(string.Empty, "Não foi possível atualizar o produto no banco"));

                CustomResponse(validationResult);
            }

            return NoContent();
        }

        [HttpPut("catalogo/produtos/alterar-estoque/{id}")]
        public async Task<IActionResult> AlterarEstoque(Guid id, EstoqueViewModel estoque)
        {
            var produto = await _produtoRepository.ObterPorId(id);

            if (produto == null) return NotFound();            

            produto.ReporEstoque(estoque.QuantidadeEstoque);

            if (produto.QuantidadeEstoque < 0)
                produto.QuantidadeEstoque = 0;

            _produtoRepository.Atualizar(produto);

            if (!await _produtoRepository.UnitOfWork.Commit())
            {
                var validationResult = new ValidationResult();

                validationResult.Errors.Add(new ValidationFailure(string.Empty, "Não foi possível alter o estoque do produto no banco"));

                CustomResponse(validationResult);
            }

            return NoContent();
        }
    }
}
