
-- SQL BASICS SHEET FOR REVISON.

-- CREATE, USE AND DROP DATABASE IN SQL.

-- Creating new database.
CREATE DATABASE basicsql;

-- Usings database.
USE basicsql;

-- Droping database.
DROP DATABASE basicsql;

-- CREATE TABLE.

-- Creating table.
CREATE TABLE employee (
						e_id int not null,
						e_name varchar(20) unique,
						e_salary int,
						e_age int not null DEFAULT 18,
						e_gender varchar(20) ,
						e_dept varchar(20),
						primary key(e_id)
					);

-- INSERT QUERY SYNTAX.

-- Inserting data directly.
INSERT INTO employee values (1,'Same',95000,45,'Male','Operations')
INSERT INTO employee values (2,'Anne',125000,30,'Female','Analytics');

-- Inserting data by columns name.
INSERT INTO employee(e_id,e_gender,e_name,e_salary,e_dept) VALUES (3,'Male','Bob',80000,'Support');

INSERT INTO employee(e_id,e_name,e_salary,e_age,e_gender,e_dept) VALUES (4,'Julia',73000,30,'Female','Analytics');
INSERT INTO employee(e_id,e_name,e_salary,e_age,e_gender,e_dept) VALUES (5,'Matt',159000,33,'Male','Sales');
INSERT INTO employee(e_id,e_name,e_salary,e_age,e_gender,e_dept) VALUES (6,'Jeff',112000,27,'Male','Operations');

-- SELECT SATEMENT SYNTAX.

-- Seleting all field from table.
SELECT * FROM employee;

-- Seleting single columns by name from table.
SELECT e_name FROM employee;

-- Seleting multiple columns by name from table.
SELECT e_id, e_name, e_gender FROM employee;

-- DELETE THE TABLE.

-- Deleting tabel.
DROP TABLE employee;

-- SELECT DISTINCT SYNTAX.

--selecting distict e_gender.
SELECT DISTINCT e_gender FROM employee;

--WHERE CLAUSE.

-- Selecting records using where.
SELECT * FROM employee WHERE e_gender='Female';

SELECT * FROM employee WHERE e_age < 30;

-- Selecting records using where and 'And'.
SELECT * FROM employee WHERE e_salary > 100000 and e_age < 30;

-- Selecting records using where and 'Or'.
SELECT * FROM employee WHERE e_salary > 100000 or e_age < 30;


-- Selecting records using where and 'Not'.
SELECT * FROM employee WHERE not e_salary > 100000;


-- LIKE OPERATOR.

-- LIKE Operator	Description
-- WHERE CustomerName LIKE 'a%'	    Finds any values that start with "a"
-- WHERE CustomerName LIKE '%a'	    Finds any values that end with "a"
-- WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
-- WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
-- WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
-- WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
-- WHERE ContactName LIKE 'a%o'	    Finds any values that start with "a" and ends with "o"
	
-- WHERE SALARY LIKE '2___3'        Finds any values in a five-digit number that start with 2 and end with 3.
-- WHERE NAME LIKE 'A[a, l, j, y, a, k]'  Finds any name that starts with A and has the specified alphabets. For e.g. Ajay
-- WHERE NAME LIKE 'A[a, l, j, y, a, k]'  Finds any name that starts with A and does not consists of the specified alphabets. For e.g. Abdu.

SELECT * FROM employee WHERE  e_name LIKE 'J%';
SELECT * FROM employee WHERE  e_name LIKE '%a';
SELECT * FROM employee WHERE  e_age LIKE '3_';


-- BETWEEN OPERATOR.

-- Selecting employees where age is between 25 to 30
SELECT * FROM employee WHERE e_age BETWEEN 30 AND 35;
SELECT * FROM employee WHERE e_salary BETWEEN 90000 AND 120000;

-- BASIC INBUILT FUNCTIONS.

-- MIN()
SELECT MIN(e_salary) AS MINIMUM_SALARY FROM employee;

-- MAX()
SELECT MAX(e_salary) AS MAXIMUM_SALARY FROM employee;

