### ✅ **Day 19: Partitioning & Sharding**  
Today, you’ll learn about **partitioning** and **sharding**, two techniques used to scale databases and improve performance by distributing data across multiple storage units.

---

#### **1. Partitioning**  
Partitioning divides a large table into smaller, more manageable pieces while keeping the data logically connected.  

**Types of Partitioning:**  
1. **Horizontal Partitioning (Row-Based):**  
   - Splits a table by rows. Each partition contains a subset of rows.  
   - Example: Partition a `sales` table by year (`sales_2021`, `sales_2022`).  

2. **Vertical Partitioning (Column-Based):**  
   - Splits a table by columns. Each partition contains a subset of columns.  
   - Example: Separate frequently accessed columns (e.g., `customer_id`, `order_date`) from rarely accessed columns (e.g., `order_details`).  

---

#### **2. Horizontal Partitioning**  

**Example in PostgreSQL:**  
Partition the `sales` table by year.  

1. Create the main table:  
   ```sql
   CREATE TABLE sales (
       sale_id SERIAL PRIMARY KEY,
       sale_date DATE NOT NULL,
       amount NUMERIC NOT NULL
   ) PARTITION BY RANGE (sale_date);
   ```

2. Create partitions for each year:  
   ```sql
   CREATE TABLE sales_2021 PARTITION OF sales
       FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

   CREATE TABLE sales_2022 PARTITION OF sales
       FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');
   ```

**Task:**  
- Create a horizontally partitioned table for `orders` by month.  

---

#### **3. Vertical Partitioning**  

**Example:**  
Split the `customers` table into two tables:  
- `customer_info`: Contains frequently accessed columns (`customer_id`, `name`, `email`).  
- `customer_details`: Contains rarely accessed columns (`address`, `phone`, `preferences`).  

```sql
CREATE TABLE customer_info (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE customer_details (
    customer_id INT PRIMARY KEY REFERENCES customer_info(customer_id),
    address TEXT,
    phone VARCHAR(20),
    preferences JSONB
);
```

**Task:**  
- Split the `products` table into two vertically partitioned tables.  

---

#### **4. Sharding**  
Sharding distributes data across multiple databases or servers. Each shard contains a subset of the data, allowing for horizontal scaling.  

**Sharding Strategies:**  
1. **Range-Based Sharding:**  
   - Distributes data based on a range of values (e.g., customer IDs 1-1000 in Shard 1, 1001-2000 in Shard 2).  

2. **Hash-Based Sharding:**  
   - Uses a hash function to distribute data evenly across shards.  

3. **Directory-Based Sharding:**  
   - Uses a lookup table to map data to shards.  

---

#### **5. Range-Based Sharding Example**  

**Scenario:**  
Shard the `orders` table by `customer_id`.  

1. Create Shard 1:  
   ```sql
   CREATE TABLE orders_shard_1 (
       order_id SERIAL PRIMARY KEY,
       customer_id INT CHECK (customer_id BETWEEN 1 AND 1000),
       order_date DATE NOT NULL,
       amount NUMERIC NOT NULL
   );
   ```

2. Create Shard 2:  
   ```sql
   CREATE TABLE orders_shard_2 (
       order_id SERIAL PRIMARY KEY,
       customer_id INT CHECK (customer_id BETWEEN 1001 AND 2000),
       order_date DATE NOT NULL,
       amount NUMERIC NOT NULL
   );
   ```

**Task:**  
- Implement hash-based sharding for the `products` table.  

---

#### **6. Hash-Based Sharding Example**  

**Scenario:**  
Shard the `products` table using a hash function.  

1. Create Shard 1:  
   ```sql
   CREATE TABLE products_shard_1 (
       product_id SERIAL PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       price NUMERIC NOT NULL
   );
   ```

2. Create Shard 2:  
   ```sql
   CREATE TABLE products_shard_2 (
       product_id SERIAL PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       price NUMERIC NOT NULL
   );
   ```

3. Use a hash function to determine the shard:  
   ```sql
   SELECT * FROM products_shard_1 WHERE MOD(product_id, 2) = 0;
   SELECT * FROM products_shard_2 WHERE MOD(product_id, 2) = 1;
   ```

**Task:**  
- Implement directory-based sharding for the `customers` table.  

---

### **Practice Queries**  
1. Create a horizontally partitioned table for `orders` by month.  
2. Split the `products` table into two vertically partitioned tables.  
3. Implement hash-based sharding for the `products` table.  
4. Implement directory-based sharding for the `customers` table.  

---

### **Example Solutions**  

**1. Horizontal Partitioning for `orders` by Month:**  
```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    amount NUMERIC NOT NULL
) PARTITION BY RANGE (order_date);

CREATE TABLE orders_2023_01 PARTITION OF orders
    FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');

CREATE TABLE orders_2023_02 PARTITION OF orders
    FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');
```

**2. Vertical Partitioning for `products`:**  
```sql
CREATE TABLE product_info (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);

CREATE TABLE product_details (
    product_id INT PRIMARY KEY REFERENCES product_info(product_id),
    description TEXT,
    category VARCHAR(50)
);
```

**3. Hash-Based Sharding for `products`:**  
```sql
CREATE TABLE products_shard_1 (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);

CREATE TABLE products_shard_2 (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);

-- Use MOD to determine shard
SELECT * FROM products_shard_1 WHERE MOD(product_id, 2) = 0;
SELECT * FROM products_shard_2 WHERE MOD(product_id, 2) = 1;
```

**4. Directory-Based Sharding for `customers`:**  
```sql
CREATE TABLE customer_shard_map (
    customer_id INT PRIMARY KEY,
    shard_id INT NOT NULL
);

CREATE TABLE customers_shard_1 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE customers_shard_2 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Example: Map customer_id 1 to Shard 1
INSERT INTO customer_shard_map (customer_id, shard_id) VALUES (1, 1);
```

---

**Next Up:**  
✅ **Day 20: High Availability & Disaster Recovery**  
- Learn about high availability (HA) and disaster recovery (DR) strategies to ensure database uptime and data safety.  

Let me know if you need further clarification or help! 😊
