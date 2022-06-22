USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[Consult_Clients]    Script Date: 6/21/2022 7:11:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--CONSULT CLIENTS BY PARAMETERS
CREATE PROCEDURE [dbo].[Consult_Clients]
@name_client_ VARCHAR(128),
@id_pais_ INT,
@id_subs_ INT,
@fristDate DATE,
@lastDate DATE
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_client_ INT,
	@name_client VARCHAR(128),
	@mail_client_ VARCHAR(128),
	@location_client VARCHAR(MAX),
	@subs_client_ varchar(128),
	@name_country varchar(128),
	@amount_purchases INT,
	@mount_shipping_ FLOAT,
	@mount_purchases_ FLOAT,
	@cursor INT
	SET @error = 0

DECLARE @result TABLE
	(id_client INT,
	 name_client VARCHAR(128),
	 email_client VARCHAR(128),
	 name_subscription VARCHAR(128),
	 name_Country VARCHAR(128),
	 location_client VARCHAR(128),
	 amount_purchases INT,
	 mount_shipping_ FLOAT,
	 mount_purchases_ FLOAT)

	SELECT @cursor = MIN([id_client]) FROM [dbo].[Client]
	WHILE @cursor IS NOT NULL
		BEGIN
			SET @id_client_ = NULL
			SELECT @id_client_ = [id_client]
			  ,@name_client = [name_client]
			  ,@mail_client_= [email_client]
			  ,@subs_client_ = [name_subscription]
			  ,@name_country = [name_Country]
			  ,@location_client = [location_clientText]
		  FROM [dbo].[Client]
		  INNER JOIN [dbo].[CatalogCountry] ON [id_Country] = [country_client]
		  INNER JOIN [dbo].[CatalogSubscription] ON [id_subscription] = [subscription_client]
		  WHERE (( [name_client] LIKE '%'+@name_client_+'%') OR (@name_client_ = '')) --BY NAME
		  AND [id_client] = @cursor
		  AND ([country_client] = @id_pais_ OR @id_pais_ = 0)						--BY COUNTRY
		  AND (@id_subs_ = [subscription_client] OR @id_subs_ = 0 OR @id_subs_ = '')					--BY SUBS

		  IF (@id_client_ IS NOT null)
			BEGIN
			 SELECT @amount_purchases = COUNT(*) FROM [dbo].[purchase] 
						WHERE [client_purchase] = @id_client_
						AND (
						(([date_purchase] BETWEEN @fristDate AND @lastDate) OR (@fristDate = '' OR @lastDate = '')) --BOTH DATES
						OR
						(([date_purchase] >= @fristDate ) OR (@fristDate = '')) --FIRST DATE
						OR
						(([date_purchase] <= @lastDate ) OR (@lastDate = '')) --LAST DATE
						)
			 SELECT @mount_shipping_ = SUM([shipping]) FROM [dbo].[purchase] 
						where [client_purchase] = @id_client_
						AND (
						(([date_purchase] BETWEEN @fristDate AND @lastDate) OR (@fristDate = '' OR @lastDate = '')) --BOTH DATES
						OR
						(([date_purchase] >= @fristDate ) OR (@fristDate = '')) --FIRST DATE
						OR
						(([date_purchase] <= @lastDate ) OR (@lastDate = '')) --LAST DATE
						)
			 SELECT @mount_purchases_ = SUM([total]) FROM [dbo].[purchase] 
						where [client_purchase] = @id_client_
						AND (
						(([date_purchase] BETWEEN @fristDate AND @lastDate) OR (@fristDate = '' OR @lastDate = '')) --BOTH DATES
						OR
						(([date_purchase] >= @fristDate ) OR (@fristDate = '')) --FIRST DATE
						OR
						(([date_purchase] <= @lastDate ) OR (@lastDate = '')) --LAST DATE
						)
			END

			IF (@id_client_ IS NOT NULL)
				BEGIN
					INSERT INTO @result VALUES(@id_client_
										,@name_client
										,@mail_client_
										,@subs_client_
										,@name_country
										,@location_client
										,@amount_purchases
										,@mount_shipping_
										,@mount_purchases_)
				END
			

		SELECT @cursor = MIN([id_client]) FROM [dbo].[Client] WHERE [id_client]>@cursor
		END
	

	SELECT * FROM @result

print @error;
RETURN @error
END
GO


