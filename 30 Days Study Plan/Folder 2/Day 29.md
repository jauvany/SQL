Okay, let's tackle Day 29's plan: reviewing common SQL & DBA interview questions and practicing on LeetCode and HackerRank.  I can help you with both!

**Part 1: Common SQL & DBA Interview Questions (Review)**

Here's a breakdown of some frequently asked questions, categorized for clarity:

**SQL Fundamentals:**

* **SELECT, FROM, WHERE:**  These are the building blocks.  Expect questions about filtering data, using aliases, and understanding the order of operations.  *Example:* "Write a query to find all customers from the 'USA' in the 'Customers' table."
* **GROUP BY, HAVING:**  Essential for aggregations.  `GROUP BY` groups rows based on a column, and `HAVING` filters the *grouped* results.  *Example:* "Find the average order value for each customer, but only show customers with an average order value greater than $100."
* **JOINs (INNER, LEFT, RIGHT, FULL):**  Crucial for combining data from multiple tables.  Understand the different types of joins and when to use them. *Example:* "Retrieve the customer's name and their corresponding order details from the 'Customers' and 'Orders' tables."
* **Subqueries:** Queries nested within other queries.  Useful for complex filtering or calculations. *Example:* "Find the customer who placed the largest order."
* **UNION and UNION ALL:** Combining the results of multiple SELECT statements.  Understand the difference between them (duplicates vs. distinct).
* **Data Types:**  Know the common SQL data types (INT, VARCHAR, DATE, etc.) and when to use them.
* **Indexes:**  How they work, why they're important for performance, and when to create them.  *Example:* "Explain how an index can speed up query execution."
* **Transactions (ACID properties):**  Understand the concepts of Atomicity, Consistency, Isolation, and Durability. *Example:* "What are the ACID properties of a transaction?"
* **Normalization:**  The process of organizing data to reduce redundancy and improve data integrity.  Know the different normal forms (1NF, 2NF, 3NF, BCNF). *Example:* "What are the benefits of database normalization?"

**DBA Specific Questions:**

* **Backup and Recovery:**  Different backup strategies (full, differential, incremental) and how to restore a database. *Example:* "Describe your database backup and recovery plan."
* **Performance Tuning:**  Identifying and resolving performance bottlenecks.  *Example:* "How would you diagnose a slow-performing query?"
* **Security:**  User management, permissions, and protecting against SQL injection. *Example:* "How do you secure a database against unauthorized access?"
* **High Availability and Disaster Recovery:**  Implementing solutions to ensure continuous database availability. *Example:* "Explain different high availability solutions for databases."
* **Monitoring:**  Tools and techniques for monitoring database performance and health.
* **Database Design:**  Creating efficient and scalable database schemas.
* **Stored Procedures, Functions, Triggers:**  Understand their purpose and how to use them. *Example:* "What is a stored procedure and what are its advantages?"
* **Different Database Systems (MySQL, PostgreSQL, SQL Server, Oracle):**  Be familiar with the specific features and differences of the database systems you've worked with.

**Part 2: Hands-on Practice (LeetCode, HackerRank)**

Here's a suggested approach for practicing:

1. **Start with Easy Problems:** Build your confidence and solidify your understanding of basic concepts.
2. **Gradually Increase Difficulty:** Move on to medium and then hard problems as you progress.
3. **Focus on Understanding:** Don't just aim for a correct solution.  Understand *why* your solution works and explore alternative approaches.
4. **Practice Regularly:** Consistency is key.  Even a little bit of practice each day can make a big difference.
5. **Simulate Interview Conditions:**  Try to solve problems within a time limit to get used to the pressure of an interview.
6. **Analyze Your Solutions:**  After solving a problem, review your code and look for ways to optimize it (e.g., improve time or space complexity).  Compare your solution with others to learn different techniques.

**Specific LeetCode/HackerRank Recommendations (Examples):**

