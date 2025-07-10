USE mavenmovies;
--
--
#SQL Commands
--
--
#Q1-
#Identify the primary keys and foreign keys in maven movies db. Discuss the differences.
--
#Ans-
--
#Let's discuss primary keys and foreign keys in a database and how you can identify them in your "maven movies" database.
#**Primary Key (PK)**
#*   **Purpose:** A primary key is a column or a set of columns that uniquely identifies each row in a table.
#*   **Characteristics:**
#   *   Must contain unique values for each row.
#   *   Cannot contain NULL values (it must be NOT NULL).
#   *   A table can have only one primary key.
#*   **Role:** It enforces entity integrity, ensuring that each record in the table is distinct and can be uniquely referenced.
#**Foreign Key (FK)**
#*   **Purpose:** A foreign key is a column or a set of columns in one table that refers to the primary key (or a unique key) in another table.
#*   **Characteristics:**
#    *   Establishes a link or relationship between two tables.
#    *   Values in the foreign key column(s) must match values in the referenced primary/unique key column(s) in the other table, or they can be NULL (depending on the constraint definition).
#    *   A table can have multiple foreign keys.
#*   **Role:** It enforces referential integrity, ensuring that relationships between tables are valid and that you don't have "orphaned" records (e.g., a rental record referencing a non-existent customer).
#**How to Identify Primary and Foreign Keys in your Database:**
#You can typically identify primary and foreign keys by examining the database schema. In a SQL environment like MySQL, you can use commands like:
#*   `DESCRIBE table_name;` or `SHOW COLUMNS FROM table_name;`: This will show you the columns in a table and usually indicates which one is the `PRI` (Primary Key).
#*   `SHOW CREATE TABLE table_name;`: This command provides the `CREATE TABLE` statement for a table, which explicitly defines primary key constraints (`PRIMARY KEY (...)`) and foreign key constraints (`FOREIGN KEY (...) REFERENCES other_table (other_column)`).
#*   **Information Schema:** For a more programmatic way to retrieve details about all tables and their constraints, you can query the `information_schema` database (if you have the necessary permissions). Tables like `KEY_COLUMN_USAGE` and `TABLE_CONSTRAINTS` contain information about keys and constraints.
#**Key Differences:**
#| Feature          | Primary Key                                     | Foreign Key                                       |
#| :--------------- | :---------------------------------------------- | :------------------------------------------------ |
#| **Purpose**      | Uniquely identifies rows in its own table       | Establishes relationships with other tables     |
#| **Uniqueness**   | Values must be unique                           | Values do *not* need to be unique (can be repeated) |
#| **NULL Values**  | Cannot contain NULLs                            | Can contain NULLs (unless specified otherwise)    |
#| **Number per Table** | One                                             | Can be multiple                                   |
#| **Integrity**    | Enforces Entity Integrity                       | Enforces Referential Integrity                    |
#| **Reference**    | Referenced by foreign keys in other tables      | References a primary/unique key in another table  |
#By examining the schema of each table in your "maven movies" database using the methods above, you can identify the primary and foreign keys present and understand how the tables are related.
--
--
#Q2-
#List all details of actors
SELECT * FROM actor;
--
--
#Q3-
#List all customer information from DB.
SELECT * FROM customer;
--
--
#Q4-
#List different countries.
SELECT DISTINCT country
FROM country;
--
--
#Q5-
#Display all active customers.
SELECT *
FROM customer
WHERE active = 1;
--
--
#Q6-
#List of all rental IDs for customer with ID 1.
SELECT rental_id
FROM rental
WHERE customer_id = 1;
--
--
#Q7-
#Display all the films whose rental duration is greater than 5 .
SELECT *
FROM film
WHERE rental_duration > 5;
--
--
#Q8-
# List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT COUNT(*)
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;
--
--
#Q9-
# Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name)
FROM actor;
--
--
#Q10-
#Display the first 10 records from the customer table.
SELECT *
FROM customer
LIMIT 10;
--
--
#Q11-
#Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT *
FROM customer
WHERE first_name LIKE 'b%'
LIMIT 3;
--
--
#Q12-
#Display the names of the first 5 movies which are rated as ‘G’.
SELECT title
FROM film
WHERE rating = 'G'
LIMIT 5;
--
--
#Q13-
#Find all customers whose first name starts with "a".
SELECT *
FROM customer
WHERE first_name LIKE 'a%';
--
--
#Q14-
# Find all customers whose first name ends with "a".
SELECT *
FROM customer
WHERE first_name LIKE '%a';
--
--
#Q15-
#Display the list of first 4 cities which start and end with ‘a’ .
SELECT *
FROM city
WHERE city LIKE 'a%a'
LIMIT 4;
--
--
#Q16-
# Find all customers whose first name have "NI" in any position.
SELECT *
FROM customer
WHERE first_name LIKE '%NI%';
--
--
#Q17-
#Find all customers whose first name have "r" in the second position .
SELECT *
FROM customer
WHERE first_name LIKE '_r%';
--
--
#Q18-
# Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT *
FROM customer
WHERE first_name LIKE 'a____%';
--
--
#Q19-
# Find all customers whose first name starts with "a" and ends with "o".
SELECT *
FROM customer
WHERE first_name LIKE 'a%o';
--
--
#Q20-
#Get the films with pg and pg-13 rating using IN operator.
SELECT *
FROM film
WHERE rating IN ('PG', 'PG-13');
--
--
#Q21-
#Get the films with length between 50 to 100 using between operator.
SELECT *
FROM film
WHERE length BETWEEN 50 AND 100;
--
--
#Q22-
#Get the top 50 actors using limit operator.
SELECT *
FROM actor
LIMIT 50;
--
--
#Q23-
#Get the distinct film ids from inventory table.
SELECT DISTINCT film_id
FROM inventory;
--
--
#FUNCTIONS
#Basic Aggregate Functions
--
--
#Questions 1
#Retrieve the total number of rentals made in the Sakila database.
#Hint: Use the COUNT() function.
SELECT COUNT(*)
FROM rental;
--
--
#Questions 2
#Find the average rental duration (in days) of movies rented from the Sakila database.
#Hint: Utilize the AVG() function.
SELECT AVG(rental_duration) AS average_rental_duration
FROM film;
--
--
#Questions 3
#Display the first name and last name of customers in uppercase.
#Hint: Use the UPPER() function.
SELECT UPPER(first_name), UPPER(last_name)
FROM customer;
--
--
#Questions 4
#Extract the month from the rental date and display it alongside the rental ID.
#Hint: Employ the MONTH() function.
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;
--
--
#Questions 5
#Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
#Hint: Use COUNT () in conjunction with GROUP BY.
SELECT customer_id, COUNT(rental_id) AS rental_count
FROM rental
GROUP BY customer_id;
--
--
#Questions 6
#Find the total revenue generated by each store.
#Hint: Combine SUM() and GROUP BY.
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;
--
--
#Questions 7
#Determine the total number of rentals for each category of movies.
#Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
SELECT fc.category_id, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;
--
--
#Questions 8
#Find the average rental rate of movies in each language.
#Hint: JOIN film and language tables, then use AVG () and GROUP BY.
SELECT l.name AS language, AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;
--
--
#Questions 9 
#Display the title of the movie, customer s first name, and last name who rented it.
#Hint: Use JOIN between the film, inventory, rental, and customer tables.
SELECT
    f.title AS movie_title,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name
