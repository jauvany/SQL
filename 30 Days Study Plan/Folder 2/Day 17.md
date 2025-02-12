### ✅ **Day 17: Database Security Best Practices**  
Today, you’ll learn about **database security best practices**, including preventing **SQL injection**, implementing **encryption**, and ensuring **secure authentication**. These practices are essential for protecting your database from unauthorized access and malicious attacks.

---

#### **1. Preventing SQL Injection**  
SQL injection is a common attack where malicious SQL code is inserted into input fields to manipulate the database.  

**Best Practices to Prevent SQL Injection:**  
1. **Use Parameterized Queries:**  
   - Always use parameterized queries or prepared statements to separate SQL code from user input.  

   **Example in SQL Server:**  
   ```sql
   DECLARE @username NVARCHAR(50) = 'user_input';
   DECLARE @password NVARCHAR(50) = 'user_input';
   
   SELECT * FROM users
   WHERE username = @username AND password = @password;
   ```

   **Example in Python (with SQLAlchemy):**  
   ```python
   query = "SELECT * FROM users WHERE username = :username AND password = :password"
   result = db.execute(query, {'username': user_input, 'password': password_input})
   ```

2. **Input Validation:**  
   - Validate and sanitize all user inputs to ensure they conform to expected formats (e.g., numbers, email addresses).  

3. **Use Stored Procedures:**  
   - Encapsulate SQL logic in stored procedures to reduce the risk of injection.  

4. **Limit Database Permissions:**  
   - Restrict database user permissions to only what is necessary (e.g., read-only access for reporting users).  

**Task:**  
- Rewrite a vulnerable query to use parameterized inputs.  

---

#### **2. Encryption**  
Encryption ensures that sensitive data is unreadable to unauthorized users.  

**Types of Encryption:**  
1. **Data-at-Rest Encryption:**  
   - Encrypts data stored in the database.  
   - Example: Transparent Data Encryption (TDE) in SQL Server.  

   **Enable TDE in SQL Server:**  
   ```sql
   CREATE DATABASE ENCRYPTION KEY
   WITH ALGORITHM = AES_256
   ENCRYPTION BY SERVER CERTIFICATE MyServerCert;

   ALTER DATABASE students
   SET ENCRYPTION ON;
   ```

2. **Data-in-Transit Encryption:**  
   - Encrypts data transmitted between the database and clients.  
   - Example: Use SSL/TLS for secure communication.  

   **Enable SSL in PostgreSQL:**  
   - Configure `pg_hba.conf` and `postgresql.conf` to require SSL connections.  

3. **Column-Level Encryption:**  
   - Encrypts specific columns containing sensitive data (e.g., passwords, credit card numbers).  

   **Example in SQL Server:**  
   ```sql
   CREATE SYMMETRIC KEY MyColumnKey
   WITH ALGORITHM = AES_256
   ENCRYPTION BY PASSWORD = 'strong_password';

   OPEN SYMMETRIC KEY MyColumnKey
   DECRYPTION BY PASSWORD = 'strong_password';

   UPDATE users
   SET encrypted_password = ENCRYPTBYKEY(KEY_GUID('MyColumnKey'), 'plain_text_password');
   ```

**Task:**  
- Enable column-level encryption for the `password` column in the `users` table.  

---

#### **3. Secure Authentication**  
Secure authentication ensures that only authorized users can access the database.  

**Best Practices for Secure Authentication:**  
1. **Use Strong Passwords:**  
   - Enforce strong password policies (e.g., minimum length, complexity).  

2. **Multi-Factor Authentication (MFA):**  
   - Require additional verification (e.g., SMS code, authenticator app) for database access.  

3. **Role-Based Access Control (RBAC):**  
   - Assign permissions based on user roles (e.g., admin, read-only user).  

4. **Audit and Monitor Logins:**  
   - Track and review login attempts to detect suspicious activity.  

   **Example in SQL Server:**  
   ```sql
   CREATE SERVER AUDIT MyAudit
   TO FILE (FILEPATH = 'C:\Audits\');

   CREATE SERVER AUDIT SPECIFICATION MyAuditSpec
   FOR SERVER AUDIT MyAudit
   ADD (FAILED_LOGIN_GROUP),
   ADD (SUCCESSFUL_LOGIN_GROUP)
   WITH (STATE = ON);
   ```

**Task:**  
- Create an audit log to track failed login attempts.  

---

### **Practice Queries**  
1. Rewrite a vulnerable query to use parameterized inputs.  
2. Enable column-level encryption for the `password` column in the `users` table.  
3. Create an audit log to track failed login attempts.  

---

### **Example Solutions**  

**1. Parameterized Query:**  
```sql
DECLARE @username NVARCHAR(50) = 'user_input';
DECLARE @password NVARCHAR(50) = 'user_input';

SELECT * FROM users
WHERE username = @username AND password = @password;
```

**2. Column-Level Encryption:**  
```sql
CREATE SYMMETRIC KEY MyColumnKey
WITH ALGORITHM = AES_256
ENCRYPTION BY PASSWORD = 'strong_password';

OPEN SYMMETRIC KEY MyColumnKey
DECRYPTION BY PASSWORD = 'strong_password';

UPDATE users
SET encrypted_password = ENCRYPTBYKEY(KEY_GUID('MyColumnKey'), 'plain_text_password');
```

**3. Audit Log for Failed Logins:**  
```sql
CREATE SERVER AUDIT MyAudit
TO FILE (FILEPATH = 'C:\Audits\');

CREATE SERVER AUDIT SPECIFICATION MyAuditSpec
FOR SERVER AUDIT MyAudit
ADD (FAILED_LOGIN_GROUP)
WITH (STATE = ON);
```

---

**Next Up:**  
✅ **Day 18: Database Monitoring & Maintenance**  
- Learn how to monitor database performance and perform routine maintenance tasks.  

Let me know if you need further clarification or help! 😊