* **Easy:**  Two Sum (LeetCode), Simple Array Sum (HackerRank)
* **Medium:**  Group Anagrams (LeetCode), Queries with Sum of Array (HackerRank)
* **Hard:**  Merge Intervals (LeetCode),  Advanced Select Statements (HackerRank SQL Challenges)

**Tips for Practice:**

* **Use a Notebook or Whiteboard:**  Sketching out your ideas and writing pseudocode can help you clarify your thinking.
* **Explain Your Approach:**  Verbalizing your thought process can help you identify flaws in your logic.
* **Don't Give Up Too Easily:**  Struggling with a problem is part of the learning process.  But if you're stuck for too long, don't hesitate to look at hints or solutions.  The key is to learn from your mistakes.

I'm here to help!  If you have specific questions about SQL queries, DBA concepts, or LeetCode/HackerRank problems, feel free to ask.  We can work through examples together, discuss different approaches, and I can provide feedback on your code.  Good luck with your interview preparation!

Day 29: Review & Practice Interview Questions

Here are some common SQL & DBA interview questions that you can practice on LeetCode and HackerRank:

1. Write a SQL query to find the second highest salary from the Employee table.

   ```sql
   SELECT MAX(Salary) AS SecondHighestSalary
   FROM Employee
   WHERE Salary < (SELECT MAX(Salary) FROM Employee)
   ```

2. Write a SQL query to find the Nth highest salary from the Employee table.

   ```sql
   CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
   BEGIN
     RETURN (
       SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
       LIMIT N, 1
     );
   END
   ```

3. Write a SQL query to find the duplicate emails in a table named Person.

   ```sql
   SELECT Email
   FROM Person
   GROUP BY Email
   HAVING COUNT(*) > 1
   ```

4. Write a SQL query to delete all duplicate emails, keeping only one unique email with the smallest Id.

   ```sql
   DELETE p1
   FROM Person p1, Person p2
   WHERE p1.Email = p2.Email AND p1.Id > p2.Id
   ```

5. Write a SQL query to rank scores in a table named Scores.

   ```sql
   SELECT Score, DENSE_RANK() OVER (ORDER BY Score DESC) AS Rank
   FROM Scores
   ```

6. Write a SQL query to find the total number of users and the total number of active users each day.

   ```sql
   SELECT Login_Date, COUNT(User_ID) AS Total_Users,
          SUM(CASE WHEN Is_Active = 1 THEN 1 ELSE 0 END) AS Active_Users
   FROM User_Logins
   GROUP BY Login_Date
   ```

7. Write a SQL query to find the total number of unique visitors who visited the website on each day.

   ```sql
   SELECT Visit_Date, COUNT(DISTINCT User_ID) AS Unique_Visitors
   FROM User_Visits
   GROUP BY Visit_Date
   ```

8. Write a SQL query to find the maximum time gap between two consecutive visits by the same user.

   ```sql
   SELECT User_ID, MAX(Time_Gap) AS Max_Time_Gap
   FROM (
     SELECT User_ID,
            DATEDIFF(MINUTE, LAG(Visit_Time) OVER (PARTITION BY User_ID ORDER BY Visit_Time), Visit_Time) AS Time_Gap
     FROM User_Visits
   ) AS T
   GROUP BY User_ID
   ```

9. Write a SQL query to find the number of users who visited the website on consecutive days.

   ```sql
   SELECT COUNT(DISTINCT User_ID) AS Consecutive_Visitors
   FROM (
     SELECT User_ID, Visit_Date,
            DENSE_RANK() OVER (PARTITION BY User_ID ORDER BY Visit_Date) AS Consecutive_Days
     FROM (
       SELECT DISTINCT User_ID, Visit_Date
       FROM User_Visits
     ) AS T
   ) AS T
   WHERE Consecutive_Days > 1
   ```

10. Write a SQL query to find the average time spent by each user on the website.

    ```sql
    SELECT User_ID, AVG(Time_Spent) AS Avg_Time_Spent
    FROM User_Visits
    GROUP BY User_ID
    ```

