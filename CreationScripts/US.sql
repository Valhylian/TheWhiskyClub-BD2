USE [master]
GO
/****** Object:  Database [WhiskyUS]    Script Date: 6/15/2022 7:29:36 PM ******/
CREATE DATABASE [WhiskyUS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WhiskyUS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WhiskyUS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WhiskyUS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WhiskyUS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WhiskyUS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WhiskyUS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WhiskyUS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WhiskyUS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WhiskyUS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WhiskyUS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WhiskyUS] SET ARITHABORT OFF 
GO
ALTER DATABASE [WhiskyUS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WhiskyUS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WhiskyUS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WhiskyUS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WhiskyUS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WhiskyUS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WhiskyUS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WhiskyUS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WhiskyUS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WhiskyUS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WhiskyUS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WhiskyUS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WhiskyUS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WhiskyUS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WhiskyUS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WhiskyUS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WhiskyUS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WhiskyUS] SET RECOVERY FULL 
GO
ALTER DATABASE [WhiskyUS] SET  MULTI_USER 
GO
ALTER DATABASE [WhiskyUS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WhiskyUS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WhiskyUS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WhiskyUS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WhiskyUS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WhiskyUS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WhiskyUS', N'ON'
GO
ALTER DATABASE [WhiskyUS] SET QUERY_STORE = OFF
GO
USE [WhiskyUS]
GO
/****** Object:  Table [dbo].[CatalogContainer]    Script Date: 6/15/2022 7:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogContainer](
	[id_Container] [int] NOT NULL,
	[description_Container] [varchar](64) NOT NULL,
 CONSTRAINT [PK__CatalogC__58852D4DD7CB5386] PRIMARY KEY CLUSTERED 
(
	[id_Container] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogProductType]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogProductType](
	[id_ProductType] [int] NOT NULL,
	[name_ProductType] [varchar](64) NOT NULL,
 CONSTRAINT [PK__CatalogP__2ABBD35E2B53C837] PRIMARY KEY CLUSTERED 
(
	[id_ProductType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogSubscription]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogSubscription](
	[id_subscription] [int] NOT NULL,
	[name_subscription] [varchar](64) NOT NULL,
	[description_subscription] [varchar](max) NOT NULL,
	[discount_subscription] [int] NOT NULL,
	[price_subscription] [money] NOT NULL,
	[discount_shipping] [int] NOT NULL,
 CONSTRAINT [PK__CatalogS__5F1F3D15B676654E] PRIMARY KEY CLUSTERED 
(
	[id_subscription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id_client] [int] NOT NULL,
	[name_client] [varchar](50) NOT NULL,
	[email_client] [varchar](64) NOT NULL,
	[subscription_client] [int] NOT NULL,
 CONSTRAINT [PK__Client__6EC2B6C03F204202] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id_product] [int] NOT NULL,
	[name_product] [varchar](64) NOT NULL,
	[type_product] [int] NOT NULL,
	[aged_product] [int] NOT NULL,
	[container_product] [int] NOT NULL,
	[price_product] [money] NOT NULL,
	[special_product] [bit] NOT NULL,
	[image] [varbinary](128) NULL,
 CONSTRAINT [PK__Product__BA39E84F19C31262] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductxStore]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductxStore](
	[id_productxStore] [int] IDENTITY(1,1) NOT NULL,
	[aumount] [int] NOT NULL,
	[id_store] [int] NOT NULL,
	[id_product] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_productxStore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[id_purchase] [int] NOT NULL,
	[client_purchase] [int] NOT NULL,
	[date_purchase] [date] NOT NULL,
	[location_client] [geography] NOT NULL,
	[subtotal] [money] NOT NULL,
	[shipping] [money] NOT NULL,
	[total] [money] NOT NULL,
	[id_PurchasingManager] [int] NULL,
	[id_Dealer] [int] NULL,
	[status_purchase] [int] NOT NULL,
	[distance] [float] NULL,
	[moneyType] [varchar](128) NOT NULL,
 CONSTRAINT [PK__purchase__84A464F9F96D4D4D] PRIMARY KEY CLUSTERED 
(
	[id_purchase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchaseXProduct]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchaseXProduct](
	[id_purchaseXProduct] [int] NOT NULL,
	[id_purchase] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[subtotal] [money] NOT NULL,
 CONSTRAINT [PK__purchase__393FB097CBC7006C] PRIMARY KEY CLUSTERED 
(
	[id_purchaseXProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/15/2022 7:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[id_store] [int] NOT NULL,
	[name_store] [varchar](64) NOT NULL,
	[location_store] [geography] NOT NULL,
	[location_storeText]  AS ([location_store].[STAsText]()),
 CONSTRAINT [PK__Store__3A39C3396C9262B9] PRIMARY KEY CLUSTERED 
(
	[id_store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CatalogContainer] ([id_Container], [description_Container]) VALUES (1, N'Mini Bottle 4cl')
GO
INSERT [dbo].[CatalogContainer] ([id_Container], [description_Container]) VALUES (2, N'Hip flask Bottle 200ml')
GO
INSERT [dbo].[CatalogContainer] ([id_Container], [description_Container]) VALUES (3, N'Standar Bottle 50cl')
GO
INSERT [dbo].[CatalogContainer] ([id_Container], [description_Container]) VALUES (4, N'Bottle 70cl-1L')
GO
INSERT [dbo].[CatalogContainer] ([id_Container], [description_Container]) VALUES (5, N'Special Size Bottle 3L')
GO
INSERT [dbo].[CatalogContainer] ([id_Container], [description_Container]) VALUES (6, N'Gift Edition Bottle 4.5L ')
GO
INSERT [dbo].[CatalogProductType] ([id_ProductType], [name_ProductType]) VALUES (1, N'Single Malt')
GO
INSERT [dbo].[CatalogProductType] ([id_ProductType], [name_ProductType]) VALUES (2, N'Blended Scotch')
GO
INSERT [dbo].[CatalogProductType] ([id_ProductType], [name_ProductType]) VALUES (3, N'Irish')
GO
INSERT [dbo].[CatalogProductType] ([id_ProductType], [name_ProductType]) VALUES (4, N'Blended Malt')
GO
INSERT [dbo].[CatalogProductType] ([id_ProductType], [name_ProductType]) VALUES (5, N'Bourbon')
GO
INSERT [dbo].[CatalogProductType] ([id_ProductType], [name_ProductType]) VALUES (6, N'Tennessee Whiskey')
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (1, N'Default', N'Default', 0, 0.0000, 0)
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (2, N'Tier Short Glass', N'When a new whiskey is entered into the store, you receive an email with its description. You have a 5% discount on purchases', 5, 30.0000, 0)
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (3, N'Tier Gleincairn', N'Exclusive whiskeys. It has a 10% discount on purchases and a 20% discount on the cost of shipping. Notifications of new products to the mail.', 10, 70.0000, 20)
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (4, N'Tier Master Distiller', N'Free shipping cost. You have a 30% discount on purchases and every 10 whiskeys you buy, you get a free whiskey. Access to the catalog of special whiskeys. Mail notification of new products.', 30, 100.0000, 100)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (1, N'Andres Valverde', N'andres190601@gmail.com', 4)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (2, N'Luis Fallas', N'lfpf2220@gmail.com', 2)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (3, N'Shirley Rodriguez', N'shirod777@gmail.com', 3)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (4, N'Juanita Perez', N'juanita@gmail.com', 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (5, N'PRUEBA', N'PRUEBA@GMAIL.COM', 4)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [container_product], [price_product], [special_product], [image]) VALUES (1, N'Glenfiddich', 1, 15, 3, 45.0000, 0, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [container_product], [price_product], [special_product], [image]) VALUES (2, N'Glenlivet Founder’s Reserve', 1, 20, 3, 38.0000, 0, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [container_product], [price_product], [special_product], [image]) VALUES (3, N'Monkey Shoulder', 2, 3, 1, 10.0000, 0, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [container_product], [price_product], [special_product], [image]) VALUES (4, N'Lambay Small Batch Blend', 3, 10, 2, 25.0000, 0, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [container_product], [price_product], [special_product], [image]) VALUES (5, N'Johnnie Walker Black Label', 4, 12, 4, 55.0000, 0, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [container_product], [price_product], [special_product], [image]) VALUES (6, N'Makers Mark at Drizly', 5, 20, 5, 150.0000, 1, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [container_product], [price_product], [special_product], [image]) VALUES (7, N'George Dickel Barrel Select', 6, 12, 6, 70.0000, 1, NULL)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [location_store]) VALUES (7, N'WhiskyClub USA 1', 0xE6100000010CAD85B4731EE542403E50ADFB029A5EC0)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [location_store]) VALUES (8, N'WhiskyClub USA 2', 0xE6100000010CE2FED4AF626140409F1A3DA1EA485DC0)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [location_store]) VALUES (9, N'WhiskyClub USA 3', 0xE6100000010C4D0D51BB2D5D4440AB612D8E897F52C0)
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__special__412EB0B6]  DEFAULT ((0)) FOR [special_product]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__subtot__49C3F6B7]  DEFAULT ((0)) FOR [subtotal]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__shippi__4AB81AF0]  DEFAULT ((0)) FOR [shipping]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__total__4BAC3F29]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__status__4CA06362]  DEFAULT ((1)) FOR [status_purchase]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__subscrip__3C69FB99] FOREIGN KEY([subscription_client])
REFERENCES [dbo].[CatalogSubscription] ([id_subscription])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__subscrip__3C69FB99]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__contain__4316F928] FOREIGN KEY([container_product])
REFERENCES [dbo].[CatalogContainer] ([id_Container])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__contain__4316F928]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__type_pr__4222D4EF] FOREIGN KEY([type_product])
REFERENCES [dbo].[CatalogProductType] ([id_ProductType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__type_pr__4222D4EF]
GO
ALTER TABLE [dbo].[ProductxStore]  WITH CHECK ADD  CONSTRAINT [FK__ProductxS__id_pr__46E78A0C] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[ProductxStore] CHECK CONSTRAINT [FK__ProductxS__id_pr__46E78A0C]
GO
ALTER TABLE [dbo].[ProductxStore]  WITH CHECK ADD  CONSTRAINT [FK__ProductxS__id_st__45F365D3] FOREIGN KEY([id_store])
REFERENCES [dbo].[Store] ([id_store])
GO
ALTER TABLE [dbo].[ProductxStore] CHECK CONSTRAINT [FK__ProductxS__id_st__45F365D3]
GO
ALTER TABLE [dbo].[purchase]  WITH CHECK ADD  CONSTRAINT [FK__purchase__client__4D94879B] FOREIGN KEY([client_purchase])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[purchase] CHECK CONSTRAINT [FK__purchase__client__4D94879B]
GO
ALTER TABLE [dbo].[purchaseXProduct]  WITH CHECK ADD  CONSTRAINT [FK__purchaseX__id_pr__5165187F] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[purchaseXProduct] CHECK CONSTRAINT [FK__purchaseX__id_pr__5165187F]
GO
ALTER TABLE [dbo].[purchaseXProduct]  WITH CHECK ADD  CONSTRAINT [FK__purchaseX__subto__5070F446] FOREIGN KEY([id_purchase])
REFERENCES [dbo].[purchase] ([id_purchase])
GO
ALTER TABLE [dbo].[purchaseXProduct] CHECK CONSTRAINT [FK__purchaseX__subto__5070F446]
GO
USE [master]
GO
ALTER DATABASE [WhiskyUS] SET  READ_WRITE 
GO
