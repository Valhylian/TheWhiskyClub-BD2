--INSERT PRODUCTS

USE [WhiskyClubCentral]
GO

INSERT INTO [dbo].[Product]
           ([name_product]
           ,[type_product]
           ,[aged_product]
           ,[distillery_product]
           ,[container_product]
           ,[price_product]
           ,[special_product])
     VALUES
			--TYPE 1 - 'Single Malt'
           ('Glenfiddich'
           ,1
           ,15
           ,1
           ,3
           ,45
           ,0),
		   ('Glenlivet Founder’s Reserve'
           ,1
           ,20
           ,2
           ,3
           ,38
           ,0),
		   --TYPE 2 - 'Blended Scotch'
		   ('Monkey Shoulder'
           ,2
           ,3 
           ,3
           ,1 --MINI BOTTLE
           ,10
           ,0),
		   --TYPE 3 - Irish
		   ('Lambay Small Batch Blend'
           ,3
           ,10 --aged
           ,4
           ,2 --200ml
           ,25
           ,0),
		   --TYPE 4 - Blended Malt
		   ('Johnnie Walker Black Label'
           ,4
           ,12
           ,4
           ,4 --1L
           ,55
           ,0),
		   --TYPE 5 - Bourbon
		   ('Makers Mark at Drizly'
           ,5
           ,20
           ,1
           ,5 --SPECIAL 3L
           ,150
           ,1),--ESPECIAL
		   --TYPE 6 - Tennessee Whiskey
		   ('George Dickel Barrel Select'
           ,6
           ,12
           ,1
           ,6 --GIFT
           ,70
           ,1)--ESPECIAL
GO

