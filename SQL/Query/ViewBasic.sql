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