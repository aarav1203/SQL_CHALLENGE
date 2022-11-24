use sql_challenge;
create table customers(
customer_id int,
name varchar(30),
country varchar(30),
primary key(customer_id)
);

create table orders1(
order_id int,
customer_id int,
product_id int,
order_date date,
quantity int,
primary key(order_id)
);

create table product1(
product_id int,
descripion varchar(30),
price int,
primary key(product_id)
);
select * from product1;
select * from orders1;
select * from customers;

-- Write an SQL query to report the customer_id and customer_name of customers who have spent at
-- least $100 in each month of June and July 2020.
-- Return the result table in any order.
with cte as(
select o.customer_id,c.name,sum(price*quantity) as month_spend,month(order_date) as month
from orders1 o inner join product1 p on o.product_id=p.product_id inner join customers c on o.customer_id=c.customer_id
where year(o.order_date)=2020 and month(o.order_date) in(6,7)
group by customer_id,month(order_date)
)
select customer_id,name from cte
where month_spend>=100
group by customer_id
having count(*)=2;