These questions cover various SQL concepts such as retrieving data, filtering, joining, aggregating, ranking, and window functions. Practice these questions on LeetCode and HackerRank to strengthen your SQL skills and prepare for your upcoming interviews.

### ✅ **Day 29: Review & Practice Interview Questions**  
Today, you’ll review key SQL and DBA concepts and practice common interview questions. You’ll also get hands-on practice using platforms like **LeetCode** and **HackerRank**.

---

#### **1. Common SQL Interview Questions**  

**1. What is the difference between `INNER JOIN` and `LEFT JOIN`?**  
- **INNER JOIN:** Returns only matching rows from both tables.  
- **LEFT JOIN:** Returns all rows from the left table and matching rows from the right table (non-matching rows contain `NULL`).  

**2. How do you find the second highest salary in a table?**  
```sql
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
```

**3. What is a `GROUP BY` clause?**  
- Groups rows with the same values into summary rows (e.g., `COUNT`, `SUM`, `AVG`).  

**4. How do you remove duplicate rows from a table?**  
```sql
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY first_name, last_name
);
```

**5. What is a subquery?**  
- A query nested inside another query (e.g., `SELECT * FROM (SELECT * FROM employees) AS subquery`).  

---

#### **2. Common DBA Interview Questions**  

**1. What is indexing, and how does it improve performance?**  
- Indexing creates a data structure (e.g., B-tree) to quickly locate rows without scanning the entire table.  

**2. What is the difference between a full backup and an incremental backup?**  
- **Full Backup:** Copies all data in the database.  
- **Incremental Backup:** Copies only the data that has changed since the last backup.  

**3. How do you handle database deadlocks?**  
- Use retry logic, set timeouts, or enforce a consistent lock order.  

**4. What is normalization, and why is it important?**  
- Normalization organizes data to reduce redundancy and improve integrity (e.g., 1NF, 2NF, 3NF).  

**5. How do you monitor database performance?**  
- Use tools like `EXPLAIN ANALYZE`, slow query logs, and database profilers.  

---

#### **3. Hands-On Practice on LeetCode and HackerRank**  

**LeetCode:**  
- **Easy:** [Combine Two Tables](https://leetcode.com/problems/combine-two-tables/)  
- **Medium:** [Second Highest Salary](https://leetcode.com/problems/second-highest-salary/)  
- **Hard:** [Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/)  

**HackerRank:**  
- **Easy:** [Revising the Select Query I](https://www.hackerrank.com/challenges/revising-the-select-query/problem)  
- **Medium:** [The Report](https://www.hackerrank.com/challenges/the-report/problem)  
- **Hard:** [Interviews](https://www.hackerrank.com/challenges/interviews/problem)  

**Task:**  
- Solve at least 3 problems on LeetCode and HackerRank.  

---

### **Practice Questions**  
1. Write a query to find the second highest salary in a table.  
2. Write a query to remove duplicate rows from a table.  
3. Explain the difference between `INNER JOIN` and `LEFT JOIN`.  
4. Solve the "Combine Two Tables" problem on LeetCode.  
5. Solve the "Revising the Select Query I" problem on HackerRank.  

---

### **Example Solutions**  

**1. Second Highest Salary:**  
```sql
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
```

**2. Remove Duplicate Rows:**  
```sql
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY first_name, last_name
);
```

**3. INNER JOIN vs LEFT JOIN:**  
- **INNER JOIN:** Returns only matching rows.  
- **LEFT JOIN:** Returns all rows from the left table and matching rows from the right table.  

**4. LeetCode: Combine Two Tables**  
```sql
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;
```

**5. HackerRank: Revising the Select Query I**  
```sql
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;
```

---

**Next Up:**  
✅ **Day 30: Final Project & Review**  
- Apply everything you’ve learned to a final project and review key concepts.  

Let me know if you need further clarification or help! 😊
