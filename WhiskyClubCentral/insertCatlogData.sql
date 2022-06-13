--INSERT CATALOG DATA
USE [WhiskyClubCentral]
GO

--CONTAINER
INSERT INTO [dbo].[CatalogContainer]
           ([description_Container])
     VALUES
           ('Mini Bottle 4cl'),
		   ('Hip flask Bottle 200ml'),
		   ('Standar Bottle 50cl'),
		   ('Bottle 70cl-1L'),
		   ('Special Size Bottle 3L'),
		   ('Gift Edition Bottle 4.5L ')
GO

--COUNTRY
INSERT INTO [dbo].[CatalogCountry]
           ([name_Country]
           ,[money_type]
           ,[dollar_equivalent])
     VALUES
           ('Germany','Euro',0.94),
		   ('United States','Dollar',1),
		   ('Japan','Yen',134.36)
GO

--DISTILLERY
INSERT INTO [dbo].[CatalogDistillery]
           ([name_Distillery])
     VALUES
           ('Glenmorangie Distillery'),
		   ('Balblair Distillery'),
		   ('Ardbeg Distillery'),
		   ('Aberlour Destillery')
GO

--PRODUCT TYPE
INSERT INTO [dbo].[CatalogProductType]
           ([name_ProductType])
     VALUES
           ('Single Malt'),
		   ('Blended Scotch'),
		   ('Irish'),
		   ('Blended Malt'),
		   ('Bourbon'),
		   ('Tennessee Whiskey')
GO

USE [WhiskyClubCentral]
GO



--SUBSCRIPTION
INSERT INTO [dbo].[CatalogSubscription]
			([id_subscription],
           [name_subscription]
           ,[description_subscription]
           ,[discount_subscription]
           ,[price_subscription]
           ,[discount_shipping])
     VALUES
			(1,
			'Default'	--name
           ,'Default'
           ,0					--discount
           ,0					--price
           ,0)--discount ship
		   ,
           (2
		   ,'Tier Short Glass'	--name
           ,'When a new whiskey is entered into the store, you receive an email with its description. You have a 5% discount on purchases'
           ,5					--discount
           ,30					--price
           ,0)					--discount ship
		   ,
		   (3
		   ,'Tier Gleincairn'	--name
           ,'Exclusive whiskeys. It has a 10% discount on purchases and a 20% discount on the cost of shipping. Notifications of new products to the mail.'
           ,10					--discount
           ,70					--price
           ,20)					--discount ship
		   ,
		   (4
		   ,'Tier Master Distiller'	--name
           ,'Free shipping cost. You have a 30% discount on purchases and every 10 whiskeys you buy, you get a free whiskey. Access to the catalog of special whiskeys. Mail notification of new products.'
           ,30					--discount
           ,100					--price
           ,100)					--discount ship

GO

--USER TYPE
INSERT INTO [dbo].[CatalogUserType]
           ([name_UserType]
           ,[description_UserType])
     VALUES
           ('Client User'
           ,'Normal user for shopping'),
		   ('Especial User'
           ,'Especial user with editing permissions')
GO