FROM
    rental r
JOIN
    customer c ON r.customer_id = c.customer_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id;
--
--
#Question 10
#Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
#Hint: Use JOIN between the film actor, film, and actor tables.
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';
--
--
#Question 11
#Retrieve the customer names along with the total amount they've spent on rentals.
#Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
SELECT
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM
    customer c
JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    total_spent DESC;    
--
--
#Question 12
#List the titles of movies rented by each customer in a particular city (e.g., 'London').
#Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.    
SELECT
    c.first_name,
    c.last_name,
    f.title AS movie_title
FROM
    customer c
JOIN
    address a ON c.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
JOIN
    rental r ON c.customer_id = r.customer_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
WHERE
    ci.city = 'London'
ORDER BY
    c.customer_id, f.title;
--
--
#Question 13
#Display the top 5 rented movies along with the number of times they've been rented.
#Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
SELECT
    f.title AS movie_title,
    COUNT(r.rental_id) AS rental_count
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id, f.title
ORDER BY
    rental_count DESC
LIMIT 5;    
--
--
#Question 14
#Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
#Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customer c
JOIN
    rental r ON c.customer_id = r.customer_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
WHERE
    i.store_id IN (1, 2)
GROUP BY
    c.customer_id, c.first_name, c.last_name
HAVING
    COUNT(DISTINCT i.store_id) = 2;
