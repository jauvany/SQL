### ✅ **Day 11: Transactions & Concurrency**  
Today, you’ll learn about **transactions** and **concurrency control** in databases. Transactions ensure data integrity and consistency, while concurrency control manages simultaneous access to data by multiple users or processes.

---

#### **1. ACID Properties**  
Transactions in relational databases follow the **ACID** properties:  

- **Atomicity:** A transaction is treated as a single unit. It either completes entirely or not at all.  
- **Consistency:** A transaction brings the database from one valid state to another, maintaining data integrity.  
- **Isolation:** Transactions are executed in isolation from other transactions.  
- **Durability:** Once a transaction is committed, its changes are permanent, even in the event of a system failure.  

---

#### **2. BEGIN TRANSACTION, COMMIT, ROLLBACK**  
These commands are used to manage transactions:  

- **BEGIN TRANSACTION:** Starts a new transaction.  
- **COMMIT:** Saves the changes made during the transaction permanently.  
- **ROLLBACK:** Undoes the changes made during the transaction.  

**Example:**  
Transfer money from one account to another.  

```sql
BEGIN TRANSACTION;

-- Deduct amount from account 1
UPDATE accounts
SET balance = balance - 100
WHERE account_id = 1;

-- Add amount to account 2
UPDATE accounts
SET balance = balance + 100
WHERE account_id = 2;

-- Check for errors
IF @@ERROR = 0
    COMMIT; -- Save changes
ELSE
    ROLLBACK; -- Undo changes
```

**Task:**  
- Write a transaction to update a student's marks and log the change in a `marks_log` table.  

---

#### **3. Handling Deadlocks**  
A **deadlock** occurs when two or more transactions block each other by holding locks on resources that the other transactions need.  

**Example of Deadlock:**  
- Transaction 1 locks row A and requests row B.  
- Transaction 2 locks row B and requests row A.  
- Both transactions wait indefinitely for each other.  

**How to Handle Deadlocks:**  
1. **Retry Logic:** If a deadlock occurs, retry the transaction after a short delay.  
2. **Lock Ordering:** Always lock resources in the same order to prevent circular waits.  
3. **Timeout:** Set a timeout for transactions to avoid indefinite waiting.  

**Example:**  
```sql
BEGIN TRANSACTION;

-- Transaction 1
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;

COMMIT;
```

**Task:**  
- Simulate a deadlock scenario and implement retry logic to handle it.  

---

### **Practice Queries**  
1. Write a transaction to update a student's marks and log the change in a `marks_log` table.  
2. Simulate a deadlock scenario and implement retry logic to handle it.  

---

### **Example Solutions**  

**1. Transaction to update marks and log changes:**  
```sql
BEGIN TRANSACTION;

-- Update student's marks
UPDATE students
SET marks = 90
WHERE student_id = 1;

-- Log the change
INSERT INTO marks_log (student_id, old_marks, new_marks, change_date)
SELECT student_id, marks, 90, GETDATE()
FROM students
WHERE student_id = 1;

-- Check for errors
IF @@ERROR = 0
    COMMIT; -- Save changes
ELSE
    ROLLBACK; -- Undo changes
```

**2. Simulate and handle a deadlock:**  
```sql
-- Transaction 1
BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
WAITFOR DELAY '00:00:05'; -- Simulate delay
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
COMMIT;

-- Transaction 2
BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 2;
WAITFOR DELAY '00:00:05'; -- Simulate delay
UPDATE accounts SET balance = balance + 100 WHERE account_id = 1;
COMMIT;

-- Retry logic in application code
DECLARE @retry INT = 0;
WHILE @retry < 3
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        -- Your transaction logic here
        COMMIT;
        BREAK;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @retry = @retry + 1;
        WAITFOR DELAY '00:00:01'; -- Wait before retrying
    END CATCH
END
```

---

**Next Up:**  
✅ **Day 12: Database Design & Normalization**  
- Learn about database design principles and normalization to reduce redundancy and improve data integrity.  

Let me know if you need further clarification or help! 😊
