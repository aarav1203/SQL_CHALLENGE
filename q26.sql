use sql_challenge;
create table products(
product_id int,
product_name varchar(30),
product_category varchar(30),
primary key(product_id)
);
create table orders(
product_id int,
order_date date,
unit int,
foreign key (product_id) references products(product_id)
);
select * from orders;
select * from products;

-- Q26.Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
-- and their amount. Return result table in any order
select p.product_name,sum(o.unit) as unit
from products p inner join orders o
on p.product_id=o.product_id
where year(order_date)=2020 and month(order_date)=2
group by product_name having sum(unit)>=100;