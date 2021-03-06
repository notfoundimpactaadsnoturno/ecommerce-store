USE [master]
GO
/****** Object:  Database [EcommerceDb]    Script Date: 07/12/2021 18:02:33 ******/
CREATE DATABASE [EcommerceDb]
GO

USE [EcommerceDb]
GO

/****** Object:  Sequence [dbo].[MinhaSequencia]    Script Date: 07/12/2021 18:02:33 ******/
CREATE SEQUENCE [dbo].[MinhaSequencia] 
 AS [int]
 START WITH 1000
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
USE [EcommerceDb]
GO
/****** Object:  Sequence [dbo].[SequenciaPedido]    Script Date: 07/12/2021 18:02:33 ******/
CREATE SEQUENCE [dbo].[SequenciaPedido] 
 AS [int]
 START WITH 1000
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarrinhoCliente]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrinhoCliente](
	[Id] [uniqueidentifier] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[Desconto] [decimal](18, 2) NOT NULL,
	[VoucherUtilizado] [bit] NOT NULL,
	[VoucherCodigo] [varchar](50) NULL,
	[Percentual] [decimal](18, 2) NULL,
	[TipoDesconto] [int] NULL,
	[ValorDesconto] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CarrinhoCliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarrinhoItens]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrinhoItens](
	[Id] [uniqueidentifier] NOT NULL,
	[ProdutoId] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](100) NULL,
	[Quantidade] [int] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[Imagem] [varchar](100) NULL,
	[CarrinhoId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CarrinhoItens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[Email] [varchar](254) NULL,
	[Cpf] [varchar](11) NULL,
	[Excluido] [bit] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enderecos]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enderecos](
	[Id] [uniqueidentifier] NOT NULL,
	[Logradouro] [varchar](200) NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[Complemento] [varchar](250) NULL,
	[Bairro] [varchar](100) NOT NULL,
	[Cep] [varchar](20) NOT NULL,
	[Cidade] [varchar](100) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Enderecos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagamentos]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagamentos](
	[Id] [uniqueidentifier] NOT NULL,
	[PedidoId] [uniqueidentifier] NOT NULL,
	[TipoPagamento] [int] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Pagamentos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoItem]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoItem](
	[Id] [uniqueidentifier] NOT NULL,
	[PedidoId] [uniqueidentifier] NOT NULL,
	[ProdutoId] [uniqueidentifier] NOT NULL,
	[ProdutoNome] [varchar](250) NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorUnitario] [decimal](18, 2) NOT NULL,
	[ProdutoImagem] [varchar](100) NULL,
 CONSTRAINT [PK_PedidoItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id] [uniqueidentifier] NOT NULL,
	[Codigo] [int] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[VoucherId] [uniqueidentifier] NULL,
	[VoucherUtilizado] [bit] NOT NULL,
	[Desconto] [decimal](18, 2) NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[PedidoStatus] [int] NOT NULL,
	[Logradouro] [varchar](100) NULL,
	[Numero] [varchar](100) NULL,
	[Complemento] [varchar](100) NULL,
	[Bairro] [varchar](100) NULL,
	[Cep] [varchar](100) NULL,
	[Cidade] [varchar](100) NULL,
	[Estado] [varchar](100) NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](250) NOT NULL,
	[Descricao] [varchar](500) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[Imagem] [varchar](250) NOT NULL,
	[QuantidadeEstoque] [int] NOT NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Token] [uniqueidentifier] NOT NULL,
	[ExpirationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityKeys]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityKeys](
	[Id] [uniqueidentifier] NOT NULL,
	[Parameters] [nvarchar](max) NULL,
	[KeyId] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Algorithm] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SecurityKeys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacoes]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacoes](
	[Id] [uniqueidentifier] NOT NULL,
	[CodigoAutorizacao] [varchar](100) NULL,
	[BandeiraCartao] [varchar](100) NULL,
	[DataTransacao] [datetime2](7) NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[CustoTransacao] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[TID] [varchar](100) NULL,
	[NSU] [varchar](100) NULL,
	[PagamentoId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Transacoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 07/12/2021 18:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[Id] [uniqueidentifier] NOT NULL,
	[Codigo] [varchar](100) NOT NULL,
	[Percentual] [decimal](18, 2) NULL,
	[ValorDesconto] [decimal](18, 2) NULL,
	[Quantidade] [int] NOT NULL,
	[TipoDesconto] [int] NOT NULL,
	[DataCriacao] [datetime2](7) NOT NULL,
	[DataUtilizacao] [datetime2](7) NULL,
	[DataValidade] [datetime2](7) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[Utilizado] [bit] NOT NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210909132540_Intial', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210912025628_Initial', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210914015827_Clientes', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210917193405_Carrinho', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210920212404_Voucher', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210921235123_Voucher', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210922205949_Pedidos', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210922234220_PedidosVoucher', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210923145501_CarrinhoCascade', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211005002312_Pagamentos', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211017233812_SecurityKeys', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211027223357_RefreshToken', N'3.1.6')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2002, N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (3002, N'98acdb8a-8b3d-4b8e-a8d0-e1acb5d3bc85', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (3003, N'54ab4bf5-485f-4c4a-9389-da20b1c20c09', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (4003, N'88aba5e5-42f9-4d2a-ab47-ca832a324aa3', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (5003, N'cd9ff148-4fd3-4e79-97c7-528c82ebeb7d', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6003, N'820a33ee-f71c-4a0f-a6a4-c75b47302c2f', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6004, N'6cf88d48-98ee-4c74-a809-198e60f4a558', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7003, N'd4db5fae-4b5c-4d03-be8b-ff78bbb16789', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7004, N'5d22f0cb-ac33-4f51-a907-27c2d494aa10', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7005, N'327f8eda-5400-453e-922a-271cf9be9636', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7006, N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8006, N'2c4a93ac-5319-4483-85b0-c511ff06eea7', N'Catalogo', N'Ler')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8008, N'd7204e0f-8847-4d10-b94a-14e5c7f270a6', N'Catalogo', N'Ler')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', N'ari@ari.com.br', N'ARI@ARI.COM.BR', N'ari@ari.com.br', N'ARI@ARI.COM.BR', 1, N'AQAAAAEAACcQAAAAEJza0263EEump2qBFsb5jhNAL+z20PY+rvrX4HqCH7ywv2NdsSD+qqdLlE/0yEuiNw==', N'OLXKBI5CGTWMYIYTCDZN47O7KWETU7TW', N'8c09f1a8-727d-4f47-aa04-4ba56ff99dab', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2c4a93ac-5319-4483-85b0-c511ff06eea7', N'alisson@alisson.com', N'ALISSON@ALISSON.COM', N'alisson@alisson.com', N'ALISSON@ALISSON.COM', 1, N'AQAAAAEAACcQAAAAEP8qY1PK1nkHD8AFiQ8j5BjIyNpKACBCmS0xS32+pHpotYuo6FB4zNIIIj+Pl4luMw==', N'3D3CHPP7GLVABELNUNVQ7EAPDCBQRURI', N'846f2b99-d3ed-4c93-94e6-229313a97060', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'327f8eda-5400-453e-922a-271cf9be9636', N'alan@freefire.com', N'ALAN@FREEFIRE.COM', N'alan@freefire.com', N'ALAN@FREEFIRE.COM', 1, N'AQAAAAEAACcQAAAAELiYjrGAo/qztsCf/3hKjTf77VMGOht2eAdxXpGSWz0HR0wC4HadmMF6EOQ08potEg==', N'55O2BTQXW4QW6MFN3ZZHIWCBRGIWL5IB', N'0d280000-d3f0-4c54-87eb-5e3a11028098', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'54ab4bf5-485f-4c4a-9389-da20b1c20c09', N'fernando@fernando.com', N'FERNANDO@FERNANDO.COM', N'fernando@fernando.com', N'FERNANDO@FERNANDO.COM', 1, N'AQAAAAEAACcQAAAAEF1KroHxLRE514tiz0XuzWY7Q7cyRKuK2A9dclAqaLPz4z/jia1i6xBnCAkJekR/lA==', N'CG6TVJEAQXHBODJR3YTKE7BP6TY6UBCF', N'ce7476c4-7c06-4371-b82e-b9e33bada205', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5d22f0cb-ac33-4f51-a907-27c2d494aa10', N'levi@levi.com', N'LEVI@LEVI.COM', N'levi@levi.com', N'LEVI@LEVI.COM', 1, N'AQAAAAEAACcQAAAAEHCi7Ix5I7ZfExCw0V2soCXOzjIvkmGnTyex0UorV1SKcti3npgzqQxruQ9Mv0ictQ==', N'TEGWQHGCWDN6E6W454OJGCFQQRIMBBU5', N'12f37c49-7b44-46c5-a45a-8c51a1e99954', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6cf88d48-98ee-4c74-a809-198e60f4a558', N'admin@admin.com', N'ADMIN@ADMIN.COM', N'admin@admin.com', N'ADMIN@ADMIN.COM', 1, N'AQAAAAEAACcQAAAAEEtXnoLk0czMauKphmQ6wt1nx2R9ORRLc/49Jtx1VfvUt+GDuu5pHYELfjWQ8/Ajsg==', N'KG7YMMZTNRZXHBA7WOTZWVJT5SLKQ6YW', N'1338c4bd-a8e7-49e1-8204-93c0985042a0', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'820a33ee-f71c-4a0f-a6a4-c75b47302c2f', N'novo@novo.com', N'NOVO@NOVO.COM', N'novo@novo.com', N'NOVO@NOVO.COM', 1, N'AQAAAAEAACcQAAAAEJzmsUqU0J/r3IYO+/4HYJFs7apJUB6B6REFIlR6pn5TcM9Oa2Zc36k5LmYR4IFteQ==', N'5BASPQ2MSAQKWLO3P2PQ2OW5JWWHS4LE', N'b2af81f9-53e4-437f-ab77-e234b4beecd2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'88aba5e5-42f9-4d2a-ab47-ca832a324aa3', N'felipe@gmail.com', N'FELIPE@GMAIL.COM', N'felipe@gmail.com', N'FELIPE@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAECBLx71LwwH3uYUNLqTGuaTEtLQA8IjcpbIbqjUesO14BvkmCTA3eIPbg2yzBlXvmA==', N'QH4TZWSFRXC3FZ5GILLZF3SHR4JM4MA2', N'b0cb4897-1a84-491a-963f-d251c8c840c8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'98acdb8a-8b3d-4b8e-a8d0-e1acb5d3bc85', N'alan@gmail.com', N'ALAN@GMAIL.COM', N'alan@gmail.com', N'ALAN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAELZP7vMWmvSzNx0HcO83v7eEXfQHK+yi4W6t0354l1lWoIKrfI+EiC8Uyj10BZyhxw==', N'6EPZREVZV6N7NP4Z475FFG3NRGKKRQWN', N'ce4c34e9-9ecc-472a-8ba3-e9d81994cc62', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', N'teste@teste.com', N'TESTE@TESTE.COM', N'teste@teste.com', N'TESTE@TESTE.COM', 1, N'AQAAAAEAACcQAAAAELxqrUXqRheB5ayiDqyNyujs9AWxTXyWXu4dH4wu8ZI+aTPke4MtJgxJrUBZjBtJOw==', N'SWCBYIKVPOORJRGTAB6Y3THNZJXGHUPP', N'548e62a7-1426-44de-a080-087fe6364ad1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cd9ff148-4fd3-4e79-97c7-528c82ebeb7d', N'ariane@ariane.com', N'ARIANE@ARIANE.COM', N'ariane@ariane.com', N'ARIANE@ARIANE.COM', 1, N'AQAAAAEAACcQAAAAECg0kLyBVDO+Bo5uWXMPCy8Cfl39DSWPx58du7QC1ZrYROkMgHH0TIM0Zq9bkruNuQ==', N'LCWJNR2BRRYWBOLEWQAMFD2W3IZIGIPT', N'f7936983-89e6-48d7-80ea-bb806c94608e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd4db5fae-4b5c-4d03-be8b-ff78bbb16789', N'emerson@emerson.com', N'EMERSON@EMERSON.COM', N'emerson@emerson.com', N'EMERSON@EMERSON.COM', 1, N'AQAAAAEAACcQAAAAEGUE8CDlJ5hUHYq7ZSVXqez3tTiKAU3mkRbHjFLt25LPLLSBfCC2jTSgQOtSAbruuw==', N'TFPB3XKZMLB6QMZ4MJ2ASOMWQ7LANPEU', N'e559d0e2-f76e-43b8-8a35-10c8a5eb2048', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd7204e0f-8847-4d10-b94a-14e5c7f270a6', N'alisson2@alisson.com', N'ALISSON2@ALISSON.COM', N'alisson2@alisson.com', N'ALISSON2@ALISSON.COM', 1, N'AQAAAAEAACcQAAAAEO6d9fUNHZGnla7LcddpsKS2ccjxloHsaGCz+ND8zx2wGs+N57P4s4Gsg4rRYQxGHA==', N'5DAALK5GJEEBVAIDKEQRGL47EXMNBYVX', N'702a0f76-4dc0-4900-9f21-fe71c0924012', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[CarrinhoCliente] ([Id], [ClienteId], [ValorTotal], [Desconto], [VoucherUtilizado], [VoucherCodigo], [Percentual], [TipoDesconto], [ValorDesconto]) VALUES (N'ebec9615-95fa-4a1a-be18-8560aee741fa', N'd7204e0f-8847-4d10-b94a-14e5c7f270a6', CAST(85.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[CarrinhoItens] ([Id], [ProdutoId], [Nome], [Quantidade], [Valor], [Imagem], [CarrinhoId]) VALUES (N'df95d387-561e-4dda-ba81-d7ed5f204ae2', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 1, CAST(85.00 AS Decimal(18, 2)), N'Branca 4head.webp', N'ebec9615-95fa-4a1a-be18-8560aee741fa')
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'd7204e0f-8847-4d10-b94a-14e5c7f270a6', N'Alisson Quirino', N'alisson2@alisson.com', N'17707564006', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'6cf88d48-98ee-4c74-a809-198e60f4a558', N'Felipe Rodrigues', N'admin@admin.com', N'97211443049', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'327f8eda-5400-453e-922a-271cf9be9636', N'Alan gamer', N'alan@freefire.com', N'44700054018', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'5d22f0cb-ac33-4f51-a907-27c2d494aa10', N'Levi Impacta', N'levi@levi.com', N'22988702098', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'cd9ff148-4fd3-4e79-97c7-528c82ebeb7d', N'Ariane Melo', N'ariane@ariane.com', N'33411337044', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', N'Felipe Renan', N'teste@teste.com', N'22911768035', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'2c4a93ac-5319-4483-85b0-c511ff06eea7', N'Alisson Quirino', N'alisson@alisson.com', N'67576542020', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'820a33ee-f71c-4a0f-a6a4-c75b47302c2f', N'Rogerio Fiusa', N'novo@novo.com', N'90858049066', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'88aba5e5-42f9-4d2a-ab47-ca832a324aa3', N'Felipe Melo', N'felipe@gmail.com', N'35976457045', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'54ab4bf5-485f-4c4a-9389-da20b1c20c09', N'Fernando', N'fernando@fernando.com', N'36892848052', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'98acdb8a-8b3d-4b8e-a8d0-e1acb5d3bc85', N'Alan dos Santos', N'alan@gmail.com', N'35236247896', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', N'Ariane Noa', N'ari@ari.com.br', N'21391338030', 0)
INSERT [dbo].[Clientes] ([Id], [Nome], [Email], [Cpf], [Excluido]) VALUES (N'd4db5fae-4b5c-4d03-be8b-ff78bbb16789', N'Emerson impacta', N'emerson@emerson.com', N'10921678037', 0)
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'c3ff3919-b771-4dab-b1cd-08fdcd059acf', N'Rua Gavião Pescador', N'198', N'Casa 8', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP', N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'a5ad9934-40c2-4a35-b129-0a224e9bfdcd', N'Rua Antônio Capuzzi', N'60', N'APTO 22 C', N'Conjunto Residencial José Bonifácio', N'08255120', N'São Paulo', N'SP', N'88aba5e5-42f9-4d2a-ab47-ca832a324aa3')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'563b820d-c477-46e4-b3e3-1ff9e4cbb463', N'Rua Professor Antônio Peixoto', N'984', N'Próximo ao Bahamas club', N'Jardim Jaú (Zona Leste)', N'03702010', N'São Paulo', N'SP', N'd4db5fae-4b5c-4d03-be8b-ff78bbb16789')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'c4659747-374f-4d14-ab3a-a20c1834ceae', N'Rua Professor Antônio Peixoto', N'987', N'Perto da favela de paraisopolis', N'Jardim Jaú (Zona Leste)', N'03702010', N'São Paulo', N'SP', N'5d22f0cb-ac33-4f51-a907-27c2d494aa10')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'cc0904bc-dd03-41f2-8197-a6faa0186bfa', N'Rua Gavião Pescador', N'60', N'Apto 41/c', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP', N'a0b28712-12a5-4b09-87c9-b1ccbed060f8')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'af70ab69-c7c9-4357-8f8a-bb59f183e3c3', N'Rua Gavião Pescador', N'123', N'casa 5', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP', N'98acdb8a-8b3d-4b8e-a8d0-e1acb5d3bc85')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'10562a6a-1b33-4eef-815e-c1812a0578db', N'Rua Gavião Pescador', N'198', N'Casa 2', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP', N'327f8eda-5400-453e-922a-271cf9be9636')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'81a08b8e-31f3-4323-ac29-c4007f0fd51d', N'Rua Antônio Capuzzi', N'2', NULL, N'Conjunto Residencial José Bonifácio', N'08255120', N'São Paulo', N'SP', N'820a33ee-f71c-4a0f-a6a4-c75b47302c2f')
INSERT [dbo].[Enderecos] ([Id], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado], [ClienteId]) VALUES (N'89bfb83a-3187-4296-bdf7-eadc2bd9c790', N'Rua Gavião Pescador', N'89', N'APTO 22', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP', N'6cf88d48-98ee-4c74-a809-198e60f4a558')
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'f0b2574c-1f26-4ca8-824d-024d20198bf8', N'7b7965ae-43a0-4247-8698-030509d2525b', 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'7002c90b-0cd3-4507-9903-15232d6be2b0', N'a79d7ff8-73ff-4462-8b7f-fa2e832b1cd2', 1, CAST(99.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'4dc09266-db3b-49b5-a1d8-1d1010e33fa3', N'9293c304-a7fe-40b6-9860-330d058e0508', 1, CAST(34.99 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'67553ae6-2fe4-4a96-8d8e-28ff780f87e4', N'8e20c233-4222-4d17-b83b-d911d3142c84', 1, CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'e5568b92-9966-4681-89ae-4032ae7fe107', N'df0ad7f6-44c7-492f-8045-860fa85c516a', 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'cc2d2a34-cf47-4026-bf78-4076d1fceb68', N'd3413158-c41c-49c6-a9b8-c3f6f58b5f41', 1, CAST(49.99 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'49303c41-eef6-43e9-9d50-4a1d8e48d42d', N'45c69cce-5b77-451d-abd9-b45b18aff34a', 1, CAST(83.40 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'6dfd7215-a7cb-43a0-920f-4eae9cf082ba', N'6bedce28-cd28-4e92-b62b-6ed1c4a1c501', 1, CAST(1319.82 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'269c1f33-4e03-4c39-a7d2-50ea0156f6b7', N'936183a2-b514-4fe4-b9a8-b65575d3ae3c', 1, CAST(43.99 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'449f1a58-bc57-474d-b81a-5303ab39e049', N'5a5895a0-ad33-4dc5-9000-581564d3b40b', 1, CAST(329.98 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'74913730-5f84-4ba4-8596-577824b118a4', N'9190acfa-f8ea-4f4c-8e18-8bb134e6765b', 1, CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'5e46687c-1fb3-42a6-942a-5923cfbf52e7', N'a3f49b78-6f7b-47ff-9a10-061eb2156fc6', 1, CAST(75.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'8683da82-207d-4788-9d69-5c9951e95675', N'8b3d00db-cda0-4e74-9ef4-19ea8b2c6837', 1, CAST(75.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'3efc5225-b1a3-4201-ad2d-6cd4c1477ad0', N'1f25aa47-6532-4fcb-9842-c4d099eb13f6', 1, CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a', N'38016dd4-07d5-42de-b3b9-849761c80aa1', 1, CAST(499.90 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'466a23b6-3989-48f6-bb7d-7bd6f8c6947f', N'bf2ae2c2-eb1b-4fd7-9566-412cd25b1c1e', 1, CAST(175.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'241fdd19-23b5-47b0-821e-7fa8ca726ac1', N'd56a52f4-ef17-44aa-be8d-0fe21a993a87', 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'37978744-dfc3-4c0e-9362-888af16193ae', N'9124a112-3716-4885-babc-36284779ff1d', 1, CAST(49.99 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'04d63f78-bc99-4f5d-b65c-8e6088a82369', N'2c20bdf5-0885-43cb-874a-e8ee528e84a2', 1, CAST(1199.85 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'b5377653-ae58-436e-9bb4-8fd4bb46493e', N'51836e55-80a9-4e54-8162-58d8702a975f', 1, CAST(399.92 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'0998de46-4ba3-4ae4-9bb1-90c7c4a3895d', N'410f36a3-8a3e-4cae-9a62-78a9941b7c06', 1, CAST(159.98 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'3daa3e60-92d3-4f46-8e62-a1576c3b1267', N'dd56f6ba-cdcf-426c-8c04-5c5a2bb40c80', 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'12b2787a-c802-40d7-84e8-a186aabfa1be', N'da2937cc-4edc-45f8-8f7f-349ff2bd732d', 1, CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'b2d4feb3-7da9-44a1-aa81-b9965a407d30', N'997f5ca3-e383-45bd-beac-ad8c89e46d45', 1, CAST(49.99 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'6571d884-2927-4844-8cc8-bb3435b03ce0', N'2ad6118f-d793-44d9-ad3b-98ce3abbdac5', 1, CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'a87c0c1b-0fc1-4ec7-aade-bcbf75363ccc', N'7fdced22-a8a5-4ef4-a82e-828d0d426e49', 1, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'a7baa170-112d-4cbb-a227-cbe04bec26cd', N'd2d981cc-6bde-4ef8-a57f-2ca5c78f5b88', 1, CAST(149.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'ef238560-4a06-4729-b6a0-cfe908e4295f', N'd273aff2-bed2-4ff8-ae85-d4ace42de021', 1, CAST(349.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'9f60c827-7a6c-4f19-9202-e392e0bc8e31', N'eed9894c-7f4c-414c-8ec1-612ddc19a349', 1, CAST(101.61 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'919247cd-cf38-46ed-aa02-e8490cd9a052', N'97d0cb00-333e-45e6-bceb-3defbbccaefa', 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'c08d94f8-ae8e-46da-9255-e988fad2473b', N'b01209e3-3bc4-4655-a448-88fbed14b3f7', 1, CAST(79.99 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'd8789738-bac7-401f-b576-ea3dd0920aea', N'fba27b89-c778-4a02-bae0-0d1b0712566b', 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Pagamentos] ([Id], [PedidoId], [TipoPagamento], [Valor]) VALUES (N'8d1a9ef2-3a82-4e0c-a716-f60cacaf13cf', N'5af88463-dc97-4a79-84a9-aa9923be6d3e', 1, CAST(27.49 AS Decimal(18, 2)))
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'9af71420-dee8-4b1e-b77c-13ee5dc054d5', N'45c69cce-5b77-451d-abd9-b45b18aff34a', N'6ecaaa6b-ad9f-422c-b3bb-6013ec27c4bb', N'Camiseta Code Life Cinza', 2, CAST(99.00 AS Decimal(18, 2)), N'camiseta3.jpg')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'031a5008-3cfd-4796-9df7-1ccbc6990cdb', N'6bedce28-cd28-4e92-b62b-6ed1c4a1c501', N'7d67df76-2d4e-4a47-a11c-08eb80a9060b', N'Camiseta 4 Head New', 14, CAST(79.99 AS Decimal(18, 2)), N'4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'8bace302-02d3-456f-893b-1d6ec8fd89cf', N'b01209e3-3bc4-4655-a448-88fbed14b3f7', N'7d67df76-2d4e-4a47-a11c-08eb80a9060b', N'Camiseta 4 Head New', 1, CAST(79.99 AS Decimal(18, 2)), N'4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'06cd180a-f512-4a02-9fa9-35910ac6d674', N'38016dd4-07d5-42de-b3b9-849761c80aa1', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 10, CAST(49.99 AS Decimal(18, 2)), N'Branca 4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'1c3997ce-8b9c-4739-8f02-380567d502e1', N'2c20bdf5-0885-43cb-874a-e8ee528e84a2', N'7d67df76-2d4e-4a47-a11c-08eb80a9060b', N'Camiseta 4 Head New', 15, CAST(79.99 AS Decimal(18, 2)), N'4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'61519d55-4842-4501-b227-40dcb21c789f', N'410f36a3-8a3e-4cae-9a62-78a9941b7c06', N'7d67df76-2d4e-4a47-a11c-08eb80a9060b', N'Camiseta 4 Head New', 2, CAST(79.99 AS Decimal(18, 2)), N'4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'f78962bf-51de-4011-a9d8-4d914e6c2773', N'a79d7ff8-73ff-4462-8b7f-fa2e832b1cd2', N'6ecaaa6b-ad9f-422c-b3bb-6013ec27c4bb', N'Camiseta Code Life Cinza', 1, CAST(99.00 AS Decimal(18, 2)), N'camiseta3.jpg')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'a178b65c-9218-4ee3-a143-7627b09fddcf', N'51836e55-80a9-4e54-8162-58d8702a975f', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 8, CAST(49.99 AS Decimal(18, 2)), N'Branca 4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'c6e06019-062f-40d2-b9d3-882a02cbbf76', N'd3413158-c41c-49c6-a9b8-c3f6f58b5f41', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 1, CAST(49.99 AS Decimal(18, 2)), N'Branca 4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'e3083de5-61f1-4c31-89ff-9ae1762b44cb', N'9293c304-a7fe-40b6-9860-330d058e0508', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 1, CAST(49.99 AS Decimal(18, 2)), N'Branca 4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'22a91cd1-fa2e-494d-b48c-9c4fded28f16', N'45c69cce-5b77-451d-abd9-b45b18aff34a', N'7d67df76-2d4e-4a47-a11c-08eb80a9060b', N'Camiseta 4 Head New', 1, CAST(79.99 AS Decimal(18, 2)), N'4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'd4c834ce-5e1c-47ee-bb77-9da0e0d08ca8', N'6bedce28-cd28-4e92-b62b-6ed1c4a1c501', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 4, CAST(49.99 AS Decimal(18, 2)), N'Branca 4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'c3b87007-7bd0-4f40-a0c2-9feca2073c59', N'5af88463-dc97-4a79-84a9-aa9923be6d3e', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 1, CAST(49.99 AS Decimal(18, 2)), N'Branca 4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'326ccf8a-5cad-4dae-88e0-b2cb3c048d18', N'936183a2-b514-4fe4-b9a8-b65575d3ae3c', N'7d67df76-2d4e-4a47-a11c-08eb80a9060b', N'Camiseta 4 Head New', 1, CAST(79.99 AS Decimal(18, 2)), N'4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'e0927905-74fd-4bf6-bd76-e79a04cf80db', N'997f5ca3-e383-45bd-beac-ad8c89e46d45', N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', 1, CAST(49.99 AS Decimal(18, 2)), N'Branca 4head.webp')
INSERT [dbo].[PedidoItem] ([Id], [PedidoId], [ProdutoId], [ProdutoNome], [Quantidade], [ValorUnitario], [ProdutoImagem]) VALUES (N'725c76ec-1229-4465-929d-f7c9345a3ca6', N'8e20c233-4222-4d17-b83b-d911d3142c84', N'e9d13954-4525-4306-869f-a4d2d989e1ac', N'Hrv 2020', 1, CAST(79.00 AS Decimal(18, 2)), N'e5a8ab4a-5c7f-4a4a-b6ad-359fc9f35b32_Hrv.jpg')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'9293c304-a7fe-40b6-9860-330d058e0508', 1464, N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', N'880cb02a-8ca4-4516-a9a0-ce8473f2641a', 1, CAST(15.00 AS Decimal(18, 2)), CAST(34.99 AS Decimal(18, 2)), CAST(N'2021-12-01T20:15:59.9939374' AS DateTime2), 2, N'Rua Gavião Pescador', N'60', N'Apto 41/c', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'51836e55-80a9-4e54-8162-58d8702a975f', 1466, N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(399.92 AS Decimal(18, 2)), CAST(N'2021-12-01T20:30:10.4933214' AS DateTime2), 5, N'Rua Gavião Pescador', N'198', N'Casa 8', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'6bedce28-cd28-4e92-b62b-6ed1c4a1c501', 1470, N'd4db5fae-4b5c-4d03-be8b-ff78bbb16789', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(1319.82 AS Decimal(18, 2)), CAST(N'2021-12-01T21:30:42.7619068' AS DateTime2), 5, N'Rua Professor Antônio Peixoto', N'984', N'Próximo ao Bahamas club', N'Jardim Jaú (Zona Leste)', N'03702010', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'410f36a3-8a3e-4cae-9a62-78a9941b7c06', 1461, N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(159.98 AS Decimal(18, 2)), CAST(N'2021-11-30T20:33:38.7451968' AS DateTime2), 2, N'Rua Gavião Pescador', N'198', N'Casa 8', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'38016dd4-07d5-42de-b3b9-849761c80aa1', 1465, N'd4db5fae-4b5c-4d03-be8b-ff78bbb16789', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(499.90 AS Decimal(18, 2)), CAST(N'2021-12-01T20:30:04.1000480' AS DateTime2), 5, N'Rua Professor Antônio Peixoto', N'984', N'Próximo ao Bahamas club', N'Jardim Jaú (Zona Leste)', N'03702010', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'b01209e3-3bc4-4655-a448-88fbed14b3f7', 1467, N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(79.99 AS Decimal(18, 2)), CAST(N'2021-12-01T21:27:33.0280585' AS DateTime2), 2, N'Rua Gavião Pescador', N'198', N'Casa 8', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'5af88463-dc97-4a79-84a9-aa9923be6d3e', 1458, N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', N'ba0da49d-ecfc-4643-8bb8-155aabbcd619', 1, CAST(22.50 AS Decimal(18, 2)), CAST(27.49 AS Decimal(18, 2)), CAST(N'2021-11-28T21:11:38.7879993' AS DateTime2), 2, N'Rua Gavião Pescador', N'60', N'Apto 41/c', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'997f5ca3-e383-45bd-beac-ad8c89e46d45', 1463, N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(49.99 AS Decimal(18, 2)), CAST(N'2021-12-01T20:10:23.5755832' AS DateTime2), 2, N'Rua Gavião Pescador', N'60', N'Apto 41/c', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'45c69cce-5b77-451d-abd9-b45b18aff34a', 1511, N'6cf88d48-98ee-4c74-a809-198e60f4a558', N'875b657e-90f3-45b6-a941-7c5f4f6084f3', 1, CAST(194.59 AS Decimal(18, 2)), CAST(83.40 AS Decimal(18, 2)), CAST(N'2021-12-06T22:16:30.5623839' AS DateTime2), 2, N'Rua Gavião Pescador', N'89', N'APTO 22', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'936183a2-b514-4fe4-b9a8-b65575d3ae3c', 1459, N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', N'ba0da49d-ecfc-4643-8bb8-155aabbcd619', 1, CAST(36.00 AS Decimal(18, 2)), CAST(43.99 AS Decimal(18, 2)), CAST(N'2021-11-28T21:54:57.7219210' AS DateTime2), 2, N'Rua Gavião Pescador', N'60', N'Apto 41/c', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'd3413158-c41c-49c6-a9b8-c3f6f58b5f41', 1469, N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(49.99 AS Decimal(18, 2)), CAST(N'2021-12-01T21:30:38.6221184' AS DateTime2), 2, N'Rua Gavião Pescador', N'198', N'Casa 8', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'8e20c233-4222-4d17-b83b-d911d3142c84', 1460, N'a0b28712-12a5-4b09-87c9-b1ccbed060f8', N'b8808681-ebe9-4007-86b7-503a6cfe14ec', 1, CAST(45.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), CAST(N'2021-11-28T21:55:36.8988216' AS DateTime2), 2, N'Rua Gavião Pescador', N'60', N'Apto 41/c', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'2c20bdf5-0885-43cb-874a-e8ee528e84a2', 1468, N'd4db5fae-4b5c-4d03-be8b-ff78bbb16789', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(1199.85 AS Decimal(18, 2)), CAST(N'2021-12-01T21:27:39.3566736' AS DateTime2), 5, N'Rua Professor Antônio Peixoto', N'984', N'Próximo ao Bahamas club', N'Jardim Jaú (Zona Leste)', N'03702010', N'São Paulo', N'SP')
INSERT [dbo].[Pedidos] ([Id], [Codigo], [ClienteId], [VoucherId], [VoucherUtilizado], [Desconto], [ValorTotal], [DataCadastro], [PedidoStatus], [Logradouro], [Numero], [Complemento], [Bairro], [Cep], [Cidade], [Estado]) VALUES (N'a79d7ff8-73ff-4462-8b7f-fa2e832b1cd2', 1462, N'07e2143c-dd6d-46cc-97d0-fc0f747aa06e', NULL, 0, CAST(0.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), CAST(N'2021-11-30T20:38:01.4443436' AS DateTime2), 2, N'Rua Gavião Pescador', N'198', N'Casa 8', N'Conjunto Residencial José Bonifácio', N'08253500', N'São Paulo', N'SP')
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a11c-08eb80a9060b', N'Camiseta 4 Head New', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(79.99 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'4head.webp', 13)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a12c-08eb80a9060b', N'Camiseta 4 Head Branca', N'Camiseta 4 Head Branca the Best t-shirt', 1, CAST(85.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Branca 4head.webp', 6)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a13c-08eb80a9060b', N'Camiseta Tiltado', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'tiltado.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a14c-08eb80a9060b', N'Camiseta Tiltado Branca', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Branco Tiltado.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a15c-08eb80a9060b', N'Camiseta Heisenberg', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Heisenberg.webp', 7)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a16c-08eb80a9060b', N'Camiseta Kappa', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Kappa.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a17c-08eb80a9060b', N'Camiseta MacGyver', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'MacGyver.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a18c-08eb80a9060b', N'Camiseta Maestria', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Maestria.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a29c-08eb80a9060b', N'Camiseta My Yoda', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'My Yoda.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a39c-08eb80a9060b', N'Camiseta Pato', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Pato.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a41c-08eb80a9060b', N'Camiseta Xavier School', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Xaviers School.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a42c-08eb80a9060b', N'Camiseta Yoda', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Yoda.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a49c-08eb80a9060b', N'Camiseta Quack', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Quack.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a59c-08eb80a9060b', N'Camiseta Rick And Morty 2', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Rick And Morty Captured.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a69c-08eb80a9060b', N'Camiseta Rick And Morty', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Rick And Morty.webp', 5)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a79c-08eb80a9060b', N'Camiseta Say My Name', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Say My Name.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a89c-08eb80a9060b', N'Camiseta Support', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'support.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a99c-08eb80a9060b', N'Camiseta Try Hard', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'Tryhard.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'7d67df76-2d4e-4a47-a19c-08eb80a9060c', N'Camiseta Code Life Preta', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta2.jpg', 107)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'd7b40f3b-9407-4d47-934b-09eee2eb099d', N'Tapete Vermelhor', N'Tapete macio para sua sala', 1, CAST(11.00 AS Decimal(18, 2)), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'c45af104-4b46-4fa1-a4c3-a215183cabcf_tapete-vermelho.jpg', 98)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476421e', N'Caneca Joker Wanted', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-joker Wanted.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476422e', N'Caneca Joker', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-Joker.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476423e', N'Caneca Nightmare', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-Nightmare.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476424e', N'Caneca Ozob', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-Ozob.webp', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476425e', N'Caneca Rick and Morty', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-Rick and Morty.jpg', 5)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476426e', N'Caneca Wonder Woman', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-Wonder Woman.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476427e', N'Caneca No Coffee No Code', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca4.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476437e', N'Caneca Batman', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca1--batman.jpg', 4)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476447e', N'Caneca Vegeta', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca1-Vegeta.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476457e', N'Caneca Batman Preta', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-Batman.jpg', 8)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476467e', N'Caneca Big Bang Theory', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-bbt.webp', 0)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476477e', N'Caneca Cogumelo', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-cogumelo.webp', 9)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476487e', N'Caneca Geeks', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-Geeks.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'78162be3-61c4-4959-89d7-5ebfb476497e', N'Caneca Ironman', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca-ironman.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'768d00bd-3eef-4de4-8492-5edd295d6d12', N'Sapato', N'Sapato preto de couro', 1, CAST(85.00 AS Decimal(18, 2)), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'75337dbd-4de5-43f1-8688-8abed2f6d3eb_sapato.jpg', 5)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'6ecaaa6b-ad9f-422c-b3bb-6013ec27b4bb', N'Camiseta Debugar Preta', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(75.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta4.jpg', 9)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'6ecaaa6b-ad9f-422c-b3bb-6013ec27c4bb', N'Camiseta Code Life Cinza', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(99.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta3.jpg', 12)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'52dd696b-0882-4a73-9525-6af55dd416a4', N'Caneca Star Bugs Coffee', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(20.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca1.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'191ddd3e-acd4-4c3b-ae74-8e473993c5da', N'Caneca Programmer Code', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(15.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca2.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'8def18a0-9e06-486a-87f2-98329be3a9c4', N'Oculos Vermelhor', N'Oculos pra cego ve', 1, CAST(12.99 AS Decimal(18, 2)), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'b9bc0895-a0be-4df5-b6aa-54b403a37866_oculos.jpeg', 5)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'24a93317-e7a7-45b6-91e3-9a46df08d9c6', N'Pizza de mussarela', N'Melhor pizza de mussarela da região', 1, CAST(33.90 AS Decimal(18, 2)), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'59ccbaa7-1591-452d-a98c-3cbb2a115ed4_pizzaNova.jpg', 0)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'aab7c412-d9d8-44f6-a297-9d4324db4b37', N'Patins', N'Melhor patins BRASIL', 1, CAST(89.99 AS Decimal(18, 2)), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'96212b61-e17d-42c3-83ed-aedd292c2aa1_patins.jpg', 20)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'fc184e11-014c-4978-aa10-9eb5e1af369b', N'Camiseta Software Developer', N'Camiseta 100% algodão, resistente a lavagens e altas temperaturas.', 1, CAST(100.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'camiseta1.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'20e08cd4-2402-4e76-a3c9-a026185b193d', N'Caneca Turn Coffee in Code', N'Caneca de porcelana com impressão térmica de alta resistência.', 1, CAST(20.00 AS Decimal(18, 2)), CAST(N'2019-07-19T00:00:00.0000000' AS DateTime2), N'caneca3.jpg', 10)
INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N'e9d13954-4525-4306-869f-a4d2d989e1ac', N'Hrv 2020', N'Carro mais bonito da marca Honda', 1, CAST(79.00 AS Decimal(18, 2)), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'e5a8ab4a-5c7f-4a4a-b6ad-359fc9f35b32_Hrv.jpg', 1)
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'ed2318be-b1db-4fc5-8420-4490fe48609e', N'novo@novo.com', N'663c14c4-c0f6-4be3-9df8-f4cc4c999d7d', CAST(N'2021-11-27T09:28:37.2513473' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'da6b3ed2-4644-4bef-9aca-6a083c5bbf7c', N'alan@freefire.com', N'42167364-9280-413f-b1c8-874e7f9902cf', CAST(N'2021-11-29T05:52:31.8868668' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'c1210188-2204-4bf8-b21d-76baf23fd033', N'teste@teste.com', N'21ad4087-9fd0-4453-afbe-de9f069b3f13', CAST(N'2021-12-02T07:19:16.8364674' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'64fa1df7-3ce8-44fa-886d-8568206f7f9f', N'levi@levi.com', N'a60b4c5c-3c8a-4561-9abc-fd5a1133b972', CAST(N'2021-12-02T07:27:08.6378642' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'b201f609-5a8d-4282-968d-951281dc7b00', N'admin@admin.com', N'e79811ad-88c9-4d23-9877-2e51bc041881', CAST(N'2021-12-07T09:20:40.9883809' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'46609fc2-5261-4021-8e1c-b3de76442fc0', N'alisson@alisson.com', N'2b19242c-41f4-4bdd-984b-1419821c6dca', CAST(N'2021-12-07T09:45:12.4577980' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'da5340c7-47a6-401f-aeef-d8adc5c21b5e', N'alisson2@alisson.com', N'dcb240df-1746-4ff2-92f5-392d391c5fd4', CAST(N'2021-12-07T11:04:51.0951704' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'df680c7b-8a38-4fd0-a7eb-deb40c63c7a6', N'ari@ari.com.br', N'89050a0f-e863-45fc-b970-b8e97ce5f939', CAST(N'2021-12-02T08:40:43.8768713' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'4ef28b19-d741-40cf-87c7-ec08e85563cb', N'emerson@emerson.com', N'0b176523-a690-43c1-805e-da162d9c155f', CAST(N'2021-12-02T08:31:35.9325489' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Username], [Token], [ExpirationDate]) VALUES (N'9aaa274c-e087-4586-86c2-f838b05d1c5f', N'ariane@ariane.com', N'4578eff4-d245-47ee-bf0c-dbec396b0340', CAST(N'2021-11-21T10:07:49.0689236' AS DateTime2))
INSERT [dbo].[SecurityKeys] ([Id], [Parameters], [KeyId], [Type], [Algorithm], [CreationDate]) VALUES (N'fd81d9d8-e5a8-41d5-afb4-1bf60721f0d4', N'{"AdditionalData":{},"Alg":"ES256","Crv":"P-256","D":"uSwm_h3hfdb1bQYIsNuGrJkwfTmiWP7sGl3HfngqoFY","KeyId":"g9phS39C67zJK-ymvc_i3A","KeyOps":[],"Kid":"g9phS39C67zJK-ymvc_i3A","Kty":"EC","Use":"sig","X":"qDOxKKeQSXpyHdRJ4xx4Rxjs5zsDol5aLlpRsPdnoJo","X5c":[],"Y":"jEYmukzTh2B4Hi-lWvqZK5KDReQGEDOpeOyXqPFE4WE","KeySize":256,"HasPrivateKey":true,"CryptoProviderFactory":{"CryptoProviderCache":{},"CacheSignatureProviders":true}}', N'g9phS39C67zJK-ymvc_i3A', N'EC', N'ES256', CAST(N'2021-10-17T21:08:25.8767741' AS DateTime2))
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'd6ba95a0-74c0-4a27-98f3-0787e222dd9b', N'9R5GG3P2L6', N'MasterCard', CAST(N'2021-12-01T20:58:39.2031361' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'15782ac6-20d4-4624-a493-0e416c318892', N'IB2AHC8CFL', N'MasterCard', CAST(N'2021-10-10T23:12:38.6095174' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'6d8e724b-d785-4154-96c0-16569d3f5116', N'', N'MasterCard', CAST(N'2021-10-10T23:35:55.5499801' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'2cad08a0-739d-4085-853b-16a20b8d9f96', N'UQ8CZK2D4V', N'MasterCard', CAST(N'2021-11-03T22:03:26.4966877' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'9HGLJLO3YI', N'LE0UHX8972', N'241fdd19-23b5-47b0-821e-7fa8ca726ac1')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'22f28145-2370-46ad-ac4a-17ffe070497d', N'', N'MasterCard', CAST(N'2021-12-01T21:27:51.0289507' AS DateTime2), CAST(1199.85 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'6WM43KUQX2', N'Q8BRCU8SN1', N'04d63f78-bc99-4f5d-b65c-8e6088a82369')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'18151c59-1674-4d41-b7d8-1aef32cb8b56', N'HPRKBCHX0U', N'MasterCard', CAST(N'2021-10-31T21:24:06.9016782' AS DateTime2), CAST(349.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'5DZMT35DDB', N'FX8Y12MBKN', N'ef238560-4a06-4729-b6a0-cfe908e4295f')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'9b468866-6fec-44ec-a78a-1c23cbc162de', N'BPUYG0S9O3', N'MasterCard', CAST(N'2021-11-26T20:11:43.2698840' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'Z7NTJRVCQW', N'Z6GMDPT1Z9', N'3daa3e60-92d3-4f46-8e62-a1576c3b1267')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'2b0e0328-83d3-41bd-a76d-1c2b16fb816f', N'LLBBCFM8EI', N'MasterCard', CAST(N'2021-11-28T21:54:57.0699968' AS DateTime2), CAST(43.99 AS Decimal(18, 2)), CAST(1.32 AS Decimal(18, 2)), 1, N'H5WPJ5IQSZ', N'ZR4A10RMG5', N'269c1f33-4e03-4c39-a7d2-50ea0156f6b7')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'8c34dfac-904d-4149-8f84-1c9088f1e537', N'HFHXU4ODZS', N'MasterCard', CAST(N'2021-10-21T10:05:08.3685612' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'4IJDSJPP00', N'YGD40TPM4J', N'919247cd-cf38-46ed-aa02-e8490cd9a052')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'dd9fc01f-43b4-4f5d-a13e-1d60657f0745', N'RWJI3JA6V7', N'MasterCard', CAST(N'2021-12-01T20:58:39.1553579' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'dfd6028b-85c5-4249-b034-231965f73e43', N'', N'MasterCard', CAST(N'2021-12-01T20:58:39.0277661' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'9ccdefc1-5291-4d72-8706-25a91a1c2b23', N'', N'MasterCard', CAST(N'2021-12-01T20:37:13.3494972' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'24c4a360-eec2-4bb5-89fc-2641ebff2f17', N'LFE18OUS0P', N'MasterCard', CAST(N'2021-12-01T20:16:45.1530860' AS DateTime2), CAST(34.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'ZJBYDYUMSU', N'4LH40L3WKE', N'4dc09266-db3b-49b5-a1d8-1d1010e33fa3')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'b276a2e2-2a78-4560-ba65-2868badb9e19', N'37TZS1JIRX', N'MasterCard', CAST(N'2021-10-06T21:09:11.6098305' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'3J8S6V5MIP', N'XL5C5577CF', N'd8789738-bac7-401f-b576-ea3dd0920aea')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'82766e2c-ca46-4770-bbfa-2b7558a578e4', N'WDVY1AFFGB', N'MasterCard', CAST(N'2021-12-01T20:30:45.1313898' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'171902d9-f513-4b67-ba98-3436d5d3e4d8', N'UR3G1R6BKF', N'MasterCard', CAST(N'2021-11-28T21:57:38.8922520' AS DateTime2), CAST(34.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'2A4HFM3V6R', N'4T5G33I2TE', N'67553ae6-2fe4-4a96-8d8e-28ff780f87e4')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'3f2478d5-8e7b-4405-b0bd-34462f2fe7f3', N'', N'MasterCard', CAST(N'2021-10-10T23:30:56.1640358' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'438a459e-285a-4e7d-8412-360f59cb5211', N'LZPNLJXG5Z', N'MasterCard', CAST(N'2021-10-10T23:41:53.8702936' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'3J8S6V5MIP', N'XL5C5577CF', N'd8789738-bac7-401f-b576-ea3dd0920aea')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'b2f3d133-fbf1-4243-85f0-38476666ed1d', N'3327399AGX', N'MasterCard', CAST(N'2021-11-28T21:55:46.6279514' AS DateTime2), CAST(43.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'H5WPJ5IQSZ', N'ZR4A10RMG5', N'269c1f33-4e03-4c39-a7d2-50ea0156f6b7')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'05ced242-abba-4cd4-831b-391d095ea1cf', N'R5MEO6IB0O', N'MasterCard', CAST(N'2021-12-01T21:27:39.3374921' AS DateTime2), CAST(1199.85 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)), 1, N'6WM43KUQX2', N'Q8BRCU8SN1', N'04d63f78-bc99-4f5d-b65c-8e6088a82369')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'a55531cc-9564-44b9-a118-3e92a0d97f9f', N'', N'MasterCard', CAST(N'2021-10-10T23:35:55.5500253' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'3c7c6784-d200-4214-8eb3-43930bcad09b', N'JMJ2TOLWVJ', N'MasterCard', CAST(N'2021-12-01T21:30:42.7413215' AS DateTime2), CAST(1319.82 AS Decimal(18, 2)), CAST(39.59 AS Decimal(18, 2)), 1, N'X4R9WOFXBB', N'M0T2YNQYKJ', N'6dfd7215-a7cb-43a0-920f-4eae9cf082ba')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'c7b9f74a-e19f-4bda-9b27-4506af85e446', N'7EAYAZ466L', N'MasterCard', CAST(N'2021-10-10T22:47:57.4756853' AS DateTime2), CAST(80.00 AS Decimal(18, 2)), CAST(2.40 AS Decimal(18, 2)), 1, N'PYP16VJUTW', N'E0KW7AGL14', N'12b2787a-c802-40d7-84e8-a186aabfa1be')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'd52dad3c-4069-40a0-9b07-4b21ebb0bb09', N'', N'MasterCard', CAST(N'2021-10-10T23:30:41.1802212' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'46d2d72b-48ee-4cb6-9d21-4e0be6531f63', N'HB7WHJCQLH', N'MasterCard', CAST(N'2021-10-10T23:12:38.6095173' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'b204ec90-1a5b-43cd-ab0a-4e31879fe89d', N'969VI92AD9', N'MasterCard', CAST(N'2021-10-20T22:00:37.3434903' AS DateTime2), CAST(149.00 AS Decimal(18, 2)), CAST(4.47 AS Decimal(18, 2)), 1, N'HEDQ19EP2R', N'TXUCK7P304', N'a7baa170-112d-4cbb-a227-cbe04bec26cd')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'631d5365-b70e-49aa-af2d-533b3800cd7e', N'', N'MasterCard', CAST(N'2021-12-01T20:49:57.7782241' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'96e96922-148b-483d-9ec1-5440062f416a', N'EVR3RO08DO', N'MasterCard', CAST(N'2021-11-28T14:34:58.4398759' AS DateTime2), CAST(101.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'8QZ24HH910', N'N28ZFFQJZJ', N'9f60c827-7a6c-4f19-9202-e392e0bc8e31')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'85d1ebb3-22ce-4508-a6b4-557b5fbc3956', N'', N'MasterCard', CAST(N'2021-12-01T21:22:35.8035628' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'6b01536d-0fe4-42b1-92b7-558136d0bd11', N'X25Z3UHQM2', N'MasterCard', CAST(N'2021-10-21T10:05:01.2527974' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'4IJDSJPP00', N'YGD40TPM4J', N'919247cd-cf38-46ed-aa02-e8490cd9a052')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'68aefa20-3450-4473-bff3-5792527e5c7f', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4928094' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'8e9e2d87-983c-469c-a41e-591fe756144d', N'', N'MasterCard', CAST(N'2021-10-10T23:44:23.5922762' AS DateTime2), CAST(80.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'B9E5ZBLAQ4', N'JBDQQIXG24', N'6571d884-2927-4844-8cc8-bb3435b03ce0')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'4e352250-9e0d-4b46-a1c6-60384b8b97dd', N'', N'MasterCard', CAST(N'2021-10-10T23:36:44.9968023' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'257d0763-0a10-42f8-a08e-618d0108c246', N'QZ5V3Z6VF0', N'MasterCard', CAST(N'2021-10-21T10:04:09.6629917' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'W1JLN7ICWU', N'6ZHZJOF5VK', N'f0b2574c-1f26-4ca8-824d-024d20198bf8')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'9b111df5-1e0a-4f8c-936c-625e9136d408', N'AMYXU8PW2U', N'MasterCard', CAST(N'2021-12-01T20:58:39.1438279' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'fd2c9ce0-682a-48a2-aaa8-63d573f4fcbd', N'', N'MasterCard', CAST(N'2021-12-01T20:36:58.6868324' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'838efb18-2516-40ee-9dc2-6752d772bc6b', N'', N'MasterCard', CAST(N'2021-10-10T23:29:11.1940770' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'ce71223e-9b3b-4c3f-a4ea-69064016ae8d', N'', N'MasterCard', CAST(N'2021-12-01T20:31:45.1314422' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'd9e7bf56-03ea-4e9e-a05c-69960180b38d', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4929045' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'ead4c341-9e5a-48aa-9b2d-6a6e20b908e6', N'FYJX964F80', N'MasterCard', CAST(N'2021-12-01T21:30:38.5716078' AS DateTime2), CAST(49.99 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'00O7XX5EFQ', N'7YT3CRKPF6', N'cc2d2a34-cf47-4026-bf78-4076d1fceb68')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'b2a23264-f967-4aca-ad84-6d4e4bb14ded', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4929633' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'38b65775-e6c1-445b-8c74-6dc1fedd4739', N'KC85OMSGGX', N'MasterCard', CAST(N'2021-11-28T21:55:36.8829434' AS DateTime2), CAST(34.00 AS Decimal(18, 2)), CAST(1.02 AS Decimal(18, 2)), 1, N'2A4HFM3V6R', N'4T5G33I2TE', N'67553ae6-2fe4-4a96-8d8e-28ff780f87e4')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'290e16a3-ae45-404d-a5c3-6e414edf73ac', N'XECUY1OX8W', N'MasterCard', CAST(N'2021-11-28T18:15:05.9123502' AS DateTime2), CAST(329.98 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'93XRNGWTK6', N'0LDGG1I4V7', N'449f1a58-bc57-474d-b81a-5303ab39e049')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'069028ea-ad51-4472-8321-6f959164222e', N'', N'MasterCard', CAST(N'2021-10-10T23:29:56.1600139' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'86f60054-12c5-40c5-913b-7080cff1d162', N'H7OYNHQF9F', N'MasterCard', CAST(N'2021-12-01T20:10:45.6109969' AS DateTime2), CAST(49.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'LRPOD3NE7V', N'88KIZFREVD', N'b2d4feb3-7da9-44a1-aa81-b9965a407d30')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'82a97a25-b81f-487f-ba19-7148960c65ca', N'KCZY74XF61', N'MasterCard', CAST(N'2021-12-01T21:30:51.0271228' AS DateTime2), CAST(49.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'00O7XX5EFQ', N'7YT3CRKPF6', N'cc2d2a34-cf47-4026-bf78-4076d1fceb68')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'90a639f6-3ea8-4769-95a7-748b45d4b71c', N'44VZQOOFTT', N'MasterCard', CAST(N'2021-10-10T23:42:08.5986457' AS DateTime2), CAST(80.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'DBI5R8X8PI', N'6ZQ009BDOQ', N'3efc5225-b1a3-4201-ad2d-6cd4c1477ad0')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'523ddac5-03cf-4186-aa25-751c1ba2f012', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4929353' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'564c6205-1918-4c21-af48-7bb75f45d95d', N'32H7WFPMLV', N'MasterCard', CAST(N'2021-10-04T23:12:37.9511410' AS DateTime2), CAST(90.00 AS Decimal(18, 2)), CAST(2.70 AS Decimal(18, 2)), 1, N'HQQ4BN0OPA', N'4A3ETTFKNV', N'74913730-5f84-4ba4-8596-577824b118a4')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'140a7ad4-47db-48a5-921d-7c9832070f25', N'G6DDVPKAN7', N'MasterCard', CAST(N'2021-10-10T23:42:23.5814088' AS DateTime2), CAST(80.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'PYP16VJUTW', N'E0KW7AGL14', N'12b2787a-c802-40d7-84e8-a186aabfa1be')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'dc825bc3-ac8d-4370-a6e7-7f3f6c638f0d', N'38BREYS9G3', N'MasterCard', CAST(N'2021-12-01T20:30:04.0293610' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 1, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'b2defd3e-84d9-4787-a1e5-856131bb2358', N'1JE6D7XN60', N'MasterCard', CAST(N'2021-10-10T23:44:18.5877261' AS DateTime2), CAST(80.00 AS Decimal(18, 2)), CAST(2.40 AS Decimal(18, 2)), 1, N'B9E5ZBLAQ4', N'JBDQQIXG24', N'6571d884-2927-4844-8cc8-bb3435b03ce0')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'1f081dc4-172c-4e97-8c92-870c6c4795cb', N'60NTQDC6YI', N'MasterCard', CAST(N'2021-11-28T21:11:38.2875366' AS DateTime2), CAST(27.49 AS Decimal(18, 2)), CAST(0.82 AS Decimal(18, 2)), 1, N'P0N42WUNDX', N'OY52V1OV3A', N'8d1a9ef2-3a82-4e0c-a716-f60cacaf13cf')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'1c51c2a1-afb8-42d8-bf2d-8ac4b00e9b59', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4927738' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'40385b97-8266-4af4-9c9e-8b57b8cd4ab5', N'', N'MasterCard', CAST(N'2021-10-10T23:31:26.1617468' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'1607e340-c9fa-4170-9c9e-8c9463482ab7', N'JBU16ZPKLZ', N'MasterCard', CAST(N'2021-11-30T20:33:42.4107494' AS DateTime2), CAST(159.98 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'HRS6VZPPHZ', N'KH2ZBDGZQU', N'0998de46-4ba3-4ae4-9bb1-90c7c4a3895d')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'6d664b81-5d28-492f-821a-8cb5fb59e4c7', N'', N'MasterCard', CAST(N'2021-10-10T23:31:11.1624817' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'ab07f7b8-40a5-4713-8c1a-955c8354cfd6', N'PKRHWRQRUG', N'MasterCard', CAST(N'2021-11-30T20:38:00.8885331' AS DateTime2), CAST(99.00 AS Decimal(18, 2)), CAST(2.97 AS Decimal(18, 2)), 1, N'MAJKAWJKIM', N'7T5HOA8ZMB', N'7002c90b-0cd3-4507-9903-15232d6be2b0')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'3e0c7c4c-8dfc-46dc-8604-967939cbd347', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4928644' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'6559d043-9fe2-4759-975e-96cbf1c252d7', N'EQPOU7F3PO', N'MasterCard', CAST(N'2021-12-01T20:58:39.1438279' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'6ec4affa-9452-4c01-8b6d-99f4bf4d428b', N'', N'MasterCard', CAST(N'2021-12-01T20:58:39.0277729' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'5786d834-3678-4cbf-922c-9a12d4a14671', N'P61KBH7HUM', N'MasterCard', CAST(N'2021-11-28T21:11:40.5154271' AS DateTime2), CAST(27.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'P0N42WUNDX', N'OY52V1OV3A', N'8d1a9ef2-3a82-4e0c-a716-f60cacaf13cf')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'7fc6d12c-5b5b-43a7-a301-9a8cbd9be266', N'5T7JH4QO3H', N'MasterCard', CAST(N'2021-12-06T22:16:41.5477687' AS DateTime2), CAST(83.40 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'2YSJ58OUS5', N'221ZNKA74J', N'49303c41-eef6-43e9-9d50-4a1d8e48d42d')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'36f83236-1123-4953-8f5e-9c0516bd588a', N'', N'MasterCard', CAST(N'2021-10-10T23:29:26.1605620' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'11d595bd-d237-4b68-bf0e-9f1577d7a64c', N'', N'MasterCard', CAST(N'2021-12-01T20:58:39.0277772' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'cdd697d3-d0f1-49f5-a5f8-a12310fca053', N'', N'MasterCard', CAST(N'2021-10-10T23:29:41.1641128' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'938f6e9b-d8f8-427b-b139-a298b8bdad2e', N'', N'MasterCard', CAST(N'2021-10-10T23:36:03.9163852' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'f1c086fc-44c4-445c-9727-a41d5920a602', N'DNFQGA5GWD', N'MasterCard', CAST(N'2021-11-03T22:03:59.4441508' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'9HGLJLO3YI', N'LE0UHX8972', N'241fdd19-23b5-47b0-821e-7fa8ca726ac1')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'6e498ef4-7274-4f02-86a0-a4f03f18d31f', N'9A15RNLG80', N'MasterCard', CAST(N'2021-11-28T18:44:12.7829735' AS DateTime2), CAST(49.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'A0SCWHPN5M', N'FFYVGC1Z7P', N'37978744-dfc3-4c0e-9362-888af16193ae')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'f237c4a1-4ed2-4861-b305-a73cede33a53', N'WEJZ8BUZU3', N'MasterCard', CAST(N'2021-10-20T22:00:55.6770747' AS DateTime2), CAST(149.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'HEDQ19EP2R', N'TXUCK7P304', N'a7baa170-112d-4cbb-a227-cbe04bec26cd')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'c2f60f5b-e1f0-40e0-a16d-a7b2208aed2f', N'XPCPWH9OXQ', N'MasterCard', CAST(N'2021-10-31T21:23:39.6393959' AS DateTime2), CAST(349.00 AS Decimal(18, 2)), CAST(10.47 AS Decimal(18, 2)), 1, N'5DZMT35DDB', N'FX8Y12MBKN', N'ef238560-4a06-4729-b6a0-cfe908e4295f')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'f0fa4268-a8f1-42a0-b626-a8c895bb5186', N'02O3CXJ9X4', N'MasterCard', CAST(N'2021-12-01T21:27:32.9360856' AS DateTime2), CAST(79.99 AS Decimal(18, 2)), CAST(2.40 AS Decimal(18, 2)), 1, N'MMSYEQE48V', N'6BSJFBQBRV', N'c08d94f8-ae8e-46da-9255-e988fad2473b')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'05843576-ab56-4794-8add-a8edb5797b83', N'MOZNQPTVJ3', N'MasterCard', CAST(N'2021-11-26T20:12:17.3044699' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'Z7NTJRVCQW', N'Z6GMDPT1Z9', N'3daa3e60-92d3-4f46-8e62-a1576c3b1267')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'cb19f81a-6848-4a0f-9da0-aa4f795aad51', N'Z2AI8SX0CH', N'MasterCard', CAST(N'2021-11-24T22:43:52.7057263' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'CBRJ73TXI9', N'ACNKT75CLE', N'e5568b92-9966-4681-89ae-4032ae7fe107')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'ee76c516-f093-4973-b1be-af27f6de7862', N'', N'MasterCard', CAST(N'2021-12-01T20:58:39.3236100' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'ac3bdf99-0f7f-4616-b339-af4fa13af4ce', N'5743TAUV9G', N'MasterCard', CAST(N'2021-12-01T20:58:39.2110600' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'6323edbf-7994-4c59-bb3b-af51f54687c4', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4929460' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'4e86b2cc-c8ce-41b2-b92c-afb227d20f2d', N'', N'MasterCard', CAST(N'2021-10-10T23:35:55.5499903' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'1c9ba80e-0d35-42ed-a428-afe40beca07f', N'ZAO5SYQT6J', N'MasterCard', CAST(N'2021-10-21T10:03:57.5220717' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'W1JLN7ICWU', N'6ZHZJOF5VK', N'f0b2574c-1f26-4ca8-824d-024d20198bf8')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'60f98dc2-f80d-4706-b72f-b10da6b4e2d3', N'', N'MasterCard', CAST(N'2021-10-10T23:30:11.1626951' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'75ef6f67-21cc-4a42-ad49-b2eddaa4a571', N'0CY148XUOM', N'MasterCard', CAST(N'2021-10-07T12:12:36.5200058' AS DateTime2), CAST(80.00 AS Decimal(18, 2)), CAST(2.40 AS Decimal(18, 2)), 1, N'DBI5R8X8PI', N'6ZQ009BDOQ', N'3efc5225-b1a3-4201-ad2d-6cd4c1477ad0')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'96e2707c-1703-4ff2-a2e8-b36502c3e2a8', N'R78OAITZO8', N'MasterCard', CAST(N'2021-11-30T20:33:38.0474723' AS DateTime2), CAST(159.98 AS Decimal(18, 2)), CAST(4.80 AS Decimal(18, 2)), 1, N'HRS6VZPPHZ', N'KH2ZBDGZQU', N'0998de46-4ba3-4ae4-9bb1-90c7c4a3895d')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'3b978856-d5a1-49a5-a8af-b5a372533c8a', N'5RHP3S0M7J', N'MasterCard', CAST(N'2021-12-01T20:58:39.1458792' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'0461d9c0-6951-4d88-9e35-b777c7e96b13', N'XSE4ZTZ0PF', N'MasterCard', CAST(N'2021-12-06T22:16:29.9117010' AS DateTime2), CAST(83.40 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 1, N'2YSJ58OUS5', N'221ZNKA74J', N'49303c41-eef6-43e9-9d50-4a1d8e48d42d')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'697646ec-b849-4c73-8ce4-b8cf54d425ef', N'RGT0XVTJ26', N'MasterCard', CAST(N'2021-11-30T20:38:08.5969065' AS DateTime2), CAST(99.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'MAJKAWJKIM', N'7T5HOA8ZMB', N'7002c90b-0cd3-4507-9903-15232d6be2b0')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'0a281951-473a-47e4-846c-b8ff1e0136f1', N'DHIXO5K1YY', N'MasterCard', CAST(N'2021-11-01T20:41:39.8816357' AS DateTime2), CAST(350.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'1A6O9RU5NB', N'5TUPM95ST8', N'a87c0c1b-0fc1-4ec7-aade-bcbf75363ccc')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'41ec9448-dc19-4933-a696-ba8d9e5d7f2a', N'FBP3I92837', N'MasterCard', CAST(N'2021-11-03T19:56:50.4221837' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(2.25 AS Decimal(18, 2)), 1, N'KVKIXXHZ2K', N'3KQWZ3WH07', N'5e46687c-1fb3-42a6-942a-5923cfbf52e7')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'f6b69510-29a1-4233-a962-befe52649e48', N'', N'MasterCard', CAST(N'2021-10-10T23:30:26.1629980' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'349f31b3-4319-4c74-98fd-c0331cf661dd', N'0HVQ22HVH4', N'MasterCard', CAST(N'2021-11-01T20:41:09.5498133' AS DateTime2), CAST(350.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), 1, N'1A6O9RU5NB', N'5TUPM95ST8', N'a87c0c1b-0fc1-4ec7-aade-bcbf75363ccc')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'f25b5bad-daea-4e58-97dd-c0b036145e8f', N'Y8C6OOY5HR', N'MasterCard', CAST(N'2021-10-10T23:12:48.2259075' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'72a1a2d2-0e6e-424c-84e0-c4b426122ed1', N'410HWBPX3R', N'MasterCard', CAST(N'2021-12-01T21:27:36.2352390' AS DateTime2), CAST(79.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'MMSYEQE48V', N'6BSJFBQBRV', N'c08d94f8-ae8e-46da-9255-e988fad2473b')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'0a37cc15-4bf2-4619-bf19-c7ccc6145f40', N'', N'MasterCard', CAST(N'2021-12-01T21:23:24.6766344' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'46adbd8d-0024-4344-9949-c8220468b8bd', N'TX7P2B0BXF', N'MasterCard', CAST(N'2021-12-01T20:58:39.2061220' AS DateTime2), CAST(499.90 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'NPI7HQ3VTD', N'PIEWSGHR5O', N'933c45c7-13ef-4fb9-800e-7298d9d7bd3a')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'64e51a0f-69b4-4c88-a3f4-c85e7b1cb78c', N'WHXK6F2QH9', N'MasterCard', CAST(N'2021-10-04T22:48:44.7151228' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(2.25 AS Decimal(18, 2)), 1, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'9b0c0f40-0ab0-438b-a1d0-ccf54914eefa', N'KA1MGOHULH', N'MasterCard', CAST(N'2021-11-03T19:57:14.0593771' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'KVKIXXHZ2K', N'3KQWZ3WH07', N'5e46687c-1fb3-42a6-942a-5923cfbf52e7')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'63293f50-ea4b-4505-a6ca-ccf56dd76cef', N'C0TGA95B32', N'MasterCard', CAST(N'2021-12-01T20:15:59.9681682' AS DateTime2), CAST(34.99 AS Decimal(18, 2)), CAST(1.05 AS Decimal(18, 2)), 1, N'ZJBYDYUMSU', N'4LH40L3WKE', N'4dc09266-db3b-49b5-a1d8-1d1010e33fa3')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'e98398cc-fc5a-426a-a383-d001697ee0bb', N'619YY6L4WO', N'MasterCard', CAST(N'2021-11-24T22:44:52.5073266' AS DateTime2), CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'CBRJ73TXI9', N'ACNKT75CLE', N'e5568b92-9966-4681-89ae-4032ae7fe107')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'16a433d2-c82c-4733-bfba-d207e3fffac6', N'SNQ2KYPQX8', N'MasterCard', CAST(N'2021-10-10T23:41:38.6364333' AS DateTime2), CAST(90.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'HQQ4BN0OPA', N'4A3ETTFKNV', N'74913730-5f84-4ba4-8596-577824b118a4')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'870ecd70-64f1-4903-b3e5-d492d1fc8414', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4928409' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'e0189c56-658b-44b1-8688-d4f926f668bc', N'8F1U7JO2W3', N'MasterCard', CAST(N'2021-11-28T18:14:37.0718581' AS DateTime2), CAST(329.98 AS Decimal(18, 2)), CAST(9.90 AS Decimal(18, 2)), 1, N'93XRNGWTK6', N'0LDGG1I4V7', N'449f1a58-bc57-474d-b81a-5303ab39e049')
GO
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'bff574c6-0b6f-493d-acc1-d53c4a380ed2', N'', N'MasterCard', CAST(N'2021-10-10T23:35:55.5500389' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'0c794e25-b590-4b4a-8e24-d5d142301a39', N'', N'MasterCard', CAST(N'2021-10-10T23:28:56.1779694' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'bceb1236-84c4-4548-93c5-d86a5eaad942', N'K1RGYEOYJP', N'MasterCard', CAST(N'2021-11-03T20:04:13.4460293' AS DateTime2), CAST(175.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'2T07DXZIET', N'A8VMWJYC54', N'466a23b6-3989-48f6-bb7d-7bd6f8c6947f')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'4a060c59-9a0c-48e8-bec8-dbafcf7b1a13', N'08BOQMWGXW', N'MasterCard', CAST(N'2021-12-01T20:10:22.7556494' AS DateTime2), CAST(49.99 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'LRPOD3NE7V', N'88KIZFREVD', N'b2d4feb3-7da9-44a1-aa81-b9965a407d30')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'cebd2790-a784-4537-86e9-dcb970ea171c', N'7MGUD6J73B', N'MasterCard', CAST(N'2021-11-28T14:34:32.6479670' AS DateTime2), CAST(101.61 AS Decimal(18, 2)), CAST(3.05 AS Decimal(18, 2)), 1, N'8QZ24HH910', N'N28ZFFQJZJ', N'9f60c827-7a6c-4f19-9202-e392e0bc8e31')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'9bf3579a-ca38-47e7-a3b4-dd616da0b401', N'', N'MasterCard', CAST(N'2021-10-10T23:36:47.9538299' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'36fb9e02-4c51-4d9a-b117-e3e1d1d8a169', N'07X3ZW8BW9', N'MasterCard', CAST(N'2021-12-01T20:30:10.4740294' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 1, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'9c67de06-2c56-4933-b330-eb6a22444bfe', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4928846' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'aefbae5e-29b1-4ced-9954-eb951d768b5a', N'', N'MasterCard', CAST(N'2021-10-10T23:37:12.0092227' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'04438afb-d1b6-453e-ac2c-ebd51b9fe4e1', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4927901' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'dd88c24a-9fe3-44fb-910c-eef48590d9ee', N'', N'MasterCard', CAST(N'2021-12-01T21:31:06.0200157' AS DateTime2), CAST(1319.82 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'X4R9WOFXBB', N'M0T2YNQYKJ', N'6dfd7215-a7cb-43a0-920f-4eae9cf082ba')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'cbd8c53c-f6eb-4e04-ba28-f09f2921830d', N'TUUUBSBSGL', N'MasterCard', CAST(N'2021-11-03T20:03:20.1830657' AS DateTime2), CAST(175.00 AS Decimal(18, 2)), CAST(5.25 AS Decimal(18, 2)), 1, N'2T07DXZIET', N'A8VMWJYC54', N'466a23b6-3989-48f6-bb7d-7bd6f8c6947f')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'8dc45333-ff66-406a-9a71-f6423e521b3a', N'', N'MasterCard', CAST(N'2021-10-10T23:37:10.6421121' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'24982479-4df6-4242-b627-f727df8508f9', N'', N'MasterCard', CAST(N'2021-10-10T23:37:16.6400752' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'44cb2ac2-d8d3-45b0-be9a-f9798347f55d', N'GBD7940IFY', N'MasterCard', CAST(N'2021-12-01T20:58:39.1438278' AS DateTime2), CAST(399.92 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'6S2VXYXZDV', N'T7INVXKPZZ', N'b5377653-ae58-436e-9bb4-8fd4bb46493e')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'8a9a1c42-f146-409d-847a-fa5be53fd6c1', N'ZPN03BP0U3', N'MasterCard', CAST(N'2021-10-10T23:41:33.8324401' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'd2fa2e01-92b1-49e4-b420-fadc8c294d5e', N'3A5FN742IK', N'MasterCard', CAST(N'2021-11-28T18:43:43.4960023' AS DateTime2), CAST(49.99 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 1, N'A0SCWHPN5M', N'FFYVGC1Z7P', N'37978744-dfc3-4c0e-9362-888af16193ae')
INSERT [dbo].[Transacoes] ([Id], [CodigoAutorizacao], [BandeiraCartao], [DataTransacao], [ValorTotal], [CustoTransacao], [Status], [TID], [NSU], [PagamentoId]) VALUES (N'a6e25d4f-bd9d-4450-97c4-feb1d4e17f86', N'', N'MasterCard', CAST(N'2021-10-10T23:28:49.4927738' AS DateTime2), CAST(75.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5, N'03OT8RWMJI', N'WF5FYNT0XP', N'8683da82-207d-4788-9d69-5c9951e95675')
INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N'd1d0cb8e-6af0-4180-b56d-013375e5a62c', N'70R$-OFF', NULL, CAST(70.00 AS Decimal(18, 2)), 2, 1, CAST(N'2021-12-06T22:13:43.4837266' AS DateTime2), NULL, CAST(N'2021-12-08T22:13:43.4837287' AS DateTime2), 1, 0)
INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N'ba0da49d-ecfc-4643-8bb8-155aabbcd619', N'45%-OFF', CAST(45.00 AS Decimal(18, 2)), NULL, 0, 0, CAST(N'2021-11-28T19:24:09.4723923' AS DateTime2), CAST(N'2021-11-28T21:54:57.0292855' AS DateTime2), CAST(N'2021-11-30T19:24:09.4723951' AS DateTime2), 0, 1)
INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N'b8808681-ebe9-4007-86b7-503a6cfe14ec', N'45-OFF', NULL, CAST(45.00 AS Decimal(18, 2)), 1, 1, CAST(N'2021-11-28T19:17:27.0214979' AS DateTime2), NULL, CAST(N'2021-11-30T19:17:27.0215017' AS DateTime2), 1, 0)
INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N'875b657e-90f3-45b6-a941-7c5f4f6084f3', N'70%-OFF', CAST(70.00 AS Decimal(18, 2)), NULL, 1, 0, CAST(N'2021-12-06T22:13:09.1835664' AS DateTime2), NULL, CAST(N'2021-12-08T22:13:09.1835688' AS DateTime2), 1, 0)
INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N'880cb02a-8ca4-4516-a9a0-ce8473f2641a', N'30%-OFF', CAST(30.00 AS Decimal(18, 2)), NULL, 2, 0, CAST(N'2021-12-01T20:14:45.3381967' AS DateTime2), NULL, CAST(N'2021-12-03T20:14:45.3381996' AS DateTime2), 1, 0)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 07/12/2021 18:02:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 07/12/2021 18:02:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_CLIENTE]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IDX_CLIENTE] ON [dbo].[CarrinhoCliente]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarrinhoItens_CarrinhoId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_CarrinhoItens_CarrinhoId] ON [dbo].[CarrinhoItens]
(
	[CarrinhoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enderecos_ClienteId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Enderecos_ClienteId] ON [dbo].[Enderecos]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PedidoItem_PedidoId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_PedidoItem_PedidoId] ON [dbo].[PedidoItem]
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pedidos_VoucherId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_Pedidos_VoucherId] ON [dbo].[Pedidos]
(
	[VoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transacoes_PagamentoId]    Script Date: 07/12/2021 18:02:33 ******/
CREATE NONCLUSTERED INDEX [IX_Transacoes_PagamentoId] ON [dbo].[Transacoes]
(
	[PagamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarrinhoCliente] ADD  DEFAULT ((0.0)) FOR [Desconto]
GO
ALTER TABLE [dbo].[CarrinhoCliente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VoucherUtilizado]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NEXT VALUE FOR [SequenciaPedido]) FOR [Codigo]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CarrinhoItens]  WITH CHECK ADD  CONSTRAINT [FK_CarrinhoItens_CarrinhoCliente_CarrinhoId] FOREIGN KEY([CarrinhoId])
REFERENCES [dbo].[CarrinhoCliente] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarrinhoItens] CHECK CONSTRAINT [FK_CarrinhoItens_CarrinhoCliente_CarrinhoId]
GO
ALTER TABLE [dbo].[Enderecos]  WITH CHECK ADD  CONSTRAINT [FK_Enderecos_Clientes_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Enderecos] CHECK CONSTRAINT [FK_Enderecos_Clientes_ClienteId]
GO
ALTER TABLE [dbo].[PedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_PedidoItem_Pedidos_PedidoId] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedidos] ([Id])
GO
ALTER TABLE [dbo].[PedidoItem] CHECK CONSTRAINT [FK_PedidoItem_Pedidos_PedidoId]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Vouchers_VoucherId] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Vouchers] ([Id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Vouchers_VoucherId]
GO
ALTER TABLE [dbo].[Transacoes]  WITH CHECK ADD  CONSTRAINT [FK_Transacoes_Pagamentos_PagamentoId] FOREIGN KEY([PagamentoId])
REFERENCES [dbo].[Pagamentos] ([Id])
GO
ALTER TABLE [dbo].[Transacoes] CHECK CONSTRAINT [FK_Transacoes_Pagamentos_PagamentoId]
GO
USE [master]
GO
ALTER DATABASE [EcommerceDb] SET  READ_WRITE 
GO
