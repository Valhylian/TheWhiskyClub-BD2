USE [WhiskyClubCentral]
GO

/****** Object:  StoredProcedure [dbo].[resolveEmployeeReport]    Script Date: 6/21/2022 1:22:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[resolveEmployeeReport]
@id_report_ INT,
@goodPoints_ INT,
@badPoints_ INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@idEmploye_ INT
	SET @error = 0

DECLARE @result TABLE
	(id_employee INT,
	 name_employee VARCHAR(128),
	 job_employee INT,
	 nameJob VARCHAR(128),
	 baseSalaryJob MONEY,
	 nameDepartment VARCHAR(128),
	 department_employee INT,
	 store_employee INT,
	 store_name Varchar(128),
	 status_employee BIT,
	 salary MONEY,
	 score INT,
	 active BIT,
	 badScore INT,
	 moneyType VARCHAR(128),
	 equivalent FLOAT,
	 salaryEqu MONEY)

	--CONSULT
	SELECT @idEmploye_ = employee_review  FROM OPENQUERY(MYSQL, 'SELECT `employee_review`.`id_review`,
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
															WHERE id_review = @id_report_

	--SELECT EMPLOYEE AND COMPRARE VALUES (IF REPEAT = ERROR)
     INSERT INTO @result EXEC [dbo].[Consult_employeeXID] @id_employee = @idEmploye_

	--ACT EMPLOYEE
	--UPDATE GOODSCORE
	IF ((SELECT score FROM @result) != (@goodPoints_ + (SELECT score FROM @result)))  
		BEGIN
			UPDATE OPENQUERY(MYSQL,'SELECT id_employee,score FROM employee')
				SET score = (@goodPoints_ + (SELECT score FROM @result))
				WHERE id_employee = @idEmploye_
		END
	--UPDATE GOODSCORE
	IF ((SELECT badScore FROM @result) != (@badPoints_ + (SELECT badScore FROM @result)))  
		BEGIN
			UPDATE OPENQUERY(MYSQL,'SELECT id_employee,badScore FROM employee')
				SET badScore = (@badPoints_ + (SELECT badScore FROM @result))
				WHERE id_employee = @idEmploye_
		END

	--ACT REVIEW
	UPDATE OPENQUERY(MYSQL,'SELECT id_review, status_review FROM employee_review')
				SET status_review = 2
				WHERE id_review = @id_report_
print @error;
RETURN @error
END
GO


