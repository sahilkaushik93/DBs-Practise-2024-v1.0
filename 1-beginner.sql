-- create database:-
-- create database practiseSQL2024;

-- select database:-
use practiseSQL2024;

-- create table in database
CREATE TABLE if not exists Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone int8
);
-- drop table customer;
-- insert values inside a table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23',42432422),
       (2, 'Aman ', 'Chopra', 'Australia','21',42432422),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24',42432422),
       (4, 'Aditya', 'Arpan', 'Austria','21',42432422),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22',42432422);

-- (Output 1)       
select * from Customer;

-- creating a derived table from another table (Output 2)
create table cust_name AS (select CustomerID, CustomerName from Customer);
select * from cust_name;

-- to look structure of table (Output 3)
desc Customer;

-- Select a group
select * from sakila.actor limit 10;
select count(actor_id) as count, first_name 
from sakila.actor 
where last_update = "2006-02-15 04:34:33" 
group by first_name 
order by count desc;

-- having clause works only on aggregated fields generated (Output 4)
-- where can be used with non-aggregated fields
select * from sakila.rental;
select distinct(return_date) from sakila.rental;

select count(rental_id) as rentals, 
staff_id,
count(inventory_id) as inventories 
from sakila.rental
where inventory_id <= 500
group by staff_id
having (rentals > 10);

-- AND/OR operator
select * from practisesql2024.customer
where 
age < 23 and 
phone = 42432422 and (CustomerName = 'Aditya' or LastName = 'Chopra');

use practisesql2024;
CREATE TABLE Student_details (
ROLL_NO INT PRIMARY KEY,
NAME VARCHAR(25),
ADDRESS VARCHAR(25),
PHONE int8 ,
AGE INT); 

-- Inserting the data in Student Table
INSERT INTO Student_details(ROLL_NO,NAME,ADDRESS,PHONE,AGE) VALUES 
(1,'Ram','Delhi',9415536635,24),
(2,'Ramesh','Gurgaon',9414576635,21),
(3,'Sujit','Delhi',9815532635,20),
(4,'Suresh','Noida',9115536695,21),
(5,'Kajal','Gurgaon',8915536735,28),
(6,'Garima','Rohtak',7015535635,23);

select * from student_details;

-- dropping table syntax:-
-- drop table practisesql2024.student_details;
-- truncate table practisesql2024.student_details;

-- performing arithmetic operations
-- (output 5)
select * from student_details;
select NAME, PHONE, AGE, 
PHONE%AGE as "MODULO(PHONE%AGE)",
AGE + (PHONE%AGE) as "SUM of AGE & MODULO"
from student_details;

-- Wildcards
-- "%" : It is used in substiture of zero or more characters
-- "_" : It is used as a substitute for one character.
-- "-" : It is used to substitute a range of characters.
-- "[range_of_characters]" : It is used to fetch a matching set or range of 
--                           characters specified inside the brackets.
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (6, 'Shubh', 'kaur', 'India','23','9125368745'),
       (7, 'Aan ', 'opra', 'Australia','21','9632784152'),
       (8, 'Navneet', 'lasi', 'Sri lanka','24','8965741538'),
       (9, 'Adityanath', 'darpan', 'Austria','21','9874589736'),
       (10, 'Nisha', 'ujjain', 'Spain','22','8754128965');

-- (output 6)
Select * from Customer 
where Country like 's%' and 
CustomerName like 'Nav%' and 
Phone like '%4_4%';












