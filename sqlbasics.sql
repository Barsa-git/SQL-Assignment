create database SQLBasics;
use SQLBasics;
--
#Q1-
--
#Create a table called employees with the following structure?
#emp_id (integer, should not be NULL and should be a primary key).
#emp_name (text, should not be NULL).
#age (integer, should have a check constraint to ensure the age is at least 18).
#email (text, should be unique for each employee).
#salary (decimal, with a default value of 30,000).
#Write the SQL query to create the above table with all constraints.
--
#Ans-
--
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(255) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(255) UNIQUE,
    salary DECIMAL(10, 2) DEFAULT 30000
);
--
--
#Q2-
--
#Explain the purpose of constraints and how they help maintain data integrity in a database.
#Provide examples of common types of constraints.
--
#Ans-
--
#- Database constraints are rules applied to columns or tables to limit the type of data that can be inserted, updated, or deleted. Their primary purpose is to ensure the accuracy, reliability, and consistency of the data within the database.This is what we refer to as data integrity.
#- Think of data integrity as the overall quality of your data. Without constraints, a database could easily become filled with incorrect, inconsistent, or incomplete information, making it unreliable for analysis or applications.
#- Here's how constraints help maintain data integrity : -
#- Preventing invalid data: Constraints like NOT NULL and CHECK stop you from entering data that doesn't meet specific criteria. For example, NOT NULL ensures a required field is never empty, and CHECK can enforce rules like ensuring an age is above a certain number.
#- Ensuring uniqueness: Constraints like UNIQUE and PRIMARY KEY guarantee that specific values or combinations of values are unique within a column or across columns. This is essential for uniquely identifying each record and avoiding duplicates. A PRIMARY KEY is a special type of UNIQUE constraint that also cannot contain NULL values and is used as the main identifier for a record.
#- Maintaining relationships: FOREIGN KEY constraints establish and enforce links between different tables. They ensure that references between tables are valid, preventing "orphan" records and ensuring that related data stays consistent when changes are made.
#- Enforcing business rules: Constraints can be used to implement specific rules that reflect the real-world rules of your data.
#- Here are some common types of constraints with examples:

#   - NOT NULL: Ensures that a column cannot have a NULL value.
#     - Example: emp_name TEXT NOT NULL (Every employee must have a name).
#   - UNIQUE: Ensures that all values in a column are unique.
#     - Example: email TEXT UNIQUE (No two employees can have the same email address).
#   - PRIMARY KEY: Uniquely identifies each record in a table.It combines NOT NULL and UNIQUE.A table can only have one primary key.
#     - Example: emp_id INTEGER NOT NULL PRIMARY KEY (Each employee has a unique ID).
#   - FOREIGN KEY: Links a column in one table to the primary key in another table, ensuring referential integrity.
#     - Example (hypothetical): An employees table might have a department_id FOREIGN KEY that references the dept_id PRIMARY KEY in a departments table. This ensures every employee belongs to a valid department.
#   - CHECK: Ensures that all values in a column satisfy a specific condition.
#     - Example: age INTEGER CHECK (age >= 18) (An employee's age must be 18 or older).
#   - DEFAULT: Provides a default value for a column if no value is specified during data insertion.
#     - Example: salary DECIMAL DEFAULT 30000 (If no salary is given, it defaults to 30000).
#- By using these constraints, you can significantly improve the quality and reliability of the data stored in your database.
--
--
#Q3-
--
#Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
--
#Ans-
--
#**Why would you apply the NOT NULL constraint to a column?**
#- We should apply a NOT NULL constraint to a column when that column must always contain a value for every row in the table. In other words, we are ensuring that a particular piece of information is required for each record.
#- For example, in our employees table, we applied NOT NULL to emp_name. This means that every employee record must have a name. If you tried to insert a new employee record without providing a name, the database would raise an error because of the NOT NULL constraint. This helps maintain data integrity by preventing missing essential information.
#**Can a primary key contain NULL values? Justify your answer.**
#- No, a primary key cannot contain NULL values.
#- The justification for this is in the very definition and purpose of a primary key. A primary key is intended to uniquely identify each row in a table. If a primary key column allowed NULL values, it would be impossible to guarantee that each row has a unique identifier, because NULL is not a specific value and therefore cannot be used to uniquely distinguish one row from another.
#- In fact, the PRIMARY KEY constraint is a combination of two other constraints: UNIQUE and NOT NULL. So, by definition, a primary key inherently includes the NOT NULL constraint, preventing any NULL values in that column.
--
--
#Q4-
--
#Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
--
#Ans-
--
#**Steps to Add a Constraint:**
# - Identify the table and column(s) where you want to add the constraint.
# - Determine the type of constraint (NOT NULL, UNIQUE, CHECK, FOREIGN KEY).
# - Use the ALTER TABLE statement with the ADD CONSTRAINT clause (syntax might differ based on the constraint type and database).
# - Specify the constraint name (optional but recommended for easier management) and the constraint definition.
#- Example: Adding a UNIQUE constraint to the existing 'employees' table

