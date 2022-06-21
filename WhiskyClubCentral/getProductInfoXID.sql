USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[getProductInfoXID]    Script Date: 6/20/2022 11:14:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getProductInfoXID] @idProduct INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT

		SELECT *, [name_Distillery], [description_Container],[name_ProductType]
		  FROM [dbo].[Product]
		  INNER JOIN [dbo].[CatalogDistillery] ON [id_Distillery] = [distillery_product]
		  INNER JOIN [dbo].[CatalogContainer] ON [container_product] = [id_Container]
		  INNER JOIN [dbo].[CatalogProductType] ON [type_product] = [id_ProductType]
		  WHERE @idProduct = id_product

	
print @error;
RETURN @error
END
GO


