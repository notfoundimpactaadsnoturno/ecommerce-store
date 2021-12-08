using EcommerceStore.Carrinho.API.Model;
using FluentValidation.Results;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace EcommerceStore.Carrinho.API.Data
{
    public class CarrinhoContext : DbContext
    {
        public CarrinhoContext(DbContextOptions<CarrinhoContext> options)
            : base(options)
        {
            ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
            ChangeTracker.AutoDetectChangesEnabled = false;
        }

        public DbSet<CarrinhoItem> CarrinhoItens { get; set; }
        public DbSet<CarrinhoCliente> CarrinhoCliente { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            foreach (var property in modelBuilder.Model.GetEntityTypes()
                .SelectMany(ent => ent.GetProperties().Where(prop => prop.ClrType == typeof(string))))
                property.SetColumnType("varchar(100)");

            modelBuilder.Ignore<ValidationResult>();

            modelBuilder.Entity<CarrinhoCliente>()
                .HasIndex(carrinhoCliente => carrinhoCliente.ClienteId)
                .HasName("IDX_CLIENTE");

            modelBuilder.Entity<CarrinhoCliente>()
                .Ignore(cc => cc.Voucher)
                .OwnsOne(cc => cc.Voucher, voucher =>
                {
                    voucher
                    .Property(vc => vc.Codigo)
                    .HasColumnName("VoucherCodigo")
                    .HasColumnType("varchar(50)");

                    voucher
                    .Property(vc => vc.TipoDescontoVoucher)
                    .HasColumnName("TipoDesconto");

                    voucher.Property(vc => vc.Percentual)
                    .HasColumnName("Percentual");

                    voucher.Property(vc => vc.ValorDesconto)
                    .HasColumnName("ValorDesconto");
                });

            modelBuilder.Entity<CarrinhoCliente>()
                .HasMany(carrinhoCliente => carrinhoCliente.Itens)
                .WithOne(carrinhoItem => carrinhoItem.CarrinhoCliente)
                .HasForeignKey(carrinhoItem => carrinhoItem.CarrinhoId);

            foreach (var relationship in modelBuilder.Model.GetEntityTypes().SelectMany(ent => ent.GetForeignKeys()))
                relationship.DeleteBehavior = DeleteBehavior.Cascade;
        }
    }
}