-- COUNT()
SELECT COUNT(e_id) AS TOTAL_NO_OF_EMPLOYEE FROM employee;

-- Total no of female amd male employee using 'COUNT()' and 'WHERE'.
SELECT COUNT(e_id) AS TOTAL_NO_OF_FEMALE_EMPLOYEE FROM employee WHERE e_gender = 'Female';
SELECT COUNT(e_id) AS TOTAL_NO_OF_MALE_EMPLOYEE FROM employee WHERE e_gender = 'Male';

-- SUM()
SELECT SUM(e_salary) AS TOTAL_EXPENSE_ON_SALARY FROM employee;

-- AVG()
SELECT AVG(e_salary) AS AVERAGE_SALARY FROM employee;


--  BASIC INBUILT STRING FUNCTION.

-- LTRIM()
SELECT '        sparta' AS WITHOUT_LTRIM
SELECT LTRIM('        sparta') AS WITH_LTRIM;

-- LOWER()
SELECT 'SPARTA' AS WITHOUT_LOWER
SELECT LOWER('SPARTA') AS WITH_LOWER;

-- UPPER()
SELECT 'sparta' AS WITHOUT_UPPER
SELECT UPPER('sparta') AS WITH_UPPER;

-- REVERSE()
SELECT 'sparta' AS WITHOUT_REVERSE
SELECT REVERSE('sparta') AS WITH_REVERSE;

SELECT 'I Love ice-cream' AS WITHOUT_REVERSE
SELECT REVERSE('I Love ice-cream') AS WITH_REVERSE;

-- SUBSTRING()
SELECT 'This is Sapart' As STRING
SELECT SUBSTRING('This is Sapart',1,7) AS SUBSTRING
SELECT SUBSTRING('This is Sapart',9,11) AS SUBSTRING;

-- ORDER BY()
SELECT * FROM employee	ORDER BY e_age;
SELECT * FROM employee	ORDER BY e_age DESC;

SELECT * FROM employee ORDER BY e_age, e_salary;
SELECT * FROM employee ORDER BY e_age, e_salary DESC;

-- TOP
SELECT TOP 3 * FROM employee;
SELECT TOP 3 * FROM employee ORDER BY e_age DESC;

-- GROUP BY

-- group by average salary
SELECT AVG(e_salary) AS AVERAGE_SALARY, e_gender FROM employee GROUP BY e_gender;

-- group by average salary but not selected e_gender in select option
SELECT AVG(e_salary) AS AVERAGE_SALARY FROM employee GROUP BY e_gender;

-- group by average age according to depatment.
SELECT AVG(e_age) AS AVERAGE_age, e_dept FROM employee GROUP BY e_dept;

-- HIVING CLAUSE.

-- Having alway follows by group by.
SELECT e_dept,AVG(e_salary) AS AVERAGE_SALARY FROM employee GROUP BY e_dept HAVING AVG(e_salary) > 100000;


-- MODIFY TABLE.

SELECT * FROM employee

-- UPDATE STATMENT
UPDATE employee SET e_age = 42 WHERE e_name = 'Same';
SELECT * FROM employee;

-- DELETE STATMENT
DELETE FROM employee WHERE e_age = 33;
SELECT * FROM employee;

-- TRUNCATE TABLE.
TRUNCATE TABLE employee
SELECT * FROM employee;


-- JOINS
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN

-- Creating TABLE 2 FOR JOINTS department
CREATE TABLE department (
						 d_id INT PRIMARY KEY,
						 d_name VARCHAR(20) NOT NULL,
						 d_location VARCHAR(20)
);

-- Inserting values in department
INSERT INTO department VALUES (1,'Content','New York')
INSERT INTO department VALUES (2,'Analytics','New York')
INSERT INTO department VALUES (3,'Sales','Boston')
INSERT INTO department VALUES (4,'Support','Chicago')
INSERT INTO department VALUES (5,'Tech','Dallas')
INSERT INTO department VALUES (6,'Finance','Chicago')

