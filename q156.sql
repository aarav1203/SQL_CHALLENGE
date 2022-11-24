use sql_challenge;
create table purchases(
user_id int,
product_id int,
quantity int,
purchase_time datetime);

-- Q156.Assume you are given the table below containing information on user purchases. Write a query to
-- obtain the number of users who purchased the same product on two or more different days. Output
-- the number of unique users.
-- PS. On 26 Oct 2022, we expanded the purchases data set, thus the official output may vary from before

select * from purchases;

select count(distinct user_id) as repeated_customers
from purchases 
group by user_id,product_id having count(distinct purchase_time)>=2;