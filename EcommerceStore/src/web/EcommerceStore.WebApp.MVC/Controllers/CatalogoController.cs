using EcommerceStore.WebApp.MVC.Models;
using EcommerceStore.WebApp.MVC.Models.Validators;
using EcommerceStore.WebApp.MVC.Services;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceStore.WebApp.MVC.Controllers
{
    public class CatalogoController : MainController
    {
        private readonly ICatalogoService _catalogoService;
        //private readonly ICatalogoServiceRefit _catalogoService;
        //public CatalogoController(ICatalogoServiceRefit catalogoService)
        //{
        //    _catalogoService = catalogoService;
        //}

        public CatalogoController(ICatalogoService catalogoService)
        {
            _catalogoService = catalogoService;
        }

        [HttpGet]
        [Route("")]
        [Route("Vitrine")]
        public async Task<IActionResult> Index([FromQuery] int ps = 12, [FromQuery] int page = 1, [FromQuery] string q = null)
        {
            var produtos = await _catalogoService.ObterTodos(ps, page, q);

            ViewBag.Pesquisa = q;

            produtos.ReferenceAction = "Index";

            return View(produtos);
        }

        [HttpGet]
        [Route("produto-detalhe/{id}")]
        public async Task<IActionResult> ProdutoDetalhe(Guid id)
        {
            return View(await _catalogoService.ObterPorId(id));
        }

        [HttpGet("novo-produto")]
        public IActionResult Criar()
        {
            return View();
        }

        [HttpPost("novo-produto")]
        public async Task<IActionResult> Criar(ProdutoViewModel produtoViewModel)
        {
            if (!RequisicaoValida<NovoProdutoValitation>(produtoViewModel))
                return View(new ProdutoViewModel());

            var imgPrefixo = Guid.NewGuid() + "_";

            if (!await UploadArquivo(produtoViewModel.ImagemUpload, imgPrefixo))
            {
                return View(produtoViewModel);
            }

            produtoViewModel.Imagem = imgPrefixo + produtoViewModel.ImagemUpload.FileName;

            produtoViewModel.ImagemUpload = null;

            produtoViewModel.Id = Guid.NewGuid();

            var response = await _catalogoService.Adicionar(produtoViewModel);

            if (ResponsePossuiErros(response))
            {
                RemoverArquivo(produtoViewModel.ImagemUpload, imgPrefixo);

                return View(new ProdutoViewModel());
            }

            return RedirectToAction("Index");
        }

        [HttpGet("editar-produto/{id}")]
        public async Task<IActionResult> Editar(Guid id)
        {
            var produtoViewModel = await _catalogoService.ObterPorId(id);

            if (produtoViewModel == null)
            {
                return NotFound();
            }

            return View(produtoViewModel);
        }

        [HttpPost("editar-produto/{id}")]
        public async Task<IActionResult> Editar(Guid id, ProdutoViewModel editarProdutoViewModel)
        {
            var produto = await _catalogoService.ObterPorId(id);

            if (!RequisicaoValida<EditarProdutoValitation>(editarProdutoViewModel))
                return View(produto);

            bool edicao = true;

            var imgPrefixo = Guid.NewGuid() + "_";

            if (editarProdutoViewModel.ImagemUpload != null)
            {
                editarProdutoViewModel.Imagem = imgPrefixo + editarProdutoViewModel.ImagemUpload.FileName;

                if (!await UploadArquivo(editarProdutoViewModel.ImagemUpload, imgPrefixo, edicao))
                    return View(editarProdutoViewModel);

                editarProdutoViewModel.ImagemUpload = null;
            }
            else
                editarProdutoViewModel.Imagem = produto.Imagem;

            var response = await _catalogoService.Atualizar(editarProdutoViewModel);

            if (ResponsePossuiErros(response))
            {
                if (produto.Imagem != editarProdutoViewModel.Imagem)
                    RemoverArquivo(editarProdutoViewModel.ImagemUpload, imgPrefixo);

                return View(produto);
            }

            return RedirectToAction("Index");
        }

        [HttpGet("alterar-estoque-produto/{id}")]
        public async Task<IActionResult> AlterarEstoque(Guid id)
        {
            var produtoViewModel = await _catalogoService.ObterPorId(id);

            if (produtoViewModel == null)
            {
                return NotFound();
            }

            return View(produtoViewModel);
        }

        [HttpPost("alterar-estoque-produto/{id}")]
        public async Task<IActionResult> AlterarEstoque(Guid id, ProdutoViewModel produtoViewModel)
        {
            if (!RequisicaoValida<EstoqueProdutoValitation>(produtoViewModel))
                return View(await _catalogoService.ObterPorId(id));

            var response = await _catalogoService.AtualizarEstoque(id, produtoViewModel);

            if (ResponsePossuiErros(response))
            {
                return View(await _catalogoService.ObterPorId(id));
            }

            return RedirectToAction("Index");
        }

        private async Task<bool> UploadArquivo(IFormFile arquivo, string imgPrefixo, bool editar = false)
        {
            if (arquivo.Length <= 0) return false;

            var path = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\images\produtos\", imgPrefixo + arquivo.FileName);

            if (System.IO.File.Exists(path))
            {
                if (editar) return true;

                ModelState.AddModelError(string.Empty, "Já existe um arquivo com este nome!");
                return false;
            }

            using (var stream = new FileStream(path, FileMode.Create))
            {
                await arquivo.CopyToAsync(stream);
            }

            return true;
        }
        private void RemoverArquivo(IFormFile arquivo, string imgPrefixo)
        {
            var basePath = Directory.GetCurrentDirectory();

            var path = Path.Combine(basePath, "/wwwroot/imagens/produtos/", imgPrefixo + arquivo.FileName);

            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }
        }
        private bool RequisicaoValida<T>(ProdutoViewModel produtoViewModel) where T : AbstractValidator<ProdutoViewModel>, new()
        {
            var validation = new T();

            var validationResult = validation.Validate(produtoViewModel);

            if (!validationResult.IsValid)
            {
                RequisicaoInvalida(validationResult);

                return validationResult.IsValid;
            }

            return validationResult.IsValid;
        }
        private void RequisicaoInvalida(ValidationResult validation)
        {
            if (!ModelState.IsValid)
                ModelState.Clear();

            var erros = validation.Errors.ToList();

            foreach (var erro in erros)
            {
                ModelState.AddModelError(erro.PropertyName, erro.ErrorMessage);
            }
        }
    }
}
