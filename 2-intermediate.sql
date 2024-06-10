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

select * from customer;







