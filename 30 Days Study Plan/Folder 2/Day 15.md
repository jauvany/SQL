### ✅ **Day 15: User Roles & Permissions**  
Today, you’ll learn how to manage database users and their permissions using SQL commands like `GRANT`, `REVOKE`, and `DENY`. Properly managing user roles and permissions is crucial for maintaining database security and ensuring that users have the appropriate level of access.

---

#### **1. Managing Users**  
Before assigning permissions, you need to create and manage users.  

**Creating a User:**  
```sql
CREATE USER username FOR LOGIN loginname;
```

**Example:**  
```sql
CREATE USER john_doe FOR LOGIN john_doe_login;
```

**Deleting a User:**  
```sql
DROP USER username;
```

**Example:**  
```sql
DROP USER john_doe;
```

**Task:**  
- Create a user named `test_user` and assign it to a login named `test_login`.  

---

#### **2. Granting Permissions**  
The `GRANT` command is used to give users specific permissions on database objects (e.g., tables, views, procedures).  

**Syntax:**  
```sql
GRANT permission ON object TO user;
```

**Common Permissions:**  
- `SELECT`: Read data from a table or view.  
- `INSERT`: Add new rows to a table.  
- `UPDATE`: Modify existing rows in a table.  
- `DELETE`: Remove rows from a table.  
- `EXECUTE`: Execute a stored procedure.  

**Example:**  
Grant `SELECT` and `INSERT` permissions on the `students` table to `test_user`.  

```sql
GRANT SELECT, INSERT ON students TO test_user;
```

**Task:**  
- Grant `SELECT` and `UPDATE` permissions on the `students` table to `test_user`.  

---

#### **3. Revoking Permissions**  
The `REVOKE` command is used to remove previously granted permissions.  

**Syntax:**  
```sql
REVOKE permission ON object FROM user;
```

**Example:**  
Revoke `INSERT` permission on the `students` table from `test_user`.  

```sql
REVOKE INSERT ON students FROM test_user;
```

**Task:**  
- Revoke `UPDATE` permission on the `students` table from `test_user`.  

---

#### **4. Denying Permissions**  
The `DENY` command is used to explicitly prevent a user from performing an action, even if they have been granted the permission through a role or group.  

**Syntax:**  
```sql
DENY permission ON object TO user;
```

**Example:**  
Deny `DELETE` permission on the `students` table to `test_user`.  

```sql
DENY DELETE ON students TO test_user;
```

**Task:**  
- Deny `SELECT` permission on the `students` table to `test_user`.  

---

#### **5. Managing Roles**  
Roles are used to group users and manage permissions collectively.  

**Creating a Role:**  
```sql
CREATE ROLE role_name;
```

**Example:**  
```sql
CREATE ROLE read_only;
```

**Assigning a User to a Role:**  
```sql
ALTER ROLE role_name ADD MEMBER username;
```

**Example:**  
```sql
ALTER ROLE read_only ADD MEMBER test_user;
```

**Granting Permissions to a Role:**  
```sql
GRANT SELECT ON students TO read_only;
```

**Task:**  
- Create a role named `editor` and grant it `SELECT`, `INSERT`, and `UPDATE` permissions on the `students` table.  

---

### **Practice Queries**  
1. Create a user named `test_user` and assign it to a login named `test_login`.  
2. Grant `SELECT` and `UPDATE` permissions on the `students` table to `test_user`.  
3. Revoke `UPDATE` permission on the `students` table from `test_user`.  
4. Deny `SELECT` permission on the `students` table to `test_user`.  
5. Create a role named `editor` and grant it `SELECT`, `INSERT`, and `UPDATE` permissions on the `students` table.  

---

### **Example Solutions**  

**1. Create a User:**  
```sql
CREATE USER test_user FOR LOGIN test_login;
```

**2. Grant Permissions:**  
```sql
GRANT SELECT, UPDATE ON students TO test_user;
```

**3. Revoke Permissions:**  
```sql
REVOKE UPDATE ON students FROM test_user;
```

**4. Deny Permissions:**  
```sql
DENY SELECT ON students TO test_user;
```

**5. Create and Configure a Role:**  
```sql
CREATE ROLE editor;
GRANT SELECT, INSERT, UPDATE ON students TO editor;
ALTER ROLE editor ADD MEMBER test_user;
```

---

**Next Up:**  
✅ **Day 16: Backup and Recovery**  
- Learn how to back up and restore databases to ensure data safety.  

Let me know if you need further clarification or help! 😊
