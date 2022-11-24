use sql_challenge;
create table user_transaction(
transaction_id int,
product_id int,
spend float,
transaction_date datetime);

-- Q80.Assume you are given the table below containing information on user transactions for particular
-- products. Write a query to obtain the year-on-year growth rate for the total spend of each product for each year.
-- Output the year (in ascending order) partitioned by product id, current year's spend, previous year's
-- spend and year-on-year growth rate (percentage rounded to 2 decimal places).

select * from user_transaction;
insert into user_transaction values(1341, 123424, 1500.60, str_to_date('12312019120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1423, 123424, 1000.20, str_to_date('12312020120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1623, 123424, 1246.44, str_to_date('12312021120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1322, 123424, 2145.32, str_to_date('12312022120000','%m%d%Y%h%i%s'));

with cte as(
select extract(year from transaction_date) as year,product_id,spend as curr_year_spend,
round(lag(spend) over(PARTITION BY product_id order by extract(year from transaction_date)),2)
as prev_year_spend
from user_transaction)
select * ,
case when prev_year_spend is not null then round(((curr_year_spend-prev_year_spend)/prev_year_spend*100),2)
else prev_year_spend end as yoy_rate
from cte ;