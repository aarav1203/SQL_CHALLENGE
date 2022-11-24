use sql_challenge;
create table customer1(
customer_id int,
product_key int,
foreign key (product_key) references product4(product_key)
);
create table product4(
product_key int,
primary key(product_key)
);
select * from customer1;
select * from product4;

-- Q46. Write an SQL query to report the customer ids from the Customer table that bought all the products in
-- the Product table.Return the result table in any order
with cte as(
select c.customer_id,p.product_key,count(p.product_key) as pro_count
from product4 p left join customer1 c 
on p.product_key=c.product_key
group by c.customer_id)
select customer_id from cte where pro_count=(select count(*) from product4);