--
--
#Windows Function
--
--
#1.Rank the customers based on the total amount they've spent on rentals.
WITH CustomerTotalSpent AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent
    FROM
        customer c
    JOIN
        payment p ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) as customer_rank
FROM
    CustomerTotalSpent
ORDER BY
    customer_rank;
--
--
#2.Calculate the cumulative revenue generated by each film over time. 
SELECT
    f.title,
    p.payment_date,
    p.amount,
    SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM
    payment p
JOIN
    rental r ON p.rental_id = r.rental_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
ORDER BY
    f.title, p.payment_date;   
--
--
#3.Determine the average rental duration for each film, considering films with similar lengths. 
SELECT
    f.title,
    f.length,
    f.rental_duration,
    AVG(f.rental_duration) OVER (PARTITION BY f.length ORDER BY f.title) AS avg_rental_duration_by_length
FROM
    film f
ORDER BY
    f.length, f.title;   
--
--
#4.Identify the top 3 films in each category based on their rental counts.
WITH FilmRentalCounts AS (
    SELECT
        f.film_id,
        f.title,
        fc.category_id,
        COUNT(r.rental_id) AS rental_count
    FROM
        film f
    JOIN
        inventory i ON f.film_id = i.film_id
    JOIN
        rental r ON i.inventory_id = r.inventory_id
    JOIN
        film_category fc ON f.film_id = fc.film_id
    GROUP BY
        f.film_id, f.title, fc.category_id
),
RankedFilmRentals AS (
    SELECT
        film_id,
        title,
        category_id,
        rental_count,
        RANK() OVER (PARTITION BY category_id ORDER BY rental_count DESC) as category_rank
    FROM
        FilmRentalCounts
)
SELECT
    title,
    rental_count,
    category_id
FROM
    RankedFilmRentals
WHERE
    category_rank <=3
ORDER BY
    category_id, category_rank;
--
--
#5.Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
WITH CustomerRentalCounts AS (
    SELECT
        customer_id,
        COUNT(rental_id) AS total_customer_rentals
    FROM
        rental
    GROUP BY
        customer_id
)
SELECT
    customer_id,
    total_customer_rentals,
    AVG(total_customer_rentals) OVER () AS average_all_customer_rentals,
    total_customer_rentals - AVG(total_customer_rentals) OVER () AS difference_from_average
FROM
    CustomerRentalCounts
ORDER BY
    customer_id;
--
--
#6.Find the monthly revenue trend for the entire rental store over time.
SELECT
    DATE_FORMAT(payment_date, '%Y-%m') AS rental_month,
    SUM(amount) AS monthly_revenue
FROM
    payment
GROUP BY
    rental_month
ORDER BY
    rental_month;   
--
--
#7.Identify the customers whose total spending on rentals falls within the top 20% of all customers.
WITH CustomerTotalSpent AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent
    FROM
        customer c
    JOIN
        payment p ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name
),
RankedCustomers AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        total_spent,
        NTILE(5) OVER (ORDER BY total_spent DESC) as percentile_group
    FROM
        CustomerTotalSpent
)
SELECT
    RankedCustomers.customer_id,
    RankedCustomers.first_name,
    RankedCustomers.last_name,
    RankedCustomers.total_spent
FROM
    RankedCustomers
WHERE
    percentile_group = 1
