USE [master]
GO
/****** Object:  Database [WhiskyClubCentral]    Script Date: 6/14/2022 11:31:27 AM ******/
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
/****** Object:  Table [dbo].[CatalogContainer]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[CatalogCountry]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[CatalogDistillery]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[CatalogProductType]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[CatalogSubscription]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[CatalogUserType]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 6/14/2022 11:31:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[imagesProduct]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[LocationXClient]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/14/2022 11:31:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id_product] [int] NOT NULL,
	[name_product] [varchar](64) NOT NULL,
	[type_product] [int] NOT NULL,
	[aged_product] [int] NOT NULL,
	[distillery_product] [int] NOT NULL,
	[container_product] [int] NOT NULL,
	[price_product] [money] NOT NULL,
	[special_product] [bit] NOT NULL,
	[status] [bit] NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK__Product__BA39E84F14DE09CA] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/14/2022 11:31:28 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/14/2022 11:31:28 AM ******/
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
SET IDENTITY_INSERT [dbo].[Client] ON 
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (1, N'Andres Valverde', 1, N'andres190601@gmail.com', 4, 1, 0xE6100000010C4971191727AB4940EC8B62EE50C02840, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (2, N'Luis Fallas', 2, N'lfpf2220@gmail.com', 2, 2, 0xE6100000010CDE463DF3A0D44240CAE0A9ACBE5458C0, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (3, N'Shirley Rodriguez', 3, N'shirod777@gmail.com', 3, 3, 0xE6100000010C9E800A9933D74140F076FF9870786140, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials], [location_client], [status_client]) VALUES (4, N'Juanita Perez', 2, N'juanita@gmail.com', 1, 4, 0xE6100000010C119569C8342A424062C5C9E74CE95DC0, 1)
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount]) VALUES (1, N'Glenfiddich', 1, 15, 1, 3, 45.0000, 0, 1, 50)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount]) VALUES (2, N'Glenlivet Founder’s Reserve', 1, 20, 2, 3, 38.0000, 0, 1, 50)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount]) VALUES (3, N'Monkey Shoulder', 2, 3, 3, 1, 10.0000, 0, 1, 50)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount]) VALUES (4, N'Lambay Small Batch Blend', 3, 10, 4, 2, 25.0000, 0, 1, 50)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount]) VALUES (5, N'Johnnie Walker Black Label', 4, 12, 4, 4, 55.0000, 0, 1, 50)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount]) VALUES (6, N'Makers Mark at Drizly', 5, 20, 1, 5, 150.0000, 1, 1, 50)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product], [status], [amount]) VALUES (7, N'George Dickel Barrel Select', 6, 12, 1, 6, 70.0000, 1, 1, 50)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (1, N'WhiskyClub Germany 1', 1, 0xE6100000010C6167836B7B11484032FA46193D262740)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (2, N'WhiskyClub Germany 2', 1, 0xE6100000010C0E65378F6E144940D472074DED672140)
GO
INSERT [dbo].[Store] ([id_store], [name_store], [country_store], [location_store]) VALUES (3, N'WhiskyClub Germany 3', 1, 0xE6100000010C744CD9079A794940BA93B5375FCA1B40)
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
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK__Store__country_s__49C3F6B7] FOREIGN KEY([country_store])
REFERENCES [dbo].[CatalogCountry] ([id_Country])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK__Store__country_s__49C3F6B7]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([type_user])
REFERENCES [dbo].[CatalogUserType] ([id_UserType])
GO
/****** Object:  StoredProcedure [dbo].[ChangeAccountSubscription]    Script Date: 6/14/2022 11:31:29 AM ******/
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
/****** Object:  StoredProcedure [dbo].[consultProducts]    Script Date: 6/14/2022 11:31:29 AM ******/
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
/****** Object:  StoredProcedure [dbo].[consultProductsParameters]    Script Date: 6/14/2022 11:31:29 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateNewUser]    Script Date: 6/14/2022 11:31:29 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FindUserByNickname]    Script Date: 6/14/2022 11:31:29 AM ******/
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
/****** Object:  StoredProcedure [dbo].[returnProductTypes]    Script Date: 6/14/2022 11:31:29 AM ******/
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
/****** Object:  StoredProcedure [dbo].[verifyLogin]    Script Date: 6/14/2022 11:31:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[verifyLogin]
@nickname nvarchar(50), 
@password nvarchar(50)
AS
DECLARE @email varchar(64),
@idClient int
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
        SELECT @idClient as idClient, @email AS emailClient
        RETURN 0
    END
GO
USE [master]
GO
ALTER DATABASE [WhiskyClubCentral] SET  READ_WRITE 
GO
