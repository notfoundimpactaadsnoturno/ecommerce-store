using EcommerceStore.Pedidos.Domain.Pedidos;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EcommerceStore.Pedidos.Infraestructure.Data.Mappings
{
    public class PedidoItemMappings : IEntityTypeConfiguration<PedidoItem>
    {
        public void Configure(EntityTypeBuilder<PedidoItem> builder)
        {
            builder.HasKey(pedidoItem => pedidoItem.Id);

            builder.Property(pedidoItem => pedidoItem.ProdutoNome)
                .IsRequired()
                .HasColumnType("varchar(250)");

            // 1 : N => PedidoItens : Pedidos
            builder.HasOne(pedidoItem => pedidoItem.Pedido)
                .WithMany(pedido => pedido.PedidoItens);

            builder.ToTable("PedidoItem");
        }
    }
}
