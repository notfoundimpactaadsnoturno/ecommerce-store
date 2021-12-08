using EcommerceStore.Pedidos.Domain.Pedidos;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EcommerceStore.Pedidos.Infraestructure.Data.Mappings
{
    public class PedidoMappings : IEntityTypeConfiguration<Pedido>
    {
        public void Configure(EntityTypeBuilder<Pedido> builder)
        {
            builder.HasKey(pedido => pedido.Id);

            builder.OwnsOne(pedido => pedido.Endereco, endereco =>
            {
                endereco.Property(end => end.Logradouro)
                    .HasColumnName("Logradouro");

                endereco.Property(end => end.Numero)
                    .HasColumnName("Numero");

                endereco.Property(end => end.Complemento)
                    .HasColumnName("Complemento");

                endereco.Property(end => end.Bairro)
                    .HasColumnName("Bairro");

                endereco.Property(end => end.Cep)
                    .HasColumnName("Cep");

                endereco.Property(end => end.Cidade)
                    .HasColumnName("Cidade");

                endereco.Property(end => end.Estado)
                    .HasColumnName("Estado");
            });

            builder.Property(pedido => pedido.Codigo)
                .HasDefaultValueSql("NEXT VALUE FOR SequenciaPedido");

            // 1 : N => Pedido : PedidoItens
            builder.HasMany(pedido => pedido.PedidoItens)
                .WithOne(pedidoItem => pedidoItem.Pedido)
                .HasForeignKey(pedidoItem => pedidoItem.PedidoId);            

            builder.ToTable("Pedidos");
        }
    }
}
