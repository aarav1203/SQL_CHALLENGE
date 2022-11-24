create table search_frequency(
searches int,
num_users int);

insert into search_frequency values(1,2);
insert into search_frequency values(2,2);
insert into search_frequency values(3,3);
insert into search_frequency values(4,1);

-- Q83.Write a query to report the median of searches made by a user. Round the median to one decimal
-- point.
-- Hint- Write a subquery or common table expression (CTE) to generate a series of data (that's keyword
-- for column) starting at the first search and ending at some point with an optional incremental value.

select * from search_frequency;

with cte as(
select searches
from search_frequency
group by searches,generate_series(1,num_users)
)
select round(percentile_cont(0.5) within group(order by searches)::decimal,1) as median
from search_frequency;