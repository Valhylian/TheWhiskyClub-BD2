USE [WhiskyClubCentral]
GO
/****** Object:  StoredProcedure [dbo].[consultProducts]    Script Date: 6/20/2022 8:58:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[consultProducts]
@id_client INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_subs INT,
	@sub_special BIT,
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
	@product_image VARBINARY(MAX),
	@amount_purchase INT,
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
	 statusProduct VARCHAR(128),
	 product_image VARBINARY(MAX),
	 amount_purchase INT
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
	SELECT @id_subs =  [subscription_client] FROM [dbo].[Client] WHERE [id_client] = @id_client AND [status_client] = 1

	SELECT @sub_special = [special]  FROM [dbo].[CatalogSubscription] WHERE [id_subscription] = @id_subs AND [active] = 1




	--CICLE
	SELECT @id_product_cursor = MIN([id_product]) FROM [dbo].[Product]
	WHILE  @id_product_cursor IS NOT NULL
	BEGIN
	DELETE FROM @distanceAux
		--GET NEARBY STORE
		--1- GERMANY--------------------------------------------------------------------------------
		SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore]
		WHILE  @id_store_cursor IS NOT NULL
		BEGIN
			IF (SELECT [aumount] FROM [WhiskyGermany].[dbo].[ProductxStore] 
				WHERE  [id_productxStore] = @id_store_cursor AND [id_product] = @id_product_cursor)>  0
				BEGIN
					
					SET @store_id = (SELECT [id_store] FROM [WhiskyGermany].[dbo].[ProductxStore] WHERE  [id_productxStore] = @id_store_cursor AND [id_product] = @id_product_cursor)
					SELECT @store_name = [name_store], @store_location = [location_store], @store_country = [name_Country]
							FROM [dbo].[Store] 
							INNER JOIN [dbo].[CatalogCountry] ON [country_store] = [id_Country]
							WHERE [id_store] = @store_id 
					SET @store_distance = @store_location.STDistance(@client_location)

					INSERT INTO @distanceAux 
				VALUES(@store_name,@store_country,@store_distance)
				END

			
			SET @id_store_cursor = (SELECT MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore] 
								WHERE [id_productxStore] > @id_store_cursor) --NEXT STORE
			
			--PRINT @id_store_cursor;
		END--END WHILE STORE
		--GET NEARBY STORE
		--2- EEUU
		SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyUS].[dbo].[ProductxStore]
		WHILE  @id_store_cursor IS NOT NULL
		BEGIN
			IF (SELECT [aumount] FROM [WhiskyUS].[dbo].[ProductxStore] 
				WHERE  [id_productxStore] = @id_store_cursor AND [id_product] = @id_product_cursor)>  0
				BEGIN

					SET @store_id = (SELECT [id_store] FROM [WhiskyUS].[dbo].[ProductxStore] 
									WHERE  [id_productxStore] = @id_store_cursor AND [id_product] = @id_product_cursor)
					SELECT @store_name = [name_store], @store_location = [location_store], @store_country = [name_Country]
							FROM [dbo].[Store] 
							INNER JOIN [dbo].[CatalogCountry] ON [country_store] = [id_Country]
							WHERE [id_store] = @store_id 
					SET @store_distance = @store_location.STDistance(@client_location)

					INSERT INTO @distanceAux 
				VALUES(@store_name,@store_country,@store_distance)
				END

			SET @id_store_cursor = (SELECT MIN([id_productxStore]) FROM [WhiskyUS].[dbo].[ProductxStore] 
		WHERE [id_productxStore] > @id_store_cursor) --NEXT STORE
			
			PRINT @id_store_cursor;
		END--END WHILE STORE
		--3- JAPAN
		SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyJapan].[dbo].[ProductxStore]
		WHILE  @id_store_cursor IS NOT NULL
		BEGIN
			IF (SELECT [aumount] FROM [WhiskyJapan].[dbo].[ProductxStore] 
				WHERE  [id_productxStore] = @id_store_cursor AND [id_product] = @id_product_cursor)>  0
				BEGIN
					 
					SET @store_id = (SELECT [id_store] FROM [WhiskyJapan].[dbo].[ProductxStore] 
									WHERE  [id_productxStore] = @id_store_cursor AND [id_product] = @id_product_cursor)
					PRINT @store_id;
					SELECT @store_name = [name_store], @store_location = [location_store], @store_country = [name_Country]
							FROM [dbo].[Store] 
							INNER JOIN [dbo].[CatalogCountry] ON [country_store] = [id_Country]
							WHERE [id_store] = @store_id 
					SET @store_distance = @store_location.STDistance(@client_location)

					INSERT INTO @distanceAux 
				VALUES(@store_name,@store_country,@store_distance)
				END

			
			SET @id_store_cursor = (SELECT MIN([id_productxStore]) FROM [WhiskyJapan].[dbo].[ProductxStore] 
								WHERE [id_productxStore] > @id_store_cursor) --NEXT STORE
			
			PRINT @id_store_cursor;
		END--END WHILE STORE



		--SELECT NEARBY STORE
		SELECT @nearbyStore = store_name, @nearbyCountry = store_country, @store_distance = store_distance 
				FROM @distanceAux WHERE store_distance = (SELECT MIN(store_distance) FROM @distanceAux )

		--
		IF (SELECT [status] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) = 1
			AND
			((SELECT [special_product] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) = 0 OR @sub_special=1)
			AND 
			(SELECT [amount] FROM [dbo].[Product] WHERE [id_product] = @id_product_cursor) > 0
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
					,@product_image = [image]
					,@amount_purchase = [amount_purchase]
				FROM [dbo].[Product] 
				INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				WHERE [status] = 1 AND ([special_product] = 0 OR @sub_special=1) AND [id_product] = @id_product_cursor AND [amount] > 0 

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
							 @product_special,
							 @product_image,
							 @amount_purchase)

			END
		
		SET @id_product_cursor = (SELECT MIN([id_product]) FROM [dbo].[Product] WHERE [id_product] > @id_product_cursor) --NEXT PRODUCT
	END --end while

	SELECT * FROM @result


print @error;
RETURN @error
END
