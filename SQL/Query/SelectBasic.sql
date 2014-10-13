----------------------------------
----      SELECT Tutorial     ----
----------------------------------

-- Select Dates, when only Temporary Employees started working in the company --
SELECT Start_Date FROM A2_Contract WHERE End_Date IS NOT NULL

-- Find Numner of Employees with different names, who were born in 60-es --
SELECT COUNT (DISTINCT First_Name) FROM A2_Employee WHERE Birth_Date BETWEEN '1960-01-01' AND '1970-01-01'

-- Select Average Employee Salary and Number of Working Houres (per week), grouping by Working Houres Information -- 
-- (For Example: Average Salary of Employee, who is workin 20 / 30 / 40 hours per week) --
-- Got a Work_Hours fields in a result for convenience --  
SELECT AVG (Salary), Work_Hours FROM A2_Post_List GROUP BY Work_Hours 

-- Select Employees Names and Surnames, who have a phone number starting with '8912' --
-- Result will be represented in Reverse Alphabet order according to Surname(Second_Name) --
SELECT First_Name, Second_Name FROM A2_Employee WHERE Phone_Number LIKE '8912%' ORDER BY Second_Name DESC

-- Find MAX Salary which is paid to a 'Senoir Developer' or 'Research Engineer' or 'Senior Tester' --
SELECT MAX (Salary) FROM A2_Post_List WHERE Position_ID IN (2,3,5) 