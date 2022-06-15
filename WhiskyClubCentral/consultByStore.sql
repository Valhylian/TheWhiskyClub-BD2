USE [WhiskyClubCentral]
GO

CREATE PROCEDURE [dbo].[consultProductsXStore]
@id_client INT,
@id_store_ INT
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
	 idStore INT,
	 money_type VARCHAR(128),
	 statusProduct  VARCHAR(128),
	 nearbyStore  VARCHAR(128)
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
	SELECT @nearbyStore =  [name_store] from [dbo].[Store] where [id_store] = @id_store_

	--GERMANY
	IF (@id_store_ = 1 OR @id_store_ = 2 OR @id_store_ = 3)
		BEGIN
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore]
			WHILE  @id_store_cursor IS NOT NULL
			BEGIN
				IF(SELECT [id_store] FROM [WhiskyGermany].[dbo].[ProductxStore] 
					WHERE [id_productxStore]=@id_store_cursor)=@id_store_
					BEGIN
					--SELECT PRODUC ID
					SELECT @product_id = [id_product] FROM  [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor
					--STATUS TRUE?
					--AMOUNTA > 0?
					IF (SELECT [aumount] FROM [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor) > 0
						AND (SELECT [status] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 1
						AND ((SELECT [special_product] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 0 OR @id_subs=3 or @id_subs=4)
					
					SELECT 
					   @product_amount=[aumount]
					  ,@product_id = [WhiskyGermany].[dbo].[ProductxStore].[id_product]
					  ,@product_name=[name_product]
					  ,@product_type=[dbo].[CatalogProductType].name_ProductType
					  ,@product_aged = [aged_product]
					  ,@destilley = [dbo].[CatalogDistillery].name_Distillery
					  ,@product_container = [dbo].[CatalogContainer].description_Container
					  ,@product_price = ([price_product]*@cliente_money_equi)
					  ,@product_special = [special_product]
					  ,@product_amount = [WhiskyGermany].[dbo].[ProductxStore].[aumount]

				  FROM [WhiskyGermany].[dbo].[ProductxStore]
				  INNER JOIN [WhiskyClubCentral].[dbo].[Product] ON [WhiskyClubCentral].[dbo].[Product].[id_product] = [WhiskyGermany].[dbo].[ProductxStore].id_product
				  INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				  INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				  INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				  WHERE [aumount] > 0 AND [id_store] = @id_store_ AND [status] = 1 AND [id_store] = @id_store_ AND [id_productxStore]=@id_store_cursor
				  AND ([WhiskyClubCentral].[dbo].[Product].[special_product] = 0 or @id_subs=3 or @id_subs=4)

				  

				   --insert to result
				INSERT INTO @result VALUES
							(@product_id,--product_code
							@product_name,		--product_name
							@product_type,		--product_type 
							@product_aged,		--product_aged
							@destilley,		--destilley 
							@product_container, --product_container 
							@product_price,	--product_price 
							@product_amount,	--amount 
							@id_store_,		--nearbyStore
							@money_type,
							@product_special,
							@nearbyStore)
					END
				
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_productxStore] > @id_store_cursor
			END--END WHILE STORE
			SELECT * FROM @result
			RETURN 0;

		END--END GERMANY 

		--JAPAN
	IF (@id_store_ = 4 OR @id_store_ = 5 OR @id_store_ = 6)
		BEGIN
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyJapan].[dbo].[ProductxStore]
			WHILE  @id_store_cursor IS NOT NULL
			BEGIN
				IF(SELECT [id_store] FROM [WhiskyJapan].[dbo].[ProductxStore] 
					WHERE [id_productxStore]=@id_store_cursor)=@id_store_
					BEGIN
					--SELECT PRODUC ID
					SELECT @product_id = [id_product] FROM  [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor
					--STATUS TRUE?
					--AMOUNTA > 0?
					IF (SELECT [aumount] FROM [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor) > 0
						AND (SELECT [status] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 1
						AND ((SELECT [special_product] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 0 OR @id_subs=3 or @id_subs=4)
					
					SELECT 
					   @product_amount=[aumount]
					  ,@product_id = [WhiskyJapan].[dbo].[ProductxStore].[id_product]
					  ,@product_name=[name_product]
					  ,@product_type=[dbo].[CatalogProductType].name_ProductType
					  ,@product_aged = [aged_product]
					  ,@destilley = [dbo].[CatalogDistillery].name_Distillery
					  ,@product_container = [dbo].[CatalogContainer].description_Container
					  ,@product_price = ([price_product]*@cliente_money_equi)
					  ,@product_special = [special_product]
					  ,@product_amount = [WhiskyJapan].[dbo].[ProductxStore].[aumount]
				  FROM [WhiskyJapan].[dbo].[ProductxStore]
				  INNER JOIN [WhiskyClubCentral].[dbo].[Product] ON [WhiskyClubCentral].[dbo].[Product].[id_product] = [WhiskyJapan].[dbo].[ProductxStore].id_product
				  INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				  INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				  INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				  WHERE [aumount] > 0 AND [id_store] = @id_store_ AND [status] = 1 AND [id_store] = @id_store_ AND [id_productxStore]=@id_store_cursor
				  AND ([WhiskyClubCentral].[dbo].[Product].[special_product] = 0 or @id_subs=3 or @id_subs=4)

				   --insert to result
				INSERT INTO @result VALUES
							(@product_id,--product_code
							@product_name,		--product_name
							@product_type,		--product_type 
							@product_aged,		--product_aged
							@destilley,		--destilley 
							@product_container, --product_container 
							@product_price,	--product_price 
							@product_amount,	--amount 
							@id_store_,		--nearbyStore
							@money_type,
							@product_special,
							@nearbyStore)
					END
				
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_productxStore] > @id_store_cursor
			END--END WHILE STORE
			SELECT * FROM @result
			RETURN 0;

		END--END JAPAN

			--EU
	IF (@id_store_ = 4 OR @id_store_ = 5 OR @id_store_ = 6)
		BEGIN
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyUS].[dbo].[ProductxStore]
			WHILE  @id_store_cursor IS NOT NULL
			BEGIN
				IF(SELECT [id_store] FROM [WhiskyUS].[dbo].[ProductxStore] 
					WHERE [id_productxStore]=@id_store_cursor)=@id_store_
					BEGIN
					--SELECT PRODUC ID
					SELECT @product_id = [id_product] FROM  [WhiskyUS].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor
					--STATUS TRUE?
					--AMOUNTA > 0?
					IF (SELECT [aumount] FROM [WhiskyUS].[dbo].[ProductxStore] WHERE [id_productxStore]=@id_store_cursor) > 0
						AND (SELECT [status] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 1
						AND ((SELECT [special_product] FROM [WhiskyClubCentral].[dbo].[Product]  WHERE [id_product] =@product_id) = 0 OR @id_subs=3 or @id_subs=4)
					
					SELECT 
					   @product_amount=[aumount]
					  ,@product_id = [WhiskyUS].[dbo].[ProductxStore].[id_product]
					  ,@product_name=[name_product]
					  ,@product_type=[dbo].[CatalogProductType].name_ProductType
					  ,@product_aged = [aged_product]
					  ,@destilley = [dbo].[CatalogDistillery].name_Distillery
					  ,@product_container = [dbo].[CatalogContainer].description_Container
					  ,@product_price = ([price_product]*@cliente_money_equi)
					  ,@product_special = [special_product]
					  ,@product_amount = [WhiskyUS].[dbo].[ProductxStore].[aumount]
				  FROM [WhiskyUS].[dbo].[ProductxStore]
				  INNER JOIN [WhiskyClubCentral].[dbo].[Product] ON [WhiskyClubCentral].[dbo].[Product].[id_product] = [WhiskyUS].[dbo].[ProductxStore].id_product
				  INNER JOIN  [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
				  INNER JOIN  [dbo].[CatalogDistillery] ON [distillery_product] = [id_Distillery]
				  INNER JOIN  [dbo].[CatalogContainer] ON [container_product] = [id_Container]
				  WHERE [aumount] > 0 AND [id_store] = @id_store_ AND [status] = 1 AND [id_store] = @id_store_ AND [id_productxStore]=@id_store_cursor
				  AND ([WhiskyClubCentral].[dbo].[Product].[special_product] = 0 or @id_subs=3 or @id_subs=4)

				   --insert to result
				INSERT INTO @result VALUES
							(@product_id,--product_code
							@product_name,		--product_name
							@product_type,		--product_type 
							@product_aged,		--product_aged
							@destilley,		--destilley 
							@product_container, --product_container 
							@product_price,	--product_price 
							@product_amount,	--amount 
							@id_store_,		--nearbyStore
							@money_type,
							@product_special,
							@nearbyStore)
					END
				
			SELECT @id_store_cursor = MIN([id_productxStore]) FROM [WhiskyUS].[dbo].[ProductxStore] WHERE [id_productxStore] > @id_store_cursor
			END--END WHILE STORE
			SELECT * FROM @result
			RETURN 0;

		END--END EU


print @error;
RETURN @error
END
GO


EXEC [dbo].[consultProductsXStore]
@id_client=2,
@id_store_=2



CREATE PROCEDURE [dbo].[returnStores]
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT

	SELECT [id_store]
		  ,[name_store]
		  ,[country_store]
		  ,[location_store]
		  ,[location_storeText]
	  FROM [dbo].[Store]

print @error;
RETURN @error
END
GO
