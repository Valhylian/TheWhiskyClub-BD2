USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[loadReviews]    Script Date: 6/21/2022 1:24:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[loadReviews]
@idProduct_ INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	--PRODUCT EXIST?
	IF (SELECT COUNT(*) FROM [dbo].[Product] WHERE [id_product] = @idProduct_ AND [status] = 1) = 0
		BEGIN
			SET @error = 2 --product not exist
			PRINT @error
			RETURN @error
		END

		--SELECT REVIEWS
		SELECT [id_productReview]
			  ,[productReview_client]
			  ,[review]
			  ,[date_review]
			  ,[product_review]
			  ,[name_client]
		  FROM [dbo].[productReview] 
		  INNER JOIN [dbo].[Client] ON [id_client] = [productReview_client]
		  WHERE [product_review]=@idProduct_


print @error;
RETURN @error
END
GO


