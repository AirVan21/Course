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