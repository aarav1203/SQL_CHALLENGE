use sql_challenge;
create table if not exists product(
product_id int,
product_name varchar(30),
unit_price int,
primary key(product_id)
);
create table if not exists sales(
seller_id  int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key (product_id) references product(product_id)
);
select * from sales;
select * from product;

-- Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
-- between 2019-01-01 and 2019-03-31 inclusive.
-- Return the result table in any order.

with cte as(
select s.product_id,p.product_name,s.sale_date
from sales s inner join product p 
on s.product_id=p.product_id
where s.sale_date between '2019-01-01' and '2019-03-31')
select product_id,product_name from cte c
where sale_date =(select max(sale_date) from sales group by product_id having product_id=c.product_id)





