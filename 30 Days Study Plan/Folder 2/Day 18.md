### ✅ **Day 18: Logging & Monitoring Performance**  
Today, you’ll learn how to use **logs** to track queries and monitor database performance. You’ll also explore tools like **slow query logs** and **database profilers** to identify and optimize poorly performing queries.

---

#### **1. Using Logs to Track Queries**  
Logs are essential for understanding database activity, diagnosing issues, and optimizing performance.  

**Types of Logs:**  
1. **Query Logs:** Record all SQL queries executed on the database.  
2. **Error Logs:** Capture errors and warnings.  
3. **Slow Query Logs:** Identify queries that take longer than a specified threshold to execute.  

---

#### **2. Slow Query Logs**  
Slow query logs help identify queries that are consuming excessive resources or taking too long to execute.  

**Enabling Slow Query Logs in MySQL:**  
1. Edit the MySQL configuration file (`my.cnf` or `my.ini`).  
2. Add the following lines:  
   ```ini
   slow_query_log = 1
   slow_query_log_file = /var/log/mysql/slow.log
   long_query_time = 2
   ```  
   - `slow_query_log`: Enables the slow query log.  
   - `slow_query_log_file`: Specifies the log file location.  
   - `long_query_time`: Sets the threshold (in seconds) for logging queries.  

3. Restart the MySQL server.  

**Example:**  
Analyze the slow query log to identify problematic queries.  

```bash
cat /var/log/mysql/slow.log
```

**Task:**  
- Enable slow query logs in MySQL and analyze the log file.  

---

#### **3. Database Profiler**  
A database profiler provides detailed insights into query execution, including execution time, resource usage, and query plans.  

**Using SQL Server Profiler:**  
1. Open SQL Server Profiler.  
2. Create a new trace and select the events to capture (e.g., `SQL:BatchCompleted`, `SQL:StmtCompleted`).  
3. Run the trace and analyze the results.  

**Example:**  
Capture and analyze queries that take longer than 1 second to execute.  

**Task:**  
- Use SQL Server Profiler to capture and analyze slow queries.  

---

#### **4. Query Performance Monitoring in PostgreSQL**  
PostgreSQL provides tools like `pg_stat_statements` to monitor query performance.  

**Enabling `pg_stat_statements`:**  
1. Edit the `postgresql.conf` file and add:  
   ```ini
   shared_preload_libraries = 'pg_stat_statements'
   pg_stat_statements.track = all
   ```  
2. Restart the PostgreSQL server.  
3. Create the extension in the database:  
   ```sql
   CREATE EXTENSION pg_stat_statements;
   ```  

**Example:**  
View the top 10 slowest queries:  
```sql
SELECT query, calls, total_time, mean_time
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;
```

**Task:**  
- Enable `pg_stat_statements` in PostgreSQL and analyze the top slowest queries.  

---

### **Practice Queries**  
1. Enable slow query logs in MySQL and analyze the log file.  
2. Use SQL Server Profiler to capture and analyze slow queries.  
3. Enable `pg_stat_statements` in PostgreSQL and analyze the top slowest queries.  

---

### **Example Solutions**  

**1. Enable Slow Query Logs in MySQL:**  
Edit `my.cnf` or `my.ini`:  
```ini
slow_query_log = 1
slow_query_log_file = /var/log/mysql/slow.log
long_query_time = 2
```

Restart MySQL and analyze the log:  
```bash
cat /var/log/mysql/slow.log
```

**2. Use SQL Server Profiler:**  
- Open SQL Server Profiler.  
- Create a new trace and select `SQL:BatchCompleted` and `SQL:StmtCompleted`.  
- Run the trace and analyze the results.  

**3. Enable `pg_stat_statements` in PostgreSQL:**  
Edit `postgresql.conf`:  
```ini
shared_preload_libraries = 'pg_stat_statements'
pg_stat_statements.track = all
```

Restart PostgreSQL and create the extension:  
```sql
CREATE EXTENSION pg_stat_statements;
```

Analyze the top slowest queries:  
```sql
SELECT query, calls, total_time, mean_time
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;
```

---

**Next Up:**  
✅ **Day 19: Scaling Databases**  
- Learn about scaling databases vertically and horizontally to handle increased load.  

Let me know if you need further clarification or help! 😊
