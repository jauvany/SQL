### ✅ **Day 22: Real-World Project: Employee Management System**  
Today, you’ll work on a real-world project: an **Employee Management System**. You’ll design the database schema and write queries for CRUD operations, joins, and aggregations.

---

#### **1. Database Schema Design**  
The Employee Management System will have the following tables:  

1. **Employees:** Stores employee details.  
2. **Departments:** Stores department details.  
3. **Projects:** Stores project details.  
4. **Employee_Projects:** Maps employees to projects (many-to-many relationship).  

---

#### **2. Create Tables**  

**Employees Table:**  
```sql
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

**Departments Table:**  
```sql
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
```

**Projects Table:**  
```sql
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);
```

**Employee_Projects Table:**  
```sql
CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
```

**Task:**  
- Create the above tables in your database.  

---

#### **3. CRUD Operations**  

**1. Insert Data:**  
```sql
-- Insert departments
INSERT INTO departments (department_name) VALUES ('HR'), ('Engineering'), ('Sales');

-- Insert employees
INSERT INTO employees (first_name, last_name, email, hire_date, department_id)
VALUES 
('John', 'Doe', 'john.doe@example.com', '2023-01-15', 1),
('Jane', 'Smith', 'jane.smith@example.com', '2023-02-20', 2);

-- Insert projects
INSERT INTO projects (project_name, start_date, end_date)
VALUES 
('Project A', '2023-03-01', '2023-06-30'),
('Project B', '2023-04-01', NULL);

-- Assign employees to projects
INSERT INTO employee_projects (employee_id, project_id)
VALUES 
(1, 1),
(2, 1),
(2, 2);
```

**2. Read Data:**  
```sql
-- Retrieve all employees
SELECT * FROM employees;

-- Retrieve employees in the Engineering department
SELECT * FROM employees
WHERE department_id = 2;

-- Retrieve employees working on Project A
SELECT e.first_name, e.last_name
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id
WHERE p.project_name = 'Project A';
```

**3. Update Data:**  
```sql
-- Update an employee's email
UPDATE employees
SET email = 'john.doe.new@example.com'
WHERE employee_id = 1;

-- Update a project's end date
UPDATE projects
SET end_date = '2023-07-31'
WHERE project_id = 1;
```

**4. Delete Data:**  
```sql
-- Remove an employee from a project
DELETE FROM employee_projects
WHERE employee_id = 1 AND project_id = 1;

-- Delete a project
DELETE FROM projects
WHERE project_id = 2;
```

**Task:**  
- Insert sample data into the tables and perform CRUD operations.  

---

#### **4. Joins**  

**Example 1: Retrieve Employees with Department Names**  
```sql
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
```

**Example 2: Retrieve Employees and Their Projects**  
```sql
SELECT e.first_name, e.last_name, p.project_name
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id;
```

**Task:**  
- Write a query to retrieve all projects and the number of employees working on each project.  

---

#### **5. Aggregations**  

**Example 1: Count Employees in Each Department**  
```sql
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
```

**Example 2: Calculate Average Employee Tenure**  
```sql
SELECT AVG(DATEDIFF(CURDATE(), hire_date)) AS avg_tenure_days
FROM employees;
```

**Task:**  
- Write a query to calculate the total number of projects each employee is working on.  

---

### **Practice Queries**  
1. Insert sample data into the tables.  
2. Perform CRUD operations on the `employees`, `departments`, and `projects` tables.  
3. Write queries to retrieve employees with their department names and projects.  
4. Write aggregation queries to count employees in each department and calculate average tenure.  

---

### **Example Solutions**  

**1. Insert Sample Data:**  
```sql
-- Insert departments
INSERT INTO departments (department_name) VALUES ('HR'), ('Engineering'), ('Sales');

-- Insert employees
INSERT INTO employees (first_name, last_name, email, hire_date, department_id)
VALUES 
('John', 'Doe', 'john.doe@example.com', '2023-01-15', 1),
('Jane', 'Smith', 'jane.smith@example.com', '2023-02-20', 2);

-- Insert projects
INSERT INTO projects (project_name, start_date, end_date)
VALUES 
('Project A', '2023-03-01', '2023-06-30'),
('Project B', '2023-04-01', NULL);

-- Assign employees to projects
INSERT INTO employee_projects (employee_id, project_id)
VALUES 
(1, 1),
(2, 1),
(2, 2);
```

**2. CRUD Operations:**  
```sql
-- Update an employee's email
UPDATE employees
SET email = 'john.doe.new@example.com'
WHERE employee_id = 1;

-- Delete a project
DELETE FROM projects
WHERE project_id = 2;
```

**3. Joins:**  
```sql
-- Retrieve employees with department names
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Retrieve employees and their projects
SELECT e.first_name, e.last_name, p.project_name
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id;
```

**4. Aggregations:**  
```sql
-- Count employees in each department
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Calculate average employee tenure
SELECT AVG(DATEDIFF(CURDATE(), hire_date)) AS avg_tenure_days
FROM employees;
```

---

**Next Up:**  
✅ **Day 23: Advanced SQL Techniques**  
- Learn about advanced SQL techniques like recursive queries, window functions, and common table expressions (CTEs).  

Let me know if you need further clarification or help! 😊
