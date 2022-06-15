ALTER PROCEDURE CreateNewUser 
@nickname nvarchar(50), 
@password nvarchar(50), 
@full_name varchar(50), 
@country_id int, 
@email varchar(64), 
@id_subscription int
AS
DECLARE
@lastInsertedUser INT
	IF @nickname IS NULL or @password IS NULL OR @full_name IS NULL OR @country_id IS NULL OR @email IS NULL OR @id_subscription IS NULL
	BEGIN
		RETURN 1 --'One or more paramters are null'
	END
	ELSE
	IF (SELECT COUNT(1) FROM [WhiskyClubCentral].[dbo].[Users] WHERE nickname = @nickname) > 0
	BEGIN
		RETURN 2 --'Nickname is already in use'
	END
	ELSE
	IF (SELECT COUNT(1) FROM [WhiskyClubCentral].[dbo].[Client] WHERE email_client = @email) > 0
	BEGIN
		RETURN 3 --'Email is already in use'
	END
	ELSE
	BEGIN
		INSERT INTO [WhiskyClubCentral].[dbo].[Users] (nickname,password_user,type_user) VALUES (@nickname,PWDENCRYPT(@password),1)

		SET @lastInsertedUser = (SELECT TOP 1 id_user FROM [WhiskyClubCentral].[dbo].[Users] ORDER BY id_user DESC)

		INSERT INTO [WhiskyClubCentral].[dbo].[Client] (id_client,name_client,country_client,email_client,subscription_client,user_credentials)
		VALUES (@lastInsertedUser,@full_name,@country_id,@email,@id_subscription,@lastInsertedUser)

		IF (@country_id = 1) --Client is from Germany
		BEGIN
			INSERT INTO [WhiskyGermany].[dbo].[Client] (id_client,name_client,email_client,subscription_client)
			VALUES (@lastInsertedUser,@full_name,@email,@id_subscription)
		END
		ELSE
		IF (@country_id = 2) --Client is from Germany
		BEGIN
			INSERT INTO [WhiskyUS].[dbo].[Client] (id_client,name_client,email_client,subscription_client)
			VALUES (@lastInsertedUser,@full_name,@email,@id_subscription)
		END
		IF (@country_id = 3) --Client is from Germany
		BEGIN
			INSERT INTO [WhiskyJapan].[dbo].[Client] (id_client,name_client,email_client,subscription_client)
			VALUES (@lastInsertedUser,@full_name,@email,@id_subscription)
		END
	END
	RETURN 0
