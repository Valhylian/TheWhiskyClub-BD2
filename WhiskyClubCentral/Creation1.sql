USE [master]
GO
/****** Object:  Database [WhiskyClubCentral]    Script Date: 6/12/2022 9:28:47 PM ******/
CREATE DATABASE [WhiskyClubCentral]

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
/****** Object:  Table [dbo].[CatalogContainer]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[CatalogCountry]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[CatalogDistillery]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[CatalogProductType]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[CatalogSubscription]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[CatalogUserType]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 6/12/2022 9:28:48 PM ******/
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
 CONSTRAINT [PK__Client__6EC2B6C02E812F81] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imagesProduct]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[LocationXClient]    Script Date: 6/12/2022 9:28:48 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/12/2022 9:28:48 PM ******/
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
 CONSTRAINT [PK__Product__BA39E84F14DE09CA] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/12/2022 9:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[id_store] [int] IDENTITY(1,1) NOT NULL,
	[name_store] [varchar](64) NOT NULL,
	[country_store] [int] NOT NULL,
	[location_store] [geography] NOT NULL,
	[location_storeText]  AS ([location_store].[STAsText]()),
PRIMARY KEY CLUSTERED 
(
	[id_store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/12/2022 9:28:48 PM ******/
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
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials]) VALUES (1, N'Andres Valverde', 1, N'andres190601@gmail.com', 4, 1)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials]) VALUES (2, N'Luis Fallas', 2, N'lfpf2220@gmail.com', 2, 2)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials]) VALUES (3, N'Shirley Rodriguez', 3, N'shirod777@gmail.com', 3, 3)
GO
INSERT [dbo].[Client] ([id_client], [name_client], [country_client], [email_client], [subscription_client], [user_credentials]) VALUES (4, N'Juanita Perez', 2, N'juanita@gmail.com', 1, 4)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product]) VALUES (1, N'Glenfiddich', 1, 15, 1, 3, 45.0000, 0)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product]) VALUES (2, N'Glenlivet Founder’s Reserve', 1, 20, 2, 3, 38.0000, 0)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product]) VALUES (3, N'Monkey Shoulder', 2, 3, 3, 1, 10.0000, 0)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product]) VALUES (4, N'Lambay Small Batch Blend', 3, 10, 4, 2, 25.0000, 0)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product]) VALUES (5, N'Johnnie Walker Black Label', 4, 12, 4, 4, 55.0000, 0)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product]) VALUES (6, N'Makers Mark at Drizly', 5, 20, 1, 5, 150.0000, 1)
GO
INSERT [dbo].[Product] ([id_product], [name_product], [type_product], [aged_product], [distillery_product], [container_product], [price_product], [special_product]) VALUES (7, N'George Dickel Barrel Select', 6, 12, 1, 6, 70.0000, 1)
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
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_subscription_client]  DEFAULT ((1)) FOR [subscription_client]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__special__59063A47]  DEFAULT ((0)) FOR [special_product]
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
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([user_credentials])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[imagesProduct]  WITH CHECK ADD  CONSTRAINT [FK__imagesPro__image__46E78A0C] FOREIGN KEY([id_image])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[imagesProduct] CHECK CONSTRAINT [FK__imagesPro__image__46E78A0C]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__contain__440B1D61] FOREIGN KEY([container_product])
REFERENCES [dbo].[CatalogContainer] ([id_Container])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__contain__440B1D61]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__distill__4316F928] FOREIGN KEY([distillery_product])
REFERENCES [dbo].[CatalogDistillery] ([id_Distillery])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__distill__4316F928]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__type_pr__4222D4EF] FOREIGN KEY([type_product])
REFERENCES [dbo].[CatalogProductType] ([id_ProductType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__type_pr__4222D4EF]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK__Store__country_s__49C3F6B7] FOREIGN KEY([country_store])
REFERENCES [dbo].[CatalogCountry] ([id_Country])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK__Store__country_s__49C3F6B7]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([type_user])
REFERENCES [dbo].[CatalogUserType] ([id_UserType])
GO
USE [master]
GO
ALTER DATABASE [WhiskyClubCentral] SET  READ_WRITE 
GO
