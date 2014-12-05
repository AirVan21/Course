----------------------------------
---    DML Tutorial (part 2)   ---
----------------------------------

/* 
	Create Index, which contains Employee Postion names
*/

CREATE INDEX IND_POSITION_NAME ON A2_Position (Position_Name)

/*
	Create Index which contains Eployees Name and Surname (really useful index)

	Two fields used
*/

CREATE INDEX IND_EMP_NAMES ON A2_Employee (First_Name, Second_Name)

/*

	Create UNIQUE Index on Phone_Number (Suppose that every Employee has different number)

*/

-- Correct DB data --

UPDATE A2_Employee SET Phone_Number = '89134153398'
	WHERE A2_Employee.Second_Name = 'Vitvinov'

-- Creatin Unique Index --

CREATE UNIQUE INDEX IND_EMP_PHONE ON A2_Employee (Phone_Number)

-- Perform Index dropping --

DROP INDEX IND_EMP_PHONE ON A2_Employee

-------------------------------------------------------------------------------------------

/* 
	Forbid to Update already existing Position Names
*/

-- Setting Trigger-- 

CREATE TRIGGER TRIG_UPDATE_POS ON A2_Position FOR UPDATE AS
	IF UPDATE(Position_Name) ROLLBACK 

-- Testing Trigger --

UPDATE A2_Position SET Position_Name = 'S'
	WHERE (Position_Name = 'Sales')

/*
	Delete info about Employeemm who has no Contarcts
*/

CREATE TRIGGER TRIG_RM_EMP ON A2_Contract FOR DELETE AS
	DELETE FROM A2_Employee WHERE 
		Employee_ID  NOT IN (SELECT A2_Contract.Employee_ID FROM A2_Contract) 

-- Delete and Test --

DELETE FROM A2_Contract
	WHERE A2_Contract.Employee_ID = 15

-- Nothing Found --
SELECT A2_Employee.First_Name, A2_Employee.Second_Name FROM A2_Employee
	WHERE A2_Employee.Employee_ID = 15