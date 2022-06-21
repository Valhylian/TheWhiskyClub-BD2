USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[generatePurchase]    Script Date: 6/20/2022 6:35:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[generatePurchase]
@jsonProducts_ VARCHAR (MAX),
@idStore_ INT,
@idClient_ INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	--CYCLE
	@cursorProducts INT,
	--PRODUCT INFO
	@idProduct_ INT,
	@amountProduct_ INT,
	@priceProduct_ MONEY,
	@subtotal_ MONEY,
	--DATA OF CLIENTE
	@location_client GEOGRAPHY,
	@sub_client INT,
	@sub_discount INT,
	@shipping_discount FLOAT,
	@distance_client FLOAT,
	@country_client INT,
	@money_client VARCHAR(128),
	@moneyEquivalence_cliente FLOAT,
	--DATA OF STORE
	@location_store GEOGRAPHY,
	--DATA OF SHIPPING
	@shippingPrice MONEY,
	--DATA OF PURCHASE
	@lastPurchase_id INT


DECLARE @products TABLE
	(idCursor INT IDENTITY(1,1) PRIMARY KEY, 
	 idProduct INT,
	 quantity INT
	)
DECLARE @results TABLE
	(idCursor INT  PRIMARY KEY, 
	 purchase_id INT,
	 client_name VARCHAR(128),
	 store_name VARCHAR(128),
	 product_name VARCHAR(128),
	 product_priceInd MONEY,
	 product_amount INT,
	 product_subtotal MONEY,
	 purchase_total MONEY,
	 purchase_shipping MONEY,
	 client_sub VARCHAR(128),
	 product_success VARCHAR(128),
	 moneyType VARCHAR(128)
	)