-- Cheking all the data
SELECT * FROM department;

-- Cheking all the data
SELECT * FROM employee

--INNER JOIN
SELECT employee.e_name,employee.e_dept,department.d_name,department.d_location
FROM employee 
INNER JOIN department
ON employee.e_dept = department.d_name;

-- LEFT JOIN
SELECT employee.e_id,employee.e_dept,department.d_name,department.d_location
FROM employee 
lEFT JOIN department 
ON employee.e_dept = department.d_name;

-- RIGHT JOIN
SELECT employee.e_id,employee.e_dept,department.d_name,department.d_location
FROM employee 
RIGHT JOIN department 
ON employee.e_dept = department.d_name;

-- OUTER JOIN
SELECT employee.e_id,employee.e_dept,department.d_name,department.d_location
FROM employee 
FULL JOIN department 
ON employee.e_dept = department.d_name;

-- UPDATE USING JOIN

-- Upadating table using join only from one table at a time from employee table.
UPDATE employee SET e_age = e_age + 10 
FROM employee 
JOIN department ON employee.e_dept = department.d_name
WHERE d_location = 'New York';

SELECT * FROM employee
SELECT * FROM department;

-- DELETE USING JOIN

-- Deleting table using join only from one table at a time from employee table.
DELETE employee FROM employee 
JOIN department ON employee.e_dept = department.d_name
WHERE d_location = 'New York';

SELECT * FROM employee;
SELECT * FROM department;

-- UNION

-- Union is more like append in power bi so table must be same no of columns with same datatype.

CREATE TABLE student_details_1 (
								s_id int PRIMARY KEY,
								s_name VARCHAR(20),
								s_marks int
);

INSERT INTO student_details_1 VALUES (1,'Same',45);
INSERT INTO student_details_1 VALUES (2,'Bob',87);
INSERT INTO student_details_1 VALUES (3,'Anne',73);
INSERT INTO student_details_1 VALUES (4,'Julia',92);

CREATE TABLE student_details_2 (
								s_id int PRIMARY KEY,
								s_name VARCHAR(20),
								s_marks int
);

INSERT INTO student_details_2 VALUES (3,'Anne',73);
INSERT INTO student_details_2 VALUES (4,'Julia',92);
INSERT INTO student_details_2 VALUES (5,'Matt',65);

SELECT * FROM student_details_1;
SELECT * FROM student_details_2;

-- Union operator
SELECT * FROM student_details_1
UNION
SELECT * FROM student_details_2;

-- UNION ALL OPERATOR
SELECT * FROM student_details_1
UNION ALL
SELECT * FROM student_details_2;

-- EXCEPT OPERATOR
SELECT * FROM student_details_1
EXCEPT
SELECT * FROM student_details_2;

SELECT * FROM student_details_2
EXCEPT
SELECT * FROM student_details_1;

-- INTERSECT OPERATOR.
SELECT * FROM student_details_1
INTERSECT
SELECT * FROM student_details_2;

-- VIEWS

-- Creating View
CREATE VIEW MALE_EMPLOYEE 
AS
SELECT * FROM employee WHERE e_gender = 'Male';

-- Viewing THE VieW
SELECT * FROM MALE_EMPLOYEE;

-- Droping view
DROP VIEW MALE_EMPLOYEE

-- ALTER TABLE.

-- Add column
ALTER TABLE employee 
ADD e_dob date;

SELECT * FROM employee;

-- Drop column
ALTER TABLE employee
DROP COLUMN e_dob;

SELECT * FROM employee;

-- MERGE

-- Creating source table
CREATE TABLE employee_source (
						e_id int not null,
						e_name varchar(20) unique,
						e_salary int,
						e_age int not null DEFAULT 18,
						e_gender varchar(20) ,
						e_dept varchar(20),
						primary key(e_id)
					);

