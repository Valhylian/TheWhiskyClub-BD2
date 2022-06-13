--INSERT CLIENT
USE [WhiskyClubCentral]
GO 
--USERS
INSERT INTO [dbo].[Users]
           ([nickname]
           ,[password_user]
           ,[type_user])
     VALUES
           ('andres123'
           ,PWDENCRYPT ( 'contraAndres' )  
           ,1),
		   ('luis123'
           ,PWDENCRYPT ( 'contraLuis' )  
           ,1),
		   ('shirley123'
           ,PWDENCRYPT ( 'contraShirley' )  
           ,1),
		   ('juanita123'
           ,PWDENCRYPT ( 'contraJuanita' )  
           ,1)

GO



INSERT INTO [dbo].[Client]
           ([id_client]
		   ,[name_client]
           ,[country_client]
           ,[location_client]
           ,[email_client]
           ,[subscription_client]
		   ,[user_credentials])
     VALUES
			--SUBS 
           (1,
		   'Andres Valverde'
           ,1 --GERMANY
           ,geography::Point(51.33713043920813, 12.375617455987559, 4326)
           ,'andres190601@gmail.com'
           ,4
		   ,1),
		   (2,
		   'Luis Fallas'
           ,2 --EEUU
           ,geography::Point(37.661161808891606, -97.3241378458944, 4326)
           ,'lfpf2220@gmail.com'
           ,2
		   ,2),
		   (3,
		   'Shirley Rodriguez'
           ,3 --Japan
           ,geography::Point(35.68126214039624, 139.76374483008794, 4326)
           ,'shirod777@gmail.com'
           ,3
		   ,3),
		   (4,
		   'Juanita Perez'
           ,2 --EEUU
           ,geography::Point(36.329735805085996, -119.64531893448068, 4326)
           ,'juanita@gmail.com'
           ,1
		   ,4)
GO

