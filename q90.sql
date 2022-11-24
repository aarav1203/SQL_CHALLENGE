create table numbers(
num int,
frequency int);

insert into numbers values(0,7);
insert into numbers values(1,1);
insert into numbers values(2,3);
insert into numbers values(3,1);


-- Q90. The median is the value separating the higher half from the lower half of a data sample.
-- Write an SQL query to report the median of all the numbers in the database after decompressing the
-- Numbers table. Round the median to one decimal point.The query result format is in the following example.The Syntax is in PostgreSql

WITH searches_expanded AS (
  SELECT num
  FROM numbers
  GROUP BY 
    num, 
    GENERATE_SERIES(1, frequency))

SELECT 
  ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (
    ORDER BY num)::DECIMAL, 1) AS  median
FROM searches_expanded;
