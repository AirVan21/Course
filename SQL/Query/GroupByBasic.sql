----------------------------------
----    GROUP BY Tutorial     ----
----------------------------------

/*
	Finds how many Employees are working on specific position
	(Ordering by most popular position)

	- ORDER BY is used
*/

SELECT A2_Position.Position_Name, COUNT(*) AS 'Amount'  FROM A2_Contract
										   JOIN A2_Employee ON A2_Contract.Employee_ID = A2_Employee.Employee_ID
										   JOIN A2_Position ON A2_Contract.Position_ID = A2_Position.Position_ID
												GROUP BY A2_Position.Position_Name
													ORDER BY Amount DESC

/*
	Finds amount of Working Contracts assigned to specific Department

	- JOIN is used
*/

SELECT A2_Department.Department_Name, COUNT(A2_Contract.Contract_ID) AS 'Contract_Amount' FROM A2_Department
																	 JOIN A2_Contract ON A2_Department.Department_ID = A2_Contract.Department_ID
																	 	GROUP BY A2_Department.Department_Name 
/*
	Finds Average Salary per Position for Employees, who work more than 20 hours per week

	- HAVING is used
*/

SELECT A2_Position.Position_Name, AVG(A2_Post_List.Salary) FROM A2_Position, A2_Post_List
														   WHERE A2_Position.Position_ID = A2_Post_List.Position_ID
																GROUP BY A2_Position.Position_Name, A2_Post_List.Salary, A2_Post_List.Work_Hours
																	HAVING A2_Post_List.Work_Hours > 20 
/*
	Select Employees who are older than 40

	- DATETIME functions from Transact-SQL are used
*/

SELECT A2_Employee.First_Name, A2_Employee.Second_Name, A2_Employee.Birth_Date FROM A2_Employee
                                                                               WHERE DATEDIFF(YEAR, A2_Employee.Birth_Date, GETDATE()) > 40
/*
	Select first Letter of the First_Name, Surname and last 4 digit of Phone Number for Temporary Employees

	- STRING function from Transact-SQL is used
*/

SELECT DISTINCT SUBSTRING(A2_Employee.First_Name, 1, 1) as 'Name', A2_Employee.Second_Name, SUBSTRING(A2_Employee.Phone_Number, 8, 4) as 'Phone' FROM A2_Employee
																		JOIN A2_Contract ON A2_Employee.Employee_ID = A2_Contract.Employee_ID
																			WHERE A2_Contract.IsTemporary = 1



