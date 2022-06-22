USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[generateReview]    Script Date: 6/21/2022 1:26:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[generateReview]
@idProduct_ INT,
@idClient_ INT,
@review text
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	--CLIENT EXIST?
	IF (SELECT COUNT(*) FROM Client WHERE [id_client] = @idClient_ AND [status_client] = 1) = 0
		BEGIN
			SET @error = 1 --client not exist
			PRINT @error
			RETURN @error
		END

	--PRODUCT EXIST?
	IF (SELECT COUNT(*) FROM [dbo].[Product] WHERE [id_product] = @idProduct_ AND [status] = 1) = 0
		BEGIN
			SET @error = 2 --product not exist
			PRINT @error
			RETURN @error
		END

	--ADD REVIEW
	INSERT INTO [dbo].[productReview]
				([productReview_client]
				,[review]
				,[date_review]
				,[product_review])
			VALUES
				(@idClient_
				,@review
				,getdate()
				,@idProduct_)
print @error;
RETURN @error
END
GO