-- Adding data in Source
INSERT INTO employee_source VALUES(1,'Sam',95000,45,'Male','Operations');
INSERT INTO employee_source VALUES(2,'Bob',80000,21,'Male','Support');
INSERT INTO employee_source VALUES(3,'Anne',125000,25,'Female','Analytics');
INSERT INTO employee_source VALUES(6,'Jeff',112000,27,'Male','Operations');
INSERT INTO employee_source VALUES(7,'Adam',100000,28,'Male','Content');
INSERT INTO employee_source VALUES(8,'Priya',85000,37,'Female','Tech');

-- Checking data of source
SELECT * FROM employee_source;

-- Creating target table
CREATE TABLE employee_target (
						e_id int not null,
						e_name varchar(20) unique,
						e_salary int,
						e_age int not null DEFAULT 18,
						e_gender varchar(20) ,
						e_dept varchar(20),
						primary key(e_id)
					);

-- Adding data in target
INSERT INTO employee_target VALUES(1,'Sam',95000,45,'Male','Operations');
INSERT INTO employee_target VALUES(2,'Bob',80000,21,'Male','Support');
INSERT INTO employee_target VALUES(3,'Anne',125000,25,'Female','Analytics');
INSERT INTO employee_target VALUES(4,'Julia',73000,30,'Female','Analytics');
INSERT INTO employee_target VALUES(5,'Matt',159000,33,'Male','Sales');
INSERT INTO employee_target VALUES(6,'Jeff',112000,27,'Male','Operations');

-- Checking data of target
SELECT * FROM employee_target; 

-- Merging two table 
MERGE employee_target AS T
USING employee_source AS S
ON T.e_id = S.e_id
WHEN MATCHED 
THEN UPDATE SET T.e_salary = S.e_salary, T.e_age = S.e_age
WHEN NOT MATCHED BY TARGET 
THEN INSERT (e_id,e_name,e_salary,e_age,e_gender,e_dept) VALUES (S.e_id,S.e_name,S.e_salary,S.e_age,S.e_gender,S.e_dept)
WHEN NOT MATCHED BY SOURCE 
THEN DELETE;

-- Checking changes after merge
SELECT * FROM employee_target;
SELECT * FROM employee_source;

-- Removing data from both table
TRUNCATE TABLE employee_source
TRUNCATE TABLE employee_target

-- Adding data in Source
INSERT INTO employee_source VALUES(1,'Sam',95000,45,'Male','Operations');
INSERT INTO employee_source VALUES(2,'Bob',80000,21,'Male','Support');
INSERT INTO employee_source VALUES(3,'Anne',125000,25,'Female','Analytics');
INSERT INTO employee_source VALUES(6,'Jeff',112000,27,'Male','Operations');
INSERT INTO employee_source VALUES(7,'Adam',100000,28,'Male','Content');
INSERT INTO employee_source VALUES(8,'Priya',85000,37,'Female','Tech');

-- Adding data in Target
INSERT INTO employee_target VALUES(1,'Sam',95000,45,'Male','Operations');
INSERT INTO employee_target VALUES(2,'Bob',80000,21,'Male','Support');
INSERT INTO employee_target VALUES(3,'Anne',125000,25,'Female','Analytics');
INSERT INTO employee_target VALUES(4,'Julia',73000,30,'Female','Analytics');
INSERT INTO employee_target VALUES(5,'Matt',159000,33,'Male','Sales');
INSERT INTO employee_target VALUES(6,'Jeff',112000,27,'Male','Operations');


-- Second merge query. 
MERGE employee_source AS T
USING employee_target AS S
ON T.e_id = S.e_id
WHEN MATCHED 
THEN UPDATE SET T.e_salary = S.e_salary, T.e_age = S.e_age
WHEN NOT MATCHED BY TARGET 
THEN INSERT (e_id,e_name,e_salary,e_age,e_gender,e_dept) VALUES (S.e_id,S.e_name,S.e_salary,S.e_age,S.e_gender,S.e_dept)
WHEN NOT MATCHED BY SOURCE 
THEN DELETE;

-- Checking changes after merge
SELECT * FROM employee_target;
SELECT * FROM employee_source;

