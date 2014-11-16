/*
	First request: Marks per order, where students are Emploeyees
*/
SELECT A0_Order.Order_ID, A0_Order.Mark from A0_Order
	WHERE A0_Order.Employee_ID IN (SELECT A0_Employee.Employee_ID FROM A0_Employee WHERE A0_Employee.Spec = 'student')


/*
	Employee_ID who do not have contracts
*/
SELECT A0_Employee.Employee_ID FROM A0_Employee 
	WHERE A0_Employee.Employee_ID NOT IN (SELECT A0_Order.Employee_ID FROM A0_Order)

/*
	Second request: Employees who still do not have any orders
*/
SELECT A0_Person.Last_Name FROM A0_Person 
	WHERE A0_Person.Person_ID IN (
		SELECT A0_Employee.Person_ID FROM A0_Employee 
			WHERE A0_Employee.Employee_ID NOT IN (
				SELECT A0_Order.Employee_ID FROM A0_Order))

/*
	Third request: Order list (Service Name, Time, Employee, Pet, Owner)
*/
SELECT A0_Service.Name, A0_Order.Time_Order, person1.Last_Name as EmployeeName, A0_Pet.Nick, person2.Last_Name AS OwnerName 
 FROM A0_Person as person1
	JOIN A0_Employee ON  A0_Employee.Person_ID   = person1.Person_ID
	JOIN A0_Order    ON  A0_Employee.Employee_ID = A0_Order.Employee_ID
	JOIN A0_Pet      ON  A0_Order.Pet_ID         = A0_Pet.Pet_ID
	JOIN A0_Owner    ON  A0_Pet.Owner_ID         = A0_Owner.Owner_ID
	JOIN A0_Service  ON  A0_Service.Service_ID   = A0_Order.Service_ID
	JOIN A0_Person as person2 ON A0_Owner.Person_ID = person2.Person_ID

/*
	Fouth request: Collect all comments/descriptions
*/
SELECT '1' as Class, A0_Order.Comments FROM A0_Order
UNION
SELECT '2', A0_Employee.Spec FROM A0_Employee
UNION
SELECT '3', A0_Owner.Description FROM A0_Owner