### ✅ **Day 23: Real-World Project: E-Commerce Database**  
Today, you’ll work on another real-world project: an **E-Commerce Database**. You’ll design the database schema and implement tables for orders, payments, customers, and inventory.

---

#### **1. Database Schema Design**  
The E-Commerce Database will have the following tables:  

1. **Customers:** Stores customer details.  
2. **Products:** Stores product details.  
3. **Orders:** Stores order details.  
4. **Order_Items:** Maps products to orders (many-to-many relationship).  
5. **Payments:** Stores payment details.  

---

#### **2. Create Tables**  

**Customers Table:**  
```sql
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);
```

**Products Table:**  
```sql
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);
```

**Orders Table:**  
```sql
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

**Order_Items Table:**  
```sql
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

**Payments Table:**  
```sql
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Credit Card', 'PayPal', 'Cash on Delivery'),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
```

**Task:**  
- Create the above tables in your database.  

---

#### **3. Insert Sample Data**  

**Insert Customers:**  
```sql
INSERT INTO customers (first_name, last_name, email, phone, address)
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St');
```

**Insert Products:**  
```sql
INSERT INTO products (product_name, price, stock_quantity)
VALUES 
('Laptop', 999.99, 10),
('Smartphone', 499.99, 20);
```

**Insert Orders:**  
```sql
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES 
(1, '2023-10-01', 1499.98, 'Pending'),
(2, '2023-10-02', 499.99, 'Shipped');
```

**Insert Order Items:**  
```sql
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 999.99),
(1, 2, 1, 499.99),
(2, 2, 1, 499.99);
```

**Insert Payments:**  
```sql
INSERT INTO payments (order_id, payment_date, amount, payment_method)
VALUES 
(1, '2023-10-01', 1499.98, 'Credit Card'),
(2, '2023-10-02', 499.99, 'PayPal');
```

**Task:**  
- Insert sample data into the tables.  

---

#### **4. CRUD Operations**  

**1. Create a New Order:**  
```sql
-- Step 1: Insert the order
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES (1, '2023-10-03', 999.99, 'Pending');

-- Step 2: Insert order items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (3, 1, 1, 999.99);

-- Step 3: Insert payment
INSERT INTO payments (order_id, payment_date, amount, payment_method)
VALUES (3, '2023-10-03', 999.99, 'Credit Card');
```

**2. Update Order Status:**  
```sql
UPDATE orders
SET status = 'Shipped'
WHERE order_id = 1;
```

**3. Delete a Product:**  
```sql
DELETE FROM products
WHERE product_id = 2;
```

**Task:**  
- Perform CRUD operations on the `orders`, `order_items`, and `payments` tables.  

---

#### **5. Joins**  

**Example 1: Retrieve Orders with Customer Details**  
```sql
SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
```

**Example 2: Retrieve Order Items with Product Details**  
```sql
SELECT oi.order_id, p.product_name, oi.quantity, oi.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;
```

**Task:**  
- Write a query to retrieve all payments with order and customer details.  

---

#### **6. Aggregations**  

**Example 1: Calculate Total Revenue**  
```sql
SELECT SUM(total_amount) AS total_revenue
FROM orders;
```

**Example 2: Count Orders by Status**  
```sql
SELECT status, COUNT(order_id) AS order_count
FROM orders
GROUP BY status;
```

**Task:**  
- Write a query to calculate the total quantity sold for each product.  

---

### **Practice Queries**  
1. Insert sample data into the tables.  
2. Perform CRUD operations on the `orders`, `order_items`, and `payments` tables.  
3. Write queries to retrieve orders with customer details and order items with product details.  
4. Write aggregation queries to calculate total revenue and count orders by status.  

---

### **Example Solutions**  

**1. Insert Sample Data:**  
```sql
-- Insert customers
INSERT INTO customers (first_name, last_name, email, phone, address)
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St');

-- Insert products
INSERT INTO products (product_name, price, stock_quantity)
VALUES 
('Laptop', 999.99, 10),
('Smartphone', 499.99, 20);

-- Insert orders
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES 
(1, '2023-10-01', 1499.98, 'Pending'),
(2, '2023-10-02', 499.99, 'Shipped');

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 999.99),
(1, 2, 1, 499.99),
(2, 2, 1, 499.99);

-- Insert payments
INSERT INTO payments (order_id, payment_date, amount, payment_method)
VALUES 
(1, '2023-10-01', 1499.98, 'Credit Card'),
(2, '2023-10-02', 499.99, 'PayPal');
```

**2. CRUD Operations:**  
```sql
-- Update order status
UPDATE orders
SET status = 'Shipped'
WHERE order_id = 1;

-- Delete a product
DELETE FROM products
WHERE product_id = 2;
```

**3. Joins:**  
```sql
-- Retrieve orders with customer details
SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Retrieve order items with product details
SELECT oi.order_id, p.product_name, oi.quantity, oi.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;
```

**4. Aggregations:**  
```sql
-- Calculate total revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- Count orders by status
SELECT status, COUNT(order_id) AS order_count
FROM orders
GROUP BY status;
```

---

**Next Up:**  
✅ **Day 24: Advanced SQL Techniques**  
- Learn about advanced SQL techniques like recursive queries, window functions, and common table expressions (CTEs).  

Let me know if you need further clarification or help! 😊