-- FUNCTIONS

-- * SCALAR VALUE FUNCTIONS

-- Creating function
CREATE FUNCTION add_five(@num as int)
RETURNS INT
AS
BEGIN
RETURN (@num+5)
end

-- Calling function 
SELECT dbo.add_five(5);

-- Creating function
CREATE FUNCTION mul (@num1 as int,@num2 as int)
RETURNS INT
AS
BEGIN
RETURN(@num1*@num2)
end

-- Calling function 
SELECT dbo.mul(7,2)

-- Droping Function
DROP FUNCTION dbo.add_five;

--* TABLE VALUE FUNCTIONS

-- Creating function
CREATE FUNCTION gender_selector(@gender AS VARCHAR(20))
RETURNS TABLE
AS
RETURN (SELECT * FROM employee WHERE e_gender = @gender);

-- Calling function 
SELECT * FROM dbo.gender_selector('Male');

-- Droping Function
DROP FUNCTION dbo.gender_selector;

-- TEMPORARY TABLE

-- Creating tamporary table
CREATE TABLE #temporary_table (
								t_id INT,
								t_name varchar(20)
);

-- Intserting values in temporary table
INSERT INTO #temporary_table VALUES (1,'Jai')
INSERT INTO #temporary_table VALUES (2,'Gov')

-- Cheking Data in temporary table
SELECT * FROM #temporary_table; 

-- Deleting data from temporary table
TRUNCATE table  #temporary_table;

-- Deleting temporary table
DROP TABLE #temporary_table;


-- CASE STATMENT

SELECT 
CASE 
WHEN 10 > 20 THEN '10 is greater than 20'
WHEN 10 < 20 THEN '10 is less than 20'
ELSE '10 is equal to 20'
END

-- Using case statments on table
SELECT * FROM employee 

SELECT *,grade =
CASE 
WHEN e_salary < 90000 THEN 'C'
WHEN e_salary < 120000 THEN 'B'
ELSE 'A'
END 
FROM employee;

-- IIF() FUNCTION

 SELECT IIF(10 > 20,'10 is grater then 20','10 is less then 20') AS GREATER_OR_LESS;

 -- Using iif() statments on table
 SELECT * ,IIF(e_age>30,'Old Employee','Young Employee')
 AS EMPLOYEE_GENERATION FROM employee;

-- STORED PROCEDURE IN SQL.

-- Storing procedure
CREATE PROCEDURE employee_age 
AS
SELECT e_age,e_name FROM employee 
GO;

-- Excetuting procedure
EXEC employee_age

-- Deleting procedure 
DROP PROCEDURE employee_age

-- Procedure with parameter
CREATE PROCEDURE employee_gender @gender VARCHAR(20)
AS
SELECT * FROM employee_source WHERE e_gender = @gender

-- Excetuting procedure
EXEC employee_gender @gender='Female';
EXEC employee_gender @gender='Male';

-- Deleting procedure 
DROP PROCEDURE employee_gender

-- EXCEPTION HANDELLING

-- example-1
DECLARE @val_1 INT
DECLARE @val_2 INT

BEGIN TRY
SET @val_1 = 8;
SET @val_2 = @val_1/0;
END TRY

BEGIN CATCH
PRINT ERROR_MESSAGE()
END CATCH

-- ROLLBACK
BEGIN TRANSACTION
UPDATE employee SET e_age = 30 WHERE e_name = 'Same'
ROLLBACK TRANSACTION

SELECT * FROM EMPLOYEE

BEGIN TRANSACTION
UPDATE employee SET e_age = 30 WHERE e_name = 'Same'
COMMIT TRANSACTION

SELECT * FROM EMPLOYEE


BEGIN TRY
BEGIN TRANSACTION
UPDATE employee_source SET e_salary =50 WHERE  e_gender = 'Male'
UPDATE employee_source SET e_salary =195/0 WHERE e_gender = 'Female'
COMMIT TRANSACTION
PRINT 'Transaction commited'
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Transaction Rollback'
END CATCH

