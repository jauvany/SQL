### ✅ **Day 4: Filtering Data**  
Today, you’ll learn how to filter and sort data using SQL commands like `WHERE`, `BETWEEN`, `LIKE`, `IN`, and `ORDER BY`. These are essential for retrieving specific data from a database.

---

#### **1. WHERE Clause**  
The `WHERE` clause is used to filter rows based on a condition.  

**Syntax:**  
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

**Example:**  
```sql
-- Select employees hired after January 1, 2023
SELECT * FROM employees
WHERE hire_date > '2023-01-01';
```

**Task:**  
- Retrieve all students from the `students` table who were born after `2005-01-01`.  

---

#### **2. BETWEEN**  
The `BETWEEN` operator is used to filter rows within a range (inclusive).  

**Syntax:**  
```sql
SELECT column1, column2, ...
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

**Example:**  
```sql
-- Select employees hired between January 1, 2023, and March 31, 2023
SELECT * FROM employees
WHERE hire_date BETWEEN '2023-01-01' AND '2023-03-31';
```

**Task:**  
- Retrieve all students born between `2000-01-01` and `2005-12-31`.  

---

#### **3. LIKE**  
The `LIKE` operator is used to filter rows based on pattern matching.  
- `%` matches any sequence of characters.  
- `_` matches a single character.  

**Syntax:**  
```sql
SELECT column1, column2, ...
FROM table_name
WHERE column_name LIKE pattern;
```

**Examples:**  
```sql
-- Select employees whose first name starts with 'J'
SELECT * FROM employees
WHERE first_name LIKE 'J%';

-- Select employees whose last name ends with 'son'
SELECT * FROM employees
WHERE last_name LIKE '%son';

-- Select employees whose first name has 'a' as the second letter
SELECT * FROM employees
WHERE first_name LIKE '_a%';
```

**Task:**  
- Retrieve all students whose `first_name` starts with 'A'.  
- Retrieve all students whose `last_name` contains 'son'.  

---

#### **4. IN**  
The `IN` operator is used to filter rows where a column's value matches any value in a list.  

**Syntax:**  
```sql
SELECT column1, column2, ...
FROM table_name
WHERE column_name IN (value1, value2, ...);
```

**Example:**  
```sql
-- Select employees with specific employee IDs
SELECT * FROM employees
WHERE employee_id IN (1, 3, 5);
```

**Task:**  
- Retrieve all students with `student_id` in (1, 3, 5).  

---

#### **5. ORDER BY**  
The `ORDER BY` clause is used to sort the result set in ascending (`ASC`) or descending (`DESC`) order.  

**Syntax:**  
```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 ASC|DESC, column2 ASC|DESC, ...;
```

**Example:**  
```sql
-- Sort employees by hire date in ascending order
SELECT * FROM employees
ORDER BY hire_date ASC;

-- Sort employees by last name in descending order
SELECT * FROM employees
ORDER BY last_name DESC;
```

**Task:**  
- Retrieve all students sorted by `date_of_birth` in ascending order.  
- Retrieve all students sorted by `last_name` in descending order.  

---

### **Practice Queries**  
1. Retrieve all students born after `2005-01-01`.  
2. Retrieve all students born between `2000-01-01` and `2005-12-31`.  
3. Retrieve all students whose `first_name` starts with 'A'.  
4. Retrieve all students whose `last_name` contains 'son'.  
5. Retrieve all students with `student_id` in (1, 3, 5).  
6. Retrieve all students sorted by `date_of_birth` in ascending order.  
7. Retrieve all students sorted by `last_name` in descending order.  

---

### **Example Solutions**  

**1. Retrieve all students born after `2005-01-01`:**  
```sql
SELECT * FROM students
WHERE date_of_birth > '2005-01-01';
```

**2. Retrieve all students born between `2000-01-01` and `2005-12-31`:**  
```sql
SELECT * FROM students
WHERE date_of_birth BETWEEN '2000-01-01' AND '2005-12-31';
```

**3. Retrieve all students whose `first_name` starts with 'A':**  
```sql
SELECT * FROM students
WHERE first_name LIKE 'A%';
```

**4. Retrieve all students whose `last_name` contains 'son':**  
```sql
SELECT * FROM students
WHERE last_name LIKE '%son%';
```

**5. Retrieve all students with `student_id` in (1, 3, 5):**  
```sql
SELECT * FROM students
WHERE student_id IN (1, 3, 5);
```

**6. Retrieve all students sorted by `date_of_birth` in ascending order:**  
```sql
SELECT * FROM students
ORDER BY date_of_birth ASC;
```

**7. Retrieve all students sorted by `last_name` in descending order:**  
```sql
SELECT * FROM students
ORDER BY last_name DESC;
```

---

**Next Up:**  
✅ **Day 5: Aggregating Data**  
- Learn how to use aggregate functions like `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`.  

Let me know if you need further clarification or help! 😊