ORDER BY
    total_spent DESC; 
--
--
#8.Calculate the running total of rentals per category, ordered by rental count.    
WITH CategoryRentalCounts AS (
    SELECT
        fc.category_id,
        COUNT(r.rental_id) AS rental_count
    FROM
        rental r
    JOIN
        inventory i ON r.inventory_id = i.inventory_id
    JOIN
        film_category fc ON i.film_id = fc.film_id
    GROUP BY
        fc.category_id
)
SELECT
    category_id,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_rentals
FROM
    CategoryRentalCounts
ORDER BY
    rental_count;
--
--
#9.Find the films that have been rented less than the average rental count for their respective categories.    
WITH FilmRentalCounts AS (
    SELECT
        f.film_id,
        f.title,
        fc.category_id,
        COUNT(r.rental_id) AS rental_count
    FROM
        film f
    JOIN
        inventory i ON f.film_id = i.film_id
    JOIN
        rental r ON i.inventory_id = r.inventory_id
    JOIN
        film_category fc ON f.film_id = fc.film_id
    GROUP BY
        f.film_id, f.title, fc.category_id
),
CategoryAverageRental AS (
    SELECT
        category_id,
        AVG(rental_count) AS average_category_rentals
    FROM
        FilmRentalCounts
    GROUP BY
        category_id
)
SELECT
    frc.title,
    frc.rental_count,
    car.average_category_rentals,
    frc.category_id
FROM
    FilmRentalCounts frc
JOIN
    CategoryAverageRental car ON frc.category_id = car.category_id
WHERE
    frc.rental_count < car.average_category_rentals
ORDER BY
    frc.category_id, frc.rental_count;
--
--
#10.Identify the top 5 months with the highest revenue and display the revenue generated in each month.    
SELECT
    DATE_FORMAT(payment_date, '%Y-%m') AS rental_month,
    SUM(amount) AS monthly_revenue
FROM
    payment
GROUP BY
    rental_month
ORDER BY
    monthly_revenue DESC
