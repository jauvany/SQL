### ✅ **Day 5: Aggregation & Grouping**  
Today, you’ll learn how to use **aggregate functions** like `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`, as well as how to group data using `GROUP BY` and filter grouped data with `HAVING`.

---

#### **1. Aggregate Functions**  
Aggregate functions perform calculations on a set of values and return a single value.  

**Common Aggregate Functions:**  
- `COUNT()`: Counts the number of rows.  
- `SUM()`: Calculates the sum of a numeric column.  
- `AVG()`: Calculates the average of a numeric column.  
- `MIN()`: Finds the minimum value in a column.  
- `MAX()`: Finds the maximum value in a column.  

---

#### **2. COUNT()**  
The `COUNT()` function returns the number of rows that match a condition.  

**Syntax:**  
```sql
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
```

**Examples:**  
```sql
-- Count all rows in the employees table
SELECT COUNT(*) FROM employees;

-- Count employees hired after January 1, 2023
SELECT COUNT(*) FROM employees
WHERE hire_date > '2023-01-01';
```

**Task:**  
- Count the total number of students in the `students` table.  
- Count the number of students born after `2005-01-01`.  

---

#### **3. SUM()**  
The `SUM()` function calculates the total sum of a numeric column.  

**Syntax:**  
```sql
SELECT SUM(column_name)
FROM table_name
WHERE condition;
```

**Example:**  
```sql
-- Calculate the total salary of all employees
SELECT SUM(salary) FROM employees;
```

**Task:**  
- Add a `marks` column (INT) to the `students` table and populate it with some values.  
- Calculate the total marks of all students.  

---

#### **4. AVG()**  
The `AVG()` function calculates the average value of a numeric column.  

**Syntax:**  
```sql
SELECT AVG(column_name)
FROM table_name
WHERE condition;
```

**Example:**  
```sql
-- Calculate the average salary of all employees
SELECT AVG(salary) FROM employees;
```

**Task:**  
- Calculate the average marks of all students.  

---

#### **5. MIN() and MAX()**  
The `MIN()` and `MAX()` functions return the minimum and maximum values in a column, respectively.  

**Syntax:**  
```sql
SELECT MIN(column_name) FROM table_name;
SELECT MAX(column_name) FROM table_name;
```

**Examples:**  
```sql
-- Find the earliest hire date
SELECT MIN(hire_date) FROM employees;

-- Find the highest salary
SELECT MAX(salary) FROM employees;
```

**Task:**  
- Find the minimum and maximum marks in the `students` table.  

---

#### **6. GROUP BY**  
The `GROUP BY` clause groups rows that have the same values in specified columns into summary rows. It is often used with aggregate functions.  

**Syntax:**  
```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;
```

**Example:**  
```sql
-- Count the number of employees in each department
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;
```

**Task:**  
- Add a `department` column (VARCHAR) to the `students` table and populate it with values like 'Science', 'Arts', 'Commerce'.  
- Count the number of students in each department.  

---

#### **7. HAVING**  
The `HAVING` clause is used to filter groups based on a condition. It is similar to `WHERE`, but it works on aggregated data.  

**Syntax:**  
```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
HAVING condition;
```

**Example:**  
```sql
-- Find departments with more than 5 employees
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;
```

**Task:**  
- Find departments with more than 2 students.  

---

### **Practice Queries**  
1. Count the total number of students.  
2. Count the number of students born after `2005-01-01`.  
3. Calculate the total marks of all students.  
4. Calculate the average marks of all students.  
5. Find the minimum and maximum marks in the `students` table.  
6. Count the number of students in each department.  
7. Find departments with more than 2 students.  

---

### **Example Solutions**  

**1. Count the total number of students:**  
```sql
SELECT COUNT(*) FROM students;
```

**2. Count the number of students born after `2005-01-01`:**  
```sql
SELECT COUNT(*) FROM students
WHERE date_of_birth > '2005-01-01';
```

**3. Calculate the total marks of all students:**  
```sql
SELECT SUM(marks) FROM students;
```

**4. Calculate the average marks of all students:**  
```sql
SELECT AVG(marks) FROM students;
```

**5. Find the minimum and maximum marks in the `students` table:**  
```sql
SELECT MIN(marks), MAX(marks) FROM students;
```

**6. Count the number of students in each department:**  
```sql
SELECT department, COUNT(*)
FROM students
GROUP BY department;
```

**7. Find departments with more than 2 students:**  
```sql
SELECT department, COUNT(*)
FROM students
GROUP BY department
HAVING COUNT(*) > 2;
```

---

**Next Up:**  
✅ **Day 6: Joins**  
- Learn how to combine data from multiple tables using `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `FULL JOIN`.  

Let me know if you need further clarification or help! 😊
