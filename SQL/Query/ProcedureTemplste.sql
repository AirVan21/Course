-----------------------------------
---  MS SQL Procedure Tutorial  ---
-----------------------------------

/*
	How long have temporary Employees been working in each Department?

	(Print Surnames, appropriate Departments, Experience in Month)
*/

SELECT A2_Employee.Second_Name, A2_Department.Department_Name, DATEDIFF(MONTH, A2_Contract.Start_Date, GETDATE()) AS Experience FROM A2_Department 
	JOIN A2_Contract ON A2_Department.Department_ID = A2_Contract.Department_ID
		JOIN A2_Employee ON A2_Contract.Employee_ID = A2_Employee.Employee_ID
			WHERE A2_Contract.IsTemporary = 1
/*
	Description:
	Procedure, which update contract information for temporary employee after defined time period.
	
	Impact:
	Contract mark 'IsTemporary' will be set to 0. Contract 'End_Date' will ne set to 'NULL'. 
*/

CREATE PROCEDURE TransferToStaff
	@var_experience_month INT,
	@var_department_name  VARCHAR(30)
AS 
BEGIN
	UPDATE A2_Contract SET IsTemporary = 0, End_Date = 'NULL'
		WHERE A2_Contract.Contract_ID IN (SELECT A2_Contract.Contract_ID FROM A2_Contract 
											WHERE DATEDIFF(MONTH, A2_Contract.Start_Date, GETDATE()) > @var_experience_month)
			AND	A2_Contract.Department_ID IN (SELECT A2_Department.Department_ID FROM A2_Department
												WHERE A2_Department.Department_Name = @var_department_name)
END

-- Execute Procedure with input parameters --

EXECUTE TransferToStaff @var_experience_month = 12, @var_department_name = 'Machine Learning'

-- Check, that answer on this request (was called earlier on a first-step test) is another --

SELECT A2_Employee.Second_Name, A2_Department.Department_Name, DATEDIFF(MONTH, A2_Contract.Start_Date, GETDATE()) AS Experience FROM A2_Department 
	JOIN A2_Contract ON A2_Department.Department_ID = A2_Contract.Department_ID
		JOIN A2_Employee ON A2_Contract.Employee_ID = A2_Employee.Employee_ID
			WHERE A2_Contract.IsTemporary = 1

/*
	Used:
		- Two Different type input for variables
		- Update in a procedure
		- Two 'SELECT' to Different tables
		- Transact-SQL DATE - functions 
*/