LIMIT 5;
--
--
#Normalisation and CTE
--
--
#Q1-
--
#First Normal Form (1NF):
#Identify a table in the Sakila database that violates 1NF.Explain how you would normalize it to achieve 1NF.
--
#Ans-
--
#First Normal Form (1NF) is the most basic level of database normalization. For a table to be in 1NF, it must meet the following criteria:
#1.  **Atomic Values:** Each column must contain atomic (indivisible) values. This means you should not have multiple values or repeating groups of values within a single cell.
#2.  **Unique Rows:** Each row must be unique. This is usually achieved by having a primary key.
#While the Sakila database is generally well-normalized.
--
--
#Q2-
--
#Second Normal Form (2NF):
#Choose a table in Sakila and describe how you would determine whether it is in 2NF.
#If it violates 2NF, explain.
--
#Ans-
--
#Second Normal Form (2NF) is the next level of database normalization after 1NF. For a table to be in 2NF, it must meet the following criteria:
#1.  It must be in **First Normal Form (1NF)**.
#2.  All non-key attributes must be **fully functionally dependent on the entire primary key**. 
#This means that if a table has a composite primary key (a primary key made up of two or more columns), no non-key attribute should be dependent on only a *part* of the primary key.
#**Determining if a table in Sakila is in 2NF and addressing potential violations**
#The Sakila database is generally well-designed and follows normalization principles, including 2NF. However, to illustrate how you would determine if a table violates 2NF, let's consider a table with a composite key.
#A good example in Sakila is the `film_actor` table.
#**`film_actor` table:**
#| actor\_id (Part of Primary Key) | film\_id (Part of Primary Key) | last\_update (Non-key attribute) |
#| :------------------------------ | :----------------------------- | :------------------------------- |
#| 1                               | 1                              | ...                              |
#| 1                               | 2                              | ...                              |
#| 2                               | 1                              | ...                              |
#The primary key of the `film_actor` table is a composite key consisting of `actor_id` and `film_id`. This composite key uniquely identifies each row, representing that a specific actor appeared in a specific film.
#To check if `film_actor` is in 2NF, we need to see if the non-key attribute (`last_update`) is fully functionally dependent on the *entire* primary key (`actor_id`, `film_id`).
#In this case, `last_update` is the timestamp when the record of a specific actor appearing in a specific film was last updated. The `last_update` for a particular combination of `actor_id` and `film_id` is uniquely determined by that combination. 
#It is not dependent on just `actor_id` alone (an actor can be in multiple films with different last update times) or just `film_id` alone (a film can have multiple actors with different last update times for their entry in this table).
#Therefore, the `last_update` attribute is fully functionally dependent on the composite primary key (`actor_id`, `film_id`).
#Since the `film_actor` table is in 1NF (each column is atomic, and the composite key ensures unique rows) and its non-key attribute (`last_update`) is fully functionally dependent on the entire primary key, the `film_actor` table is in **2NF**.
#**Illustrating a hypothetical 2NF violation:**
#Let's imagine, for the sake of illustration, that the `film_actor` table also included the `actor_name` column:
#| actor\_id (Part of PK) | film\_id (Part of PK) | actor\_name (Non-key attribute) | last\_update (Non-key attribute) |
#| :--------------------- | :-------------------- | :------------------------------ | :------------------------------- |
#| 1                      | 1                     | John Doe                        | ...                              |
#| 1                      | 2                     | John Doe                        | ...                              |
#| 2                      | 1                     | Jane Smith                      | ...                              |
#In this hypothetical scenario, the `actor_name` attribute is dependent only on `actor_id`, which is only a *part* of the composite primary key (`actor_id`, `film_id`). 
#This would be a violation of 2NF (a partial dependency).
#To normalize this table to 2NF, you would remove the `actor_name` from the `film_actor` table and store it only in the `actor` table, where it is fully dependent on the `actor_id` (the primary key of the `actor` table). 
#This is precisely how the actual Sakila database is designed, with actor names stored separately in the `actor` table.
--
--
#Q3-
--
#Third Normal Form (3NF):
#Identify a table in Sakila that violates 3NF.
#Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
--
#Ans-
--
#Third Normal Form (3NF) is the next level of database normalization after 2NF. 
#For a table to be in 3NF, it must meet the following criteria:
#1.  It must be in **Second Normal Form (2NF)**.
#2.  There are **no transitive dependencies**. 
#A transitive dependency exists when a non-key attribute is dependent on another non-key attribute. 
#In other words, attributes should depend directly on the primary key, not on other non-key attributes.
#**Identifying a potential 3NF violation in Sakila and normalizing it**
#The Sakila database is well-structured and generally adheres to 3NF. However, to illustrate a 3NF violation and its normalization, let's consider a hypothetical scenario involving the `address` table.
#Imagine the `address` table included a column for `city_name` directly, instead of just `city_id` which is a foreign key referencing the `city` table:
#**Hypothetical `address` table (violating 3NF):**
#| address\_id (Primary Key) | address      | district   | city\_id (Foreign Key) | **city\_name** (Non-key attribute) | postal\_code | phone      | ... |
#| :------------------------ | :----------- | :--------- | :--------------------- | :--------------------------------- | :----------- | :--------- | :-- |
#| 1                         | 47 MySakila Dr. | Alberta    | 1                      | **Akaa**                           | T1H 4K9      |            |     |
#| 2                         | 1121 Loja Avenue | California | 2                      | **Akron**                          | 90427        |            |     |
#| 3                         | 1795 Kilgore Highway | Texas      | 3                      | **Alabama**                        | 31776        |            |     |
#In this hypothetical table, the primary key is `address_id`. 
#Both `city_id` and `city_name` are non-key attributes. However, there is a transitive dependency: `city_name` is dependent on `city_id`, and `city_id` is dependent on the primary key `address_id`. 
#This means `city_name` is indirectly dependent on `address_id` through `city_id`. 
#This violates 3NF because `city_name` does not directly depend *only* on the primary key `address_id`.
#**Normalization to achieve 3NF**
#To normalize this table to 3NF, you would remove the transitively dependent attribute (`city_name`) from the `address` table and place it in a separate table where it directly depends on the attribute it is dependent on (the `city` table, where `city_name` depends on `city_id`). 
#This is exactly how the actual Sakila database is designed.
#**Normalized Tables:**
#**`address` table (in 3NF):**
#| address\_id (Primary Key) | address      | district   | city\_id (Foreign Key) | postal\_code | phone      | ... |
#| :------------------------ | :----------- | :--------- | :--------------------- | :----------- | :--------- | :-- |
#| 1                         | 47 MySakila Dr. | Alberta    | 1                      | T1H 4K9      |            |     |
#| 2                         | 1121 Loja Avenue | California | 2                      | 90427        |            |     |
#| 3                         | 1795 Kilgore Highway | Texas      | 3                      | 31776        |            |     |
#**`city` table (in 3NF):**
#| city\_id (Primary Key) | city\_name | country\_id (Foreign Key) | last\_update |
#| :--------------------- | :--------- | :------------------------ | :----------- |
#| 1                      | Akaa       | ...                       | ...          |
#| 2                      | Akron      | ...                       | ...          |
#| 3                      | Alabama    | ...                       | ...          |
#In the normalized structure, `city_name` is only stored in the `city` table, where it is directly dependent on the `city_id` (the primary key of the `city` table). 
#The `address` table only contains `city_id`, which is a foreign key referencing the `city` table. 
#This eliminates the transitive dependency and brings the tables into 3NF.
--
--
#Q4-
--
#Normalization Process:
#Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
--
#Ans-
--
#**Normalization Process: From Unnormalized to at least 2NF**
#Let's take the `film` table as our example. In its actual form in the Sakila database, the `film` table is well-normalized. However, to demonstrate the normalization process, let's imagine a hypothetical **unnormalized** version of the `film` table that includes information about actors directly within the film table, violating 1NF and potentially 2NF.
#**Hypothetical Unnormalized `film` table:**
#| film\_id (Primary Key) | title       | description | release\_year | rental\_duration | rental\_rate | length | replacement\_cost | rating | special\_features | **actor\_details**                                  |
#| :--------------------- | :---------- | :---------- | :------------ | :--------------- | :----------- | :----- | :---------------- | :----- | :---------------- | :-------------------------------------------------- |
#| 1                      | ACADEMY DINOSAUR | ...         | 2006          | 6                | 0.99         | 86     | 20.99             | PG     | Deleted Scenes,Behind the Scenes | **1: PENELOPE GUINESS, 10: CHRISTIAN GABLE**      |
#| 2                      | ACE GOLDFINGER | ...         | 2006          | 3                | 4.99         | 48     | 12.99             | G      | Trailers,Deleted Scenes         | **19: BOB FAWCETT, 26: LUCILLE TRUMAN, 10: CHRISTIAN GABLE** |
#| ...                    | ...         | ...         | ...           | ...              | ...          | ...    | ...               | ...    | ...               | ...                                                 |
#This hypothetical table is unnormalized because:
#1.  The `actor_details` column contains multiple pieces of information (actor ID and actor name) and multiple values within a single cell (a list of actor details for each film). This violates **1NF**.
#2.  Even if we somehow made `actor_details` atomic (e.g., just storing a comma-separated list of actor IDs), if `film_id` was the primary key, the actor's name would be dependent on the actor's ID, and the actor's ID would be dependent on the `film_id` (as it's part of the composite key in the linking table), creating a transitive dependency or a partial dependency if we had a composite key involving `film_id` and actor ID.
#**Step 1: Normalize to First Normal Form (1NF)**
#To bring this table to 1NF, we need to ensure each column contains atomic values and remove repeating groups. We would separate the actor details into a new table.
#**New Table: `film_actor_unnormalized_1nf`**
#| film\_id | actor\_id | actor\_name     |
#| :------- | :-------- | :-------------- |
#| 1        | 10        | CHRISTIAN GABLE |
#| 2        | 19        | BOB FAWCETT     |
#| 2        | 26        | LUCILLE TRUMAN  |
#| 2        | 10        | CHRISTIAN GABLE |
#| ...      | ...       | ...             |
#The original `film` table would now look like this (removing the `actor_details` column):
#**`film` table (partially normalized to 1NF):**
#| film\_id (Primary Key) | title       | description | release\_year | rental\_duration | rental\_rate | length | replacement\_cost | rating | special\_features        |
#| :--------------------- | :---------- | :---------- | :------------ | :--------------- | :----------- | :----- | :---------------- | :----- | :----------------------- |
#| 1                      | ACADEMY DINOSAUR | ...         | 2006          | 6                | 0.99         | 86     | 20.99             | PG     | Deleted Scenes,Behind the Scenes |
#| 2                      | ACE GOLDFINGER | ...         | 2006          | 3                | 4.99         | 48     | 12.99             | G      | Trailers,Deleted Scenes  |
#| ...                    | ...         | ...         | ...           | ...              | ...          | ...    | ...               | ...    | ...                      |
#Now, both tables are in 1NF: each column has atomic values, and we can define primary keys (e.g., `film_id` for `film`, and a composite key of `film_id` and `actor_id` for `film_actor_unnormalized_1nf`).
#**Step 2: Normalize to Second Normal Form (2NF)**
#Now let's look at the `film_actor_unnormalized_1nf` table to see if it's in 2NF. The primary key is the composite key (`film_id`, `actor_id`). The non-key attribute is `actor_name`.
#Is `actor_name` fully functionally dependent on the *entire* primary key (`film_id`, `actor_id`)? No. The `actor_name` ("PENELOPE GUINESS", "BOB FAWCETT", etc.) is dependent *only* on the `actor_id` (1, 19, etc.), which is only a *part* of the composite primary key. This is a **partial dependency**, violating 2NF.
#To bring this to 2NF, we remove the partial dependency by creating a new table for actors, where the actor's name is dependent on the actor's ID.
#**New Table: `actor` (in 2NF)**
#| actor\_id (Primary Key) | actor\_name     |
#| :---------------------- | :-------------- |
#| 1                       | PENELOPE GUINESS |
#| 10                      | CHRISTIAN GABLE |
#| 19                      | BOB FAWCETT     |
#| 26                      | LUCILLE TRUMAN  |
#| ...                     | ...             |
#The `film_actor_unnormalized_1nf` table is modified to remove the `actor_name` and becomes the linking table between `film` and `actor`:
#**`film_actor` table (in 2NF - and also 3NF in this case):**
#| film\_id (Part of Primary Key) | actor\_id (Part of Primary Key) |
#| :----------------------------- | :------------------------------ |
#| 1                              | 1                               |
#| 1                              | 10                              |
#| 2                              | 19                              |
#| 2                              | 26                              |
#| 2                              | 10                              |
#| ...                            | ...                             |
#Now, the `film_actor` table has a composite primary key (`film_id`, `actor_id`), and it has no non-key attributes, so there are no partial dependencies. The `actor` table has `actor_id` as the primary key, and `actor_name` is fully dependent on it. The `film` table remains as it was after the first step.
#All three tables (`film`, `actor`, and `film_actor`) are now in **Second Normal Form**. (Note: In this specific example, `film_actor` and `actor` are also already in 3NF as there are no transitive dependencies).
#This process demonstrates how you would identify violations of 1NF and 2NF and decompose tables to achieve the desired normal forms, reducing redundancy and improving data integrity.
--
--
#Q5-
--
#CTE Basics:
#Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
--
#Ans-
--
WITH ActorFilmCounts AS (
    SELECT
        fa.actor_id,
        COUNT(fa.film_id) AS film_count
    FROM
        film_actor fa
    GROUP BY
        fa.actor_id
)
SELECT
    a.first_name,
    a.last_name,
    afc.film_count
