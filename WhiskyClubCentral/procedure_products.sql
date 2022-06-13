--CONSULT ALL PRODUCT (NOT SPECIAL)

ALTER PROCEDURE consultProducts
@id_client INT
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
	 money_type VARCHAR(128)
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


	--CICLE
	SELECT @id_product_cursor = MIN([id_product]) FROM [dbo].[Product]
	WHILE  @id_product_cursor IS NOT NULL
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
		FROM [dbo].[Product] 
		INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
		INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
		INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
		WHERE [status] = 1 AND [special_product] = 0 AND [id_product] = @id_product_cursor

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
					 @money_type )

		SET @id_product_cursor = (SELECT MIN([id_product]) FROM [dbo].[Product] WHERE [id_product] > @id_product_cursor) --NEXT PRODUCT
	END --end while

	SELECT * FROM @result


print @error;
RETURN @error
END
GO

EXEC consultProducts @id_client = 4


