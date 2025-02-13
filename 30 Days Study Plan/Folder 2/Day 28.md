### ✅ **Day 28: Data Pipelines & ETL (Extract, Transform, Load)**  
Today, you’ll learn about **ETL (Extract, Transform, Load)** processes and how to build a simple ETL pipeline using SQL. ETL is a critical component of data warehousing and analytics, enabling you to move and transform data from source systems to a target database.

---

#### **1. What is ETL?**  
ETL is a process used to:  
1. **Extract:** Retrieve data from source systems (e.g., databases, APIs, files).  
2. **Transform:** Clean, enrich, and reformat the data.  
3. **Load:** Insert the transformed data into a target database or data warehouse.  

---

#### **2. Building an ETL Pipeline Using SQL**  

**Scenario:**  
You have two tables in a source database:  
- `orders`: Contains order details.  
- `customers`: Contains customer details.  

You want to create a `sales_report` table in a target database that aggregates sales data by customer.  

---

#### **3. Step 1: Extract Data**  
Extract data from the source tables.  

```sql
-- Extract orders data
SELECT order_id, customer_id, order_date, total_amount
FROM orders;

-- Extract customers data
SELECT customer_id, first_name, last_name
FROM customers;
```

---

#### **4. Step 2: Transform Data**  
Join the `orders` and `customers` tables, and aggregate sales data by customer.  

```sql
-- Transform and aggregate data
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

---

#### **5. Step 3: Load Data**  
Create the `sales_report` table in the target database and insert the transformed data.  

```sql
-- Create the target table
CREATE TABLE sales_report (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    total_orders INT,
    total_spent DECIMAL(10, 2)
);

-- Load the transformed data
INSERT INTO sales_report (customer_id, first_name, last_name, total_orders, total_spent)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

---

#### **6. Automating the ETL Pipeline**  
To automate the ETL process, you can use:  
- **Stored Procedures:** Combine the extract, transform, and load steps into a single procedure.  
- **Scheduling Tools:** Use tools like **cron** (Linux) or **Task Scheduler** (Windows) to run the ETL process at regular intervals.  

**Example Stored Procedure:**  
```sql
CREATE PROCEDURE etl_sales_report()
BEGIN
    -- Step 1: Extract and Transform
    CREATE TEMPORARY TABLE temp_sales_report AS
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name;

    -- Step 2: Load
    DELETE FROM sales_report; -- Clear existing data
    INSERT INTO sales_report
    SELECT * FROM temp_sales_report;

    -- Clean up
    DROP TEMPORARY TABLE temp_sales_report;
END;
```

**Task:**  
- Create a stored procedure to automate the ETL pipeline.  

---

### **Practice Queries**  
1. Extract data from the `orders` and `customers` tables.  
2. Transform the data by joining and aggregating.  
3. Load the transformed data into the `sales_report` table.  
4. Create a stored procedure to automate the ETL pipeline.  

---

### **Example Solutions**  

**1. Extract Data:**  
```sql
-- Extract orders data
SELECT order_id, customer_id, order_date, total_amount
FROM orders;

-- Extract customers data
SELECT customer_id, first_name, last_name
FROM customers;
```

**2. Transform Data:**  
```sql
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

**3. Load Data:**  
```sql
-- Create the target table
CREATE TABLE sales_report (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    total_orders INT,
    total_spent DECIMAL(10, 2)
);

-- Load the transformed data
INSERT INTO sales_report (customer_id, first_name, last_name, total_orders, total_spent)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

**4. Automate with a Stored Procedure:**  
```sql
CREATE PROCEDURE etl_sales_report()
BEGIN
    -- Step 1: Extract and Transform
    CREATE TEMPORARY TABLE temp_sales_report AS
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name;

    -- Step 2: Load
    DELETE FROM sales_report; -- Clear existing data
    INSERT INTO sales_report
    SELECT * FROM temp_sales_report;

    -- Clean up
    DROP TEMPORARY TABLE temp_sales_report;
END;
```

---

**Next Up:**  
✅ **Day 29: Final Project & Review**  
- Apply everything you’ve learned to a final project and review key concepts.  

Let me know if you need further clarification or help! 😊
