### ✅ **Day 8: Window Functions**  
Today, you’ll learn about **window functions**, which allow you to perform calculations across a set of table rows related to the current row. These functions are powerful for tasks like ranking, partitioning, and analyzing trends.

---

#### **1. Window Functions Overview**  
Window functions operate on a "window" of rows defined by the `OVER` clause. Unlike aggregate functions, they do not collapse rows into a single output row.  

**Syntax:**  
```sql
SELECT column1, column2, 
       window_function() OVER (PARTITION BY column ORDER BY column)
FROM table_name;
```

---

#### **2. ROW_NUMBER()**  
The `ROW_NUMBER()` function assigns a unique sequential integer to each row within a partition.  

**Example:**  
Assign a row number to each student within their department, ordered by marks.  

```sql
SELECT first_name, last_name, department, marks,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY marks DESC) AS row_num
FROM students;
```

**Task:**  
- Write a query to assign a row number to each student within their department, ordered by marks in descending order.  

---

#### **3. RANK() and DENSE_RANK()**  
- `RANK()` assigns a unique rank to each row within a partition, with gaps in ranking for ties.  
- `DENSE_RANK()` assigns a unique rank to each row within a partition, without gaps in ranking for ties.  

**Example:**  
Rank students within their department based on marks.  

```sql
SELECT first_name, last_name, department, marks,
       RANK() OVER (PARTITION BY department ORDER BY marks DESC) AS rank,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY marks DESC) AS dense_rank
FROM students;
```

**Task:**  
- Write a query to rank students within their department using both `RANK()` and `DENSE_RANK()`.  

---

#### **4. NTILE()**  
The `NTILE()` function divides rows into a specified number of buckets and assigns a bucket number to each row.  

**Example:**  
Divide students into 3 buckets within their department based on marks.  

```sql
SELECT first_name, last_name, department, marks,
       NTILE(3) OVER (PARTITION BY department ORDER BY marks DESC) AS bucket
FROM students;
```

**Task:**  
- Write a query to divide students into 4 buckets within their department based on marks.  

---

#### **5. LEAD() and LAG()**  
- `LEAD()` accesses data from the next row in the same result set.  
- `LAG()` accesses data from the previous row in the same result set.  

**Example:**  
Compare each student's marks with the next and previous student's marks within their department.  

```sql
SELECT first_name, last_name, department, marks,
       LAG(marks) OVER (PARTITION BY department ORDER BY marks DESC) AS prev_marks,
       LEAD(marks) OVER (PARTITION BY department ORDER BY marks DESC) AS next_marks
FROM students;
```

**Task:**  
- Write a query to compare each student's marks with the next and previous student's marks within their department.  

---

### **Practice Queries**  
1. Assign a row number to each student within their department, ordered by marks in descending order.  
2. Rank students within their department using both `RANK()` and `DENSE_RANK()`.  
3. Divide students into 4 buckets within their department based on marks.  
4. Compare each student's marks with the next and previous student's marks within their department.  

---

### **Example Solutions**  

**1. Assign a row number to each student within their department, ordered by marks in descending order:**  
```sql
SELECT first_name, last_name, department, marks,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY marks DESC) AS row_num
FROM students;
```

**2. Rank students within their department using both `RANK()` and `DENSE_RANK()`:**  
```sql
SELECT first_name, last_name, department, marks,
       RANK() OVER (PARTITION BY department ORDER BY marks DESC) AS rank,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY marks DESC) AS dense_rank
FROM students;
```

**3. Divide students into 4 buckets within their department based on marks:**  
```sql
SELECT first_name, last_name, department, marks,
       NTILE(4) OVER (PARTITION BY department ORDER BY marks DESC) AS bucket
FROM students;
```

**4. Compare each student's marks with the next and previous student's marks within their department:**  
```sql
SELECT first_name, last_name, department, marks,
       LAG(marks) OVER (PARTITION BY department ORDER BY marks DESC) AS prev_marks,
       LEAD(marks) OVER (PARTITION BY department ORDER BY marks DESC) AS next_marks
FROM students;
```

---

**Next Up:**  
✅ **Day 9: Indexes and Performance Optimization**  
- Learn how to create and use indexes to improve query performance.  

Let me know if you need further clarification or help! 😊
