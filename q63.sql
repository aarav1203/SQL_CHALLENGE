use sql_challenge;
create table sales2(
sale_id int,
product_id int,
year int,
quantity int,
price int,
primary key(sale_id,year),
foreign key(product_id) references product5(product_id));
create table product5(
product_id int,
product_name varchar(30),
primary key(product_id));
select * from sales2;
select * from product5;

-- Q63.Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.
-- Return the resulting table in any order.
select p.product_name,s.year,s.price
from sales2 s left join product5 p
on s.product_id=p.product_id;
