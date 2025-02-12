### ✅ **Day 21: Database Migration & Version Control**  
Today, you’ll learn how to manage database schema changes using **Liquibase** and **Flyway**, two popular tools for database version control and migration. These tools help you track, apply, and rollback schema changes in a consistent and repeatable manner.

---

#### **1. Why Use Database Migration Tools?**  
- **Version Control:** Track changes to the database schema over time.  
- **Consistency:** Ensure that all environments (dev, test, prod) have the same schema.  
- **Automation:** Automate the application of schema changes.  
- **Rollbacks:** Easily revert to a previous schema version if needed.  

---

#### **2. Liquibase**  
Liquibase is an open-source tool for managing database schema changes. It uses XML, YAML, or SQL files to define changes and tracks them in a `DATABASECHANGELOG` table.  

---

#### **3. Setting Up Liquibase**  

**Step 1: Install Liquibase**  
Download Liquibase from the official website: [https://www.liquibase.org/download](https://www.liquibase.org/download)  

**Step 2: Create a `changelog` File**  
Define your schema changes in a `changelog` file (e.g., `changelog.xml`).  

**Example `changelog.xml`:**  
```xml
<databaseChangeLog
    xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
    http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.8.xsd">

    <changeSet id="1" author="john">
        <createTable tableName="customers">
            <column name="id" type="int" autoIncrement="true">
                <constraints primaryKey="true" nullable="false"/>
            </column>
            <column name="name" type="varchar(100)"/>
            <column name="email" type="varchar(100)"/>
        </createTable>
    </changeSet>
</databaseChangeLog>
```

**Step 3: Apply Changes**  
Run Liquibase to apply the changes to your database.  

```bash
liquibase --changeLogFile=changelog.xml --url=jdbc:mysql://localhost:3306/mydb --username=root --password=secret update
```

**Task:**  
- Create a `changelog.xml` file to add a `products` table and apply it using Liquibase.  

---

#### **4. Flyway**  
Flyway is another popular tool for database migrations. It uses SQL files to define changes and tracks them in a `flyway_schema_history` table.  

---

#### **5. Setting Up Flyway**  

**Step 1: Install Flyway**  
Download Flyway from the official website: [https://flywaydb.org/download](https://flywaydb.org/download)  

**Step 2: Create Migration Files**  
Create SQL files for your schema changes (e.g., `V1__Create_customers_table.sql`).  

**Example `V1__Create_customers_table.sql`:**  
```sql
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```

**Step 3: Apply Changes**  
Run Flyway to apply the changes to your database.  

```bash
flyway -url=jdbc:mysql://localhost:3306/mydb -user=root -password=secret migrate
```

**Task:**  
- Create a migration file to add a `products` table and apply it using Flyway.  

---

### **Practice Queries**  
1. Create a `changelog.xml` file to add a `products` table and apply it using Liquibase.  
2. Create a migration file to add a `products` table and apply it using Flyway.  

---

### **Example Solutions**  

**1. Liquibase `changelog.xml` for `products` Table:**  
```xml
<databaseChangeLog
    xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
    http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.8.xsd">

    <changeSet id="2" author="john">
        <createTable tableName="products">
            <column name="id" type="int" autoIncrement="true">
                <constraints primaryKey="true" nullable="false"/>
            </column>
            <column name="name" type="varchar(100)"/>
            <column name="price" type="decimal(10, 2)"/>
        </createTable>
    </changeSet>
</databaseChangeLog>
```

**Apply Changes:**  
```bash
liquibase --changeLogFile=changelog.xml --url=jdbc:mysql://localhost:3306/mydb --username=root --password=secret update
```

**2. Flyway Migration File for `products` Table:**  
**File: `V2__Create_products_table.sql`**  
```sql
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```

**Apply Changes:**  
```bash
flyway -url=jdbc:mysql://localhost:3306/mydb -user=root -password=secret migrate
```

---

**Next Up:**  
✅ **Day 22: Cloud Databases**  
- Learn about cloud-based database services like Amazon RDS, Google Cloud SQL, and Azure SQL Database.  

Let me know if you need further clarification or help! 😊
