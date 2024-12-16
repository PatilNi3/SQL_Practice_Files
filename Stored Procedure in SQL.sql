-- STORED PROCEDURE
/*
- A stored procedure in SQL is a group of SQL queries that can be saved and reused multiple times. 
- It is very useful as it reduces the need for rewriting SQL queries. 
- It enhances efficiency, reusability and security in database management.

- Users can also pass parameters to stored procedures so that the stored procedure can act on the passed parameter values.
*/
USE SQL_Server_DB
-- using Employee table from SQL_Clauses_1 file
SELECT * FROM Employee
-- using Employee_Department table from SQL_Clauses_2 file
SELECT * FROM Employee_Department
-- using Student & Teacher table from SQL_Joins file
SELECT * FROM Student
SELECT * FROM Teacher

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- 1. Creating a Stored Procedure:

CREATE PROCEDURE sp_Employee_Details 
@emp_id INT
AS
BEGIN
SELECT Emp_Name, Emp_Email, Emp_Salary FROM Employee WHERE Emp_ID = @emp_id
END

-- Executing a Stored Procedure:

EXEC sp_Employee_Details 1			-- fetch employee whose Emp_ID is 1

EXEC sp_Employee_Details 5			-- fetch employee whose Emp_ID is 5

EXEC sp_Employee_Details 12		-- fetch employee who not exists

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. Stored Procedure with Output Parameters:

CREATE PROCEDURE sp_EmployeeName_using_EmpID
@emp_id INT,
@emp_name VARCHAR(100) OUTPUT
AS
BEGIN
SELECT @emp_name = Emp_Name 
FROM Employee 
WHERE Emp_ID = @emp_id
END

-- Execute Stored Procedure with Output Parameter:

-- declare the variable for the output parameter
DECLARE @emp_name VARCHAR(100)

-- execute the stored procedure and specify the output variable
EXEC sp_EmployeeName_using_EmpID @emp_id = 1, @emp_name = @emp_name OUTPUT

-- display the result
SELECT @emp_name AS Emp_Name

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Stored Procedure with Control Flow:

CREATE PROCEDURE sp_employee_control_flow 
@employee_id INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Employee WHERE Emp_ID = @employee_id)
	BEGIN
		SELECT * FROM Employee WHERE Emp_ID = @employee_id
	END
	ELSE
	BEGIN
		PRINT 'Employee Not Found'
	END
END

-- Execute Stored Procedure with Control Flow

EXEC sp_employee_control_flow 1

EXEC sp_employee_control_flow 5

EXEC sp_employee_control_flow 99

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. Execute Stored Procedure with TRY CATCH

CREATE PROCEDURE sp_EmployeeDetails
@Emp_ID INT,
@Emp_Name VARCHAR(100) OUTPUT,
@Emp_Email VARCHAR(100) OUTPUT,
@Error_Message VARCHAR(100) OUTPUT
AS
BEGIN
	BEGIN TRY
		-- empployee details
		SELECT @Emp_Name = Emp_Name, @Emp_Email = Emp_Email 
		FROM Employee 
		WHERE Emp_ID = @Emp_ID

		-- if employee is not found
		IF @Emp_ID IS NULL
		BEGIN
			SET @Error_message = 'No employee found with this given Emp_ID.'
			RAISERROR(@Error_Message, 16, 1)
		END
		ELSE
		BEGIN
		SET @Error_Message = 'Employee Details Found Successfully.'
		END
	END TRY

	BEGIN CATCH
	-- if error occurs in the TRY block, control will transfer to the CATCH block

		-- catch error information
		DECLARE @ErrorMessage VARCHAR(100), @ErrorSeverity INT, @ErrorState INT

		-- get the error details
		SELECT 
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE()

		-- log the error
		PRINT 'Error Occured:' + @ErrorMessage

		-- set output parameters for error information
		SET @Error_Message = @ErrorMessage
		SET @Emp_Name = NULL
		SET @Emp_Email = NULL

		-- raise the error
		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END

-- calling procedure with valid emp_id
DECLARE @Emp_name VARCHAR(100), @Emp_Email VARCHAR(100), @Error_Message VARCHAR(100)
EXEC sp_EmployeeDetails @Emp_ID = 5, @Emp_Name = @Emp_Name OUTPUT, @Emp_Email = @Emp_Email OUTPUT, @Error_Message = @Error_Message OUTPUT
SELECT @Emp_Name AS Emp_Name, @Emp_Email AS Emp_Email

-- calling procedure with NULL emp_id
DECLARE @Emp_Name VARCHAR(100), @Emp_Email VARCHAR(100), @Error_Message VARCHAR(100)
EXEC sp_EmployeeDetails @Emp_ID = NULL, @Emp_Name = @Emp_Name OUTPUT, @Emp_Email = @Emp_Email OUTPUT, @Error_Message = @Error_Message OUTPUT
SELECT @Emp_Name AS Emp_name, @Emp_Email AS Emp_Email, @Error_Message AS Error_Messages

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- USEFUL SYSTEM STORED PROCEDURES

-- • sp_help <procedure_name> = View the information about the stored procedure like parameter name, their datatypes etc.

sp_help sp_EmployeeDetails

-- • sp_helptext <procedure_name> = View the text of the Stored Procedure

sp_helptext sp_EmployeeDetails

-- sp_depends <procedure_name> = View the dependencies of the Stored Procedure.

sp_depends sp_EmployeeDetails

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- EXAMPLES:

