### ✅ **Day 25: NoSQL vs SQL – When to Use Each?**  
Today, you’ll learn about the differences between **SQL** and **NoSQL** databases and when to use each. You’ll also compare popular NoSQL databases like **MongoDB**, **Firebase**, and **Cassandra**.

---

#### **1. SQL vs NoSQL: Key Differences**  

| Feature                | SQL (Relational Databases)       | NoSQL (Non-Relational Databases) |
|------------------------|----------------------------------|----------------------------------|
| **Data Model**         | Tables with rows and columns     | Flexible (documents, key-value, graphs, etc.) |
| **Schema**             | Fixed schema                    | Dynamic schema                   |
| **Scalability**        | Vertical scaling                | Horizontal scaling               |
| **Transactions**       | ACID-compliant                  | Often BASE-compliant (eventual consistency) |
| **Use Cases**          | Structured data, complex queries | Unstructured data, high scalability |

---

#### **2. When to Use SQL?**  
- **Structured Data:** When your data is well-defined and fits into tables.  
- **Complex Queries:** When you need to perform complex joins, aggregations, and transactions.  
- **ACID Compliance:** When data integrity and consistency are critical (e.g., financial systems).  
- **Examples:** MySQL, PostgreSQL, SQL Server.  

---

#### **3. When to Use NoSQL?**  
- **Unstructured Data:** When your data is flexible and doesn’t fit into a fixed schema.  
- **High Scalability:** When you need to handle large volumes of data and high traffic.  
- **Real-Time Applications:** When you need low-latency access to data (e.g., gaming, IoT).  
- **Examples:** MongoDB, Firebase, Cassandra.  

---

#### **4. Comparing NoSQL Databases**  

| Feature                | MongoDB                         | Firebase                        | Cassandra                       |
|------------------------|----------------------------------|----------------------------------|----------------------------------|
| **Data Model**         | Document-based (JSON-like)      | Document-based (JSON-like)      | Wide-column store               |
| **Scalability**        | Horizontal scaling              | Horizontal scaling              | Horizontal scaling              |
| **Consistency**        | Strong or eventual consistency  | Eventual consistency            | Tunable consistency             |
| **Use Cases**          | Content management, real-time apps | Real-time apps, mobile apps    | Time-series data, high write throughput |
| **Strengths**          | Flexible schema, rich queries   | Real-time sync, easy integration | High availability, fault tolerance |

---

#### **5. MongoDB**  
- **Data Model:** Stores data as JSON-like documents.  
- **Use Cases:** Content management, real-time analytics, mobile apps.  
- **Example Query:**  
  ```javascript
  db.users.find({ age: { $gt: 25 } });
  ```

---

#### **6. Firebase**  
- **Data Model:** Real-time NoSQL database with JSON-like documents.  
- **Use Cases:** Real-time apps, mobile apps, serverless backends.  
- **Example Query:**  
  ```javascript
  firebase.database().ref('users').orderByChild('age').startAt(25).once('value');
  ```

---

#### **7. Cassandra**  
- **Data Model:** Wide-column store optimized for high write throughput.  
- **Use Cases:** Time-series data, IoT, high availability systems.  
- **Example Query:**  
  ```sql
  SELECT * FROM users WHERE age > 25;
  ```

---

### **Practice Questions**  
1. When would you choose a SQL database over a NoSQL database?  
2. Compare MongoDB, Firebase, and Cassandra in terms of data model and use cases.  
3. Write a query to retrieve users older than 25 in MongoDB, Firebase, and Cassandra.  

---

### **Example Solutions**  

**1. When to Choose SQL:**  
- When you need structured data and complex queries.  
- When ACID compliance is critical (e.g., financial systems).  

**2. Comparison of NoSQL Databases:**  
| Feature                | MongoDB                         | Firebase                        | Cassandra                       |
|------------------------|----------------------------------|----------------------------------|----------------------------------|
| **Data Model**         | Document-based (JSON-like)      | Document-based (JSON-like)      | Wide-column store               |
| **Use Cases**          | Content management, real-time apps | Real-time apps, mobile apps    | Time-series data, high write throughput |

**3. Query Examples:**  
- **MongoDB:**  
  ```javascript
  db.users.find({ age: { $gt: 25 } });
  ```  
- **Firebase:**  
  ```javascript
  firebase.database().ref('users').orderByChild('age').startAt(25).once('value');
  ```  
- **Cassandra:**  
  ```sql
  SELECT * FROM users WHERE age > 25;
  ```

---

**Next Up:**  
✅ **Day 26: Final Project & Review**  
- Apply everything you’ve learned to a final project and review key concepts.  

Let me know if you need further clarification or help! 😊
