### ✅ **Day 6: Joining Tables**  
Today, you’ll learn how to combine data from multiple tables using **joins**. Joins are essential for working with relational databases, as they allow you to retrieve data from related tables.

---

#### **1. INNER JOIN**  
The `INNER JOIN` returns only the rows that have matching values in both tables.  

**Syntax:**  
```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```

**Example:**  
Suppose you have two tables:  
- `students`: `student_id`, `first_name`, `last_name`, `department_id`  
- `departments`: `department_id`, `department_name`  

```sql
-- Retrieve students along with their department names
SELECT students.first_name, students.last_name, departments.department_name
FROM students
INNER JOIN departments
ON students.department_id = departments.department_id;
```

**Task:**  
- Create a `departments` table with `department_id` and `department_name`.  
- Add a `department_id` column to the `students` table and populate it with values.  
- Write a query to retrieve students along with their department names using `INNER JOIN`.  

---

#### **2. LEFT JOIN (or LEFT OUTER JOIN)**  
The `LEFT JOIN` returns all rows from the left table and the matching rows from the right table. If there is no match, the result is `NULL` on the right side.  

**Syntax:**  
```sql
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```

**Example:**  
```sql
-- Retrieve all students and their department names (if available)
SELECT students.first_name, students.last_name, departments.department_name
FROM students
LEFT JOIN departments
ON students.department_id = departments.department_id;
```

**Task:**  
- Write a query to retrieve all students and their department names, including students without a department.  

---

#### **3. RIGHT JOIN (or RIGHT OUTER JOIN)**  
The `RIGHT JOIN` returns all rows from the right table and the matching rows from the left table. If there is no match, the result is `NULL` on the left side.  

**Syntax:**  
```sql
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
```

**Example:**  
```sql
-- Retrieve all departments and their students (if any)
SELECT students.first_name, students.last_name, departments.department_name
FROM students
RIGHT JOIN departments
ON students.department_id = departments.department_id;
```

**Task:**  
- Write a query to retrieve all departments and their students, including departments without students.  

---

#### **4. FULL JOIN (or FULL OUTER JOIN)**  
The `FULL JOIN` returns all rows when there is a match in either the left or right table. If there is no match, the result is `NULL` on the side without a match.  

**Syntax:**  
```sql
SELECT columns
FROM table1
FULL JOIN table2
ON table1.column = table2.column;
```

**Example:**  
```sql
-- Retrieve all students and departments, including unmatched rows
SELECT students.first_name, students.last_name, departments.department_name
FROM students
FULL JOIN departments
ON students.department_id = departments.department_id;
```

**Task:**  
- Write a query to retrieve all students and departments, including unmatched rows.  

---

### **Practice Queries**  
1. Retrieve students along with their department names using `INNER JOIN`.  
2. Retrieve all students and their department names, including students without a department, using `LEFT JOIN`.  
3. Retrieve all departments and their students, including departments without students, using `RIGHT JOIN`.  
4. Retrieve all students and departments, including unmatched rows, using `FULL JOIN`.  

---

### **Example Solutions**  

**1. Retrieve students along with their department names using `INNER JOIN`:**  
```sql
SELECT students.first_name, students.last_name, departments.department_name
FROM students
INNER JOIN departments
ON students.department_id = departments.department_id;
```

**2. Retrieve all students and their department names, including students without a department, using `LEFT JOIN`:**  
```sql
SELECT students.first_name, students.last_name, departments.department_name
FROM students
LEFT JOIN departments
ON students.department_id = departments.department_id;
```

**3. Retrieve all departments and their students, including departments without students, using `RIGHT JOIN`:**  
```sql
SELECT students.first_name, students.last_name, departments.department_name
FROM students
RIGHT JOIN departments
ON students.department_id = departments.department_id;
```

**4. Retrieve all students and departments, including unmatched rows, using `FULL JOIN`:**  
```sql
SELECT students.first_name, students.last_name, departments.department_name
FROM students
FULL JOIN departments
ON students.department_id = departments.department_id;
```

---

**Next Up:**  
✅ **Day 7: Subqueries**  
- Learn how to use subqueries to write more complex queries.  

Let me know if you need further clarification or help! 😊
