using EcommerceStore.Pedidos.Domain.Vouchers;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EcommerceStore.Pedidos.Infraestructure.Data.Mappings
{
    public class VoucherMappings : IEntityTypeConfiguration<Voucher>
    {
        public void Configure(EntityTypeBuilder<Voucher> builder)
        {
            builder.HasKey(voucer => voucer.Id);

            builder.Property(voucher => voucher.Codigo)
                .IsRequired()
                .HasColumnType("varchar(100)");

            builder.ToTable("Vouchers");
        }
    }
}
