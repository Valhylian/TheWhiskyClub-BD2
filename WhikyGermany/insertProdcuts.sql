USE [WhiskyGermany]
GO 

--INSERT PRODUCTS

--CONTAINER
INSERT INTO [dbo].[CatalogContainer]
           ([id_Container]
           ,[description_Container])
     VALUES
           (1,'Mini Bottle 4cl'),
		   (2,'Hip flask Bottle 200ml'),
		   (3,'Standar Bottle 50cl'),
		   (4,'Bottle 70cl-1L'),
		   (5,'Special Size Bottle 3L'),
		   (6,'Gift Edition Bottle 4.5L ')
GO

--TYPE
INSERT INTO [dbo].[CatalogProductType]
           ([id_ProductType]
           ,[name_ProductType])
     VALUES
           (1,'Single Malt'),
		   (2,'Blended Scotch'),
		   (3,'Irish'),
		   (4,'Blended Malt'),
		   (5,'Bourbon'),
		   (6,'Tennessee Whiskey')
GO

--PRODUCTS
INSERT INTO [dbo].[Product]
           ([id_product]
           ,[name_product]
           ,[type_product]
           ,[aged_product]
           ,[container_product]
           ,[price_product]
           ,[special_product])
     VALUES
			--TYPE 1 - 'Single Malt'
           (1
		   ,'Glenfiddich'
           ,1
           ,15
           ,3
           ,45
           ,0),
		   (2
		   ,'Glenlivet Founder’s Reserve'
           ,1
           ,20
           ,3
           ,38
           ,0),
		   --TYPE 2 - 'Blended Scotch'
		   (3
		   ,'Monkey Shoulder'
           ,2
           ,3 
           ,1 --MINI BOTTLE
           ,10
           ,0),
		   --TYPE 3 - Irish
		   (4,
		   'Lambay Small Batch Blend'
           ,3
           ,10 --aged
           ,2 --200ml
           ,25
           ,0),
		   --TYPE 4 - Blended Malt
		   (5,
		   'Johnnie Walker Black Label'
           ,4
           ,12
           ,4 --1L
           ,55
           ,0),
		   --TYPE 5 - Bourbon
		   (6,
		   'Makers Mark at Drizly'
           ,5
           ,20
           ,5 --SPECIAL 3L
           ,150
           ,1),--ESPECIAL
		   --TYPE 6 - Tennessee Whiskey
		   (7
		   ,'George Dickel Barrel Select'
           ,6
           ,12
           ,6 --GIFT
           ,70
           ,1)--ESPECIAL
GO

--INSERT STORE
INSERT INTO [dbo].[Store]
           ([id_store]
           ,[name_store]
           ,[location_store])
     VALUES
           (1
           ,'WhiskyClub Germany 1'
           ,geography::Point(48.13657897869303, 11.574684896387314, 4326)),
		   (2
           ,'WhiskyClub Germany 2'
           ,geography::Point(50.159624006317344, 8.702982337149855, 4326)),
		   (3
           ,'WhiskyClub Germany 3'
           ,geography::Point(50.950013142683844, 6.947628851373276, 4326))
GO


--STORE X PRODUCTS
INSERT INTO [dbo].[ProductxStore]
           ([aumount]
           ,[id_store]
           ,[id_product])
     VALUES
			--tienda 1
           (20,1,1),
		   (20,1,2),
		   (20,1,3),
		   (20,1,4),
		   (20,1,5),
		   (20,1,6),
		   --tienda 2
		   (15,2,1),
		   (15,2,2),
		   (15,2,3),
		   (15,2,4),
		   (15,2,5),
		   (15,2,6),
		   --tienda 3
		   (15,3,1),
		   (15,3,2),
		   (15,3,3),
		   (15,3,4),
		   (15,3,5),
		   (15,3,6)
GO

--SUBSCRIPTION-----------------
USE [WhiskyGermany]
GO

USE [WhiskyGermany]
GO

INSERT INTO [dbo].[CatalogSubscription]
           ([id_subscription]
           ,[name_subscription]
           ,[description_subscription]
           ,[discount_subscription]
           ,[price_subscription]
           ,[discount_shipping])
     VALUES
           (1,
			'Default'	--name
           ,'Default'
           ,0					--discount[discount_shipping]
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


--CLIENTES---------------
USE [WhiskyGermany]
GO

INSERT INTO [dbo].[Client]
           ([id_client]
           ,[name_client]
           ,[location_client]
           ,[email_client]
           ,[subscription_client])
     VALUES
           (2,
		   'Andres Valverde'
           ,geography::Point(51.33713043920813, 12.375617455987559, 4326)
           ,'andres190601@gmail.com'
           ,4),
		   (3,
		   'Luis Fallas'
           ,geography::Point(37.661161808891606, -97.3241378458944, 4326)
           ,'lfpf2220@gmail.com'
           ,2),
		   (4,
		   'Shirley Rodriguez'
           ,geography::Point(35.68126214039624, 139.76374483008794, 4326)
           ,'shirod777@gmail.com'
           ,3),
		   (5,
		   'Juanita Perez'
           ,geography::Point(36.329735805085996, -119.64531893448068, 4326)
           ,'juanita@gmail.com'
           ,1)
GO

