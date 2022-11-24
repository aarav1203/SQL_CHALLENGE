use sql_challenge;
create table orders4(
order_number int,
customer_number int,
primary key(order_number));

-- Q57.Write an SQL query to find the customer_number for the customer who has placed the largest
-- number of orders.The test cases are generated so that exactly one customer will have placed more orders than any other customer.
select * from orders4;

select customer_number 
from orders4 group by customer_number
order by count(customer_number) desc limit 1;

-- Follow up: What if more than one customer has the largest number of orders, can you find all the
-- customer_number in this case?
with cte as(
select customer_number,count(customer_number) as total_order
from orders4 
group by customer_number order by total_order desc limit 1)
select customer_number from orders4
group by customer_number
having count(customer_number) in (select total_order from cte);

