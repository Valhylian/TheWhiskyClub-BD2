USE [master]
GO
/****** Object:  Database [WhiskyGermany]    Script Date: 6/15/2022 7:27:32 PM ******/
CREATE DATABASE [WhiskyGermany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WhiskyGermany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WhiskyGermany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WhiskyGermany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WhiskyGermany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WhiskyGermany] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WhiskyGermany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WhiskyGermany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WhiskyGermany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WhiskyGermany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WhiskyGermany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WhiskyGermany] SET ARITHABORT OFF 
GO
ALTER DATABASE [WhiskyGermany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WhiskyGermany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WhiskyGermany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WhiskyGermany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WhiskyGermany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WhiskyGermany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WhiskyGermany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WhiskyGermany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WhiskyGermany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WhiskyGermany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WhiskyGermany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WhiskyGermany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WhiskyGermany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WhiskyGermany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WhiskyGermany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WhiskyGermany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WhiskyGermany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WhiskyGermany] SET RECOVERY FULL 
GO
ALTER DATABASE [WhiskyGermany] SET  MULTI_USER 
GO
ALTER DATABASE [WhiskyGermany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WhiskyGermany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WhiskyGermany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WhiskyGermany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WhiskyGermany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WhiskyGermany] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WhiskyGermany', N'ON'
GO
ALTER DATABASE [WhiskyGermany] SET QUERY_STORE = OFF
GO
USE [WhiskyGermany]
GO
/****** Object:  Table [dbo].[CatalogContainer]    Script Date: 6/15/2022 7:27:32 PM ******/
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
/****** Object:  Table [dbo].[CatalogProductType]    Script Date: 6/15/2022 7:27:32 PM ******/
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
/****** Object:  Table [dbo].[CatalogStatusPurchase]    Script Date: 6/15/2022 7:27:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogStatusPurchase](
	[id_StatusPurchase] [int] IDENTITY(1,1) NOT NULL,
	[name_StatusPurchase] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_StatusPurchase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogSubscription]    Script Date: 6/15/2022 7:27:32 PM ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 6/15/2022 7:27:32 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/15/2022 7:27:32 PM ******/
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
	[image] [varbinary](max) NULL,
 CONSTRAINT [PK__Product__BA39E84F19C31262] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductxStore]    Script Date: 6/15/2022 7:27:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductxStore](
	[id_productxStore] [int] NOT NULL,
	[aumount] [int] NOT NULL,
	[id_store] [int] NOT NULL,
	[id_product] [int] NOT NULL,
 CONSTRAINT [PK__Productx__DB71F30AF6222D76] PRIMARY KEY CLUSTERED 
(
	[id_productxStore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 6/15/2022 7:27:32 PM ******/
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
 CONSTRAINT [PK__purchase__84A464F90EB249B2] PRIMARY KEY CLUSTERED 
(
	[id_purchase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchaseXProduct]    Script Date: 6/15/2022 7:27:32 PM ******/
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
 CONSTRAINT [PK__purchase__393FB097A4AF720A] PRIMARY KEY CLUSTERED 
(
	[id_purchaseXProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/15/2022 7:27:32 PM ******/
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
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (1, N'Andres Valverde', N'andres190601@gmail.com', 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (2, N'Luis Fallas', N'lfpf2220@gmail.com', 2)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (3, N'Shirley Rodriguez', N'shirod777@gmail.com', 3)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (4, N'Juanita Perez', N'juanita@gmail.com', 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [email_client], [subscription_client]) VALUES (5, N'PRUEBA', N'PRUEBA@GMAIL.COM', 1)
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
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (1, 20, 1, 1)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (2, 20, 1, 2)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (3, 20, 1, 3)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (4, 20, 1, 4)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (5, 20, 1, 5)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (6, 15, 1, 6)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (7, 14, 2, 1)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (8, 14, 2, 2)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (9, 15, 2, 3)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (10, 15, 2, 4)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (11, 15, 2, 5)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (12, 15, 2, 6)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (13, 15, 3, 1)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (14, 13, 3, 2)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (15, 5, 3, 3)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (16, 15, 3, 4)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (17, 15, 3, 5)
GO
INSERT [dbo].[ProductxStore] ([id_productxStore], [aumount], [id_store], [id_product]) VALUES (18, 15, 3, 6)
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (1, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (2, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (3, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (4, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (5, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (6, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (7, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (8, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 0.0000, 6798.5198, 6798.5198, NULL, NULL, 1, 360623.39638885122, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (9, 2, CAST(N'2022-06-15' AS Date), 0xE6100000010CDE463DF3A0D44240CAE0A9ACBE5458C0, 0.0000, 157843.5455, 157843.5455, NULL, NULL, 1, 7891177.2737296019, N'Dollar')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (10, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 129.7200, 7204.1415, 7333.8615, NULL, NULL, 1, 382199.01274198125, N'Euro')
GO
INSERT [dbo].[purchase] ([id_purchase], [client_purchase], [date_purchase], [location_client], [subtotal], [shipping], [total], [id_PurchasingManager], [id_Dealer], [status_purchase], [distance], [moneyType]) VALUES (11, 1, CAST(N'2022-06-15' AS Date), 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 35.7200, 193.7335, 229.4535, NULL, NULL, 1, 382.19901274198122, N'Euro')
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (12, 8, 6, 1, 141.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (13, 9, 1, 1, 45.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (14, 9, 2, 1, 38.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (15, 10, 3, 10, 94.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (16, 10, 2, 1, 35.7200)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (17, 11, 2, 1, 35.7200)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [location_store]) VALUES (1, N'WhiskyClub Germany 1', 0xE6100000010C6167836B7B11484032FA46193D262740)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [location_store]) VALUES (2, N'WhiskyClub Germany 2', 0xE6100000010C0E65378F6E144940D472074DED672140)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [location_store]) VALUES (3, N'WhiskyClub Germany 3', 0xE6100000010C744CD9079A794940BA93B5375FCA1B40)
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__special__412EB0B6]  DEFAULT ((0)) FOR [special_product]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__subtot__151B244E]  DEFAULT ((0)) FOR [subtotal]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__shippi__160F4887]  DEFAULT ((0)) FOR [shipping]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__total__17036CC0]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__status__17F790F9]  DEFAULT ((1)) FOR [status_purchase]
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
ALTER TABLE [dbo].[ProductxStore]  WITH CHECK ADD  CONSTRAINT [FK__ProductxS__id_pr__282DF8C2] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[ProductxStore] CHECK CONSTRAINT [FK__ProductxS__id_pr__282DF8C2]
GO
ALTER TABLE [dbo].[ProductxStore]  WITH CHECK ADD  CONSTRAINT [FK__ProductxS__id_st__2739D489] FOREIGN KEY([id_store])
REFERENCES [dbo].[Store] ([id_store])
GO
ALTER TABLE [dbo].[ProductxStore] CHECK CONSTRAINT [FK__ProductxS__id_st__2739D489]
GO
ALTER TABLE [dbo].[purchase]  WITH CHECK ADD  CONSTRAINT [FK__purchase__client__18EBB532] FOREIGN KEY([client_purchase])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[purchase] CHECK CONSTRAINT [FK__purchase__client__18EBB532]
GO
ALTER TABLE [dbo].[purchaseXProduct]  WITH CHECK ADD  CONSTRAINT [FK__purchaseX__id_pr__1CBC4616] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[purchaseXProduct] CHECK CONSTRAINT [FK__purchaseX__id_pr__1CBC4616]
GO
ALTER TABLE [dbo].[purchaseXProduct]  WITH CHECK ADD  CONSTRAINT [FK__purchaseX__subto__1BC821DD] FOREIGN KEY([id_purchase])
REFERENCES [dbo].[purchase] ([id_purchase])
GO
ALTER TABLE [dbo].[purchaseXProduct] CHECK CONSTRAINT [FK__purchaseX__subto__1BC821DD]
GO
USE [master]
GO
ALTER DATABASE [WhiskyGermany] SET  READ_WRITE 
GO
