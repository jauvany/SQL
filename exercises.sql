#01
Problem
Selecting Multiple Columns


When buying food, it is important to make sure it is fresh and not expired.
You are given the following 'Products' list:contentImageWrite a query to select the ProductName, ProductionDate and ExpirationDate.
Use the SELECT statement and separate the required columns by commas.

-- Solution 

SELECT ProductName, productionDate, ExpirationDate FROM products;

#02
Problem
The DISTINCT Keyword


At the conclusion of a bank transaction, 6 checks are printed -- 3 originals for the bank, and 3 copies for the customer.
Here is the list of all the checks named Operation

Write a query to show only the unique checks that are given to the customer.
Use the DISTINCT statement to return the unique values of mentioned column.

-- SOLUTION

/* table name: Operation */
SELECT DISTINCT checks FROM Operation;

#03
Sorting Results


Six players have competed in a chess tournament and their scores have been tallied.
Here is the table of Players:

Sort the players by losses to derive the leaderboard.
Recall the ORDER BY keyword.

-- Solution
?

#04
Problem
Logical Operators


You are given the following films table with details about superhero movies:

Write a query to output the names of all of the films which were produced by Marvel Studios in 2010 or later, sorted by the 'name' column.
Use the AND operator to combine two or more conditions.

-- SOLUTION
SELECT name FROM films WHERE production = 'Marvel Studios' and year >= 2010 ORDER BY name;

#05

Problem
The IN Operator


You are sorting football teams by leagues and given the following table named teams.

Write a query to output the team names and the countries of all teams that have played in La Liga (Spain), Premier League (England) and Bundesliga (Germany)․
Use the IN operator.

-- SOLUTION

SELECT teamname, country FROM teams WHERE country IN('Spain', 'England', 'Germany');


#06
Apartments
You want to rent an apartment and have the following table named Apartments:
Write a query to output the apartments whose prices are greater than the average and are also not rented, sorted by the 'Price' column.
Recall the AVG keyword.

--- SOLUTION
SELECT * FROM Apartments WHERE price > (SELECT AVG(price) FROM apartments) ORDER BY price;

#07

#08

#09

#10

#11

#12

#13


#14
Problem
The INSERT Statement


You have started a car rental service and have the following cars:

#GaragecontentImage

You plan to add two more vehicles to your garage:
6, 'Mercedes-Benz', 'G 63', 2020
7, 'Porsche', 'Panamera', 2020

Write a query to insert the new cars into your table named 'Garage'. Then show the table with the added records.

Use the INSERT statement to perform the operation.

""" SOLUTION """

INSERT INTO Garage (id, make, model, prodyear) 
VALUES (6,  'Mercedes-Benz',   'G 63',   2020), 
(7,   'Porsche',    'Panamera',     2020); 
SELECT * FROM Garage

#15
Problem
Deleting Data


You are manager in the supermarket.
Here is the products table showing a field for each item, along with the ExpireDate with the count of days remaining before item expiration.contentImageYou need to get rid of all the expired products.
Delete from the ‘products’ table all of the items whose 'ExpireDate' is less than 1 and show the table without any expired items.
The DELETE statement removes the data from the table permanently.

""" SOLUTION """
DELETE FROM products WHERE expiredate=0; 
SELECT * FROM products

#16

#17

#18