----------------------------------
--  SELECT (Advanced) Tutorial  --
----------------------------------

/*
	Select Phone Numbers of Employees who are not in 'Software Engineering' department
*/

-- Find 'Software Engineering' department ID --
SELECT A2_Department.Department_ID FROM A2_Department
	WHERE A2_Department.Department_Name = 'Software Engineering'

-- Find Employee_ID of Employees who are not in 'Software Engineering' department ID --\
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
*/

-- Calculating Average salary --
SELECT AVG(A2_Post_List.Salary) FROM A2_Post_List

-- Summarize --
SELECT DISTINCT A2_Position.Position_Name, A2_Post_List.Salary FROM A2_Position
	JOIN A2_Post_List ON A2_Post_List.Position_ID = A2_Position.Position_ID
		WHERE  A2_Post_List.Salary >= (SELECT AVG(A2_Post_List.Salary) FROM A2_Post_List)