----------------------------------
--  SELECT (Advanced) Tutorial  --
----------------------------------

/*
	Select Phone Numbers of Employees who are not in 'Software Engineering' department
	
	IN, NOT IN - are used
*/

-- Find 'Software Engineering' department ID --
SELECT A2_Department.Department_ID FROM A2_Department
	WHERE A2_Department.Department_Name = 'Software Engineering'

-- Find Employee_ID of Employees who are not in 'Software Engineering' department ID --
SELECT A2_Contract.Employee_ID FROM A2_Contract
	WHERE A2_Contract.Department_ID NOT IN (
		SELECT A2_Department.Department_ID FROM A2_Department
			WHERE A2_Department.Department_Name = 'Software Engineering')

-- Summarize --
SELECT A2_Employee.Phone_Number FROM A2_Employee
	WHERE A2_Employee.Employee_ID IN (
		SELECT A2_Contract.Employee_ID FROM A2_Contract
			WHERE A2_Contract.Department_ID NOT IN (
				SELECT A2_Department.Department_ID FROM A2_Department
					WHERE A2_Department.Department_Name = 'Software Engineering'))
/*
	Select different Title of Positions of Employees who ears more than average salary
	
	>= - is used
*/

-- Calculating Average salary --
SELECT AVG(A2_Post_List.Salary) FROM A2_Post_List

-- Summarize --
SELECT DISTINCT A2_Position.Position_Name, A2_Post_List.Salary FROM A2_Position
	JOIN A2_Post_List ON A2_Post_List.Position_ID = A2_Position.Position_ID
		WHERE  A2_Post_List.Salary >= (SELECT AVG(A2_Post_List.Salary) FROM A2_Post_List)

/*
	Select All NOT NULL DATA fields from DB
	
	UNION, SELECT after FROM (and pseudonym for it) - are used 
*/

SELECT Dates FROM (SELECT A2_Contract.Start_Date AS Dates FROM A2_Contract
						UNION 
				   SELECT A2_Contract.End_Date FROM A2_Contract
						UNION 
				   SELECT A2_Employee.Birth_Date FROM A2_Employee) A2_Dates
	WHERE Dates IS NOT NULL

/*
	Select Permanent Employees who are older than All Temporary Employees 

	ALL, < - are used
*/

-- Find Birth dates of Temporary Employees --
SELECT DISTINCT A2_Employee.Birth_Date FROM A2_Employee
	JOIN A2_Contract ON A2_Employee.Employee_ID = A2_Contract.Employee_ID
		WHERE A2_Contract.IsTemporary = 1

-- Summarize --
SELECT A2_Employee.First_Name, A2_Employee.Second_Name, A2_Employee.Birth_Date FROM A2_Contract, A2_Employee
	WHERE A2_Contract.Employee_ID = A2_Employee.Employee_ID 
		AND A2_Employee.Birth_Date < ALL (SELECT DISTINCT A2_Employee.Birth_Date FROM A2_Employee
											JOIN A2_Contract ON A2_Employee.Employee_ID = A2_Contract.Employee_ID
												WHERE A2_Contract.IsTemporary = 1) 


