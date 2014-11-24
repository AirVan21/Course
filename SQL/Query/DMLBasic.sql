----------------------------------
---        DML  Tutorial       ---
----------------------------------


/*
	Adding record to A2_Employee Table
*/

INSERT INTO A2_Employee (Employee_ID, First_Name, Second_Name, Birth_Date, Phone_Number)
						(SELECT MAX(A2_Employee.Employee_ID) + 1, 'Elena', 'Dzagoeva', '1985-11-14', '89613421488' FROM A2_Employee)

-- Using Extended Syntax --

INSERT INTO A2_Employee (Employee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES 
                        ((SELECT MAX(A2_Employee.Employee_ID) + 1 FROM A2_Employee), 'Evgeniy', 'Chuprov', '1977-5-23', '89123145548')

/*
	Update Phone Number for Boris Rubin
*/

UPDATE A2_Employee SET Phone_Number = '89115899999'
	WHERE (A2_Employee.First_Name = 'Boris' AND A2_Employee.Second_Name = 'Rubin')

/*
	Update Contract End Dates(roll over for 3 months) for Temporary Employees
*/

-- It could be written without SubQuery (write 'WHERE A2_Contract.IsTemporary = 1'),
-- but this query if for example 

UPDATE A2_Contract SET End_Date = DATEADD(month, 3, A2_Contract.End_Date)
	WHERE A2_Contract.Contract_ID IN (SELECT A2_Contract.Contract_ID FROM A2_Contract
	 										WHERE A2_Contract.IsTemporary = 1)
/*
	Delete records about positions, which are not represented in Post Lists (Nobody working on these positions)
*/

DELETE FROM A2_Position
	WHERE A2_Position.Position_ID NOT IN (SELECT DISTINCT A2_Post_List.Position_ID FROM A2_Post_List)

/*
	Cascade delete. (Deleting Employee and Cascade delete all related records in Contract Table)

	Using A2_Contract table as a Main Table
	Using A2_Employee talbe as a Dependent Table
*/

-- Dropping old Constraint --

ALTER TABLE A2_Contract DROP CONSTRAINT FK_A2_Contract_Employee 

-- Adding Delete Cascade Constraint --

ALTER TABLE A2_Contract ADD CONSTRAINT FK_A2_Contract_Employee 
    FOREIGN KEY (Employee_ID)
    	REFERENCES A2_Employee(Employee_ID) ON DELETE CASCADE

-- Check existance of records, which should be cascade deleted (in A2_Contract) --
SELECT A2_Contract.Contract_ID, A2_Contract.Start_Date FROM A2_Contract
	WHERE A2_Contract.Employee_ID = (SELECT A2_Employee.Employee_ID FROM A2_Employee
										WHERE A2_Employee.Second_Name = 'Berdskaya')
-- DELETE Employee --

DELETE FROM A2_Employee
	WHERE A2_Employee.Second_Name = 'Berdskaya'

--	No info about A2_Contract Records in A2_Contract (checked) --