FROM
    actor a
JOIN
    ActorFilmCounts afc ON a.actor_id = afc.actor_id
ORDER BY
    afc.film_count DESC, a.last_name, a.first_name;
--
--
#Q6-
--
#CTE with Joins:
#Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
--
#Ans-
--
WITH FilmLanguageDetails AS (
    SELECT
        f.title,
        l.name AS language_name,
        f.rental_rate
    FROM
        film f
    JOIN
        language l ON f.language_id = l.language_id
)
SELECT
    title,
    language_name,
    rental_rate
FROM
    FilmLanguageDetails
ORDER BY
    title;
--
--    
#Q7-
--
#CTE for Aggregation:
#Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
--
#Ans-
--
WITH CustomerRevenue AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_revenue
    FROM
        customer c
    JOIN
        payment p ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_id,
    first_name,
    last_name,
    total_revenue
FROM
    CustomerRevenue
ORDER BY
    total_revenue DESC;
--
--
#Q8-
--
#CTE with Window Functions:
#Utilize a CTE with a window function to rank films based on their rental duration from the film table.
--
#Ans-
--
WITH FilmRentalDetails AS (
    SELECT
        film_id,
        title,
        rental_duration
    FROM
        film
)
SELECT
    film_id,
    title,
    rental_duration,
    RANK() OVER (ORDER BY rental_duration DESC) as rental_duration_rank
