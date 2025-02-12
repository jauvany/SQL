### ✅ **Day 13: Stored Procedures & Functions**  
Today, you’ll learn how to write **stored procedures** and create **user-defined functions (UDFs)**. These are powerful tools for encapsulating logic, improving code reusability, and enhancing database performance.

---

#### **1. Stored Procedures**  
A stored procedure is a precompiled collection of SQL statements that perform a specific task. It can accept input parameters, execute logic, and return results.  

**Syntax for Creating a Stored Procedure:**  
```sql
CREATE PROCEDURE procedure_name (parameter1 datatype, parameter2 datatype, ...)
AS
BEGIN
    -- SQL statements
END;
```

**Example:**  
Create a stored procedure to retrieve students by department.  

```sql
CREATE PROCEDURE GetStudentsByDepartment (@department VARCHAR(50))
AS
BEGIN
    SELECT first_name, last_name, marks
    FROM students
    WHERE department = @department;
END;
```

**Calling a Stored Procedure:**  
```sql
EXEC GetStudentsByDepartment @department = 'Science';
```

**Task:**  
- Write a stored procedure to update a student's marks by `student_id`.  

---

#### **2. User-Defined Functions (UDFs)**  
A UDF is a reusable function that performs a specific task and returns a value. Unlike stored procedures, UDFs can be used in SQL statements like `SELECT`, `WHERE`, etc.  

**Types of UDFs:**  
- **Scalar Functions:** Return a single value.  
- **Table-Valued Functions:** Return a table.  

---

#### **3. Scalar Functions**  
A scalar function returns a single value.  

**Syntax for Creating a Scalar Function:**  
```sql
CREATE FUNCTION function_name (parameter1 datatype, parameter2 datatype, ...)
RETURNS return_datatype
AS
BEGIN
    -- Logic
    RETURN value;
END;
```

**Example:**  
Create a scalar function to calculate the total marks of a student.  

```sql
CREATE FUNCTION CalculateTotalMarks (@student_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @total_marks INT;
    SELECT @total_marks = SUM(marks)
    FROM students
    WHERE student_id = @student_id;
    RETURN @total_marks;
END;
```

**Using a Scalar Function:**  
```sql
SELECT dbo.CalculateTotalMarks(1) AS total_marks;
```

**Task:**  
- Write a scalar function to calculate the average marks of students in a department.  

---

#### **4. Table-Valued Functions**  
A table-valued function returns a table.  

**Syntax for Creating a Table-Valued Function:**  
```sql
CREATE FUNCTION function_name (parameter1 datatype, parameter2 datatype, ...)
RETURNS TABLE
AS
RETURN (
    -- SQL query
);
```

**Example:**  
Create a table-valued function to retrieve students by department.  

```sql
CREATE FUNCTION GetStudentsByDepartmentTVF (@department VARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT first_name, last_name, marks
    FROM students
    WHERE department = @department
);
```

**Using a Table-Valued Function:**  
```sql
SELECT * FROM dbo.GetStudentsByDepartmentTVF('Science');
```

**Task:**  
- Write a table-valued function to retrieve students with marks above a specified threshold.  

---

### **Practice Queries**  
1. Write a stored procedure to update a student's marks by `student_id`.  
2. Write a scalar function to calculate the average marks of students in a department.  
3. Write a table-valued function to retrieve students with marks above a specified threshold.  

---

### **Example Solutions**  

**1. Stored Procedure to Update Marks:**  
```sql
CREATE PROCEDURE UpdateStudentMarks (@student_id INT, @new_marks INT)
AS
BEGIN
    UPDATE students
    SET marks = @new_marks
    WHERE student_id = @student_id;
END;
```

**Calling the Procedure:**  
```sql
EXEC UpdateStudentMarks @student_id = 1, @new_marks = 95;
```

**2. Scalar Function to Calculate Average Marks:**  
```sql
CREATE FUNCTION CalculateAverageMarks (@department VARCHAR(50))
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @avg_marks DECIMAL(5, 2);
    SELECT @avg_marks = AVG(marks)
    FROM students
    WHERE department = @department;
    RETURN @avg_marks;
END;
```

**Using the Function:**  
```sql
SELECT dbo.CalculateAverageMarks('Science') AS average_marks;
```

**3. Table-Valued Function to Retrieve Students with Marks Above a Threshold:**  
```sql
CREATE FUNCTION GetStudentsAboveThreshold (@threshold INT)
RETURNS TABLE
AS
RETURN (
    SELECT first_name, last_name, marks
    FROM students
    WHERE marks > @threshold
);
```

**Using the Function:**  
```sql
SELECT * FROM dbo.GetStudentsAboveThreshold(80);
```

---

**Next Up:**  
✅ **Day 14: Backup and Recovery**  
- Learn how to back up and restore databases to ensure data safety.  

Let me know if you need further clarification or help! 😊
