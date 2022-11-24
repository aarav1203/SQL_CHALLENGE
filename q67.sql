use sql_challenge;
create table customer4(
customer_id int,
name varchar(30),
visited_on date,
amount int ,
primary key (customer_id, visited_on));
select  * from customer4;

-- Q.67Write an SQL query to compute the moving average of how much the customer paid in a seven days
-- window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
-- Return result table ordered by visited_on in ascending order.
with cte as(
select visited_on,sum(amount) amount
from customer4
group by visited_on)
select visited_on,amount,average_amount from(
select visited_on,sum(amount) over(order by visited_on rows between 6 preceding  and current row) as amount,
round(sum(amount) over(order by visited_on rows between 6 preceding  and current row)/7,2) as average_amount,
lag(visited_on,6) over(order by visited_on) as prev_6
from cte)a
where prev_6 is not null
order by visited_on;