DECLARE @errorTable TABLE
	(idCursor INT IDENTITY(1,1) PRIMARY KEY, 
	 id_Product INT,
	 amount_product INT
	)
	SET @error = 0

	--NULL DATA?
	IF (@jsonProducts_ IS NULL OR @idClient_ IS NULL OR @idStore_ IS NULL) 
		BEGIN
			SET @error = 1
			RETURN @error
		END

	--JSON FORMAT?
	IF ISJSON(@jsonProducts_) < 1
		BEGIN
			 SET @error = 5
			RETURN @error
		END

	--TABLE WITH PRODUCTS
	INSERT INTO @products SELECT * FROM OPENJSON(@jsonProducts_)
							WITH (idProduct INT,
								 quantity INT)

	--DATA OF CLIENT
	SELECT @location_client = [location_client],
			@sub_client = [subscription_client],
			@money_client = [money_type],
		    @moneyEquivalence_cliente = [dollar_equivalent]
			FROM [dbo].[Client] 
			INNER JOIN [dbo].[CatalogCountry] ON [country_client] = [id_Country]
			WHERE [id_client] = @idClient_


	SELECT @sub_client = [subscription_client] FROM [dbo].[Client] WHERE [id_client] = @idClient_
	--DATA OF STORE
	SELECT @location_store = [location_store] FROM [dbo].[Store] WHERE [id_store] = @idStore_
	--DATA OF PRICE
	SELECT @sub_discount = [discount_subscription], 
		   @shipping_discount = ([discount_shipping]/100) FROM [dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client

	--SHIPPING PRICE 
	SET @distance_client = @location_store.STDistance (@location_client) 
	IF (@distance_client > 1000)
		BEGIN
			SET @distance_client = @distance_client/1000 --KM
		END
	ELSE
		BEGIN
			SET @distance_client = 0
		END
	--PRICE
	SET @shippingPrice = 15 + (@distance_client/2) 
	--DISCOUNT
	SET @shippingPrice = @shippingPrice - (@shippingPrice * @shipping_discount)
	--CONVER TO MONEYTYPE
	SET @shippingPrice = @shippingPrice * @moneyEquivalence_cliente
	--RECALCULATE
	SET @distance_client = @location_store.STDistance (@location_client) /1000

	--GENERATE PURCHAESE
	INSERT INTO [dbo].[purchase]
			   ([client_purchase]
			   ,[date_purchase]
			   ,[location_client]
			   ,[subtotal]
			   ,[shipping]
			   ,[total]
			   ,[distance]
			   ,[moneyType]
			   ,[store])
		 VALUES
			   (@idClient_
			   ,GETDATE()
			   ,@location_client
			   ,0
			   ,@shippingPrice
			   ,@shippingPrice
			   ,@distance_client
			   ,@money_client
			   ,@idStore_)

	--LAST INSERTED ID
	SELECT @lastPurchase_id = MAX([id_purchase]) FROM [dbo].[purchase]

	--GERMANY------------------------------------------------------------------------------------------------
	IF (@idStore_ = 1 OR @idStore_ = 2 OR @idStore_ = 3)
		BEGIN
			--GENERATE PURCHASE LOCAL GERMNANY
			INSERT INTO [WhiskyGermany].[dbo].[purchase] SELECT * FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase] = @lastPurchase_id

			--INIT CYCLE FOR PRODUCTS
			SELECT @cursorProducts = MIN(idCursor) FROM @products
			WHILE @cursorProducts IS NOT NULL
			BEGIN
				--INFO
				SELECT @amountProduct_ = quantity,
					   @idProduct_ = idProduct 
					   FROM @products WHERE @cursorProducts = idCursor

				--VERIFY QUANTITY
				IF (SELECT [aumount] FROM [WhiskyGermany].[dbo].[ProductxStore] WHERE [id_product] = @idProduct_ AND [id_store] = @idStore_) >= @amountProduct_
					BEGIN
						--PRICE OF PRODUCT
						SELECT @priceProduct_ = [price_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_
						--SUBTOTAL
						SET @subtotal_ = (@priceProduct_ * @amountProduct_) * @moneyEquivalence_cliente

						--GENERATE LINE OF FACT
						INSERT INTO [WhiskyClubCentral].[dbo].[purchaseXProduct]
								   ([id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   (@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)
								   
						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @priceProduct_,
								 @amountProduct_,
								 @subtotal_,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'Processed',
								 @money_client
								)

						--INSERT LOCAL
						INSERT INTO [WhiskyGermany].[dbo].[purchaseXProduct]
								   ([id_purchaseXProduct]
								   ,[id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   ((SELECT MAX([id_purchaseXProduct]) FROM [WhiskyClubCentral].[dbo].[purchaseXProduct])
								   ,@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)

						--DECREMENT AMOUNT X STORE
						UPDATE [WhiskyGermany].[dbo].[ProductxStore]
						   SET [aumount] = [aumount] - @amountProduct_
						 WHERE [id_store] = @idStore_ AND [id_product] = @idProduct_

						--DECREMENT AMOUNT GENERAL
						UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount] = [amount] - @amountProduct_
						 WHERE [id_product] = @idProduct_

						 UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount_purchase] = [amount_purchase] + @amountProduct_
						 WHERE [id_product] = @idProduct_

						 --ACT SUBTOTAL AND TOTAL
						UPDATE [WhiskyClubCentral].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
						--CENTRAL
						UPDATE [WhiskyGermany].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id



					END
				ELSE --NO EXIST AMOUNT OF PRODUCT
					BEGIN
						--INSERT INTO ERRORS TABLE
						INSERT INTO @errorTable VALUES (@idProduct_, @amountProduct_)

						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 (SELECT [price_product]*@moneyEquivalence_cliente FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @amountProduct_,
								 0,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'canceled',
								 @money_client
								)
					END


				SELECT @cursorProducts = MIN(idCursor) FROM @products WHERE idCursor > @cursorProducts --INDEX ++
			END--END WHILE

			--RETORNAR ERRORES
			UPDATE @results SET purchase_total = (SELECT total FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase]=@lastPurchase_id)
			
			--ACT STATUS
			IF (SELECT subtotal FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase]=@lastPurchase_id) = 0
				BEGIN
				--central
				UPDATE [WhiskyClubCentral].[dbo].[purchase]
				   SET [status_purchase] = 3
				 WHERE [id_purchase]=@lastPurchase_id
				 --us
				 UPDATE [WhiskyGermany].[dbo].[purchase]
				   SET [status_purchase] = 3
				 WHERE [id_purchase]=@lastPurchase_id
				END

			SELECT * FROM @results
			RETURN 0;

		END--END GERMANY

	--JAPAN--------------------------------------------------------------------------------------------
	IF (@idStore_ = 4 OR @idStore_ = 5 OR @idStore_ = 6)
		BEGIN
			--GENERATE PURCHASE LOCAL GERMNANY
			INSERT INTO [WhiskyJapan].[dbo].[purchase] SELECT * FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase] = @lastPurchase_id

			--INIT CYCLE FOR PRODUCTS
			SELECT @cursorProducts = MIN(idCursor) FROM @products
			WHILE @cursorProducts IS NOT NULL
			BEGIN
				--INFO
				SELECT @amountProduct_ = quantity,
					   @idProduct_ = idProduct 
					   FROM @products WHERE @cursorProducts = idCursor

				--VERIFY QUANTITY
				IF (SELECT [aumount] FROM [WhiskyJapan].[dbo].[ProductxStore] WHERE [id_product] = @idProduct_ AND [id_store] = @idStore_) >= @amountProduct_
					BEGIN
						--PRICE OF PRODUCT
						SELECT @priceProduct_ = [price_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_
						--SUBTOTAL
						SET @subtotal_ = (@priceProduct_ * @amountProduct_) * @moneyEquivalence_cliente

						--GENERATE LINE OF FACT
						INSERT INTO [WhiskyClubCentral].[dbo].[purchaseXProduct]
								   ([id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   (@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)


						--INSERT LOCAL
						INSERT INTO [WhiskyJapan].[dbo].[purchaseXProduct]
								   ([id_purchaseXProduct]
								   ,[id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   ((SELECT MAX([id_purchaseXProduct]) FROM [WhiskyClubCentral].[dbo].[purchaseXProduct])
								   ,@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)
						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @priceProduct_,
								 @amountProduct_,
								 @subtotal_,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'Processed',
								 @money_client
								)

						--DECREMENT AMOUNT
						UPDATE [WhiskyJapan].[dbo].[ProductxStore]
						   SET [aumount] = [aumount] - @amountProduct_
						 WHERE [id_store] = @idStore_ AND [id_product] = @idProduct_

						UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount] = [amount] - @amountProduct_
						 WHERE [id_product] = @idProduct_

						 UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount_purchase] = [amount_purchase] + @amountProduct_
						 WHERE [id_product] = @idProduct_

						 --ACT SUBTOTAL AND TOTAL
						UPDATE [WhiskyClubCentral].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
						--CENTRAL
						UPDATE [WhiskyJapan].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
					END
				ELSE --NO EXIST AMOUNT OF PRODUCT
					BEGIN
						--INSERT INTO ERRORS TABLE
						INSERT INTO @errorTable VALUES (@idProduct_, @amountProduct_)

						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 (SELECT [price_product]*@moneyEquivalence_cliente FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @amountProduct_,
								 0,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'canceled',
								 @money_client
								)
					END


				SELECT @cursorProducts = MIN(idCursor) FROM @products WHERE idCursor > @cursorProducts--INDEX ++
			END--END WHILE

			--RETORNAR ERRORES
			UPDATE @results SET purchase_total = (SELECT total FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase]=@lastPurchase_id)
			
			--ACT STATUS
			IF (SELECT subtotal FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase]=@lastPurchase_id) = 0
				BEGIN
				--central
				UPDATE [WhiskyClubCentral].[dbo].[purchase]
				   SET [status_purchase] = 3
				 WHERE [id_purchase]=@lastPurchase_id
				 --us
				 UPDATE [WhiskyJapan].[dbo].[purchase]
				   SET [status_purchase] = 3
				 WHERE [id_purchase]=@lastPurchase_id
				END
			
			SELECT * FROM @results
			RETURN 0;

		END--END JAPAN

	--US--------------------------------------------------------------------------------------------
	IF (@idStore_ = 7 OR @idStore_ = 8 OR @idStore_ = 9)
		BEGIN
			--GENERATE PURCHASE LOCAL GERMNANY
			INSERT INTO [WhiskyUS].[dbo].[purchase] SELECT * FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase] = @lastPurchase_id

			--INIT CYCLE FOR PRODUCTS
			SELECT @cursorProducts = MIN(idCursor) FROM @products
			WHILE @cursorProducts IS NOT NULL
			BEGIN
				--INFO
				SELECT @amountProduct_ = quantity,
					   @idProduct_ = idProduct 
					   FROM @products WHERE @cursorProducts = idCursor

				--VERIFY QUANTITY
				IF (SELECT [aumount] FROM [WhiskyUS].[dbo].[ProductxStore] WHERE [id_product] = @idProduct_ AND [id_store] = @idStore_) >= @amountProduct_
					BEGIN
						--PRICE OF PRODUCT
						SELECT @priceProduct_ = [price_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_
						--SUBTOTAL
						SET @subtotal_ = (@priceProduct_ * @amountProduct_) * @moneyEquivalence_cliente

						--GENERATE LINE OF FACT
						INSERT INTO [WhiskyClubCentral].[dbo].[purchaseXProduct]
								   ([id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   (@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)


						--INSERT LOCAL
						INSERT INTO [WhiskyUS].[dbo].[purchaseXProduct]
								   ([id_purchaseXProduct]
								   ,[id_purchase]
								   ,[id_product]
								   ,[amount]
								   ,[subtotal])
							 VALUES
								   ((SELECT MAX([id_purchaseXProduct]) FROM [WhiskyClubCentral].[dbo].[purchaseXProduct])
								   ,@lastPurchase_id
								   ,@idProduct_
								   ,@amountProduct_
								   ,@subtotal_)
						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @priceProduct_,
								 @amountProduct_,
								 @subtotal_,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'Processed',
								 @money_client
								)

						--DECREMENT AMOUNT
						UPDATE [WhiskyUS].[dbo].[ProductxStore]
						   SET [aumount] = [aumount] - @amountProduct_
						 WHERE [id_store] = @idStore_ AND [id_product] = @idProduct_

						 --DECREMENT AMOUNT GENERAL
						UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount] = [amount] - @amountProduct_
						 WHERE [id_product] = @idProduct_

						 UPDATE [WhiskyClubCentral].[dbo].[Product]
						   SET [amount_purchase] = [amount_purchase] + @amountProduct_
						 WHERE [id_product] = @idProduct_

						 --ACT SUBTOTAL AND TOTAL
						UPDATE [WhiskyClubCentral].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
						--CENTRAL
						UPDATE [WhiskyUS].[dbo].[purchase]
							SET 
								 [subtotal] = [subtotal] + @subtotal_
								,[total] = [total] + @subtotal_
							WHERE [id_purchase] = @lastPurchase_id
					END
				ELSE --NO EXIST AMOUNT OF PRODUCT
					BEGIN
						--INSERT INTO ERRORS TABLE
						INSERT INTO @errorTable VALUES (@idProduct_, @amountProduct_)

						--ADD TO RESULT 
						INSERT INTO @results VALUES
								(@cursorProducts, 
								 @lastPurchase_id,
								 (SELECT [name_client] FROM [WhiskyClubCentral].[dbo].[Client] WHERE [id_client] = @idClient_),
								 (SELECT [name_store] FROM [WhiskyClubCentral].[dbo].[Store] WHERE [id_store] = @idStore_),
								 (SELECT [name_product] FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 (SELECT [price_product]*@moneyEquivalence_cliente FROM [WhiskyClubCentral].[dbo].[Product] WHERE [id_product] = @idProduct_),
								 @amountProduct_,
								 0,
								 0,
								 @shippingPrice,
								 (SELECT [name_subscription] FROM [WhiskyClubCentral].[dbo].[CatalogSubscription] WHERE [id_subscription] = @sub_client),
								 'canceled',
								 @money_client
								)
					END


				SELECT @cursorProducts = MIN(idCursor) FROM @products WHERE idCursor > @cursorProducts
			END--END WHILE

			--RETORNAR ERRORES
			UPDATE @results SET purchase_total = (SELECT total FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase]=@lastPurchase_id)
			
			--ACT STATUS
			IF (SELECT subtotal FROM [WhiskyClubCentral].[dbo].[purchase] WHERE [id_purchase]=@lastPurchase_id) = 0
				BEGIN
				--central
				UPDATE [WhiskyClubCentral].[dbo].[purchase]
				   SET [status_purchase] = 3
				 WHERE [id_purchase]=@lastPurchase_id
				 --us
				 UPDATE [WhiskyUS].[dbo].[purchase]
				   SET [status_purchase] = 3
				 WHERE [id_purchase]=@lastPurchase_id
				END


			SELECT * FROM @results
			RETURN 0;

		END--END US

RETURN @error
END
GO


