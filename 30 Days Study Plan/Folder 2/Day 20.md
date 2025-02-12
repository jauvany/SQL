### ✅ **Day 20: High Availability & Replication**  
Today, you’ll learn about **high availability (HA)** and **replication** strategies to ensure database uptime and scalability. These techniques are essential for maintaining performance and reliability in production environments.

---

#### **1. High Availability (HA)**  
High availability ensures that a database remains accessible and operational with minimal downtime, even during failures.  

**Key Components of HA:**  
- **Redundancy:** Multiple copies of data and services.  
- **Failover:** Automatic switching to a backup system in case of failure.  
- **Monitoring:** Continuous health checks and alerts.  

---

#### **2. Master-Slave Replication**  
Master-slave replication involves one primary (master) database that handles write operations and one or more secondary (slave) databases that replicate data from the master and handle read operations.  

**How It Works:**  
1. The master database processes all write operations (`INSERT`, `UPDATE`, `DELETE`).  
2. Changes are logged in a binary log.  
3. Slave databases replicate the changes from the master's binary log.  
4. Read operations can be distributed across slave databases to reduce load on the master.  

**Benefits:**  
- **Read Scaling:** Distribute read queries across multiple slaves.  
- **Fault Tolerance:** If the master fails, a slave can be promoted to master.  

---

#### **3. Setting Up Master-Slave Replication in MySQL**  

**Step 1: Configure the Master Server**  
1. Edit the MySQL configuration file (`my.cnf` or `my.ini`):  
   ```ini
   [mysqld]
   server-id=1
   log-bin=mysql-bin
   ```  
2. Restart the MySQL server.  
3. Create a replication user:  
   ```sql
   CREATE USER 'replica'@'%' IDENTIFIED BY 'password';
   GRANT REPLICATION SLAVE ON *.* TO 'replica'@'%';
   FLUSH PRIVILEGES;
   ```  
4. Check the master status:  
   ```sql
   SHOW MASTER STATUS;
   ```  
   Note the `File` and `Position` values.  

**Step 2: Configure the Slave Server**  
1. Edit the MySQL configuration file:  
   ```ini
   [mysqld]
   server-id=2
   ```  
2. Restart the MySQL server.  
3. Set up replication:  
   ```sql
   CHANGE MASTER TO
   MASTER_HOST='master_ip',
   MASTER_USER='replica',
   MASTER_PASSWORD='password',
   MASTER_LOG_FILE='mysql-bin.000001',
   MASTER_LOG_POS=4;
   ```  
4. Start the slave:  
   ```sql
   START SLAVE;
   ```  
5. Check the slave status:  
   ```sql
   SHOW SLAVE STATUS\G;
   ```  

**Task:**  
- Set up master-slave replication between two MySQL instances.  

---

#### **4. Read/Write Scaling**  
Read/write scaling involves distributing read and write operations across multiple database instances to improve performance.  

**Strategies:**  
1. **Read Scaling:**  
   - Use slave databases to handle read queries.  
   - Example: Direct all `SELECT` queries to slave databases.  

2. **Write Scaling:**  
   - Use techniques like sharding or multi-master replication to distribute write operations.  

**Example of Read Scaling:**  
Configure your application to direct read queries to slave databases:  
```python
# Python example with SQLAlchemy
read_db_url = 'mysql://user:password@slave1:3306/db'
write_db_url = 'mysql://user:password@master:3306/db'

read_engine = create_engine(read_db_url)
write_engine = create_engine(write_db_url)

# Use read_engine for SELECT queries
result = read_engine.execute("SELECT * FROM customers")

# Use write_engine for INSERT/UPDATE/DELETE queries
write_engine.execute("INSERT INTO customers (name, email) VALUES ('John', 'john@example.com')")
```

**Task:**  
- Configure your application to use read scaling with master-slave replication.  

---

### **Practice Queries**  
1. Set up master-slave replication between two MySQL instances.  
2. Configure your application to use read scaling with master-slave replication.  

---

### **Example Solutions**  

**1. Master-Slave Replication in MySQL:**  
**Master Configuration:**  
```ini
[mysqld]
server-id=1
log-bin=mysql-bin
```

**Slave Configuration:**  
```ini
[mysqld]
server-id=2
```

**Master Setup:**  
```sql
CREATE USER 'replica'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'replica'@'%';
FLUSH PRIVILEGES;

SHOW MASTER STATUS;
```

**Slave Setup:**  
```sql
CHANGE MASTER TO
MASTER_HOST='master_ip',
MASTER_USER='replica',
MASTER_PASSWORD='password',
MASTER_LOG_FILE='mysql-bin.000001',
MASTER_LOG_POS=4;

START SLAVE;

SHOW SLAVE STATUS\G;
```

**2. Read Scaling in Application:**  
```python
# Python example with SQLAlchemy
read_db_url = 'mysql://user:password@slave1:3306/db'
write_db_url = 'mysql://user:password@master:3306/db'

read_engine = create_engine(read_db_url)
write_engine = create_engine(write_db_url)

# Use read_engine for SELECT queries
result = read_engine.execute("SELECT * FROM customers")

# Use write_engine for INSERT/UPDATE/DELETE queries
write_engine.execute("INSERT INTO customers (name, email) VALUES ('John', 'john@example.com')")
```

---

**Next Up:**  
✅ **Day 21: Cloud Databases**  
- Learn about cloud-based database services like Amazon RDS, Google Cloud SQL, and Azure SQL Database.  

Let me know if you need further clarification or help! 😊