CREATE PROCEDURE sp_CalculateStudentSalary
    @Emp_Department VARCHAR(100),
    @Emp_Salary DECIMAL(10, 2) OUTPUT
AS
BEGIN
    SELECT @Emp_Salary = SUM(E.Emp_Salary)
    FROM Employee E
	INNER JOIN 
	Employee_Department D
	ON E.Emp_ID = D.Emp_ID
END;

---------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_UpdateEmployeeSalary
    @Emp_ID INT,
    @NewSalary DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRY
        UPDATE Employee
        SET Emp_Salary = @NewSalary
        WHERE Emp_ID = @Emp_ID;
        
        PRINT 'Salary updated successfully';

    END TRY
    BEGIN CATCH
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
    END CATCH
END;

-- execute procedure with correct salary
EXEC sp_UpdateEmployeeSalary @Emp_ID = 5, @NewSalary = 55555.55

-- execute procedure with incorrect salary
EXEC sp_UpdateEmployeeSalary @Emp_ID = 99, @NewSalary = 55555555555.55555

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- EXAMPLES:

-- 1. Stored Procedure to Insert Employee Data in to Employee Table

CREATE PROCEDURE sp_InsertEmployee
    @Emp_Name VARCHAR(100),
    @Emp_Age INT,
    @Emp_Email VARCHAR(100),
    @Emp_City VARCHAR(50),
    @Emp_Contact VARCHAR(10),
    @Emp_Salary INT
AS
BEGIN
    INSERT INTO Employee (Emp_Name, Emp_Age, Emp_Email, Emp_City, Emp_Contact, Emp_Salary)
    VALUES (@Emp_Name, @Emp_Age, @Emp_Email, @Emp_City, @Emp_Contact, @Emp_Salary)
END

-- execute sp_insertemployee procedure
EXEC sp_InsertEmployee 'Alice Cooper', 30, 'alice.cooper@example.com', 'Noida', '9112345678', 55000

-- 2. Stored Procedure to Update Employee Salary

CREATE PROCEDURE UpdateEmployeeSalary
    @Emp_ID INT,
    @New_Salary INT
AS
BEGIN
    UPDATE Employee
    SET Emp_Salary = @New_Salary
    WHERE Emp_ID = @Emp_ID
END

-- execute sp_updateemployeesalary procedure
EXEC UpdateEmployeeSalary 1, 60000

-- 3. Stored Procedure to Retrieve Employees by City

CREATE PROCEDURE sp_RetrieveEmployeeByCity
	@Emp_City VARCHAR(100)
AS
BEGIN
	SELECT * FROM Employee
	WHERE Emp_City = @Emp_City
END

-- execute sp_retrieveemployeebycity procedure
EXEC sp_RetrieveEmployeeByCity 'Pune'

-- 4. Stored Procedure to Delete Employee by ID

CREATE PROCEDURE sp_DeleteEmployee
	@Emp_ID INT
AS
BEGIN
	DELETE FROM Employee
	WHERE Emp_ID = @Emp_ID
END

-- execute sp_deleteemployee procedure
EXEC sp_DeleteEmployee 1002

-- 5. Stored Procedure to Get Employee Count by Age Group

CREATE PROCEDURE sp_CountEmployeeByAgeGroup
AS
BEGIN
	SELECT Emp_Age, COUNT(*) AS Employee_Count
	FROM Employee
	GROUP BY Emp_Age
END

EXEC sp_CountEmployeeByAgeGroup

-- 6. Stored Procedure to Retrieve Employees by Salary Range
SELECT * FROM Employee 
CREATE PROCEDURE sp_RetrieveEmployeeBySalary
	@Min_Salary INT,
	@Max_Salary INT
AS 
BEGIN
	SELECT * FROM Employee
	WHERE Emp_Salary BETWEEN @Min_Salary AND @Max_Salary
END

-- execute sp_retrieveemployeesalary procedure
EXEC sp_RetrieveEmployeeBySalary 50000, 80000

-- 7. Stored Procedure to Find the Highest Paid Employee 

CREATE PROCEDURE sp_HighestPaidEmployee
AS
BEGIN
	SELECT TOP 1* FROM Employee ORDER BY Emp_Salary DESC
END

-- execute sp_highestpaidemployee procedure
EXEC sp_HighestPaidEmployee

-- 8. Stored Procedure to Get Employees and Their Salaries Above a Certain Threshold

CREATE PROCEDURE sp_EmployeeSalaryAboveLimit
	@Emp_Salalary_Limit INT
AS
BEGIN
	SELECT Emp_Name, Emp_Salary
	FROM Employee
	WHERE Emp_Salary > @Emp_Salalary_Limit
END

-- execute sp_EmployeeSalaryAboveLimit
EXEC sp_EmployeeSalaryAboveLimit 50000

-- 9. Stored Procedure to Get Employee Details by Name

CREATE PROCEDURE sp_EmployeeDetailsByEmpName
	@Emp_name VARCHAR(100)
AS
BEGIN
	SELECT * FROM Employee
	WHERE Emp_Name = @Emp_name
END

-- execute sp_emplyeedetailsbyempname procedure
EXEC sp_EmployeeDetailsByEmpName 'John Doe'

-- 10. Stored Procedure to Count Employees in Each City

CREATE PROCEDURE sp_CountEmployeeByCity
AS
BEGIN
	SELECT Emp_City, COUNT(*) 
	FROM Employee 
	GROUP BY Emp_City
END

-- execute sp_CountEmployeeByCity procedure
EXEC sp_CountEmployeeByCity

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