FROM
    FilmRentalDetails
ORDER BY
    rental_duration_rank;
--
--
#Q9-
--
#CTE and Filtering:
#Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
--
#Ans-
--
WITH CustomersWithMoreThanTwoRentals AS (
    SELECT
        customer_id,
        COUNT(rental_id) AS rental_count
    FROM
        rental
    GROUP BY
        customer_id
    HAVING
        COUNT(rental_id) > 2
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    cwmttr.rental_count
FROM
    customer c
JOIN
    CustomersWithMoreThanTwoRentals cwmttr ON c.customer_id = cwmttr.customer_id
ORDER BY
    cwmttr.rental_count DESC;
--
--
#Q10-
--
#CTE for Date Calculations:
#Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.
--
#Ans-
--
WITH MonthlyRentals AS (
    SELECT
        rental_id,
        rental_date
    FROM
        rental
)
SELECT
    DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
    COUNT(rental_id) AS total_rentals
FROM
    MonthlyRentals
GROUP BY
    rental_month
ORDER BY
    rental_month;
--
--
#Q11-
--
#CTE and Self-Join:
#Create a CTE to generate a report showing pairs of actors who have appeared in the same film together,using the film_actor table.
--
#Ans-
--
WITH FilmActors AS (
    SELECT
        film_id,
        actor_id
    FROM
        film_actor
)
SELECT
    a1.first_name AS actor1_first_name,
    a1.last_name AS actor1_last_name,
    a2.first_name AS actor2_first_name,
    a2.last_name AS actor2_last_name,
    f.title AS shared_film_title
FROM
    FilmActors fa1
JOIN
    FilmActors fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
JOIN
    actor a1 ON fa1.actor_id = a1.actor_id
JOIN
    actor a2 ON fa2.actor_id = a2.actor_id
JOIN
    film f ON fa1.film_id = f.film_id
ORDER BY
    f.title, a1.last_name, a1.first_name, a2.last_name, a2.first_name;
--
--
#Q12-
--
#CTE for Recursive Search:
#Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column.
--
#Ans-
--
WITH RECURSIVE StaffHierarchy AS (
    -- Anchor member: Select the manager you want to start with
    SELECT
        staff_id,
        first_name,
        last_name,
        last_update,
        0 AS level -- Level to track hierarchy depth
    FROM
        staff
    WHERE
        staff_id = 2 -- Replace with the staff_id of the specific manager

    UNION ALL

    -- Recursive member: Select staff who report to those found in the previous step
    SELECT
        s.staff_id,
        s.first_name,
        s.last_name,
        s.last_update,
        sh.level + 1
    FROM
        staff s
    JOIN
        StaffHierarchy sh ON s.last_update = sh.staff_id
)
SELECT
    staff_id,
    first_name,
    last_name,
    last_update,
    level
FROM
    StaffHierarchy;
--
-- 
