USE [master]
GO
/****** Object:  Database [WhiskyClubCentral]    Script Date: 6/15/2022 7:26:06 PM ******/
CREATE DATABASE [WhiskyClubCentral]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WhiskyClubCentral', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WhiskyClubCentral.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WhiskyClubCentral_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WhiskyClubCentral_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WhiskyClubCentral] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WhiskyClubCentral].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WhiskyClubCentral] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET ARITHABORT OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WhiskyClubCentral] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WhiskyClubCentral] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WhiskyClubCentral] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WhiskyClubCentral] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET RECOVERY FULL 
GO
ALTER DATABASE [WhiskyClubCentral] SET  MULTI_USER 
GO
ALTER DATABASE [WhiskyClubCentral] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WhiskyClubCentral] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WhiskyClubCentral] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WhiskyClubCentral] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WhiskyClubCentral] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WhiskyClubCentral] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WhiskyClubCentral', N'ON'
GO
ALTER DATABASE [WhiskyClubCentral] SET QUERY_STORE = OFF
GO
USE [WhiskyClubCentral]
GO
/****** Object:  Table [dbo].[CatalogContainer]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogContainer](
	[id_Container] [int] IDENTITY(1,1) NOT NULL,
	[description_Container] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Container] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogCountry]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogCountry](
	[id_Country] [int] IDENTITY(1,1) NOT NULL,
	[name_Country] [varchar](64) NOT NULL,
	[money_type] [varchar](64) NOT NULL,
	[dollar_equivalent] [float] NOT NULL,
 CONSTRAINT [PK__CatalogC__DCFD765CD0D14B46] PRIMARY KEY CLUSTERED 
(
	[id_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogDistillery]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogDistillery](
	[id_Distillery] [int] IDENTITY(1,1) NOT NULL,
	[name_Distillery] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Distillery] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogProductType]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogProductType](
	[id_ProductType] [int] IDENTITY(1,1) NOT NULL,
	[name_ProductType] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ProductType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogStatusPurchase]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogStatusPurchase](
	[id_StatusPurchase] [int] NOT NULL,
	[name_StatusPurchase] [varchar](64) NOT NULL,
 CONSTRAINT [PK__CatalogS__4259C51E2967F82B] PRIMARY KEY CLUSTERED 
(
	[id_StatusPurchase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogSubscription]    Script Date: 6/15/2022 7:26:06 PM ******/
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
 CONSTRAINT [PK__CatalogS__F9DF0F6D89C35136] PRIMARY KEY CLUSTERED 