SELECT * FROM employee_source
BEGIN TRY
INSERT INTO employee_source VALUES (1,'same','bsyavu')
PRINT 'Edit Completed'
END TRY
BEGIN CATCH
PRINT 'Not Completed'
END CATCH

-- TRIGGERS

-- A trigger is a special kind of stored procedure that automatically
-- executes when an event occurs in the database server.

-- There are 3 types of triggers
-- 1. DML trigger (data manipulation language) Insert,Update,Delete.
-- 2. DDl triggers (data definition language) create, alter.
-- 3. LOGON TRIGGER

-- DML TRIGGERS ARE FIRED AUTOMATICALLY IN RESPONSE TO DML EVENT
-- (INSERT, UPDATE AND DELETE)

-- DML TRIGGER CAN BE OF 2 TYPES
-- 1. After trigger (Also called for triggers)
-- 2. Instead of trigger.

-- Crating table
CREATE TABLE student (
						   id INT PRIMARY KEY,
						   Name VARCHAR(20),
						   Gender VARCHAR(20),
						   Class int,
						   Fee int
						  );

-- Insert values in table
INSERT INTO student VALUES (1,'Sam','Male',10,4000);
INSERT INTO student VALUES (2,'Bob','Male',9,3500);
INSERT INTO student VALUES (3,'Anne','Female',8,3000);
INSERT INTO student VALUES (4,'Jeff','Male',10,4000);
INSERT INTO student VALUES (5,'Adam','Male',9,3500);
INSERT INTO student VALUES (6,'Priya','female',5,3000);
INSERT INTO student VALUES (7,'Sachin','Male',5,3000);

-- Checking data
SELECT * FROM student;

-- Creating trigger using print
CREATE TRIGGER TR_STUDENT_INSERT
ON student
AFTER INSERT
AS
BEGIN
PRINT 'New row is add to the student table.';
END

-- Inserting value to check the value of trigger
INSERT INTO student VALUES (8,'Sagar','Male',9,3000);

-- CREATE TRIGGER USING SELECT STATMENT.

-- AFTER INSERT OR FOR INSERT
-- AFTER DELETE OR FOR DELETE
-- AFTER UPDATE OR FOR UPDATE

-- INSERTED TRIGGER
CREATE TRIGGER TR_STUDENT_INSERT_WITH_DATA
ON student
AFTER INSERT
AS
BEGIN
SELECT * FROM INSERTED;
END

-- Inserting values to check trigger
INSERT INTO student VALUES (9,'sUMAN','Female',9,3000);


-- DELETE TRIGGER
CREATE TRIGGER TR_STUDENT_DELETE_WITH_DATA
ON student
AFTER DELETE
AS
BEGIN
SELECT * FROM DELETED;
END

-- Deleting values to check trigger
DELETE FROM student WHERE id = 9;

-- Dropping trigger
DROP TRIGGER TR_STUDENT_DELETE_WITH_DATA

-- UPDATE TRIGGER
CREATE TRIGGER TR_STUDENT_UPDATE_WITH_DATA
ON student
AFTER UPDATE
AS
BEGIN
SELECT * FROM INSERTED
SELECT * FROM DELETED
END

-- Updating data for cheking trigger
UPDATE student SET Name = 'Akansha' where  Name = 'Priya';

-- Dropping trigger
DROP TRIGGER TR_STUDENT_UPDATE_WITH_DATA


-- Creating table
CREATE TABLE employee_trigger  (  
								  Id INT PRIMARY KEY,  
								  Name VARCHAR(45),  
								  Salary INT,  
								  Gender VARCHAR(12),  
								  DepartmentId INT  
						);  

-- Insert values in table
INSERT INTO employee_trigger  VALUES (1,'Steffan', 82000, 'Male', 3),  
									 (2,'Amelie', 52000, 'Female', 2),  
									 (3,'Antonio', 25000, 'male', 1),  
									 (4,'Marco', 47000, 'Male', 2),  

									 (5,'Eliana', 46000, 'Female', 3);
