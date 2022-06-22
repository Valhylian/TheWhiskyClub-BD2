USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[Consult_Clients]    Script Date: 6/21/2022 7:11:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--CONSULT CLIENTS BY PARAMETERS
ALTER PROCEDURE [dbo].[Consult_PurchaseXClient]
@id_client_ INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	SELECT [id_purchase]
		  ,[client_purchase]
		  ,[date_purchase]
		  ,[purchase].[location_client]
		  ,[name_client]
		  ,[subtotal]
		  ,[shipping]
		  ,[total]
		  ,[id_PurchasingManager]
		  ,[id_Dealer]
		  ,[status_purchase]
		  ,[distance]
		  ,[moneyType]
		  ,[store]
	  FROM [dbo].[purchase] 
	  INNER JOIN [dbo].[Client] ON [id_client] = @id_client_
	  WHERE @id_client_ = [client_purchase]

print @error;
RETURN @error
END
GO


