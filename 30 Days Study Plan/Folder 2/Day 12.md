### ✅ **Day 12: Normalization & Database Design**  
Today, you’ll learn about **database normalization**, a process of organizing data to reduce redundancy and improve data integrity. You’ll also explore the trade-offs of **denormalization**.

---

#### **1. Normalization Overview**  
Normalization is the process of structuring a database to:  
- Eliminate redundancy.  
- Ensure data dependencies make sense.  
- Improve data integrity and efficiency.  

The most common normal forms are:  
- **1NF (First Normal Form)**  
- **2NF (Second Normal Form)**  
- **3NF (Third Normal Form)**  
- **BCNF (Boyce-Codd Normal Form)**  

---

#### **2. First Normal Form (1NF)**  
A table is in 1NF if:  
- Each column contains atomic (indivisible) values.  
- Each row is unique.  

**Example:**  
Before 1NF:  
| student_id | courses         |  
|------------|-----------------|  
| 1          | Math, Science   |  
| 2          | English         |  

After 1NF:  
| student_id | course  |  
|------------|---------|  
| 1          | Math    |  
| 1          | Science |  
| 2          | English |  

**Task:**  
- Normalize a table that stores multiple phone numbers for a single contact into 1NF.  

---

#### **3. Second Normal Form (2NF)**  
A table is in 2NF if:  
- It is in 1NF.  
- All non-key attributes are fully dependent on the primary key (no partial dependency).  

**Example:**  
Before 2NF:  
| order_id | product_id | product_name | quantity |  
|----------|------------|--------------|----------|  
| 1        | 101        | Laptop       | 2        |  
| 1        | 102        | Mouse        | 5        |  

After 2NF:  
**Orders Table:**  
| order_id | product_id | quantity |  
|----------|------------|----------|  
| 1        | 101        | 2        |  
| 1        | 102        | 5        |  

**Products Table:**  
| product_id | product_name |  
|------------|--------------|  
| 101        | Laptop       |  
| 102        | Mouse        |  

**Task:**  
- Normalize a table that stores order details with redundant product information into 2NF.  

---

#### **4. Third Normal Form (3NF)**  
A table is in 3NF if:  
- It is in 2NF.  
- There are no transitive dependencies (non-key attributes depend only on the primary key).  

**Example:**  
Before 3NF:  
| student_id | student_name | department | department_head |  
|------------|--------------|------------|-----------------|  
| 1          | John         | Science    | Dr. Smith       |  
| 2          | Jane         | Arts       | Dr. Brown       |  

After 3NF:  
**Students Table:**  
| student_id | student_name | department |  
|------------|--------------|------------|  
| 1          | John         | Science    |  
| 2          | Jane         | Arts       |  

**Departments Table:**  
| department | department_head |  
|------------|-----------------|  
| Science    | Dr. Smith       |  
| Arts       | Dr. Brown       |  

**Task:**  
- Normalize a table that stores student information with redundant department details into 3NF.  

---

#### **5. Boyce-Codd Normal Form (BCNF)**  
A table is in BCNF if:  
- It is in 3NF.  
- For every functional dependency, the determinant is a candidate key.  

**Example:**  
Before BCNF:  
| student_id | course | instructor |  
|------------|--------|------------|  
| 1          | Math   | Dr. Smith  |  
| 2          | Math   | Dr. Brown  |  

After BCNF:  
**Enrollments Table:**  
| student_id | course |  
|------------|--------|  
| 1          | Math   |  
| 2          | Math   |  

**Instructors Table:**  
| course | instructor |  
|--------|------------|  
| Math   | Dr. Smith  |  
| Math   | Dr. Brown  |  

**Task:**  
- Normalize a table that stores student enrollments with redundant instructor details into BCNF.  

---

#### **6. Denormalization Trade-offs**  
Denormalization is the process of combining tables to improve read performance at the cost of increased redundancy and potential data inconsistency.  

**When to Denormalize:**  
- Read-heavy workloads (e.g., reporting, analytics).  
- Complex queries that require multiple joins.  

**Trade-offs:**  
- **Pros:** Faster reads, simpler queries.  
- **Cons:** Redundancy, increased storage, risk of data inconsistency.  

**Example:**  
Combine `students` and `departments` tables for faster querying:  
| student_id | student_name | department | department_head |  
|------------|--------------|------------|-----------------|  
| 1          | John         | Science    | Dr. Smith       |  
| 2          | Jane         | Arts       | Dr. Brown       |  

---

### **Practice Queries**  
1. Normalize a table that stores multiple phone numbers for a single contact into 1NF.  
2. Normalize a table that stores order details with redundant product information into 2NF.  
3. Normalize a table that stores student information with redundant department details into 3NF.  
4. Normalize a table that stores student enrollments with redundant instructor details into BCNF.  
5. Discuss the trade-offs of denormalizing a `students` and `departments` table.  

---

### **Example Solutions**  

**1. Normalize into 1NF:**  
Before:  
| contact_id | phone_numbers       |  
|------------|---------------------|  
| 1          | 123-456, 789-012    |  

After:  
| contact_id | phone_number |  
|------------|--------------|  
| 1          | 123-456      |  
| 1          | 789-012      |  

**2. Normalize into 2NF:**  
Before:  
| order_id | product_id | product_name | quantity |  
|----------|------------|--------------|----------|  
| 1        | 101        | Laptop       | 2        |  

After:  
**Orders Table:**  
| order_id | product_id | quantity |  
|----------|------------|----------|  
| 1        | 101        | 2        |  

**Products Table:**  
| product_id | product_name |  
|------------|--------------|  
| 101        | Laptop       |  

**3. Normalize into 3NF:**  
Before:  
| student_id | student_name | department | department_head |  
|------------|--------------|------------|-----------------|  
| 1          | John         | Science    | Dr. Smith       |  

After:  
**Students Table:**  
| student_id | student_name | department |  
|------------|--------------|------------|  
| 1          | John         | Science    |  

**Departments Table:**  
| department | department_head |  
|------------|-----------------|  
| Science    | Dr. Smith       |  

**4. Normalize into BCNF:**  
Before:  
| student_id | course | instructor |  
|------------|--------|------------|  
| 1          | Math   | Dr. Smith  |  

After:  
**Enrollments Table:**  
| student_id | course |  
|------------|--------|  
| 1          | Math   |  

**Instructors Table:**  
| course | instructor |  
|--------|------------|  
| Math   | Dr. Smith  |  

**5. Denormalization Trade-offs:**  
- **Pros:** Faster reads, simpler queries.  
- **Cons:** Redundancy, increased storage, risk of data inconsistency.  

---

**Next Up:**  
✅ **Day 13: Backup and Recovery**  
- Learn how to back up and restore databases to ensure data safety.  

Let me know if you need further clarification or help! 😊
