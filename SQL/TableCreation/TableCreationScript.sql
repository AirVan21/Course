-----------------------------------------------
-- Script Table Creation. Primary Key Creation
-----------------------------------------------

CREATE TABLE A2_Employee(

    Employee_ID       INTEGER      		NOT NULL,
    First_Name	      VARCHAR(20)  		NOT NULL,
    Second_Name	      VARCHAR(20)       NOT NULL,
    Birth_Date        DATE              NOT NULL,
    Phone_Number	  VARCHAR(15)  		NOT NULL,
   
CONSTRAINT A2_Employee_PK PRIMARY KEY (Employee_ID)
)
;

CREATE TABLE A2_Contract(

    Contract_ID       INTEGER      		NOT NULL,
    Employee_ID       INTEGER      		NOT NULL,
    Department_ID     INTEGER      		NOT NULL,
    Position_ID       INTEGER           NOT NULL,
    IsTemporary       INTEGER           DEFAULT 0           NOT NULL,
    Start_Date        DATE              NOT NULL,
    End_Date          DATE              		,
   
CONSTRAINT A2_Contract_PK PRIMARY KEY (Contract_ID)
)
;

CREATE TABLE A2_Department(

	Department_ID     INTEGER      		NOT NULL,
	Post_List_ID	  INTEGER			NOT NULL,
	Department_Name   VARCHAR(30)       NOT NULL,

CONSTRAINT A2_Department_PK PRIMARY KEY (Department_ID)
)
;

CREATE TABLE A2_Post_List(

	Post_List_ID	 INTEGER      		NOT NULL,
	Position_ID      INTEGER			NOT NULL,
	Salary			 INTEGER			NOT NULL,
	Work_Hours		 INTEGER            NOT NULL,

CONSTRAINT A2_Post_List_PK PRIMARY KEY (Post_List_ID)
)
; 

CREATE TABLE A2_Position(

	Position_ID      INTEGER			NOT NULL,
	Position_Name    VARCHAR(30)        NOT NULL,
	Description      VARCHAR(50)                ,

CONSTRAINT A2_Position_PK PRIMARY Key (Position_ID)
)
; 

-----------------------------------------------
-- Foreign Key Creation
-----------------------------------------------

ALTER TABLE A2_Contract ADD CONSTRAINT FK_A2_Contract_Employee 
    FOREIGN KEY (Employee_ID)
    REFERENCES A2_Employee(Employee_ID)
;

ALTER TABLE A2_Contract ADD CONSTRAINT FK_A2_Contract_Department 
    FOREIGN KEY (Department_ID)
    REFERENCES A2_Department(Department_ID)
;

ALTER TABLE A2_Contract ADD CONSTRAINT FK_A2_Contract_Position 
    FOREIGN KEY (Position_ID)
    REFERENCES A2_Position(Position_ID)
;

ALTER TABLE A2_Department ADD CONSTRAINT FK_A2_Department_Post_List 
    FOREIGN KEY (Post_List_ID)
    REFERENCES A2_Post_List(Post_List_ID)
;

ALTER TABLE A2_Post_List ADD CONSTRAINT FK_A2_Post_List_Position 
    FOREIGN KEY (Position_ID)
    REFERENCES A2_Position(Position_ID)
;

-----------------------------------------------
-- Insert Content in Tables
-----------------------------------------------
-- Employee --
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (1, 'Ivan', 'Ivanov', '1959-01-22', '89123556781');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (2, 'Valentin', 'Petrov', '1959-04-12','89123456742');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (3, 'Maksim', 'Izotov', '1980-07-21','89123546763');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (4, 'Irina', 'Voronova', '1967-08-01','89823546731');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (5, 'Anna', 'Lebedeva', '1963-04-17','89123556782');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (6, 'Viktor', 'Lavrov', '1983-11-02','89123556743');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (7, 'Alla', 'Kupriyanova', '1977-12-23','89123556764');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (8, 'Anton', 'Teryaev', '1987-02-01','89823546738');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (9, 'Olga', 'Berdskaya', '1982-06-09','89823546308');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (10, 'Ruslan', 'Tagirov', '1966-06-09','89813547301');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (11, 'Yurii', 'Vitvinov', '1986-01-19','89123247311');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (12, 'Ilya', 'Kuratov', '1984-07-19','89123247311');
INSERT INTO A2_Employee(Empoyee_ID, First_Name, Second_Name, Birth_Date, Phone_Number) VALUES (13, 'Lidiya', 'Rebrova', '1980-02-12','89125347377');

--Contracts --
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (1, 1, 1, 2, 0,'1999-02-15')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (2, 2, 1, 3, 0,'2001-03-19')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (3, 3, 1, 1, 1,'20013-11-16', '2014-11-16')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (4, 4, 1, 4, 0,'2007-06-29')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (5, 6, 1, 3, 0,'2005-11-23')

INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (6, 5, 3, 2, 0,'2006-10-22')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (7, 7, 3, 2, 0,'2005-11-23')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (8, 8, 3, 1, 0,'2010-01-13')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (9, 10, 3, 1, 1,'2014-01-10', '2014-10-10')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (10, 11, 3, 5, 0,'2012-11-30')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (11, 12, 3, 5, 0,'2010-02-03')

INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (12, 9, 2, 7, 1,'2014-02-15', '2014-11-15')
INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (13, 13, 2, 6, 0,'2003-10-07')

INSERT INTO A2_Contract(Contract_ID, Empoyee_ID, Department_ID, Position_ID, IsTemporary, Start_Date, End_Date) VALUES (14, )

-- Department --
INSERT INTO A2_Department(Department_ID, Post_List_ID, Department_Name) VALUES (1, 1, "Machine Learning")
INSERT INTO A2_Department(Department_ID, Post_List_ID, Department_Name) VALUES (2, 3, "Software Engineering")
INSERT INTO A2_Department(Department_ID, Post_List_ID, Department_Name) VALUES (3, 2, "Sales")
INSERT INTO A2_Department(Department_ID, Post_List_ID, Department_Name) VALUES (4, 5, "Support")
INSERT INTO A2_Department(Department_ID, Post_List_ID, Department_Name) VALUES (5, 4, "Web")

-- Position --
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (1, "Junior Developer", "Implement simple tasks")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (2, "Senior Developer", "Construct project structure")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (3, "Research Engineer", "Explore effective algorithms")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (4, "Junior Tester", "Test GUI")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (5, "Senior Tester", "Develop test systems")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (6, "Product Manager", "Represent products")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (7, "Help Desk Assistant", "Answers on users questions")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (8, "System Administrator", "Set office IT infrastructure")
INSERT INTO A2_Position(Position_ID, Position_Name, Description) VALUES (9, "Designer", "Create sites templates")

-- Machine Learning --
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (1,1,30000,30)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (1,2,70000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (1,3,80000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (1,3,80000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (1,4,30000,30)

-- Software Engineering --
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (3,1,30000,30)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (3,1,20000,20)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (3,2,70000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (3,2,70000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (3,5,60000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (3,5,60000,40)

-- Sales --
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (2,6,75000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (2,7,30000,40)

-- Support --
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (5,7,30000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (5,7,30000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (5,7,15000,20)

-- Web --
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (4,8,70000,40)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (4,9,50000,30)
INSERT INTO A2_Post_List(Post_List_ID, Position_ID, Salary, Work_Hours) VALUES (4,4,15000,20)

-----------------------------------------------
-- Delete Tables
-----------------------------------------------
