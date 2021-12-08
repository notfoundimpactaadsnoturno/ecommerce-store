using EcommerceStore.Catalogo.API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EcommerceStore.Catalogo.API.Data.Mappings
{
    public class ProdutoMapping : IEntityTypeConfiguration<Produto>
    {
        public void Configure(EntityTypeBuilder<Produto> builder)
        {
            builder.HasKey(produto => produto.Id);

            builder.Property(produto => produto.Nome)
                .IsRequired()
                .HasColumnType("varchar(250)");

            builder.Property(produto => produto.Descricao)
                .IsRequired()
                .HasColumnType("varchar(500)");

            builder.Property(produto => produto.Imagem)
                .IsRequired()
                .HasColumnType("varchar(250)");

            builder.ToTable("Produtos");
        }
    }
}
