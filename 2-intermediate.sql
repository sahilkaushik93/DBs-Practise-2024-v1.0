-- The SQL WITH clause allows you to give a sub-query block a name 
-- (a process also called sub-query refactoring), which can be referenced in several places 
-- within the main SQL query
-- The clause is used for defining a temporary relation such that the output of this 
-- temporary relation is available and is used by the query that is associated 
-- with the WITH clause.

select * from student_details;

-- all students whose age is greater than avg age
-- (output 1)
WITH temporaryTable(avgvalue) as 
(select avg(AGE) from student_details)
select ROLL_NO, NAME, ADDRESS, AGE 
from student_details, temporaryTable 
where student_details.AGE > temporaryTable.avgvalue;

-- all films whose length is greater than avg length
-- output 2
select * from sakila.film;

-- using with
with 
-- first sub-query
tempFilmLen(rating, total) 
as 
(select rating, sum(length) from sakila.film group by rating),
-- second sub-query
avgFilmLen(avgLen) 
as 
(select avg(length) from sakila.film)
-- generating results using two sub-queries
select rating
from tempFilmLen, avgFilmLen
where tempFilmLen.total > avgFilmLen.avgLen;

-- OFFSET and FETCH Clause(in mysql we use LIMIT) are used in conjunction with SELECT and ORDER BY 
-- clause to provide a means to retrieve a range of records.
-- The OFFSET argument is used to identify the starting point to return rows from a result set. 
-- Basically, it exclude the first set of records.
-- Note:
-- OFFSET can only be used with ORDER BY clause. It cannot be used on its own.
-- OFFSET value must be greater than or equal to zero. It cannot be negative, else return error.

-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition
-- ORDER BY column_name
-- LIMIT row_count 
-- OFFSET offset_no;

-- row_count specifies the number of rows to return.
-- offset_no specifies the number of rows to skip before starting to return rows.

-- (output 3)
select * from student_details;
SELECT ROLL_NO, AGE, NAME
FROM student_details
WHERE AGE < 23
ORDER BY NAME
LIMIT 50
OFFSET 1;

-- CASE expression
-- (Output 4)
select * from customer;
select *, 
case 
when Country In ('India', 'Sri Lanka') then 'Asian'
else 'Foreign'
end as Nationality
from customer;

-- ALL OPERATORY:-
-- ALL operator is used to select all tuples of SELECT STATEMENT. 
-- It is also used to compare a value to every value in another 
-- value set or result from a subquery.
-- The ALL operator returns TRUE if all of the subqueries values meet the condition. 
-- The ALL must be preceded by comparison operators and evaluates true if all of 
-- the subqueries values meet the condition.
-- ALL is used with SELECT, WHERE, HAVING statement
-- Syntax:
-- SELECT column_name(s)
-- FROM table_name
-- WHERE column_name comparison_operator ALL
-- (SELECT column_name
-- FROM table_name
-- WHERE condition(s));

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Product (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1500.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 600.00),
(4, 'Monitor', 300.00);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 4),
(4, 4, 2);

-- The ALL operator compares a value to all values in another set of values (a subquery). 
-- It returns TRUE if the comparison is true for all values in the set.
-- Example:
-- Find products whose price is greater than all products that have been ordered with 
-- a quantity greater than 3.
SELECT ProductName, Price
FROM Product
WHERE Price > ALL 
(SELECT Price FROM Product WHERE ProductID IN 
(SELECT ProductID FROM OrderDetails WHERE Quantity > 3));

-- Explanation:
-- 1.
-- The subquery (SELECT ProductID FROM OrderDetails WHERE Quantity > 3) 
-- finds the ProductID of products ordered in quantities greater than 3.
-- 2.
-- The inner subquery (SELECT Price FROM Product WHERE ProductID IN (...)) 
-- gets the prices of those products.
-- 3.
-- The outer query compares the price of each product to all prices returned 
-- by the subquery, returning only those products that are more expensive 
-- than all the prices in the subquery.


-- ANY Operator
-- The ANY operator compares a value to any value in a set of values (a subquery). 
-- It returns TRUE if the comparison is true for any one of the values in the set.
-- Example
-- Using the same tables, let's find products that are cheaper than any product 
-- that has been ordered with a quantity greater than 2.

SELECT ProductName, Price
FROM Product
WHERE Price < ANY 
(SELECT Price FROM Product WHERE ProductID IN 
(SELECT ProductID FROM OrderDetails WHERE Quantity > 2));











