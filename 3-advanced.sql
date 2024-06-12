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










