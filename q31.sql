use sql_challenge;
create table npv(
id int,
year int,
npv int,
primary key(id,year)
);
create table queries(
id int,
year int,
primary key(id,year)
);
select * from npv;
select * from queries;

-- Q30. Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.

select q.id, q.year,ifnull(n.npv,0) as npv
from queries q left join npv n on q.id=n.id and q.year=n.year;

-- Q31.Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.
-- ABOVE REPEATED QUESTION
