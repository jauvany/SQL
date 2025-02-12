### ✅ **Day 3: CRUD Operations**  
Today, you’ll learn the core CRUD operations in SQL: **Create (Insert)**, **Read (Select)**, **Update**, and **Delete**. These operations are essential for managing data in a database.

---

#### **1. INSERT INTO**  
The `INSERT INTO` command is used to add new rows of data into a table.  

**Syntax:**  
```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

**Example:**  
```sql
INSERT INTO employees (employee_id, first_name, last_name, hire_date)
VALUES (1, 'John', 'Doe', '2023-01-15');
```

**Inserting Multiple Rows:**  
You can insert multiple rows in a single query:  
```sql
INSERT INTO employees (employee_id, first_name, last_name, hire_date)
VALUES 
(2, 'Jane', 'Smith', '2023-02-20'),
(3, 'Alice', 'Johnson', '2023-03-25');
```

**Task:**  
- Create a table named `students` (if it doesn’t exist) with the following columns:  
  - `student_id` (INT, PRIMARY KEY)  
  - `first_name` (VARCHAR(50), NOT NULL  
  - `last_name` (VARCHAR(50), NOT NULL  
  - `date_of_birth` (DATE)  
- Insert at least 3 rows of data into the `students` table.  

---

#### **2. SELECT**  
The `SELECT` command is used to retrieve data from a table.  

**Syntax:**  
```sql
SELECT column1, column2, ...
FROM table_name;
```

**Example:**  
```sql
-- Select all columns
SELECT * FROM employees;

-- Select specific columns
SELECT first_name, last_name FROM employees;
```

**Filtering Data with WHERE:**  
You can filter rows using the `WHERE` clause:  
```sql
SELECT * FROM employees
WHERE hire_date > '2023-01-01';
```

**Task:**  
- Retrieve all rows from the `students` table.  
- Retrieve only the `first_name` and `last_name` of students born after `2005-01-01`.  

---

#### **3. UPDATE**  
The `UPDATE` command is used to modify existing data in a table.  

**Syntax:**  
```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

**Example:**  
```sql
-- Update a specific row
UPDATE employees
SET last_name = 'Brown'
WHERE employee_id = 1;

-- Update multiple rows
UPDATE employees
SET hire_date = '2023-04-01'
WHERE hire_date < '2023-03-01';
```

**Task:**  
- Update the `last_name` of a student with `student_id = 1` to "Smith".  
- Update the `date_of_birth` of all students born before `2005-01-01` to `2005-01-01`.  

---

#### **4. DELETE**  
The `DELETE` command is used to remove rows from a table.  

**Syntax:**  
```sql
DELETE FROM table_name
WHERE condition;
```

**Example:**  
```sql
-- Delete a specific row
DELETE FROM employees
WHERE employee_id = 1;

-- Delete multiple rows
DELETE FROM employees
WHERE hire_date < '2023-01-01';
```

**Note:** If you omit the `WHERE` clause, all rows in the table will be deleted!  

**Task:**  
- Delete a student with `student_id = 2`.  
- Delete all students born before `2005-01-01`.  

---

### **Summary of Day 3 Tasks:**  
1. Create the `students` table (if it doesn’t exist).  
2. Insert at least 3 rows of data into the `students` table.  
3. Retrieve all rows from the `students` table.  
4. Retrieve only the `first_name` and `last_name` of students born after `2005-01-01`.  
5. Update the `last_name` of a student with `student_id = 1` to "Smith".  
6. Update the `date_of_birth` of all students born before `2005-01-01` to `2005-01-01`.  
7. Delete a student with `student_id = 2`.  
8. Delete all students born before `2005-01-01`.  

---

**Next Up:**  
✅ **Day 4: Filtering and Sorting Data**  
- Learn advanced filtering with `WHERE`, `AND`, `OR`, `IN`, `BETWEEN`, and sorting with `ORDER BY`.  

Let me know if you need further clarification or help! 😊
