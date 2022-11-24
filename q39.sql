use sql_challenge;
create table calls(
from_id int,
to_id int,
duration int
);
select * from calls;

-- Q.39 Write an SQL query to report the number of calls and the total call duration between each pair of
-- distinct persons (person1, person2) where person1 < person2.
-- Return the result table in any order.
-- person1 person2 call_count total_duration
select from_id as person1 ,to_id as person2,count(*) as call_count,sum(duration) as call_duration from(
select * from calls
union all
select to_id,from_id,duration from calls)s
where from_id<to_id
group by person1 ,person2;

-- Q.40 Write an SQL query to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places.
-- Return the result table in any order.
-- Q.40 AND Q.23 ARE BOTH SAME