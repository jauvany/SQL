### ✅ **Day 30: Final Project – Build Your Own Database System**  
Today, you’ll apply everything you’ve learned to design and build a custom database system for any industry. You’ll also write optimized queries to interact with the database.

---

#### **1. Choose an Industry**  
Select an industry or domain for your project. Examples:  
- **E-commerce:** Manage products, orders, customers, and payments.  
- **Healthcare:** Track patients, appointments, prescriptions, and medical records.  
- **Education:** Manage students, courses, enrollments, and grades.  
- **Banking:** Track accounts, transactions, loans, and customers.  

---

#### **2. Design the Database Schema**  
Create a schema with tables, relationships, and constraints.  

**Example: E-Commerce Database**  
1. **Customers Table:**  
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

2. **Products Table:**  
   ```sql
   CREATE TABLE products (
       product_id INT AUTO_INCREMENT PRIMARY KEY,
       product_name VARCHAR(100) NOT NULL,
       price DECIMAL(10, 2) NOT NULL,
       stock_quantity INT NOT NULL
   );
   ```

3. **Orders Table:**  
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

4. **Order_Items Table:**  
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

5. **Payments Table:**  
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
- Design a schema for your chosen industry and create the tables.  

---

#### **3. Insert Sample Data**  
Populate the tables with sample data.  

**Example: Insert Data into E-Commerce Database**  
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

**Task:**  
- Insert sample data into your database.  

---

#### **4. Write Optimized Queries**  
Write queries to interact with your database.  

**Example Queries for E-Commerce Database:**  
1. **Retrieve all orders for a customer:**  
   ```sql
   SELECT o.order_id, o.order_date, o.total_amount, o.status
   FROM orders o
   JOIN customers c ON o.customer_id = c.customer_id
   WHERE c.email = 'john.doe@example.com';
   ```

2. **Calculate total revenue:**  
   ```sql
   SELECT SUM(total_amount) AS total_revenue
   FROM orders;
   ```

3. **Find the top-selling products:**  
   ```sql
   SELECT p.product_name, SUM(oi.quantity) AS total_sold
   FROM order_items oi
   JOIN products p ON oi.product_id = p.product_id
   GROUP BY p.product_name
   ORDER BY total_sold DESC;
   ```

4. **Retrieve orders with payment details:**  
   ```sql
   SELECT o.order_id, c.first_name, c.last_name, o.total_amount, p.payment_method
   FROM orders o
   JOIN customers c ON o.customer_id = c.customer_id
   JOIN payments p ON o.order_id = p.order_id;
   ```

**Task:**  
- Write at least 5 optimized queries for your database.  

---

### **Practice Queries**  
1. Design a schema for your chosen industry and create the tables.  
2. Insert sample data into your database.  
3. Write at least 5 optimized queries to interact with your database.  

---

### **Example Solutions**  

**1. Schema Design:**  
```sql
-- Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- Products Table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order_Items Table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Credit Card', 'PayPal', 'Cash on Delivery'),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
```

**2. Insert Sample Data:**  
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

**3. Optimized Queries:**  
```sql
-- Retrieve all orders for a customer
SELECT o.order_id, o.order_date, o.total_amount, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.email = 'john.doe@example.com';

-- Calculate total revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- Find the top-selling products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Retrieve orders with payment details
SELECT o.order_id, c.first_name, c.last_name, o.total_amount, p.payment_method
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments p ON o.order_id = p.order_id;

-- Retrieve customers who haven't placed any orders
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

---

**Congratulations!**  
You’ve completed the 30-day SQL Development & DBA study plan. You now have the skills to design, optimize, and manage databases effectively. Keep practicing and exploring advanced topics to continue growing your expertise. 😊
