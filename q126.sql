use sql_challenge;
create table orders6(
order_id int,
customer_id int,
trip_id int,
status enum('completed successfully', 'completed incorrectly', 'never received'),
order_timestamp timestamp);
create table trips(
dasher_id int,
trip_id int,
estimated_delivery_timestamp timestamp,
actual_delivery_timestamp timestamp);

create table customer5(
customer_id int,
signup_timestamp timestamp);

-- Q26.Write a query to find the bad experience rate in the first 14 days for new users who signed up in June
-- 2022. Output the percentage of bad experience rounded to 2 decimal places.

select * from orders6;
select * from customer5;
select * from trips;
with cte as(
select o.customer_id,o.status,c.signup_timestamp,o.order_timestamp
from orders6 o inner join  trips t on o.trip_id=t.trip_id 
inner join customer5 c on c.customer_id=o.customer_id
where extract(year from c.signup_timestamp)=2022 and month(c.signup_timestamp)=6 and datediff(o.order_timestamp,c.signup_timestamp)<=14
)
select round((100.0*count(case when status in('completed incorrectly','never received') then 1 else null end)/count(customer_id)),2)
as bad_experience_pct
from cte;
