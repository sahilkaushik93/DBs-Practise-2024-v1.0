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




