-- 1. UNION CLAUSE:-
-- The Union Clause is used to combine two separate select statements and produce the 
-- result set as a union of both select statements.
--  NOTE:
-- The fields to be used in both the select statements must be in the same order, same number, 
-- and same data type.
-- The Union clause produces distinct values in the result set, to fetch the duplicate values 
-- too UNION ALL must be used instead of just UNION.

select * from practisesql2024.student_details;

CREATE TABLE practisesql2024.student_branch (
  roll_no INT,
  branch VARCHAR(50),
  grade VARCHAR(2)
);

INSERT INTO practisesql2024.student_branch (roll_no, branch, grade)
VALUES 
  (1, 'Computer Science', 'A'),
  (2, 'Electrical Engineering', 'B'),
  (3, 'Mechanical Engineering', 'C');

-- (Output 1)  
select roll_no, name from practisesql2024.student_details
UNION
select roll_no, branch from practisesql2024.student_branch;

-- (Output 2)
select roll_no, name from practisesql2024.student_details where roll_no > 3
UNION ALL
select roll_no, branch from practisesql2024.student_branch where roll_no < 3;

-- 2. INTERSECT CLAUSE:-
-- provide the result of the intersection of two select statements. This implies the 
-- result contains all the rows which are common to both the SELECT statements
-- (Output 3)
select roll_no name from practisesql2024.student_details
INTERSECT 
select roll_no from practisesql2024.student_branch;

-- 3. EXCEPT clause :  contains all the rows that are returned by the first SELECT operation, 
-- and not returned by the second SELECT operation
-- (Output 4)
select roll_no name from practisesql2024.student_details
EXCEPT 
select roll_no from practisesql2024.student_branch;

-- INNER JOIN
-- It brings common part from two sets
-- Note: We can also write JOIN instead of INNER JOIN. JOIN is same as INNER JOIN. 
select * from sakila.actor;
select * from sakila.film_actor;

-- (Output 5)
select ac.actor_id, film_ac.film_id, concat(ac.first_name," " ,ac.last_name) as actor_name
from 
sakila.actor as ac
INNER JOIN
sakila.film_actor as film_ac
ON ac.actor_id = film_ac.actor_id;

-- LEFT JOIN
-- LEFT JOIN returns all the rows of the table on the left side of the join and 
-- matches rows for the table on the right side of the join. For the rows for which there 
-- is no matching row on the right side, the result-set will contain null. LEFT JOIN is also 
-- known as LEFT OUTER JOIN.
-- RIGHT JOIN (opposite of LEFT JOIN)
select * from sakila.film_category;
-- (Output 6)
select count(ac.actor_id) as "total_actors", count(cat.film_id) as "total_films", cat.category_id
from 
sakila.film_actor as ac
LEFT JOIN
sakila.film_category as cat
ON ac.film_id = cat.film_id
WHERE ac.actor_id = 20
GROUP BY cat.category_id
HAVING total_actors > 3
ORDER BY cat.category_id;

-- CARTESIAN JOIN/CROSS JOIN
-- The CARTESIAN JOIN is also known as CROSS JOIN. In a CARTESIAN JOIN there is a 
-- join for each row of one table to every row of another table. 
-- This usually happens when the matching column or WHERE condition is not specified.
-- In the absence of a WHERE condition the CARTESIAN JOIN will behave like a CARTESIAN PRODUCT. 
-- i.e., the number of rows in the result-set is the product of the number of rows of the two tables.
-- In the presence of WHERE condition this JOIN will function like a INNER JOIN.
-- Generally speaking, Cross join is similar to an inner join where the join-condition 
-- will always evaluate to True
select * from practisesql2024.student_branch;
select * from practisesql2024.student_details;

-- (Output 7)
select sd.ROLL_NO, sd.NAME, sb.branch, sb.grade from 
practisesql2024.student_branch as sb
CROSS JOIN
practisesql2024.student_details as sd;

-- (Output 8)
select sd.ROLL_NO, sd.NAME, sb.branch, sb.grade from 
practisesql2024.student_branch as sb
CROSS JOIN
practisesql2024.student_details as sd
where sb.roll_no = sd.ROLL_NO;

-- SELF JOIN
-- SELF JOIN a table is joined to itself. That is, each row of the table is joined with itself 
-- and all other rows depending on some conditions. In other words we can say that it is a 
-- join between two copies of the same table.
-- (Output 9)
select a.*, b.*
from 
practisesql2024.student_details as a,
practisesql2024.student_details as b
where 
a.ROLL_NO = b.ROLL_NO;