#- Let's add a UNIQUE constraint to the emp_name column.

ALTER TABLE employees
ADD CONSTRAINT unique_emp_name UNIQUE (emp_name);

#**Steps to Remove a Constraint:**

#- Identify the table and the constraint you want to remove.
#- Use the ALTER TABLE statement with the DROP CONSTRAINT clause.
#- Specify the name of the constraint to be dropped.
#   - Note: Primary Key constraints might need to be dropped differently or might not be droppable if they are part of a foreign key relationship. NOT NULL constraints are typically removed using ALTER COLUMN. UNIQUE constraints can often be dropped by name.
#- Example: Removing the UNIQUE constraint we just added

ALTER TABLE employees
DROP CONSTRAINT unique_emp_name;
--
--
#Q5-
--
#Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.Provide an example of an error message that might occur when violating a constraint.
--
#Ans-
--
#Example of inserting data that violates the CHECK constraint (age < 18)
INSERT INTO employees (emp_id, emp_name, age, email) VALUES (1, 'Alice Smith', 17, 'alice@example.com');
#Example of inserting data that violates the UNIQUE constraint (duplicate email)
INSERT INTO employees (emp_id, emp_name, age, email) VALUES (1, 'Alice Smith', 25, 'alice@example.com');
INSERT INTO employees (emp_id, emp_name, age, email) VALUES (2, 'Bob Johnson', 30, 'alice@example.com');
#Example of inserting data that violates the NOT NULL constraint (missing emp_name)
INSERT INTO employees (emp_id, age, email) VALUES (3, 40, 'charlie@example.com');
--
--
#Q6-
--
#You created a products table without constraints as follows:
#CREATE TABLE products
#(product_id INT,
#product_name VARCHAR(50),
#price DECIMAL(10, 2));
#Now, you realise that :

#The product_id should be a primary key.
#The price should have a default value of 50.00
--
#Ans-
--
#Create the initial table without constraints
CREATE TABLE products
    (product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
#Drop the existing table
DROP TABLE IF EXISTS products;
#SQL query to create the products table with constraints
CREATE TABLE products
    (product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2) DEFAULT 50.00);
# Test inserting a product without specifying price (should use default)
INSERT INTO products (product_id, product_name) VALUES (1, 'Widget');

# Test inserting a product with price
INSERT INTO products (product_id, product_name, price) VALUES (2, 'Gadget', 75.50);

# Test inserting a duplicate product_id (should fail due to PRIMARY KEY)
INSERT INTO products (product_id, product_name, price) VALUES (1, 'Duplicate Widget', 10.00);

# Select data to see the result
SELECT * FROM products;
--
--
#Q7-
--
#You have two tables : -
#students
#( student_id { 1 , 2 , 3 } , student_name { alice , bob , charlie } )
#classes
#( class_id { 101 , 102 , 103 } , class_name { math , science , history } )
#Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
--
#Ans-
--
# Create the students table
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT
);
# Insert data into students table
INSERT INTO students (student_id, student_name) VALUES
(1, 'alice'),
(2, 'bob'),
(3, 'charlie');
# Create the classes table
CREATE TABLE classes (
    class_id INTEGER PRIMARY KEY,
    class_name TEXT
);
# Insert data into classes table
INSERT INTO classes (class_id, class_name) VALUES
(101, 'math'),
(102, 'science'),
(103, 'history');
# Create a mapping table to represent which student is in which class
# For simplicity, let's create a simple mapping for the example.
CREATE TABLE student_classes (
    student_id INTEGER,
    class_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    PRIMARY KEY (student_id, class_id) -- Composite primary key
);
# Insert mapping data
INSERT INTO student_classes (student_id, class_id) VALUES
(1, 101), -- alice is in math
(1, 102), -- alice is in science
(2, 101), -- bob is in math
(3, 103); -- charlie is in history
# SQL query to fetch student_name and class_name using INNER JOIN
# We need to join students, student_classes (the linking table), and classes.
SELECT
    s.student_name,
    c.class_name
FROM
    students AS s
INNER JOIN
    student_classes AS sc ON s.student_id = sc.student_id
INNER JOIN
    classes AS c ON sc.class_id = c.class_id;
