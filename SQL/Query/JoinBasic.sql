----------------------------------
----       JOIN Tutorial      ----
----------------------------------

/* 
	Select Name, Surname, Phone Numbers of Employess who work in 'Machine Learning' Department
*/
SELECT A2_Employee.First_Name, A2_Employee.Second_Name, A2_Employee.Phone_Number FROM A2_Contract 
							                                                       JOIN A2_Employee ON A2_Contract.Employee_ID = A2_Employee.Employee_ID
																				   JOIN A2_Department ON A2_Contract.Department_ID = A2_Department.Department_ID
																				     WHERE A2_Department.Department_Name = 'Machine Learning' 