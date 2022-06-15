USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[returnProductTypes]    Script Date: 6/14/2022 10:56:30 AM ******/
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


USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[consultProducts]    Script Date: 6/14/2022 10:56:40 AM ******/
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

USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[consultProductsParameters]    Script Date: 6/14/2022 10:56:50 AM ******/
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