--
--
#Q8-
--
#Consider the following three tables : -
#Orders
#( order_id { 1 , 2 } , order_date { 2024-01-01 , 2024-01-03 } , customer_id { 101 , 102 } )
#Customers
#( customer_id { 101 , 102 } , customer_name { Alice , Bob } )
#Products
#( product_id { 1 , 2 } , product_name { Laptop , Phone } , order_id { 1 , NULL } )
#Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order Hint: (use INNER JOIN and LEFT JOIN) .    
--
#Ans-
--
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
# Create the orders table
    CREATE TABLE orders (
        order_id INTEGER PRIMARY KEY,
        order_date TEXT,
        customer_id INTEGER
    );
# Insert data into orders table
    INSERT INTO orders (order_id, order_date, customer_id) VALUES
    (1, '2024-01-01', 101),
    (2, '2024-01-03', 102);
# Create the customers table
    CREATE TABLE customers (
        customer_id INTEGER PRIMARY KEY,
        customer_name TEXT
    );    
# Insert data into customers table
    INSERT INTO customers (customer_id, customer_name) VALUES
    (101, 'Alice'),
    (102, 'Bob');    
# Create the products table
    CREATE TABLE products (
        product_id INTEGER PRIMARY KEY,
        product_name TEXT,
        order_id INTEGER
    );    
# Insert data into products table
    INSERT INTO products (product_id, product_name, order_id) VALUES
    (1, 'Laptop', 1),
    (2, 'Phone', NULL);    
# SQL query to fetch order_id, customer_name, and product_name,
# including all products
SELECT
    o.order_id,
    c.customer_name,
    p.product_name
FROM
    products AS p
LEFT JOIN
    orders AS o ON p.order_id = o.order_id
LEFT JOIN
    customers AS c ON o.customer_id = c.customer_id;    
--
--
#Q9-
--
#Given the following tables : -
#Sales
#( sale_id { 1 , 2 , 3 } , product_id { 101 , 102 , 101 } , amount { 500 , 300 , 700 } )
#Products
#( product _id { 101 , 102 } , product_name { Laptop , Phone } )
#Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function .
--
#Ans-
--
# Drop tables if they exist to start fresh for this example
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
# Create the Products table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT
);
# Insert data into Products table
INSERT INTO Products (product_id, product_name) VALUES
(101, 'Laptop'),
(102, 'Phone');
# Create the Sales table
CREATE TABLE Sales (
    sale_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    amount DECIMAL(10, 2)
);    
# Insert data into Sales table
INSERT INTO Sales (sale_id, product_id, amount) VALUES
(1, 101, 500),
(2, 102, 300),
(3, 101, 700);
# Select all data from the Products table
SELECT * FROM Products;
# Select all data from the Sales table
SELECT * FROM Sales;
# Calculate the total sales amount across all products
SELECT SUM(amount) FROM Sales;
# Find the total sales amount for a specific product (e.g., product_id 101 - Laptop)
SELECT SUM(amount) FROM Sales WHERE product_id = 101;
# Find the total sales amount for each product (using the query from before)
SELECT
    p.product_name,
    SUM(s.amount) AS total_sales_amount
FROM
    Sales AS s
INNER JOIN
    Products AS p ON s.product_id = p.product_id
GROUP BY
    p.product_name;
--
--
#Q10-
--
#You are given three tables : -
#Orders
#( order_id { 1 , 2 } , order_date { 2024-01-02 , 2024-01-05 } , customer_id { 1 , 2 } )
#Customers
#( customer_id { 1 , 2 } , customer_name { Alice , Bob } )
#Order_Details
#( order_id { 1 , 1 , 2 } , product_id { 101 , 102 , 101 } , quantity { 2 , 1 , 3 } )
#Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.    
--
#Ans-
--
# Drop tables if they exist to start fresh for this example
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Order_Details;
# Create the Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT
);
# Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob');
# Create the Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
# Insert data into Orders table
INSERT INTO Orders (order_id, order_date, customer_id) VALUES
(1, '2024-01-02', 1),
(2, '2024-01-05', 2);
# Create the Order_Details table
CREATE TABLE Order_Details (
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
# Insert data into Order_Details table
INSERT INTO Order_Details (order_id, product_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 3);
# Display contents of Customers table
SELECT * FROM Customers;
# Display contents of Orders table
SELECT * FROM Orders;
# Display contents of Order_Details table
SELECT * FROM Order_Details;
# SQL query to display order_id, customer_name, and quantity
SELECT
    o.order_id,
    c.customer_name,
    od.quantity
FROM
    Orders AS o
INNER JOIN
    Customers AS c ON o.customer_id = c.customer_id
INNER JOIN
    Order_Details AS od ON o.order_id = od.order_id;
--
--
    

