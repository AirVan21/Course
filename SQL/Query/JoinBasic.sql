----------------------------------
----       JOIN Tutorial      ----
----------------------------------

/* 
	Select Name, Surname, Phone Numbers of Employees who work in 'Machine Learning' Department
*/

SELECT A2_Employee.First_Name, A2_Employee.Second_Name, A2_Employee.Phone_Number FROM A2_Contract 
							                                                         JOIN A2_Employee ON A2_Contract.Employee_ID = A2_Employee.Employee_ID
																				     JOIN A2_Department ON A2_Contract.Department_ID = A2_Department.Department_ID
																				         WHERE A2_Department.Department_Name = 'Machine Learning' 
/*
	Shows different Position Name (all existing, because RIGHT JOIN) and shows Salary (NOT NULL if there is somebody working on this position)
	
	P.S.

	Added extra raws for more interesting result

	INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (10, 'Scrum Master', 'Set project timeplan')
	INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (11, 'Line Manager', 'Manage department structure') 

*/

SELECT DISTINCT A2_Position.Position_Name, A2_Post_List.Salary FROM A2_Post_List 
																	RIGHT JOIN A2_Position ON A2_Post_List.Position_ID = A2_Position.Position_ID
																		ORDER BY A2_Post_List.Salary DESC

/*
	Find out amount of Empoloyees, who are Testers AND where born After '1970-01-01'
*/

SELECT COUNT(A2_Employee.Employee_ID) FROM A2_Contract
											JOIN A2_Employee ON A2_Contract.Employee_ID = A2_Employee.Employee_ID
											JOIN A2_Position ON A2_Contract.Position_ID = A2_Position.Position_ID
												WHERE A2_Position.Position_Name LIKE '%Tester' 
													AND A2_Employee.Birth_Date > '1970-01-01'
/*
	Find out amount of Employees in every Department
*/

SELECT A2_Department.Department_Name, COUNT(A2_Contract.Employee_ID) FROM A2_Contract, A2_Department
																	      	WHERE A2_Contract.Department_ID = A2_Department.Department_ID
																	      		GROUP BY A2_Department.Department_Name

/*
	Show for all permanent Employees their Name, Surname and Department e-mail 
*/

SELECT A2_Employee.First_Name, A2_Employee.Second_Name, A2_Department.Department_Email FROM A2_Contract, A2_Employee, A2_Department
																					  		WHERE A2_Contract.Employee_ID = A2_Employee.Employee_ID
																					  			AND   A2_Contract.Department_ID = A2_Department.Department_ID
																					  			AND A2_Contract.IsTemporary = 0
																					  		
