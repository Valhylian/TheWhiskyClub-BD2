USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[generateEmployeeReport]    Script Date: 6/21/2022 1:25:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[generateEmployeeReport]
@idEmployee_ INT,
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

	--EMPLOYEE EXIST?
	IF (SELECT COUNT(*) FROM OPENQUERY(MYSQL, 'SELECT * FROM employee') WHERE id_employee = @idEmployee_ AND active = 1) = 0
		BEGIN
			SET @error = 2 --product not exist
			PRINT @error
			RETURN @error
		END

	--ADD REVIEW
	INSERT INTO  OPENQUERY(MYSQL, 'SELECT 
							`employee_review`.`employee_review`,
							`employee_review`.`info_review`,
							`employee_review`.`status_review`,
							`employee_review`.`client_review`,
							`employee_review`.`date_review`
						FROM `whiskyclub_employees`.`employee_review`;') 
			VALUES
				(@idEmployee_
				,@review
				,1
				,@idClient_
				,GETDATE())
print @error;
RETURN @error
END
GO


