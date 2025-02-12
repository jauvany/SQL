### ✅ **Day 16: Backup & Restore Strategies**  
Today, you’ll learn about **backup and restore strategies** to ensure data safety and recoverability. Proper backup strategies are critical for protecting your data from loss due to hardware failures, human errors, or disasters.

---

#### **1. Types of Backups**  
There are three main types of backups:  

1. **Full Backup:**  
   - A complete copy of the entire database.  
   - Provides the most comprehensive protection but requires the most storage and time.  
   - Example: Back up the entire `students` database.  

2. **Incremental Backup:**  
   - Backs up only the data that has changed since the last backup (full or incremental).  
   - Requires less storage and time compared to a full backup.  
   - Example: Back up only the changes made since the last backup.  

3. **Differential Backup:**  
   - Backs up only the data that has changed since the last full backup.  
   - Requires more storage and time than incremental backups but less than full backups.  
   - Example: Back up all changes made since the last full backup.  

---

#### **2. Full Backup**  

**Syntax for Full Backup:**  
```sql
BACKUP DATABASE database_name
TO DISK = 'path_to_backup_file.bak';
```

**Example:**  
Back up the `students` database to a file.  

```sql
BACKUP DATABASE students
TO DISK = 'C:\Backups\students_full.bak';
```

**Task:**  
- Perform a full backup of the `students` database.  

---

#### **3. Incremental Backup**  

**Syntax for Incremental Backup:**  
```sql
BACKUP DATABASE database_name
TO DISK = 'path_to_backup_file.bak'
WITH DIFFERENTIAL;
```

**Example:**  
Perform an incremental backup of the `students` database.  

```sql
BACKUP DATABASE students
TO DISK = 'C:\Backups\students_incremental.bak'
WITH DIFFERENTIAL;
```

**Task:**  
- Perform an incremental backup of the `students` database.  

---

#### **4. Differential Backup**  

**Syntax for Differential Backup:**  
```sql
BACKUP DATABASE database_name
TO DISK = 'path_to_backup_file.bak'
WITH DIFFERENTIAL;
```

**Example:**  
Perform a differential backup of the `students` database.  

```sql
BACKUP DATABASE students
TO DISK = 'C:\Backups\students_differential.bak'
WITH DIFFERENTIAL;
```

**Task:**  
- Perform a differential backup of the `students` database.  

---

#### **5. Database Recovery Techniques**  
Recovery involves restoring a database from backups and applying transaction logs to bring the database to a consistent state.  

**Steps for Recovery:**  
1. Restore the most recent full backup.  
2. Apply the most recent differential backup (if available).  
3. Apply all incremental backups (if available).  
4. Apply transaction logs to recover up to the point of failure.  

---

#### **6. Restoring a Database**  

**Syntax for Restoring a Full Backup:**  
```sql
RESTORE DATABASE database_name
FROM DISK = 'path_to_backup_file.bak'
WITH RECOVERY;
```

**Example:**  
Restore the `students` database from a full backup.  

```sql
RESTORE DATABASE students
FROM DISK = 'C:\Backups\students_full.bak'
WITH RECOVERY;
```

**Syntax for Restoring with Differential/Incremental Backups:**  
```sql
RESTORE DATABASE database_name
FROM DISK = 'path_to_full_backup_file.bak'
WITH NORECOVERY;

RESTORE DATABASE database_name
FROM DISK = 'path_to_differential_backup_file.bak'
WITH RECOVERY;
```

**Example:**  
Restore the `students` database using a full backup and a differential backup.  

```sql
RESTORE DATABASE students
FROM DISK = 'C:\Backups\students_full.bak'
WITH NORECOVERY;

RESTORE DATABASE students
FROM DISK = 'C:\Backups\students_differential.bak'
WITH RECOVERY;
```

**Task:**  
- Restore the `students` database using a full backup and a differential backup.  

---

### **Practice Queries**  
1. Perform a full backup of the `students` database.  
2. Perform an incremental backup of the `students` database.  
3. Perform a differential backup of the `students` database.  
4. Restore the `students` database using a full backup and a differential backup.  

---

### **Example Solutions**  

**1. Full Backup:**  
```sql
BACKUP DATABASE students
TO DISK = 'C:\Backups\students_full.bak';
```

**2. Incremental Backup:**  
```sql
BACKUP DATABASE students
TO DISK = 'C:\Backups\students_incremental.bak'
WITH DIFFERENTIAL;
```

**3. Differential Backup:**  
```sql
BACKUP DATABASE students
TO DISK = 'C:\Backups\students_differential.bak'
WITH DIFFERENTIAL;
```

**4. Restore Database:**  
```sql
RESTORE DATABASE students
FROM DISK = 'C:\Backups\students_full.bak'
WITH NORECOVERY;

RESTORE DATABASE students
FROM DISK = 'C:\Backups\students_differential.bak'
WITH RECOVERY;
```

---

**Next Up:**  
✅ **Day 17: Database Monitoring & Maintenance**  
- Learn how to monitor database performance and perform routine maintenance tasks.  

Let me know if you need further clarification or help! 😊
