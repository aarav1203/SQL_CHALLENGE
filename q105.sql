use sql_challenge;
create table triangle1(
a int,
b int,
c int);
insert into triangle1 values(20,20,23);
insert into triangle1 values(20,20,20);
insert into triangle1 values(20,21,22);
insert into triangle1 values(13,14,30);

-- Q105.Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
-- Output one of the following statements for each record in the table:
-- ● Equilateral: It's a triangle with sides of equal length.
-- ● Isosceles: It's a triangle with sides of equal length.
-- ● Scalene: It's a triangle with sides of differing lengths.
-- ● Not A Triangle: The given values of A, B, and C don't form a triangle

select * from triangle1;

SELECT
    CASE
        WHEN A = B AND A = C AND B = C 
            THEN 'Equilateral'
        WHEN (A = B OR A = C OR B = C) AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Isosceles'
        WHEN A != B AND B != C AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Scalene'
        ELSE 'Not A Triangle'
    END as types_of_triangle
FROM TRIANGLE1;