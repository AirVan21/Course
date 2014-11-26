/*
	Pets amount by Age
*/
SELECT A0_Pet.Age, COUNT(*) FROM A0_Pet GROUP BY A0_Pet.Age

/*
	Pets amount by age 1
*/

SELECT A0_Pet_Type.Name, A0_Pet.Age, COUNT(*) FROM A0_Pet 
											  JOIN A0_Pet_Type ON A0_Pet_Type.Pet_Type_ID = A0_Pet.Pet_Type_ID
													GROUP BY A0_Pet.Age, A0_Pet_Type.Name
/*
	Pets amount by age 2
*/

SELECT A0_Pet.Age, A0_Pet_Type.Name, COUNT(*) FROM A0_Pet 
											  JOIN A0_Pet_Type ON A0_Pet_Type.Pet_Type_ID = A0_Pet.Pet_Type_ID
													GROUP BY A0_Pet.Age, A0_Pet_Type.Name
														ORDER BY A0_Pet.Age

/*
	Pet types wit age <= 6
*/

SELECT A0_Pet_Type.Name, AVG(CAST (A0_Pet.Age as DECIMAL)) FROM A0_Pet
											  JOIN A0_Pet_Type ON A0_Pet_Type.Pet_Type_ID = A0_Pet.Pet_Type_ID
												  GROUP BY A0_Pet_Type.Name
													HAVING AVG(CAST (A0_Pet.Age as DECIMAL)) < 6

/*
	Employee surnames
*/

SELECT A0_Person.Last_Name from A0_Order, A0_Employee, A0_Person
								WHERE A0_Order.Employee_ID = A0_Employee.Employee_ID 
								AND A0_Employee.Person_ID = A0_Person.Person_ID
									GROUP BY A0_Person.Last_Name
									HAVING COUNT(*) > 5

