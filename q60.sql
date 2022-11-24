use sql_challenge;
create table triangle(
x int,
y int,
z int,
primary key(x,y,z)
);
select * from triangle;

-- Q60. Write an SQL query to report for every three line segments whether they can form a triangle.
-- Return the result table in any order

SELECT X,Y,Z,
CASE WHEN (X+Y)>Z  AND (Y+Z)>X AND (X+Z)>Y THEN 'YES' ELSE 'NO' END AS TRIANGLE
FROM triangle;