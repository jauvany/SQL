### ✅ **Day 7: Subqueries & Common Table Expressions (CTEs)**  
Today, you’ll learn how to write **subqueries** and use **Common Table Expressions (CTEs)** to simplify complex queries. These techniques are powerful tools for breaking down complex problems into manageable parts.

---

#### **1. Subqueries**  
A subquery is a query nested inside another query. It can be used in `SELECT`, `INSERT`, `UPDATE`, `DELETE`, or `WHERE` clauses.  

**Types of Subqueries:**  
- **Scalar Subquery:** Returns a single value.  
- **Row Subquery:** Returns a single row.  
- **Column Subquery:** Returns a single column.  
- **Table Subquery:** Returns a table.  

---

#### **2. Writing Subqueries**  

**Example 1: Scalar Subquery in `SELECT`**  
Find the average marks of students and compare each student's marks to the average.  

```sql
SELECT first_name, last_name, marks, 
       (SELECT AVG(marks) FROM students) AS average_marks
FROM students;
```

**Example 2: Subquery in `WHERE`**  
Find students who scored above the average marks.  

```sql
SELECT first_name, last_name, marks
FROM students
WHERE marks > (SELECT AVG(marks) FROM students);
```

**Example 3: Subquery in `FROM`**  
Find the department with the highest average marks.  

```sql
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department
HAVING AVG(marks) = (
    SELECT MAX(avg_marks)
    FROM (
        SELECT AVG(marks) AS avg_marks
        FROM students
        GROUP BY department
    ) AS dept_avg
);
```

**Task:**  
- Write a query to find students who scored above the average marks in their department.  

---

#### **3. Common Table Expressions (CTEs)**  
A CTE is a temporary result set that you can reference within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. It is defined using the `WITH` clause.  

**Syntax:**  
```sql
WITH cte_name AS (
    SELECT ...
)
SELECT ...
FROM cte_name;
```

**Example 1: Simple CTE**  
Find the average marks of students and compare each student's marks to the average.  

```sql
WITH avg_marks_cte AS (
    SELECT AVG(marks) AS avg_marks
    FROM students
)
SELECT first_name, last_name, marks, avg_marks
FROM students, avg_marks_cte;
```

**Example 2: CTE with Multiple Subqueries**  
Find the department with the highest average marks.  

```sql
WITH dept_avg AS (
    SELECT department, AVG(marks) AS avg_marks
    FROM students
    GROUP BY department
)
SELECT department, avg_marks
FROM dept_avg
WHERE avg_marks = (SELECT MAX(avg_marks) FROM dept_avg);
```

**Task:**  
- Write a query using a CTE to find students who scored above the average marks in their department.  

---

### **Practice Queries**  
1. Find students who scored above the average marks in their department using a subquery.  
2. Find the department with the highest average marks using a subquery.  
3. Find students who scored above the average marks in their department using a CTE.  
4. Find the department with the highest average marks using a CTE.  

---

### **Example Solutions**  

**1. Find students who scored above the average marks in their department using a subquery:**  
```sql
SELECT first_name, last_name, marks, department
FROM students s1
WHERE marks > (
    SELECT AVG(marks)
    FROM students s2
    WHERE s2.department = s1.department
);
```

**2. Find the department with the highest average marks using a subquery:**  
```sql
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department
HAVING AVG(marks) = (
    SELECT MAX(avg_marks)
    FROM (
        SELECT AVG(marks) AS avg_marks
        FROM students
        GROUP BY department
    ) AS dept_avg
);
```

**3. Find students who scored above the average marks in their department using a CTE:**  
```sql
WITH dept_avg AS (
    SELECT department, AVG(marks) AS avg_marks
    FROM students
    GROUP BY department
)
SELECT s.first_name, s.last_name, s.marks, s.department
FROM students s
JOIN dept_avg d ON s.department = d.department
WHERE s.marks > d.avg_marks;
```

**4. Find the department with the highest average marks using a CTE:**  
```sql
WITH dept_avg AS (
    SELECT department, AVG(marks) AS avg_marks
    FROM students
    GROUP BY department
)
SELECT department, avg_marks
FROM dept_avg
WHERE avg_marks = (SELECT MAX(avg_marks) FROM dept_avg);
```

---

**Next Up:**  
✅ **Day 8: Indexes and Performance Optimization**  
- Learn how to create and use indexes to improve query performance.  

Let me know if you need further clarification or help! 😊
