### ✅ **Day 10: Query Optimization**  
Today, you’ll learn how to optimize slow-running queries using tools like `EXPLAIN ANALYZE`, avoid common pitfalls like `SELECT *` and N+1 queries, and practice optimizing queries for better performance.

---

#### **1. Using EXPLAIN ANALYZE**  
The `EXPLAIN ANALYZE` command provides detailed information about how a query is executed, including the execution plan, cost, and time taken. This helps identify bottlenecks and optimize queries.  

**Syntax:**  
```sql
EXPLAIN ANALYZE
SELECT ...;
```

**Example:**  
Analyze a query that retrieves students with marks greater than 80.  

```sql
EXPLAIN ANALYZE
SELECT * FROM students
WHERE marks > 80;
```

**Key Metrics to Look For:**  
- **Execution Time:** Total time taken to execute the query.  
- **Cost:** Estimated cost of the query (lower is better).  
- **Rows:** Number of rows scanned or returned.  
- **Index Usage:** Whether indexes are being used effectively.  

**Task:**  
- Use `EXPLAIN ANALYZE` to analyze a query that retrieves students in the 'Science' department.  

---

#### **2. Avoiding SELECT ***  
Using `SELECT *` retrieves all columns from a table, which can be inefficient if you only need a few columns.  

**Why Avoid `SELECT *`?**  
- Increases the amount of data transferred.  
- Can prevent the database from using indexes effectively.  
- Makes the query less readable and maintainable.  

**Example:**  
Instead of:  
```sql
SELECT * FROM students;
```

Use:  
```sql
SELECT first_name, last_name, marks FROM students;
```

**Task:**  
- Rewrite a query to retrieve only the `first_name`, `last_name`, and `marks` columns from the `students` table.  

---

#### **3. Avoiding N+1 Queries**  
The N+1 query problem occurs when a query is executed repeatedly in a loop, resulting in multiple round trips to the database.  

**Example of N+1 Query Problem:**  
```sql
-- Retrieve all departments
SELECT * FROM departments;

-- For each department, retrieve students
SELECT * FROM students WHERE department_id = 1;
SELECT * FROM students WHERE department_id = 2;
...
```

**Solution:**  
Use a single query with a `JOIN` to retrieve all data at once.  

```sql
SELECT d.department_name, s.first_name, s.last_name
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id;
```

**Task:**  
- Rewrite a query to retrieve all departments and their students in a single query.  

---

#### **4. Practice: Optimize Slow-Running Queries**  

**Query 1: Slow Query**  
```sql
SELECT * FROM students
WHERE department = 'Science' AND marks > 80;
```

**Optimization Steps:**  
1. Use `EXPLAIN ANALYZE` to analyze the query.  
2. Create an index on the `department` and `marks` columns.  
3. Rewrite the query to avoid `SELECT *`.  

**Optimized Query:**  
```sql
CREATE INDEX idx_department_marks
ON students (department, marks);

EXPLAIN ANALYZE
SELECT first_name, last_name, marks
FROM students
WHERE department = 'Science' AND marks > 80;
```

**Query 2: N+1 Query Problem**  
```sql
-- Retrieve all departments
SELECT * FROM departments;

-- For each department, retrieve students
SELECT * FROM students WHERE department_id = 1;
SELECT * FROM students WHERE department_id = 2;
...
```

**Optimized Query:**  
```sql
SELECT d.department_name, s.first_name, s.last_name
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id;
```

---

### **Practice Queries**  
1. Use `EXPLAIN ANALYZE` to analyze a query that retrieves students in the 'Science' department.  
2. Rewrite a query to retrieve only the `first_name`, `last_name`, and `marks` columns from the `students` table.  
3. Rewrite a query to retrieve all departments and their students in a single query.  
4. Optimize a slow-running query that retrieves students in the 'Science' department with marks greater than 80.  

---

### **Example Solutions**  

**1. Analyze a query with `EXPLAIN ANALYZE`:**  
```sql
EXPLAIN ANALYZE
SELECT * FROM students
WHERE department = 'Science';
```

**2. Rewrite to avoid `SELECT *`:**  
```sql
SELECT first_name, last_name, marks
FROM students;
```

**3. Rewrite to avoid N+1 queries:**  
```sql
SELECT d.department_name, s.first_name, s.last_name
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id;
```

**4. Optimize a slow-running query:**  
```sql
CREATE INDEX idx_department_marks
ON students (department, marks);

EXPLAIN ANALYZE
SELECT first_name, last_name, marks
FROM students
WHERE department = 'Science' AND marks > 80;
```

---

**Next Up:**  
✅ **Day 11: Transactions and Concurrency Control**  
- Learn how to manage transactions and handle concurrency using `BEGIN`, `COMMIT`, and `ROLLBACK`.  

Let me know if you need further clarification or help! 😊