(
	[id_subscription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogUserType]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogUserType](
	[id_UserType] [int] IDENTITY(1,1) NOT NULL,
	[name_UserType] [varchar](64) NOT NULL,
	[description_UserType] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_UserType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id_client] [int] NOT NULL,
	[name_client] [varchar](50) NOT NULL,
	[country_client] [int] NOT NULL,
	[email_client] [varchar](64) NOT NULL,
	[subscription_client] [int] NOT NULL,
	[user_credentials] [int] NOT NULL,
	[location_client] [geography] NULL,
	[location_clientText]  AS ([location_client].[STAsText]()),
	[status_client] [bit] NOT NULL,
 CONSTRAINT [PK__Client__6EC2B6C02E812F81] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imagesProduct]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imagesProduct](
	[id_image] [int] IDENTITY(1,1) NOT NULL,
	[product_image] [int] NOT NULL,
	[image_] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationXClient]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationXClient](
	[id_locationXClient] [int] IDENTITY(1,1) NOT NULL,
	[id_client] [varchar](50) NOT NULL,
	[location_client] [geography] NOT NULL,
	[location_clientText]  AS ([location_client].[STAsText]()),
PRIMARY KEY CLUSTERED 
(
	[id_locationXClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[name_product] [varchar](64) NOT NULL,
	[type_product] [int] NOT NULL,
	[aged_product] [int] NOT NULL,
	[distillery_product] [int] NOT NULL,
	[container_product] [int] NOT NULL,
	[price_product] [money] NOT NULL,
	[special_product] [bit] NOT NULL,
	[status] [bit] NULL,
	[amount] [int] NOT NULL,
	[image] [varbinary](max) NULL,
 CONSTRAINT [PK__Product__BA39E84F14DE09CA] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[id_purchase] [int] IDENTITY(1,1) NOT NULL,
	[client_purchase] [int] NOT NULL,
	[date_purchase] [date] NOT NULL,
	[location_client] [geography] NOT NULL,
	[subtotal] [money] NOT NULL,
	[shipping] [money] NOT NULL,
	[total] [money] NOT NULL,
	[id_PurchasingManager] [int] NULL,
	[id_Dealer] [int] NULL,
	[status_purchase] [int] NOT NULL,
	[distance] [float] NOT NULL,
	[moneyType] [varchar](128) NOT NULL,
 CONSTRAINT [PK__purchase__84A464F9AB33EC9D] PRIMARY KEY CLUSTERED 
(
	[id_purchase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchaseXProduct]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchaseXProduct](
	[id_purchaseXProduct] [int] IDENTITY(1,1) NOT NULL,
	[id_purchase] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[subtotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_purchaseXProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[id_store] [int] NOT NULL,
	[name_store] [varchar](64) NOT NULL,
	[country_store] [int] NOT NULL,
	[location_store] [geography] NOT NULL,
	[location_storeText]  AS ([location_store].[STAsText]()),
 CONSTRAINT [PK__Store__3A39C33947B6B43A] PRIMARY KEY CLUSTERED 
(
	[id_store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/15/2022 7:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[password_user] [varbinary](max) NOT NULL,
	[type_user] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CatalogContainer] ON 
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
SET IDENTITY_INSERT [dbo].[CatalogContainer] OFF
GO
SET IDENTITY_INSERT [dbo].[CatalogCountry] ON 
GO
INSERT [dbo].[CatalogCountry] ([id_Country], [name_Country], [money_type], [dollar_equivalent]) VALUES (1, N'Germany', N'Euro', 0.94)
GO
INSERT [dbo].[CatalogCountry] ([id_Country], [name_Country], [money_type], [dollar_equivalent]) VALUES (2, N'United States', N'Dollar', 1)
GO
INSERT [dbo].[CatalogCountry] ([id_Country], [name_Country], [money_type], [dollar_equivalent]) VALUES (3, N'Japan', N'Yen', 134.36)
GO
SET IDENTITY_INSERT [dbo].[CatalogCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[CatalogDistillery] ON 
GO
INSERT [dbo].[CatalogDistillery] ([id_Distillery], [name_Distillery]) VALUES (1, N'Glenmorangie Distillery')
GO
INSERT [dbo].[CatalogDistillery] ([id_Distillery], [name_Distillery]) VALUES (2, N'Balblair Distillery')
GO
INSERT [dbo].[CatalogDistillery] ([id_Distillery], [name_Distillery]) VALUES (3, N'Ardbeg Distillery')
GO
INSERT [dbo].[CatalogDistillery] ([id_Distillery], [name_Distillery]) VALUES (4, N'Aberlour Destillery')
GO
SET IDENTITY_INSERT [dbo].[CatalogDistillery] OFF
GO
SET IDENTITY_INSERT [dbo].[CatalogProductType] ON 
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
SET IDENTITY_INSERT [dbo].[CatalogProductType] OFF
GO
INSERT [dbo].[CatalogStatusPurchase] ([id_StatusPurchase], [name_StatusPurchase]) VALUES (1, N'Pending')
GO
INSERT [dbo].[CatalogStatusPurchase] ([id_StatusPurchase], [name_StatusPurchase]) VALUES (2, N'Processed')
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (1, N'Default', N'Default', 0, 0.0000, 0)
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (2, N'Tier Short Glass', N'When a new whiskey is entered into the store, you receive an email with its description. You have a 5% discount on purchases', 5, 30.0000, 0)
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (3, N'Tier Gleincairn', N'Exclusive whiskeys. It has a 10% discount on purchases and a 20% discount on the cost of shipping. Notifications of new products to the mail.', 10, 70.0000, 20)
GO
INSERT [dbo].[CatalogSubscription] ([id_subscription], [name_subscription], [description_subscription], [discount_subscription], [price_subscription], [discount_shipping]) VALUES (4, N'Tier Master Distiller', N'Free shipping cost. You have a 30% discount on purchases and every 10 whiskeys you buy, you get a free whiskey. Access to the catalog of special whiskeys. Mail notification of new products.', 30, 100.0000, 100)
GO
SET IDENTITY_INSERT [dbo].[CatalogUserType] ON 
GO
INSERT [dbo].[CatalogUserType] ([id_UserType], [name_UserType], [description_UserType]) VALUES (1, N'Client User', N'Normal user for shopping')
GO
INSERT [dbo].[CatalogUserType] ([id_UserType], [name_UserType], [description_UserType]) VALUES (2, N'Especial User', N'Especial user with editing permissions')
GO
SET IDENTITY_INSERT [dbo].[CatalogUserType] OFF
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (1, N'Andres Valverde', 1, N'andres190601@gmail.com', 1, 1, 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (2, N'Luis Fallas', 2, N'lfpf2220@gmail.com', 2, 2, 0xE6100000010CDE463DF3A0D44240CAE0A9ACBE5458C0, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (3, N'Shirley Rodriguez', 3, N'shirod777@gmail.com', 3, 3, 0xE6100000010C9E800A9933D74140F076FF9870786140, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (4, N'Juanita Perez', 2, N'juanita@gmail.com', 1, 4, 0xE6100000010C119569C8342A424062C5C9E74CE95DC0, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (5, N'Valeria', 2, N'valeria@gmail.com', 4, 6, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (1, N'Glenfiddich', 1, 15, 1, 3, 45.0000, 0, 1, 50, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (2, N'Glenlivet Founder’s Reserve', 1, 20, 2, 3, 38.0000, 0, 1, 50, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (3, N'Monkey Shoulder', 2, 3, 3, 1, 10.0000, 0, 1, 50, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (4, N'Lambay Small Batch Blend', 3, 10, 4, 2, 25.0000, 0, 1, 50, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (5, N'Johnnie Walker Black Label', 4, 12, 4, 4, 55.0000, 0, 1, 50, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (6, N'Makers Mark at Drizly', 5, 20, 1, 5, 150.0000, 1, 1, 50, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (7, N'George Dickel Barrel Select', 6, 12, 1, 6, 70.0000, 1, 1, 50, NULL)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount], [image]) VALUES (8, N'PruebaImageb', 1, 1, 1, 1, 1.0000, 1, 1, 1, 0xFFD8FFE000104A46494600010100000100010000FFDB0084000906071207061213121016131515151217171718171A181A151715181816181616181B212C211B1A251B171821312D26292B2F2E2E17203338372D37282D2E2B010A0A0A0E0D0E1B10101B2D2520252F35352D2D2F2F2E2E2E2D2D2F2D2D2D2D2D2D2D2D2D2D352D2D372D2D352D2B2D2B2D2D2B2D2D2D2D2D2D2D2D2D2D2D2D2DFFC000110800E100E103012200021101031101FFC4001C0001000300030101000000000000000000000506070304080201FFC40048100002010300050805070A030900000000000102030411050612213107132241516171817291A1B1C12332344252B2D1141524536282A2C2D2F07383922533435493A3B3E1F1FFC400190101000301010000000000000000000000000102030405FFC40026110100020202010303050000000000000000010203110431211341611222F014327191B1FFDA000C03010002110311003F00DC40000000000000000000000001F15AAC685272949462B7B6DA492ED6DF02B577CA1E8BB4ACE12BEA6E4B8A82954C7FA1302D00ACD9EBFE8CBDADB30BC86D764A3387DF8A2C74AAC6B52528C94A2D6534F29A7D69AE280FB00000000000000000000000000000000000000000000000000014BE5666E3AB1149FCEAF4D3F28CE7EF8A7E479DEACF6B48CBFBECFC0F4472AD6F2B9D03452C6EB8836DBC24B9BAA9C9BEA4B39660173A39DBD672E2F2E527B514A29BDD1D86F6DCBC97663AC8998856625C9A3A58D25159E3F8C7F037BE48E7B5AA18EA8D7B94BCE6E4FDB26FCCC72C344D2B8BBA6E9545D15996FDA9CA5D70514D2C678349E71C718CEC5C935BBB6D5AA9197FCCD778C34D2E8F14F7A6445A24889895D40059600000000000000000000000000000000000000000000000052B95EB4FCAB5325D2945C2AD069C5E1F4A6A935E18A8CF38C7476DDF4A0937B2DFF793D2BCA94B1AA525DB5682F55452F81836827FEDBABD1DBE92E8F6FCE2B69D46D7C38E32658ACFE789947DA68AC69284649C53CB4F38E1D8D1E83E47EDBF27D45A4F69C9CEA5C49E5E71F2B2863D515E7931FD21BF4C5BBD8D8CA9616EE1B3159DC971C761B1F24B2DAD46A2BECD4BA5FF007EA3F88A5BEA8DA73E28C5966B1F9E22571001666000000000000000000000000000000000000000000000000A5F2A5F29A2ADA9E71CE5D4579469569BFBA65367A079ABC94A8B72929E7127F3B65E5631849E7C0D33957B856EAC5BE0AB557E7CCCD2F7B299A0AAE6AB7DADBF59C5CCC96A478232CE3B45A3B87DDA6AC7E5D79CE5C4A509B7294541ACC76B7BCE535D9DB8C17AE4A63CCEAFD6A69E79BBBB98EFE3BDA9FF0037B485770A1562C95E4B2A73946FDAE0EF26D7FD3A69FB8CF839AD937B44E6B65BCDECBC800F452000000000000000000000000000000000000000000000044EB0EB0D0D5FB4DBAB2DEFE6C23BE53F05D9DEFDFB80ADF2B14217763674E52C4A574B1E11A555C9F86E5EB451A8BA5A1EEB156B46316F73724B3DC75B59AF2B6B8692556AA718C1354E119E3613E3BD3CB93C2CBEEF03AB4B5769CE4B9C86D3FDA6E5EF387936C768F3B677985AE8DFD9DECF0AEA9E12FB71E3EB2C3C904E9BD0370A135271BCB8DA69E78ECB8BF0D9C7B4CE2E754EDEAD3C7311F26D7C4ECEACD4A9A8FA4253B78B9539E39CA6E59534B861F1525BF0F7F1DFC4CB896C54F1132AD26B0DE0113ABBAC343586D36E94B7AC6DC25BA707D925F1594C963D36C0000000000000000000000000000000000000000000088D6BD371D5ED0752BB8ED38E1463F6A52788AF0F82326B597E79AEEE6EE6EA4E5BF1F562BA925D85E796159D4D7FE2D2F899D68A97E84BC0C334FB2B298ABA4A145ECD3A51F1672D9CB9FA9997B371079CD725B46D4DA7B8F2B916998676DA614634DA6A29F733B4ECA85E52DF4F0FBB71D26F28EF58ACDB49F0C35DFB9A7BFF00BF89CB8267EA52236A7E97DBD5AD251AF6D51C64BD4D75C64BAD335DD57D331D3FA0E9574B67693DA8FD9945E24BC32B7773463FAED2DDEB342E491635321E9D4F79EDF16D3AD35A2E6003ADA0000000000000000000000000000000000000000299CAE2CEA5D4EEA94BEF199E8A7FA1A34FE56239D48ADDD2A4FF008D19568CA9B34765EE9259C3EB4F84A3DABBD1CD9FB8565D8E35497D11D1ADBE585C56ECB4F39F3F67E30F0E95526F427CAD7C6F8EEDCDF07DDE1F89E66545626675094BC8A6D283714F7F6BF6AC25D9C59CF60B9BA18CB6BBDE782C7B8E3B9CA92524934B1BB7707D8725ABE8339693F7E95C93313A53F5D19A4F2531C6A5D2EF954FBC669AE2F6A6D75E33E0BB5F6234EE4B563526877BA9F7E4BE07B3C54E35B00076B4000000000000000000000000000000000000000055395159D47B8FF2FEFC4C8ACA70A9651854598ADF16B74A9BED83F87066C1CA62CEA3DD7A30FBF1314B67F228E5E44EB4AD9DC8CA56B53A5D38754D2EAFDA458346C9548A69E510B672D927747DA465BE0F665D6BA9F91E666E98D92929656F7D58392DA12AF1C297371EB97178FD95F1614630865EF67DD19660CE3C7FBD5EE772A7EB9D68C693A74E3B305BDF5CA72FB53975BF62350E4C16351ADBFCDFFCB3327D6E7D266B9C9B4767526D7D19BF5D49B3DDE274DB1ACA003B1A00000000000000000000000000000000000000002BFAFF006D3BCD4FB9A74E2E539462A315C5BDB8EE323B4D54BD54966D9AF19D35FCC6E1A5F7E8E9F97BD15DBDACE868D725C766293EC726A29F96726396916ECD6D40A1AB7734F8D34BF7E3F0648DBD8CE83E924BCCEFD5D331B3AB5D54A8EA28CE6E1B3B2FA11A34A6D2E197994BCDF52E10DA5F4D7E9492DB84152BB949A50728CA8CE941349BC34B6E4F1D798F7A39EDC5A5BBDAB3484E51B39D5E097ACEDD1D155765F47F897E245D9E995F9C24A2E4E1B13824947A556355D27B39EC7192DF8E19DFB895D1FA65CEC22B339D5FD1F69A8C70B6A1466FBB665B4F0DE37CB1BB719C7031C4EE36AFA7554B597556F6E33B16CE5E1287F51A7EA45B4ACF552DA9CE2E328C1A927C53DA7B8FB8D655ED14D67128292CF1C496567BF0C91D1FBAD23E7EF675E1A453C42F1588760006E900000000000000000000000000000000000000007574A2CD84FCBDE8AF568C6A5A6CCB389471ECF3DE58B48EFB29797BD10518ECD24BB1246774C2B95F44D254EAE2A4D2A919C658C70942117F57F613F16FAB71137BA0E9D79CBE527D255E0F1B3FF1E509CF1D1E29D358F3E259EB5CC64B29FD9EA7F5B72EA21E7791A9BF38DCE5C1F05D7C0A6F53A4E9FB63A1292ABB5B738EF9B58C74653A92AD26B317C652971EA64D58683A74BE6D5A9BF9BDFD1DFCD2A718A7D1E0B9B5E727DD8E8DADEAA345CD624A3BDA5C71BB2D77ACADC582D6EE1349A794F86E7BFAFB06FCE8D3B16D415B5A469A6E4A31514E58CB496167092E04A597D1979FBD9D19BC23BD63F4487822F4ED12E7001A200000000000000000000000000000000000000001D7BFFA14FD17EC2BF34DD158CFAF1DA586FF00E8353D09FB99011FF748A5D308AB8A9B9F4DFF00AA1F810CA4F1C5F17D70ED2C372B2FA885AB454258DDD7D4BAF7994C7DD12B474E4B5A0EAD2E6D3924DADADF0CE376E5DEF1EFEECD8ED6788AE93C6EFAD0E1858C6EEC2BF6DA3B9F5855670F470BCF8168B78A8F04BFF84563E345BF97324F9B79F7E7E049597D0E1E8C7DC47D4F98CEFD8FD0A9FA10F7235A2B2E7001A200000000000000000000000000000000000000001D5D293E6F465678CE29D478EDC4598D5B72B50A914A56328E7ECD64D6FF004A11C1B369259D1D57FC39FDD6797ECEC2956A3BE3ED7F899E4B456372ADA67D97EA9CA5509BDF6B5BCA549FF3A3A53D7EB79C962DEE3D54FC7F584058681A3564FA5521E8CF1F024A9EA75BD4DFF94D65FBF0FE9EE472DB934AF7FE2BEA6BB4D5B728D6F45ACDB5CBF08D3F1FD6771256FCA7D094FA3695BF7A5497F3B2AD3D51B6A6B7DDD67FBF0FE93928EAE5AB9EEA952A3D96F2EA671EA457F578FE7FA3D54DDF72B8A9CDC61A3E551EFDCEB2EAF4612C9AE587D069FA10F723CCFA5ECA9DBD65B29ACEEF9CF876713D356AB16B0F463EE3AF15A2D1B84D2667B72800D57000000000000000000000000000000000000000055794BD37F98F54EAC92CCAA7C92EEDB8CB2FD49F9E0C5F553462BBB3DA9C5ACB78DED6EF266C3CAB683ABA7754A51A11DBA94E71A8A0B8CD4534E31EFC4B3DF83CE94EE67695A49CEAD171786B128B8BEC970DFE252FAF75657FBFD0D3B78E6965F737C48CB4D34E857D9A94E517E1FF00A2AB534C556FE95571E94A3EE91F96FA49AA99755C9F7ED4BDB930B62A5BD94B42F70D32AE2E230A74DB6F8EEE1FC258E14E14ED5ED3DF8EEF81953D2BF289AADB0D75A525ED246CB5A6A41B52B96D7795AE1C75F656B110F8D69AD1A77EB119E33C5E706FDC9CE9BFCFBAAB4A6D74A1F2527F69C12C4BCD34FC7279CAF6EE7A56F52873955BF9A927D27D8B765F923D0BC96E84ABA075469C2B4766A4E52A928F5C36924A2FBF1159EF67453E1AD56E001A2C000000000000000000000000000000000000000011DA5740DA6995FA45AD2AD8E0E74E326BC1B595E4488029373C9568AAD9C5BCE9E7F575AAC579476B65792232A722F60E798D6B88F7668CBEFD26FDA69208D4234CE21C8D587D6AD7135D9F231F6C2927ED24ADF92AD154A69CADA555AEBA95AACB77638ED61AF145D40D41A847E8AD056BA1E2D5BDB52A39E3CDD38C5BF16965F992001290000000000000000000000000000000000000000000000000000000000000000000000000000000000007FFD9)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[purchase] ON 
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
SET IDENTITY_INSERT [dbo].[purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[purchaseXProduct] ON 
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (1, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (2, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (3, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (4, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (5, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (6, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (7, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (8, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (9, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (10, 1, 4, 2, 47.0000)
GO
INSERT [dbo].[purchaseXProduct] ([id_purchaseXProduct], [id_purchase], [id_product], [amount], [subtotal]) VALUES (11, 5, 6, 1, 141.0000)
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
SET IDENTITY_INSERT [dbo].[purchaseXProduct] OFF
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (1, N'WhiskyClub Germany 1', 1, 0xE6100000010C6167836B7B11484032FA46193D262740)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (2, N'WhiskyClub Germany 2', 1, 0xE6100000010C0E65378F6E144940D472074DED672140)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (3, N'WhiskyClub Germany 3', 1, 0xE6100000010C744CD9079A794940BA93B5375FCA1B40)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (4, N'WhiskyClub Japan 1', 3, 0xE6100000010CA7E4B3FDF2D54140AE60160B70786140)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (5, N'WhiskyClub Japan 2', 3, 0xE6100000010CCB323EE063DC414026BBDF2999766140)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (6, N'WhiskyClub Japan 3', 3, 0xE6100000010C642141698FD54140A129D96D73786140)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (7, N'WhiskyClub USA 1', 2, 0xE6100000010CAD85B4731EE542403E50ADFB029A5EC0)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (8, N'WhiskyClub USA 2', 2, 0xE6100000010CE2FED4AF626140409F1A3DA1EA485DC0)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (9, N'WhiskyClub USA 3', 2, 0xE6100000010C4D0D51BB2D5D4440AB612D8E897F52C0)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([id_user], [nickname], [password_user], [type_user]) VALUES (1, N'andres123', 0x020074348C3E5C37880AC09AD34E299FC86770BC144B253FEC25FB581E29D86BB895CC2EC75D208E29446CFD60CBFCE881ED0A44B8238C12138B3B7D449149C990ACDA164636, 1)
GO
INSERT [dbo].[Users] ([id_user], [nickname], [password_user], [type_user]) VALUES (2, N'luis123', 0x0200996FCA024109660DA60ECC793BFEA744C2A7D1C38BCC2BBB763EB865306ED4AFCA81B2D95770D0D22F243E32E9FDD0A9C23EA6E106C8F32B019C55EDD6ACB9516B3FB878, 1)
GO
INSERT [dbo].[Users] ([id_user], [nickname], [password_user], [type_user]) VALUES (3, N'shirley123', 0x020018FFA35F3114C45422B5240A221128DD261EF8DDAC8A3513C72D3A31453F8B1484ADAAC5A8117F11274A5C0CA77A66CB6EB13A1FC37F83077E033B5DF237EEB42A1F45B0, 1)
GO
INSERT [dbo].[Users] ([id_user], [nickname], [password_user], [type_user]) VALUES (4, N'juanita123', 0x02004FF404A9F684F33C7CDED5A426A39B973A8663CD621AF20A7059414AE42207C2E15F90038DDAE1DC19B1A94624D8C722BCDF3CBFDB794096AF87CBE3361B517F51AA2326, 1)
GO
INSERT [dbo].[Users] ([id_user], [nickname], [password_user], [type_user]) VALUES (5, N'PRUEBA', 0x0200C5205BFA986DC9C9646B2F68EF8E5340B31FF007C984EEF13981320292191B2651F9828C9F89406EC736CA93B6C3B21E7D7D99707FF3AC24C3BA266F5BF71D3853597FEB, 1)
GO
INSERT [dbo].[Users] ([id_user], [nickname], [password_user], [type_user]) VALUES (6, N'valeUser', 0x02001D4C00CF80562FD5010F4E2E0DEF1F9FC7AB26CF469D1C9332CF4827DE88DBC0777897D97F51D777DA185988A7A4497F41152D24F9125F7F59EDD9005160666FFDC91B18, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_subscription_client]  DEFAULT ((1)) FOR [subscription_client]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_status_client]  DEFAULT ((1)) FOR [status_client]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__special__59063A47]  DEFAULT ((0)) FOR [special_product]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_estado]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__subtot__3C34F16F]  DEFAULT ((0)) FOR [subtotal]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__shippi__3D2915A8]  DEFAULT ((0)) FOR [shipping]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__total__3E1D39E1]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[purchase] ADD  CONSTRAINT [DF__purchase__status__3F115E1A]  DEFAULT ((1)) FOR [status_purchase]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__country___4CA06362] FOREIGN KEY([country_client])
REFERENCES [dbo].[CatalogCountry] ([id_Country])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__country___4CA06362]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__subscrip__4D94879B] FOREIGN KEY([subscription_client])
REFERENCES [dbo].[CatalogSubscription] ([id_subscription])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__subscrip__4D94879B]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__user_cre__71D1E811] FOREIGN KEY([user_credentials])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__user_cre__71D1E811]
GO
ALTER TABLE [dbo].[imagesProduct]  WITH CHECK ADD  CONSTRAINT [FK__imagesPro__image__46E78A0C] FOREIGN KEY([id_image])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[imagesProduct] CHECK CONSTRAINT [FK__imagesPro__image__46E78A0C]
GO
ALTER TABLE [dbo].[purchase]  WITH CHECK ADD  CONSTRAINT [FK__purchase__client__40058253] FOREIGN KEY([client_purchase])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[purchase] CHECK CONSTRAINT [FK__purchase__client__40058253]
GO
ALTER TABLE [dbo].[purchase]  WITH CHECK ADD  CONSTRAINT [FK__purchase__status__40F9A68C] FOREIGN KEY([status_purchase])
REFERENCES [dbo].[CatalogStatusPurchase] ([id_StatusPurchase])
GO
ALTER TABLE [dbo].[purchase] CHECK CONSTRAINT [FK__purchase__status__40F9A68C]
GO
ALTER TABLE [dbo].[purchaseXProduct]  WITH CHECK ADD  CONSTRAINT [FK__purchaseX__id_pr__44CA3770] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[purchaseXProduct] CHECK CONSTRAINT [FK__purchaseX__id_pr__44CA3770]
GO
ALTER TABLE [dbo].[purchaseXProduct]  WITH CHECK ADD  CONSTRAINT [FK__purchaseX__subto__43D61337] FOREIGN KEY([id_purchase])
REFERENCES [dbo].[purchase] ([id_purchase])
GO
ALTER TABLE [dbo].[purchaseXProduct] CHECK CONSTRAINT [FK__purchaseX__subto__43D61337]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK__Store__country_s__49C3F6B7] FOREIGN KEY([country_store])
REFERENCES [dbo].[CatalogCountry] ([id_Country])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK__Store__country_s__49C3F6B7]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([type_user])
REFERENCES [dbo].[CatalogUserType] ([id_UserType])
GO
/****** Object:  StoredProcedure [dbo].[ChangeAccountSubscription]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChangeAccountSubscription] 
@username nvarchar(64),
@newPlan int
AS
DECLARE @IdClient int,
@country_id INT

EXEC @IdClient = FindUserByNickname @nickname = @username

SET @country_id = (SELECT country_client FROM [WhiskyClubCentral].[dbo].[Client] WHERE id_client = @IdClient)

UPDATE [WhiskyClubCentral].[dbo].[Client] SET subscription_client = @newPlan WHERE id_client = @IdClient

IF (@country_id = 1) --Client is from Germany
        BEGIN
            UPDATE [WhiskyGermany].[dbo].[Client] SET subscription_client = @newPlan WHERE id_client = @IdClient
        END
        ELSE
        IF (@country_id = 2) --Client is from the United States
        BEGIN
            UPDATE [WhiskyUS].[dbo].[Client] SET subscription_client = @newPlan WHERE id_client = @IdClient
        END
        IF (@country_id = 3) --Client is from Japan
        BEGIN
            UPDATE [WhiskyJapan].[dbo].[Client] SET subscription_client = @newPlan WHERE id_client = @IdClient
        END



GO
/****** Object:  StoredProcedure [dbo].[consultProducts]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultProducts]
@id_client INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_subs INT,
	@id_product_cursor INT, --for products cicle
	@id_store_cursor INT, --for storexproducts cicle
	@client_location geography,
	@client_country INT,
	@cliente_money_equi FLOAT,
	@product_id INT,
	@product_name VARCHAR(128),
	@product_type VARCHAR(128),
	@product_aged INT,
	@destilley VARCHAR(128),
	@product_container VARCHAR(128),
	@product_price MONEY,
	@product_amount MONEY,
	@product_distance FLOAT,
	@product_status BIT,
	@product_special VARCHAR(128),
	--
	@nearbyStore VARCHAR(128),
	@nearbyCountry VARCHAR(128),
	@money_type VARCHAR(128),
	--Stores (validate distance)
	@store_id INT, 
	@store_name VARCHAR(128),
	@store_distance FLOAT,
	@store_location GEOGRAPHY,
	@store_country VARCHAR(128)


DECLARE @result TABLE
	(product_code INT, 
	 product_name VARCHAR(128),
	 product_type VARCHAR(128),
	 product_aged INT,
	 destilley VARCHAR(128),
	 product_container VARCHAR(128),
	 product_price MONEY,
	 amount INT,
	 nearbyStore VARCHAR(128),
	 nearbyCountry VARCHAR(128),
	 nearbyDistance FLOAT,
	 money_type VARCHAR(128),
	 statusProduct VARCHAR(128)
	)

DECLARE @distanceAux TABLE
	(store_name VARCHAR(128),
	 store_country VARCHAR(128),
	 store_distance FLOAT
	)

	SET @error = 0

	--values not null
	IF (@id_client IS NULL)
		BEGIN
			SET @error = 1 --null value
			RETURN @error
		END

	--client exists?
	IF (SELECT COUNT(*) FROM Client WHERE [id_client] = @id_client AND [status_client] = 1) = 0
		BEGIN
			SET @error = 1 --client not exist
			RETURN @error
		END

	--GET LOCATION:
	SELECT @client_location = [location_client] FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1
	--GET COUNTRY
	SELECT @client_country = [country_client] FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1
	--GET MONEY EQUIVALENCE 
	SELECT @cliente_money_equi = [dollar_equivalent] FROM [dbo].[CatalogCountry] WHERE [id_Country] = @client_country
	--GET MONEY TYPE
	SELECT @money_type = [money_type] FROM [dbo].[CatalogCountry] WHERE [id_Country] = @client_country
	--GET SUB
	SELECT @id_subs =  [subscription_client]  FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1



	--CICLE
	SELECT @id_product_cursor = MIN([id_product]) FROM [dbo].[Product]
	WHILE  @id_product_cursor IS NOT NULL
	
	BEGIN
	DELETE FROM @distanceAux
		--GET NEARBY STORE
		--1- GERMANY
		SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore]
		WHILE  @id_store_cursor IS NOT NULL
		BEGIN
			IF (SELECT COUNT(*) FROM [WhiskyGermany].[dbo].[ProductxStore] 
				WHERE  [id_store] = @id_store_cursor AND [id_product] = @id_product_cursor AND [aumount] > 0)>  0
				BEGIN
					SET @store_id = @id_store_cursor
					SELECT @store_name = [name_store], @store_location = [location_store], @store_country = [name_Country]
							FROM [dbo].[Store] 
							INNER JOIN [dbo].[CatalogCountry] ON [country_store] = [id_Country]
							WHERE [id_store] = @store_id 
					SET @store_distance = @store_location.STDistance(@client_location)
				END

			INSERT INTO @distanceAux 
				VALUES(@store_name,@store_country,@store_distance)
			SET @id_store_cursor = (SELECT MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore] 
								WHERE [id_product] > @id_store_cursor) --NEXT STORE
			
			PRINT @id_store_cursor;
		END--END WHILE STORE
		--GET NEARBY STORE
		--2- EEUU
		--3- JAPAN
		--SELECT NEARBY STORE
		SELECT @nearbyStore = store_name, @nearbyCountry = store_country, @store_distance = store_distance 
				FROM @distanceAux WHERE store_distance = (SELECT MIN(store_distance) FROM @distanceAux )

		--
		IF (SELECT [status] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) = 1
			AND
			((SELECT [special_product] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) = 0 OR @id_subs = 3 OR @id_subs = 4)
			AND 
			(SELECT [amount] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) > 1
			BEGIN
			--UPDATE VALUES
				SELECT 
					 @product_id = [id_product]
					,@product_name = [name_product]
					,@product_type = [dbo].[CatalogProductType].name_ProductType
					,@product_aged = [aged_product]
					,@destilley = [dbo].[CatalogDistillery].name_Distillery
					,@product_container = [dbo].[CatalogContainer].description_Container
					,@product_price = ([price_product]*@cliente_money_equi)
					,@product_amount = [amount]
					,@product_status = [special_product]
				FROM [dbo].[Product] 
				INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				WHERE [status] = 1 AND ([special_product] = 0 OR @id_subs = 3 OR @id_subs = 4) AND [id_product] = @id_product_cursor AND [amount] > 0 

				IF (@product_status = 1)
					SET @product_special = 'SPECIAL'
				ELSE
					SET @product_special = 'NORMAL'
				--insert to result
				INSERT INTO @result VALUES
							(@id_product_cursor,--product_code
							 @product_name,		--product_name
							 @product_type,		--product_type 
							 @product_aged,		--product_aged
							 @destilley,		--destilley 
							 @product_container, --product_container 
							 @product_price,	--product_price 
							 @product_amount,	--amount 
							 @nearbyStore,		--nearbyStore
							 @nearbyCountry,	--nearbyCountry 
							 @store_distance/1000,
							 @money_type,
							 @product_special)

			END
		
		SET @id_product_cursor = (SELECT MIN([id_product]) FROM [dbo].[Product] WHERE [id_product] > @id_product_cursor) --NEXT PRODUCT
	END --end while

	SELECT * FROM @result


print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[consultProductsParameters]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultProductsParameters]
@id_client INT,
@id_productType_ INT,
@product_name_ VARCHAR(128),
@lowPrice_ INT,
@higPrice_ INT,
@distance_ INT,
@order_ INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_product_cursor INT, --for products cicle
	@id_store_cursor INT, --for storexproducts cicle
	@client_location geography,
	@client_country INT,
	@cliente_money_equi FLOAT,
	@product_id INT,
	@product_name VARCHAR(128),
	@product_type VARCHAR(128),
	@product_aged INT,
	@destilley VARCHAR(128),
	@product_container VARCHAR(128),
	@product_price MONEY,
	@product_amount MONEY,
	@id_subs INT,
	@product_status BIT,
	--
	@nearbyStore VARCHAR(128),
	@nearbyCountry VARCHAR(128),
	@money_type VARCHAR(128),
	--Stores (validate distance)
	@store_id INT, 
	@store_name VARCHAR(128),
	@store_distance FLOAT,
	@store_location GEOGRAPHY,
	@store_country VARCHAR(128),
	@product_special  VARCHAR(128)

DECLARE @result TABLE
	(product_code INT, 
	 product_name VARCHAR(128),
	 product_type VARCHAR(128),
	 product_aged INT,
	 destilley VARCHAR(128),
	 product_container VARCHAR(128),
	 product_price MONEY,
	 amount INT,
	 nearbyStore VARCHAR(128),
	 nearbyCountry VARCHAR(128),
	 nearbyLocation FLOAT,
	 money_type VARCHAR(128),
	 statusProduct  VARCHAR(128)
	)

DECLARE @distanceAux TABLE
	(store_name VARCHAR(128),
	 store_country VARCHAR(128),
	 store_distance FLOAT
	)

	SET @error = 0

	
	--values not null
	IF (@id_client IS NULL)
		BEGIN
			SET @error = 1 --null value
			RETURN @error
		END

	--client exists?
	IF (SELECT COUNT(*) FROM Client WHERE [id_client] = @id_client AND [status_client] = 1) = 0
		BEGIN
			SET @error = 1 --client not exist
			RETURN @error
		END

	--GET LOCATION:
	SELECT @client_location = [location_client] FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1
	--GET COUNTRY
	SELECT @client_country = [country_client] FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1
	--GET MONEY EQUIVALENCE 
	SELECT @cliente_money_equi = [dollar_equivalent] FROM [dbo].[CatalogCountry] WHERE [id_Country] = @client_country
	--GET MONEY TYPE
	SELECT @money_type = [money_type] FROM [dbo].[CatalogCountry] WHERE [id_Country] = @client_country
	--GET SUB
	SELECT @id_subs =  [subscription_client]  FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1


	--CICLE
	SELECT @id_product_cursor = MIN([id_product]) FROM [dbo].[Product]
	WHILE  @id_product_cursor IS NOT NULL
	BEGIN
	DELETE FROM @distanceAux
		IF (((SELECT [name_product] FROM [dbo].[Product] WHERE [id_product]=@id_product_cursor) LIKE '%'+@product_name_+'%') OR (@product_name_ = '')) --BY NAME
			AND (((SELECT [type_product] FROM [dbo].[Product] WHERE [id_product]=@id_product_cursor) = @id_productType_) OR (@id_productType_ = 0)) --BY TYPE
			AND (((SELECT [price_product] FROM [dbo].[Product] WHERE [id_product]=@id_product_cursor) >= @lowPrice_) OR (@lowPrice_ = '')) --low price
			AND (((SELECT [price_product] FROM [dbo].[Product] WHERE [id_product]=@id_product_cursor) <= @higPrice_) OR (@higPrice_ = '')) --high price
			AND (((SELECT [price_product] FROM [dbo].[Product] WHERE [id_product]=@id_product_cursor) BETWEEN @lowPrice_ AND @higPrice_ ) OR (@lowPrice_ = '' OR @higPrice_ = '')) --high price
			AND (SELECT [status] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) = 1
			AND((SELECT [special_product] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) = 0 OR @id_subs = 3 OR @id_subs = 4)
			AND (SELECT [amount] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) > 1
			--validar aqui
			
			
			BEGIN
				--GET NEARBY STORE
		--1- GERMANY
		SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore]
		WHILE  @id_store_cursor IS NOT NULL
		BEGIN
			IF (SELECT COUNT(*) FROM [WhiskyGermany].[dbo].[ProductxStore] 
				WHERE  [id_store] = @id_store_cursor AND [id_product] = @id_product_cursor AND [aumount] > 0)>  0
				BEGIN
					SET @store_id = @id_store_cursor
					SELECT @store_name = [name_store], @store_location = [location_store], @store_country = [name_Country]
							FROM [dbo].[Store] 
							INNER JOIN [dbo].[CatalogCountry] ON [country_store] = [id_Country]
							WHERE [id_store] = @store_id 
					SET @store_distance = @store_location.STDistance(@client_location)
				END

			INSERT INTO @distanceAux 
				VALUES(@store_name,@store_country,@store_distance)
			SET @id_store_cursor = (SELECT MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore] 
								WHERE [id_product] > @id_store_cursor) --NEXT STORE
			
			PRINT @id_store_cursor;
		END--END WHILE STORE
		--GET NEARBY STORE
		--2- EEUU
		--3- JAPAN
		--SELECT NEARBY STORE
		SELECT @nearbyStore = store_name, @nearbyCountry = store_country, @store_distance = store_distance 
				FROM @distanceAux WHERE store_distance = (SELECT MIN(store_distance) FROM @distanceAux )

		IF ((@store_distance/1000) < @distance_) OR (@distance_ = '')
			BEGIN
				--UPDATE VALUES
				SELECT 
					 @product_id = [id_product]
					,@product_name = [name_product]
					,@product_type = [dbo].[CatalogProductType].name_ProductType
					,@product_aged = [aged_product]
					,@destilley = [dbo].[CatalogDistillery].name_Distillery
					,@product_container = [dbo].[CatalogContainer].description_Container
					,@product_price = ([price_product]*@cliente_money_equi)
					,@product_amount = [amount]
					,@product_status = [special_product]
				FROM [dbo].[Product] 
				INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				WHERE [id_product] = @id_product_cursor
		
				IF (@product_status = 1)
					SET @product_special = 'SPECIAL'
				ELSE
					SET @product_special = 'NORMAL'

				--insert to result
				INSERT INTO @result VALUES
							(@id_product_cursor,--product_code
							 @product_name,		--product_name
							 @product_type,		--product_type 
							 @product_aged,		--product_aged
							 @destilley,		--destilley 
							 @product_container, --product_container 
							 @product_price,	--product_price 
							 @product_amount,	--amount 
							 @nearbyStore,		--nearbyStore
							 @nearbyCountry,	--nearbyCountry 
							 (@store_distance/1000),
							 @money_type,
							 @product_special)
					END

			END --END IF
		
		

		SET @id_product_cursor = (SELECT MIN([id_product]) FROM [dbo].[Product] WHERE [id_product] > @id_product_cursor) --NEXT PRODUCT
	END --end while

	IF (@order_ = 2)
		BEGIN
			--price priority
			IF (@lowPrice_ != '' or @higPrice_ != '')
				BEGIN
					SELECT * FROM @result ORDER BY product_price DESC
					RETURN @error;
				END

			--distance
			IF (@distance_ != '')
				BEGIN
					SELECT * FROM @result ORDER BY nearbyLocation DESC
					RETURN @error;
				END
			--type
			IF (@id_productType_ != 0)
				BEGIN
					SELECT * FROM @result ORDER BY product_type DESC
					RETURN @error;
				END
			--nombre
			IF (@product_name_ != '')
				BEGIN
					SELECT * FROM @result ORDER BY product_name DESC
					RETURN @error;
				END
		END

	IF (@order_ = 1)
		BEGIN
			--price priority
			IF (@lowPrice_ != '' or @higPrice_ != '')
				BEGIN
					SELECT * FROM @result ORDER BY product_price ASC
					RETURN @error;
				END

			--distance
			IF (@distance_ != '')
				BEGIN
					SELECT * FROM @result ORDER BY nearbyLocation ASC
					RETURN @error;
				END
			--type
			IF (@id_productType_ != 0)
				BEGIN
					SELECT * FROM @result ORDER BY product_type ASC
					RETURN @error;
				END
			--nombre
			IF (@product_name_ != '')
				BEGIN
					SELECT * FROM @result ORDER BY product_name ASC
					RETURN @error;
				END
		END
		SELECT * FROM @result

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[consultProductsXStore]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultProductsXStore]
@id_client INT,
@id_store_ INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_product_cursor INT, --for products cicle
	@id_store_cursor INT, --for storexproducts cicle
	@client_location geography,
	@client_country INT,
	@cliente_money_equi FLOAT,
	@product_id INT,
	@product_name VARCHAR(128),
	@product_type VARCHAR(128),
	@product_aged INT,
	@destilley VARCHAR(128),
	@product_container VARCHAR(128),
	@product_price MONEY,
	@product_amount MONEY,
	@id_subs INT,
	@product_status BIT,
	--
	@nearbyStore VARCHAR(128),
	@nearbyCountry VARCHAR(128),
	@money_type VARCHAR(128),
	--Stores (validate distance)
	@store_id INT, 
	@store_name VARCHAR(128),
	@store_distance FLOAT,
	@store_location GEOGRAPHY,
	@store_country VARCHAR(128),
	@product_special  VARCHAR(128)

DECLARE @result TABLE
	(product_code INT, 
	 product_name VARCHAR(128),
	 product_type VARCHAR(128),
	 product_aged INT,
	 destilley VARCHAR(128),
	 product_container VARCHAR(128),
	 product_price MONEY,
	 amount INT,
	 idStore INT,
	 money_type VARCHAR(128),
	 statusProduct  VARCHAR(128),
	 nearbyStore  VARCHAR(128)
	)
	SET @error = 0

	
	--values not null
	IF (@id_client IS NULL)
		BEGIN
			SET @error = 1 --null value
			RETURN @error
		END

	--client exists?
	IF (SELECT COUNT(*) FROM Client WHERE [id_client] = @id_client AND [status_client] = 1) = 0
		BEGIN
			SET @error = 1 --client not exist
			RETURN @error
		END

	--GET LOCATION:
	SELECT @client_location = [location_client] FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1
	--GET COUNTRY
	SELECT @client_country = [country_client] FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1
	--GET MONEY EQUIVALENCE 
	SELECT @cliente_money_equi = [dollar_equivalent] FROM [dbo].[CatalogCountry] WHERE [id_Country] = @client_country
	--GET MONEY TYPE
	SELECT @money_type = [money_type] FROM [dbo].[CatalogCountry] WHERE [id_Country] = @client_country
	--GET SUB
	SELECT @id_subs =  [subscription_client]  FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1
	SELECT @nearbyStore =  [name_store] from [dbo].[Store] where [id_store] = @id_store_

	--GERMANY
	IF (@id_store_ = 1 OR @id_store_ = 2 OR @id_store_ = 3)
		BEGIN
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore]
			WHILE  @id_store_cursor IS NOT NULL
			BEGIN
				IF(SELECT [id_store] FROM [WhiskyGermany].[dbo].[ProductxStore] 
					WHERE [id_productxStore]=@id_store_cursor)=@id_store_
					BEGIN
					--SELECT PRODUC ID
					SELECT @product_id = [id_product] FROM  [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor
					--STATUS TRUE?
					--AMOUNTA > 0?
					IF (SELECT [aumount] FROM [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor) > 0
						AND (SELECT [status] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 1
						AND ((SELECT [special_product] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 0 OR @id_subs=3 or @id_subs=4)
					
					SELECT 
					   @product_amount=[aumount]
					  ,@product_id = [WhiskyGermany].[dbo].[ProductxStore].[id_product]
					  ,@product_name=[name_product]
					  ,@product_type=[dbo].[CatalogProductType].name_ProductType
					  ,@product_aged = [aged_product]
					  ,@destilley = [dbo].[CatalogDistillery].name_Distillery
					  ,@product_container = [dbo].[CatalogContainer].description_Container
					  ,@product_price = ([price_product]*@cliente_money_equi)
					  ,@product_special = [special_product]
					  ,@product_amount = [WhiskyGermany].[dbo].[ProductxStore].[aumount]

				  FROM [WhiskyGermany].[dbo].[ProductxStore]
				  INNER JOIN [WhiskyClubCentral].[dbo].[Product] ON [WhiskyClubCentral].[dbo].[Product].[id_product] = [WhiskyGermany].[dbo].[ProductxStore].id_product
				  INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				  INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				  INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				  WHERE [aumount] > 0 AND [id_store] = @id_store_ AND [status] = 1 AND [id_store] = @id_store_ AND [id_productxStore]=@id_store_cursor
				  AND ([WhiskyClubCentral].[dbo].[Product].[special_product] = 0 or @id_subs=3 or @id_subs=4)

				  

				   --insert to result
				INSERT INTO @result VALUES
							(@product_id,--product_code
							@product_name,		--product_name
							@product_type,		--product_type 
							@product_aged,		--product_aged
							@destilley,		--destilley 
							@product_container, --product_container 
							@product_price,	--product_price 
							@product_amount,	--amount 
							@id_store_,		--nearbyStore
							@money_type,
							@product_special,
							@nearbyStore)
					END
				
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_productxStore] > @id_store_cursor
			END--END WHILE STORE
			SELECT * FROM @result
			RETURN 0;

		END--END GERMANY 

		--JAPAN
	IF (@id_store_ = 4 OR @id_store_ = 5 OR @id_store_ = 6)
		BEGIN
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyJapan].[dbo].[ProductxStore]
			WHILE  @id_store_cursor IS NOT NULL
			BEGIN
				IF(SELECT [id_store] FROM [WhiskyJapan].[dbo].[ProductxStore] 
					WHERE [id_productxStore]=@id_store_cursor)=@id_store_
					BEGIN
					--SELECT PRODUC ID
					SELECT @product_id = [id_product] FROM  [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor
					--STATUS TRUE?
					--AMOUNTA > 0?
					IF (SELECT [aumount] FROM [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor) > 0
						AND (SELECT [status] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 1
						AND ((SELECT [special_product] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 0 OR @id_subs=3 or @id_subs=4)
					
					SELECT 
					   @product_amount=[aumount]
					  ,@product_id = [WhiskyJapan].[dbo].[ProductxStore].[id_product]
					  ,@product_name=[name_product]
					  ,@product_type=[dbo].[CatalogProductType].name_ProductType
					  ,@product_aged = [aged_product]
					  ,@destilley = [dbo].[CatalogDistillery].name_Distillery
					  ,@product_container = [dbo].[CatalogContainer].description_Container
					  ,@product_price = ([price_product]*@cliente_money_equi)
					  ,@product_special = [special_product]
					  ,@product_amount = [WhiskyJapan].[dbo].[ProductxStore].[aumount]
				  FROM [WhiskyJapan].[dbo].[ProductxStore]
				  INNER JOIN [WhiskyClubCentral].[dbo].[Product] ON [WhiskyClubCentral].[dbo].[Product].[id_product] = [WhiskyJapan].[dbo].[ProductxStore].id_product
				  INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				  INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				  INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				  WHERE [aumount] > 0 AND [id_store] = @id_store_ AND [status] = 1 AND [id_store] = @id_store_ AND [id_productxStore]=@id_store_cursor
				  AND ([WhiskyClubCentral].[dbo].[Product].[special_product] = 0 or @id_subs=3 or @id_subs=4)

				   --insert to result
				INSERT INTO @result VALUES
							(@product_id,--product_code
							@product_name,		--product_name
							@product_type,		--product_type 
							@product_aged,		--product_aged
							@destilley,		--destilley 
							@product_container, --product_container 
							@product_price,	--product_price 
							@product_amount,	--amount 
							@id_store_,		--nearbyStore
							@money_type,
							@product_special,
							@nearbyStore)
					END
				
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_productxStore] > @id_store_cursor
			END--END WHILE STORE
			SELECT * FROM @result
			RETURN 0;

		END--END JAPAN

			--EU
	IF (@id_store_ = 4 OR @id_store_ = 5 OR @id_store_ = 6)
		BEGIN
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyUS].[dbo].[ProductxStore]
			WHILE  @id_store_cursor IS NOT NULL
			BEGIN
				IF(SELECT [id_store] FROM [WhiskyUS].[dbo].[ProductxStore] 
					WHERE [id_productxStore]=@id_store_cursor)=@id_store_
					BEGIN
					--SELECT PRODUC ID
					SELECT @product_id = [id_product] FROM  [WhiskyUS].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor
					--STATUS TRUE?
					--AMOUNTA > 0?
					IF (SELECT [aumount] FROM [WhiskyUS].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor) > 0
						AND (SELECT [status] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 1
						AND ((SELECT [special_product] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 0 OR @id_subs=3 or @id_subs=4)
					
					SELECT 
					   @product_amount=[aumount]
					  ,@product_id = [WhiskyUS].[dbo].[ProductxStore].[id_product]
					  ,@product_name=[name_product]
					  ,@product_type=[dbo].[CatalogProductType].name_ProductType
					  ,@product_aged = [aged_product]
					  ,@destilley = [dbo].[CatalogDistillery].name_Distillery
					  ,@product_container = [dbo].[CatalogContainer].description_Container
					  ,@product_price = ([price_product]*@cliente_money_equi)
					  ,@product_special = [special_product]
					  ,@product_amount = [WhiskyUS].[dbo].[ProductxStore].[aumount]
				  FROM [WhiskyUS].[dbo].[ProductxStore]
				  INNER JOIN [WhiskyClubCentral].[dbo].[Product] ON [WhiskyClubCentral].[dbo].[Product].[id_product] = [WhiskyUS].[dbo].[ProductxStore].id_product
				  INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				  INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				  INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				  WHERE [aumount] > 0 AND [id_store] = @id_store_ AND [status] = 1 AND [id_store] = @id_store_ AND [id_productxStore]=@id_store_cursor
				  AND ([WhiskyClubCentral].[dbo].[Product].[special_product] = 0 or @id_subs=3 or @id_subs=4)

				   --insert to result
				INSERT INTO @result VALUES
							(@product_id,--product_code
							@product_name,		--product_name
							@product_type,		--product_type 
							@product_aged,		--product_aged
							@destilley,		--destilley 
							@product_container, --product_container 
							@product_price,	--product_price 
							@product_amount,	--amount 
							@id_store_,		--nearbyStore
							@money_type,
							@product_special,
							@nearbyStore)
					END
				
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyUS].[dbo].[ProductxStore] WHERE [id_productxStore] > @id_store_cursor
			END--END WHILE STORE
			SELECT * FROM @result
			RETURN 0;

		END--END EU


print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[CreateNewUser]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateNewUser] 
@nickname nvarchar(50), 
@password nvarchar(50), 
@full_name varchar(50), 
@country_id int, 
@email varchar(64), 
@id_subscription int
AS
DECLARE
@lastInsertedUser INT,
@lastInsertedClient INT

	IF (@nickname IS NULL or @password IS NULL OR @full_name IS NULL OR @country_id IS NULL OR @email IS NULL OR @id_subscription IS NULL)
	BEGIN
		RETURN 1 --'One or more paramters are null'
	END

	IF (SELECT COUNT(*) FROM [WhiskyClubCentral].[dbo].[Users] WHERE nickname = @nickname) > 0
	BEGIN
		RETURN 2 --'Nickname is already in use'
	END

	IF (SELECT COUNT(*) FROM [WhiskyClubCentral].[dbo].[Client] WHERE email_client = @email) > 0
	BEGIN
		RETURN 3 --'Email is already in use'
	END


	INSERT INTO [WhiskyClubCentral].[dbo].[Users] (nickname,password_user,type_user) VALUES (@nickname,PWDENCRYPT(@password),1)

	SET @lastInsertedUser = (SELECT MAX(id_user) FROM [dbo].[Users])
	SET @lastInsertedClient = (SELECT MAX([id_client]) FROM [WhiskyClubCentral].[dbo].[Client]) + 1

	INSERT INTO [WhiskyClubCentral].[dbo].[Client]
			   ([id_client]
			   ,[name_client]
			   ,[country_client]
			   ,[email_client]
			   ,[subscription_client]
			   ,[user_credentials])
		 VALUES
			   (@lastInsertedClient
			   ,@full_name
			   ,@country_id
			   ,@email
			   ,@id_subscription
			   ,@lastInsertedUser)


	IF (@country_id = 1) --Client is from Germany
	BEGIN
		INSERT INTO [WhiskyGermany].[dbo].[Client] (id_client,name_client,email_client,subscription_client)
		VALUES (@lastInsertedUser,@full_name,@email,@id_subscription)
	END

PRINT 0
RETURN 0

EXEC CreateNewUser 
@nickname = 'PRUEBA', 
@password = 'PRUEBA', 
@full_name = 'PRUEBA', 
@country_id = 1, 
@email = 'PRUEBA@GMAIL.COM', 
@id_subscription =1
GO
/****** Object:  StoredProcedure [dbo].[FindUserByNickname]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FindUserByNickname] 
@nickname nvarchar(64)
AS
DECLARE @result int,
@IdCredentials int
SET @IdCredentials = (SELECT id_user FROM [WhiskyClubCentral].[dbo].[Users] WHERE nickname = @nickname)
SET @result = (SELECT id_client FROM [WhiskyClubCentral].[dbo].[Client] WHERE user_credentials = @IdCredentials)
RETURN @result
GO
/****** Object:  StoredProcedure [dbo].[generatePurchase]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[generatePurchase]
@jsonProducts_ VARCHAR (MAX),
@idStore_ INT,
@idClient_ INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	--CYCLE
	@cursorProducts INT,
	--PRODUCT INFO
	@idProduct_ INT,
	@amountProduct_ INT,
	@priceProduct_ MONEY,
	@subtotal_ MONEY,
	--DATA OF CLIENTE
	@location_client GEOGRAPHY,
	@sub_client INT,
	@sub_discount INT,
	@shipping_discount FLOAT,
	@distance_client FLOAT,
	@country_client INT,
	@money_client VARCHAR(128),
	@moneyEquivalence_cliente FLOAT,
	--DATA OF STORE
	@location_store GEOGRAPHY,
	--DATA OF SHIPPING
	@shippingPrice MONEY,
	--DATA OF PURCHASE
	@lastPurchase_id INT


DECLARE @products TABLE
	(idCursor INT IDENTITY(1,1) PRIMARY KEY, 
	 idProduct INT,
	 quantity INT
	)
DECLARE @results TABLE
	(idCursor INT  PRIMARY KEY, 
	 purchase_id INT,
	 client_name VARCHAR(128),
	 store_name VARCHAR(128),
	 product_name VARCHAR(128),
	 product_priceInd MONEY,
	 product_amount INT,
	 product_subtotal MONEY,
	 purchase_total MONEY,
	 purchase_shipping MONEY,
	 client_sub VARCHAR(128),
	 product_success VARCHAR(128),
	 moneyType VARCHAR(128)
	)

DECLARE @errorTable TABLE
	(idCursor INT IDENTITY(1,1) PRIMARY KEY, 
	 id_Product INT,
	 amount_product INT
	)
	SET @error = 0

	--NULL DATA?
	IF (@jsonProducts_ IS NULL OR @idClient_ IS NULL OR @idStore_ IS NULL) 
		BEGIN
			SET @error = 1
			RETURN @error
		END

	--JSON FORMAT?
	IF ISJSON(@jsonProducts_) < 1
		BEGIN
			 SET @error = 5
			RETURN @error
		END

	--TABLE WITH PRODUCTS
	INSERT INTO @products SELECT * FROM OPENJSON(@jsonProducts_)
							WITH (idProduct INT,
								 quantity INT)

	--DATA OF CLIENT
	SELECT @location_client = [location_client],
			@sub_client = [subscription_client],
			@money_client = [money_type],
		    @moneyEquivalence_cliente = [dollar_equivalent]
			FROM [dbo].[Client] 
			INNER JOIN [dbo].[CatalogCountry] ON [country_client] = [id_Country]
			WHERE [id_client] = @idClient_


	SELECT @sub_client = [subscription_client] FROM [dbo].[Client] WHERE [id_client] = @idClient_
	--DATA OF STORE
	SELECT @location_store = [location_store] FROM [dbo].[Store] WHERE [id_store] = @idStore_
	--DATA OF PRICE
	SELECT @sub_discount = [discount_subscription], 
		   @shipping_discount = ([discount_shipping]/100) FROM [dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client

	--SHIPPING PRICE 
	SET @distance_client = @location_store.STDistance (@location_client) 
	IF (@distance_client > 1000)
		BEGIN
			SET @distance_client = @distance_client/1000 --KM
		END
	ELSE
		BEGIN
			SET @distance_client = 0
		END
	--PRICE
	SET @shippingPrice = 15 + (@distance_client/2) 
	--DISCOUNT
	SET @shippingPrice = @shippingPrice - (@shippingPrice * @shipping_discount)
	--CONVER TO MONEYTYPE
	SET @shippingPrice = @shippingPrice * @moneyEquivalence_cliente
	--RECALCULATE
	SET @distance_client = @location_store.STDistance (@location_client) /1000

	--GENERATE PURCHAESE
	INSERT INTO [dbo].[purchase]
			   ([client_purchase]
			   ,[date_purchase]
			   ,[location_client]
			   ,[subtotal]
			   ,[shipping]
			   ,[total]
			   ,[distance]
			   ,[moneyType])
		 VALUES
			   (@idClient_
			   ,GETDATE()
			   ,@location_client
			   ,0
			   ,@shippingPrice
			   ,@shippingPrice
			   ,@distance_client
			   ,@money_client)

	--LAST INSERTED ID
	SELECT @lastPurchase_id = MAX([id_purchase]) FROM [dbo].[purchase]

	--GERMANY------------------------------------------------------------------------------------------------
	IF (@idStore_ = 1 OR @idStore_ = 2 OR @idStore_ = 3)
		BEGIN
			--GENERATE PURCHASE LOCAL GERMNANY
			INSERT INTO [WhiskyGermany].[dbo].[purchase] SELECT * FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase] = @lastPurchase_id

			--INIT CYCLE FOR PRODUCTS
			SELECT @cursorProducts = MIN(idCursor) FROM @products
			WHILE @cursorProducts IS NOT NULL
			BEGIN
				--INFO
				SELECT @amountProduct_ = quantity,
					   @idProduct_ = idProduct 
					   FROM @products WHERE @cursorProducts = idCursor

				--VERIFY QUANTITY
				IF (SELECT [aumount] FROM [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_product] = @idProduct_ AND [id_store] = @idStore_) >= @amountProduct_
					BEGIN
						--PRICE OF PRODUCT
						SELECT @priceProduct_ = [price_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_
						--SUBTOTAL
						SET @subtotal_ = (@priceProduct_ * @amountProduct_) * @moneyEquivalence_cliente

						--GENERATE LINE OF FACT
						INSERT INTO [WhiskyClubCentral].[dbo].[purchaseXProduct]
								   ([id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   (@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)
								   
						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @priceProduct_,
								 @amountProduct_,
								 @subtotal_,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'COMPRADO',
								 @money_client
								)

						--INSERT LOCAL
						INSERT INTO [WhiskyGermany].[dbo].[purchaseXProduct]
								   ([id_purchaseXProduct]
								   ,[id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   ((SELECT MAX([id_purchaseXProduct]) FROM [WhiskyClubCentral].[dbo].[purchaseXProduct])
								   ,@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)

						--DECREMENT AMOUNT X STORE
						UPDATE [WhiskyGermany].[dbo].[ProductxStore]
						   SET [aumount] = [aumount] - @amountProduct_
						 WHERE [id_store] = @idStore_ AND [id_product] = @idProduct_

						--DECREMENT AMOUNT GENERAL
						UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount] = [amount] - @amountProduct_
						 WHERE [id_product] = @idProduct_


						 --ACT SUBTOTAL AND TOTAL
						UPDATE [WhiskyClubCentral].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
						--CENTRAL
						UPDATE [WhiskyGermany].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id



					END
				ELSE --NO EXIST AMOUNT OF PRODUCT
					BEGIN
						--INSERT INTO ERRORS TABLE
						INSERT INTO @errorTable VALUES (@idProduct_, @amountProduct_)

						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 (SELECT [price_product]*@moneyEquivalence_cliente FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @amountProduct_,
								 0,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'ANULADO',
								 @money_client
								)
					END


				SELECT @cursorProducts = MIN(idCursor) FROM @products WHERE idCursor > @cursorProducts --INDEX ++
			END--END WHILE

			--RETORNAR ERRORES
			SELECT * FROM @results
			RETURN 0;

		END--END GERMANY

	--JAPAN--------------------------------------------------------------------------------------------
	IF (@idStore_ = 4 OR @idStore_ = 5 OR @idStore_ = 6)
		BEGIN
			--GENERATE PURCHASE LOCAL GERMNANY
			INSERT INTO [WhiskyJapan].[dbo].[purchase] SELECT * FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase] = @lastPurchase_id

			--INIT CYCLE FOR PRODUCTS
			SELECT @cursorProducts = MIN(idCursor) FROM @products
			WHILE @cursorProducts IS NOT NULL
			BEGIN
				--INFO
				SELECT @amountProduct_ = quantity,
					   @idProduct_ = idProduct 
					   FROM @products WHERE @cursorProducts = idCursor

				--VERIFY QUANTITY
				IF (SELECT [aumount] FROM [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_product] = @idProduct_ AND [id_store] = @idStore_) >= @amountProduct_
					BEGIN
						--PRICE OF PRODUCT
						SELECT @priceProduct_ = [price_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_
						--SUBTOTAL
						SET @subtotal_ = (@priceProduct_ * @amountProduct_) * @moneyEquivalence_cliente

						--GENERATE LINE OF FACT
						INSERT INTO [WhiskyClubCentral].[dbo].[purchaseXProduct]
								   ([id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   (@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)


						--INSERT LOCAL
						INSERT INTO [WhiskyJapan].[dbo].[purchaseXProduct]
								   ([id_purchaseXProduct]
								   ,[id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   ((SELECT MAX([id_purchaseXProduct]) FROM [WhiskyClubCentral].[dbo].[purchaseXProduct])
								   ,@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)
						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @priceProduct_,
								 @amountProduct_,
								 @subtotal_,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'COMPRADO',
								 @money_client
								)

						--DECREMENT AMOUNT
						UPDATE [WhiskyJapan].[dbo].[ProductxStore]
						   SET [aumount] = [aumount] - @amountProduct_
						 WHERE [id_store] = @idStore_ AND [id_product] = @idProduct_

						UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount] = [amount] - @amountProduct_
						 WHERE [id_product] = @idProduct_

						 --ACT SUBTOTAL AND TOTAL
						UPDATE [WhiskyClubCentral].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
						--CENTRAL
						UPDATE [WhiskyJapan].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
					END
				ELSE --NO EXIST AMOUNT OF PRODUCT
					BEGIN
						--INSERT INTO ERRORS TABLE
						INSERT INTO @errorTable VALUES (@idProduct_, @amountProduct_)

						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 (SELECT [price_product]*@moneyEquivalence_cliente FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @amountProduct_,
								 0,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'ANULADO',
								 @money_client
								)
					END


				SELECT @cursorProducts = MIN(idCursor) FROM @products WHERE idCursor > @cursorProducts--INDEX ++
			END--END WHILE

			--RETORNAR ERRORES
			SELECT * FROM @results
			RETURN 0;

		END--END JAPAN

	--US--------------------------------------------------------------------------------------------
	IF (@idStore_ = 7 OR @idStore_ = 8 OR @idStore_ = 9)
		BEGIN
			--GENERATE PURCHASE LOCAL GERMNANY
			INSERT INTO [WhiskyUS].[dbo].[purchase] SELECT * FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase] = @lastPurchase_id

			--INIT CYCLE FOR PRODUCTS
			SELECT @cursorProducts = MIN(idCursor) FROM @products
			WHILE @cursorProducts IS NOT NULL
			BEGIN
				--INFO
				SELECT @amountProduct_ = quantity,
					   @idProduct_ = idProduct 
					   FROM @products WHERE @cursorProducts = idCursor

				--VERIFY QUANTITY
				IF (SELECT [aumount] FROM [WhiskyUS].[dbo].[ProductxStore] WHERE [id_product] = @idProduct_ AND [id_store] = @idStore_) >= @amountProduct_
					BEGIN
						--PRICE OF PRODUCT
						SELECT @priceProduct_ = [price_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_
						--SUBTOTAL
						SET @subtotal_ = (@priceProduct_ * @amountProduct_) * @moneyEquivalence_cliente

						--GENERATE LINE OF FACT
						INSERT INTO [WhiskyClubCentral].[dbo].[purchaseXProduct]
								   ([id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   (@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)


						--INSERT LOCAL
						INSERT INTO [WhiskyUS].[dbo].[purchaseXProduct]
								   ([id_purchaseXProduct]
								   ,[id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   ((SELECT MAX([id_purchaseXProduct]) FROM [WhiskyClubCentral].[dbo].[purchaseXProduct])
								   ,@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)
						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @priceProduct_,
								 @amountProduct_,
								 @subtotal_,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'COMPRADO',
								 @money_client
								)

						--DECREMENT AMOUNT
						UPDATE [WhiskyUS].[dbo].[ProductxStore]
						   SET [aumount] = [aumount] - @amountProduct_
						 WHERE [id_store] = @idStore_ AND [id_product] = @idProduct_

						 --DECREMENT AMOUNT GENERAL
						UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount] = [amount] - @amountProduct_
						 WHERE [id_product] = @idProduct_

						 --ACT SUBTOTAL AND TOTAL
						UPDATE [WhiskyClubCentral].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
						--CENTRAL
						UPDATE [WhiskyUS].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
					END
				ELSE --NO EXIST AMOUNT OF PRODUCT
					BEGIN
						--INSERT INTO ERRORS TABLE
						INSERT INTO @errorTable VALUES (@idProduct_, @amountProduct_)

						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 (SELECT [price_product]*@moneyEquivalence_cliente FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @amountProduct_,
								 0,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'ANULADO',
								 @money_client
								)
					END


				SELECT @cursorProducts = MIN(idCursor) FROM @products WHERE idCursor > @cursorProducts
			END--END WHILE

			--RETORNAR ERRORES
			SELECT * FROM @results
			RETURN 0;

		END--END US

RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[returnProductTypes]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[returnProductTypes]
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT

	SELECT [id_ProductType]
		  ,[name_ProductType]
	  FROM [dbo].[CatalogProductType]

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[returnStores]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[returnStores]
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT

	SELECT [id_store]
		  ,[name_store]
		  ,[country_store]
		  ,[location_store]
		  ,[location_storeText]
	  FROM [dbo].[Store]

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[verifyLogin]    Script Date: 6/15/2022 7:26:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[verifyLogin]
@nickname nvarchar(50), 
@password nvarchar(50)
AS
DECLARE @email varchar(64),
@idClient int,
@idUserType int
    IF @nickname IS NULL or @password IS NULL
    BEGIN
        PRINT 1
        RETURN 1 --'One or more paramters are null'
    END
    ELSE
    IF (SELECT COUNT(*) FROM [WhiskyClubCentral].[dbo].[Users] WHERE nickname = @nickname) <= 0
    BEGIN
        PRINT 2
        RETURN 2 --'No account registered with the sent nickname'
    END
    ELSE
    IF (SELECT pwdcompare(@password, (select [password_user] FROM [WhiskyClubCentral].[dbo].[Users] where nickname=@nickname))) <= 0
    BEGIN
        PRINT 3
        RETURN 3 --'The given password and nickname combination does not exist'
    END
    ELSE
    BEGIN
        EXEC @IdClient = FindUserByNickname @nickname = @nickname
        SET @email = (SELECT email_client FROM [WhiskyClubCentral].[dbo].[Client] WHERE id_client = @idClient)
		SET @idUserType = (SELECT type_user FROM [WhiskyClubCentral].[dbo].[Users] WHERE nickname = @nickname)
        SELECT @idClient as idClient, @email AS emailClient, @idUserType AS userType
        RETURN 0
    END
GO
USE [master]
GO
ALTER DATABASE [WhiskyClubCentral] SET  READ_WRITE 
GO
