### ✅ **Day 14: Triggers & Event Handling**  
Today, you’ll learn how to create **triggers** to enforce business rules and handle database events. Triggers are special types of stored procedures that automatically execute in response to specific events, such as `INSERT`, `UPDATE`, or `DELETE` operations.

---

#### **1. What is a Trigger?**  
A trigger is a database object that automatically executes a set of SQL statements when a specified event occurs. Triggers are commonly used for:  
- Enforcing business rules.  
- Validating data.  
- Auditing changes.  
- Maintaining referential integrity.  

**Types of Triggers:**  
- **AFTER Trigger:** Executes after the triggering event (e.g., `INSERT`, `UPDATE`, `DELETE`).  
- **INSTEAD OF Trigger:** Executes instead of the triggering event (often used with views).  

---

#### **2. Creating Triggers**  

**Syntax for Creating a Trigger:**  
```sql
CREATE TRIGGER trigger_name
ON table_name
AFTER|INSTEAD OF [INSERT, UPDATE, DELETE]
AS
BEGIN
    -- SQL statements
END;
```

**Example:**  
Create a trigger to log changes to the `students` table.  

```sql
CREATE TRIGGER trg_LogStudentChanges
ON students
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Log changes to a log table
    INSERT INTO student_log (action, student_id, change_date)
    SELECT 
        CASE 
            WHEN EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted) THEN 'UPDATE'
            WHEN EXISTS (SELECT * FROM inserted) THEN 'INSERT'
            WHEN EXISTS (SELECT * FROM deleted) THEN 'DELETE'
        END AS action,
        COALESCE(i.student_id, d.student_id) AS student_id,
        GETDATE() AS change_date
    FROM inserted i
    FULL JOIN deleted d ON i.student_id = d.student_id;
END;
```

**Task:**  
- Create a trigger to log changes to the `students` table.  

---

#### **3. Enforcing Business Rules with Triggers**  
Triggers can enforce business rules by validating data before or after changes are made.  

**Example:**  
Create a trigger to ensure that a student's marks cannot be updated to a negative value.  

```sql
CREATE TRIGGER trg_ValidateMarks
ON students
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE marks < 0)
    BEGIN
        RAISERROR('Marks cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
```

**Task:**  
- Write a trigger to ensure that a student's marks cannot be updated to a value greater than 100.  

---

#### **4. Practice: Implement a Trigger for Data Validation**  

**Scenario:**  
You want to ensure that a student's `date_of_birth` is not in the future when inserting or updating records.  

**Solution:**  
Create a trigger to validate the `date_of_birth` column.  

```sql
CREATE TRIGGER trg_ValidateDOB
ON students
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE date_of_birth > GETDATE())
    BEGIN
        RAISERROR('Date of birth cannot be in the future.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
```

**Task:**  
- Write a trigger to ensure that a student's `date_of_birth` is not in the future.  

---

### **Practice Queries**  
1. Create a trigger to log changes to the `students` table.  
2. Write a trigger to ensure that a student's marks cannot be updated to a value greater than 100.  
3. Write a trigger to ensure that a student's `date_of_birth` is not in the future.  

---

### **Example Solutions**  

**1. Trigger to Log Changes:**  
```sql
CREATE TRIGGER trg_LogStudentChanges
ON students
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    INSERT INTO student_log (action, student_id, change_date)
    SELECT 
        CASE 
            WHEN EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted) THEN 'UPDATE'
            WHEN EXISTS (SELECT * FROM inserted) THEN 'INSERT'
            WHEN EXISTS (SELECT * FROM deleted) THEN 'DELETE'
        END AS action,
        COALESCE(i.student_id, d.student_id) AS student_id,
        GETDATE() AS change_date
    FROM inserted i
    FULL JOIN deleted d ON i.student_id = d.student_id;
END;
```

**2. Trigger to Validate Marks:**  
```sql
CREATE TRIGGER trg_ValidateMarks
ON students
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE marks > 100)
    BEGIN
        RAISERROR('Marks cannot be greater than 100.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
```

**3. Trigger to Validate Date of Birth:**  
```sql
CREATE TRIGGER trg_ValidateDOB
ON students
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE date_of_birth > GETDATE())
    BEGIN
        RAISERROR('Date of birth cannot be in the future.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
```

---

**Next Up:**  
✅ **Day 15: Backup and Recovery**  
- Learn how to back up and restore databases to ensure data safety.  

Let me know if you need further clarification or help! 😊
