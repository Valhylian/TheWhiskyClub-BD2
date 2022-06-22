USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[loadClientInfoReport]    Script Date: 6/21/2022 1:24:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[loadClientInfoReport]
@report_id_ INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0


	--ADD REVIEW
	SELECT *, DATEADD(dd, 0, DATEDIFF(dd, 0, date_review)) as dateR  FROM OPENQUERY(MYSQL, 'SELECT `employee_review`.`id_review`,
															`employee_review`.`employee_review`,
															`employee_review`.`info_review`,
															`employee_review`.`status_review`,
															`employee_review`.`client_review`,
															`employee_review`.`date_review`,
															descriptionReview,
															name_employee,
															name_deparment,
															name_job
														FROM `whiskyclub_employees`.`employee_review`
														INNER JOIN catalog_status_review ON status_review = idStatus
														INNER JOIN employee ON id_employee = employee_review
														INNER JOIN catalog_department ON department_employee = id_department
														INNER JOIN catalog_job ON job_employee = id_job')
														INNER JOIN [dbo].[Client] ON client_review = [id_client]
														WHERE id_review = @report_id_
print @error;
RETURN @error
END
GO


