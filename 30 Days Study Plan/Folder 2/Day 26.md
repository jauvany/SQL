### ✅ **Day 26: Cloud Databases (AWS RDS, Azure, Google Cloud SQL)**  
Today, you’ll learn how to set up a **cloud-based SQL database** using popular cloud platforms like **AWS RDS**, **Azure SQL Database**, and **Google Cloud SQL**. These services provide managed database solutions, making it easier to deploy, scale, and maintain databases.

---

#### **1. What Are Cloud Databases?**  
Cloud databases are fully managed database services hosted on cloud platforms. They offer:  
- **Scalability:** Easily scale up or down based on demand.  
- **High Availability:** Built-in redundancy and failover mechanisms.  
- **Automated Maintenance:** Automatic backups, patching, and updates.  

---

#### **2. Setting Up AWS RDS (Relational Database Service)**  
AWS RDS supports multiple database engines, including MySQL, PostgreSQL, and SQL Server.  

**Step 1: Create an RDS Instance**  
1. Log in to the AWS Management Console.  
2. Navigate to **RDS** > **Create database**.  
3. Choose a database engine (e.g., MySQL).  
4. Configure the instance (e.g., instance type, storage, credentials).  
5. Enable **Public accessibility** if you want to access the database from outside AWS.  
6. Click **Create database**.  

**Step 2: Connect to the Database**  
1. Retrieve the endpoint and credentials from the RDS console.  
2. Use a database client (e.g., MySQL Workbench) to connect:  
   - **Host:** Endpoint (e.g., `mydb.123456789012.us-east-1.rds.amazonaws.com`)  
   - **Port:** 3306 (default for MySQL)  
   - **Username/Password:** As configured during setup.  

**Task:**  
- Create an AWS RDS instance and connect to it using a database client.  

---

#### **3. Setting Up Azure SQL Database**  
Azure SQL Database is a fully managed SQL Server database service.  

**Step 1: Create an Azure SQL Database**  
1. Log in to the Azure Portal.  
2. Navigate to **SQL databases** > **Create**.  
3. Configure the database (e.g., server, pricing tier, resource group).  
4. Set the **Server admin login** and password.  
5. Click **Review + create** > **Create**.  

**Step 2: Connect to the Database**  
1. Retrieve the server name and credentials from the Azure Portal.  
2. Use a database client (e.g., SQL Server Management Studio) to connect:  
   - **Server name:** `yourservername.database.windows.net`  
   - **Authentication:** SQL Server Authentication  
   - **Username/Password:** As configured during setup.  

**Task:**  
- Create an Azure SQL Database and connect to it using a database client.  

---

#### **4. Setting Up Google Cloud SQL**  
Google Cloud SQL supports MySQL, PostgreSQL, and SQL Server.  

**Step 1: Create a Cloud SQL Instance**  
1. Log in to the Google Cloud Console.  
2. Navigate to **SQL** > **Create instance**.  
3. Choose a database engine (e.g., MySQL).  
4. Configure the instance (e.g., instance ID, password, region).  
5. Click **Create**.  

**Step 2: Connect to the Database**  
1. Retrieve the instance connection name and credentials from the Cloud Console.  
2. Use a database client (e.g., MySQL Workbench) to connect:  
   - **Host:** Public IP address of the instance  
   - **Port:** 3306 (default for MySQL)  
   - **Username/Password:** As configured during setup.  

**Task:**  
- Create a Google Cloud SQL instance and connect to it using a database client.  

---

### **Practice Queries**  
1. Create an AWS RDS instance and connect to it.  
2. Create an Azure SQL Database and connect to it.  
3. Create a Google Cloud SQL instance and connect to it.  

---

### **Example Solutions**  

**1. AWS RDS Setup:**  
- **Endpoint:** `mydb.123456789012.us-east-1.rds.amazonaws.com`  
- **Connection String:**  
  ```bash
  mysql -h mydb.123456789012.us-east-1.rds.amazonaws.com -u admin -p
  ```

**2. Azure SQL Database Setup:**  
- **Server Name:** `yourservername.database.windows.net`  
- **Connection String:**  
  ```bash
  sqlcmd -S yourservername.database.windows.net -U admin -P yourpassword
  ```

**3. Google Cloud SQL Setup:**  
- **Public IP:** `123.456.789.012`  
- **Connection String:**  
  ```bash
  mysql -h 123.456.789.012 -u root -p
  ```

---

**Next Up:**  
✅ **Day 27: Final Project & Review**  
- Apply everything you’ve learned to a final project and review key concepts.  

Let me know if you need further clarification or help! 😊