-- Checking data
SELECT * FROM employee_trigger;  

-- Creating audit table for checking any delete and insert log 
CREATE TABLE Employee_Audit_Test  (    
									Id int IDENTITY,   
									Audit_Action text   
								);  

-- Cheking data
SELECT * FROM Employee_Audit_Test

-- Insert valuest in auidit table when inserted values in table. 
CREATE TRIGGER trInsertEmployee   
ON employee_trigger 
AFTER INSERT  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from inserted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('New employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))  
END  

-- Insert values in table.
INSERT INTO employee_trigger VALUES (6,'Peter', 62000, 'Male', 3)  

-- Insert valuest in auidit table when delete values in table.
CREATE TRIGGER trDeleteEmployee   
ON employee_trigger  
FOR DELETE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from deleted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)))  
END  

-- Delete the values from table.
DELETE FROM employee_trigger WHERE Id = 2;  
  
-- Cheking values in audit table.
SELECT * FROM Employee_Audit_Test;

-- INSTEAD OF INSERT
-- INSTEAD OF DELETE
-- INSTEAD OF UPDATE 

-- Creating table
CREATE TABLE employee_inst_trigger  (  
								  Id INT PRIMARY KEY,  
								  Name VARCHAR(45),  
								  Salary INT,  
								  Gender VARCHAR(12),  
								  DepartmentId INT  
						);  

-- Insert values in table
INSERT INTO employee_inst_trigger  VALUES (1,'Steffan', 82000, 'Male', 3),  
										  (2,'Amelie', 52000, 'Female', 2),  
										  (3,'Antonio', 25000, 'male', 1),  
										  (4,'Marco', 47000, 'Male', 2),  
										  (5,'Eliana', 46000, 'Female', 3);
-- Checking data
SELECT * FROM employee_inst_trigger;  

-- Creating audit table for checking any delete and insert log 
CREATE TABLE Employee_inst_Audit_Test  (    
									Id int IDENTITY,   
									Audit_Action text   
								);  

-- Checking data
SELECT * FROM Employee_inst_Audit_Test

-- Instead of insert
CREATE TRIGGER INSTED_OF_INSERT
ON employee_inst_trigger
INSTEAD OF INSERT
AS 
BEGIN
INSERT INTO Employee_inst_Audit_Test
VALUES ('New values are trying to insert in the table at '+ CAST(GETDATE() AS VARCHAR(25)))
END

-- Insert values in table.
INSERT INTO employee_inst_trigger VALUES (6,'Peter', 62000, 'Male', 3)  

-- checking audit table
SELECT * FROM Employee_inst_Audit_Test

-- droping trigger
DROP TRIGGER INSTED_OF_INSERT

-- Instead of delete
CREATE TRIGGER INSTED_OF_DELETE
ON employee_inst_trigger
INSTEAD OF DELETE
AS
BEGIN
INSERT INTO Employee_inst_Audit_Test
VALUES('Someone try to delete the entry from the tabel at ' + CAST(GETDATE() AS VARCHAR(30)))
END


-- Delete the values from table.
DELETE FROM employee_inst_trigger WHERE Id = 2; 

-- checking audit table
SELECT * FROM Employee_inst_Audit_Test

-- droping trigger
DROP TRIGGER INSTED_OF_DELETE

-- Deleting all the data from the table.
TRUNCATE TABLE Employee_inst_Audit_Test

-- Instead of update
CREATE TRIGGER INSTED_OF_UPDATE
ON employee_inst_trigger
INSTEAD OF UPDATE
AS 
BEGIN
INSERT INTO Employee_inst_Audit_Test
VALUES('Someone trys to update values of your table at ' + CAST(GETDATE() AS VARCHAR(30)))
END

-- Updating the table
UPDATE employee_inst_trigger SET Name = 'YourName' WHERE Id = 2; 

-- checking audit table
SELECT * FROM Employee_inst_Audit_Test

-- droping trigger
DROP TRIGGER INSTED_OF_DELETE

-- ================================================== THE END ================================================================