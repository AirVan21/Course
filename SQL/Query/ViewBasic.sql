----------------------------------
----      VIEW  Tutorial      ----
----------------------------------

/*
	Creates V_CONTACT_INFO view where gathered all information, 
	which could be helpful if you need to contact a person

*/

-- Creates VIEW --

CREATE VIEW V_CONTACT_INFO 
	AS SELECT A2_Employee.First_Name, A2_Employee.Second_Name,  A2_Employee.Phone_Number, A2_Department.Department_Name, A2_Department.Department_Email FROM A2_Employee
		JOIN A2_Contract ON A2_Contract.Employee_ID = A2_Employee.Employee_ID
		JOIN A2_Department ON A2_Department.Department_ID = A2_Contract.Department_ID

-- Send to Department an e-mail with information about Employees from Softwre Department, who are using MTS Mobile operator --

SELECT First_Name, Second_Name as Surname, Department_Name FROM V_CONTACT_INFO
	WHERE Phone_Number LIKE('8912%') AND Department_Name = 'Software Engineering'
		ORDER BY Surname

-- Update (&Check) Deparment e-mail for 'Machine-Learning' department --

UPDATE V_CONTACT_INFO SET Department_Email = 'ml.dep@gmail.com'
	WHERE Department_Email = 'machine_learning.dep@gmail.com'

SELECT Department_Email FROM V_CONTACT_INFO

/*
	Create V_TEMP_EMPLOYEE view where gathered information,
	about Temporary Employees
*/

-- Creates VIEW --

CREATE VIEW V_TEMP_EMPLOYEE
	AS SELECT A2_Employee.First_Name, A2_Employee.Second_Name, A2_Employee.Birth_Date, A2_Contract.Start_Date, A2_Contract.End_Date FROM A2_Employee, A2_Contract
		WHERE A2_Contract.Employee_ID = A2_Employee.Employee_ID AND A2_Contract.IsTemporary = 1

-- Prolong Contract with Temporary Employees for 2 months

UPDATE A2_Contract SET End_Date = DATEADD(month, 3, End_Date)

/*
	Create V_POSITION_RATING to monitor most paid positions
*/

-- Creates VIEW --

CREATE VIEW V_POSITION_RATING
	AS SELECT A2_Position.Position_Name, A2_Post_List.Salary, A2_Post_List.Work_Hours, (CAST(A2_Post_List.Salary / A2_Post_List.Work_Hours AS DECIMAL)) AS Payment_Hour FROM A2_Post_List
		JOIN A2_Position ON A2_Post_List.Position_ID = A2_Position.Position_ID
			GROUP BY A2_Position.Position_Name, A2_Post_List.Salary, A2_Post_List.Work_Hours

-- Show top 5 most paid postions --

SELECT TOP 5 Position_Name, Payment_Hour FROM V_POSITION_RATING
	ORDER BY Payment_Hour DESC