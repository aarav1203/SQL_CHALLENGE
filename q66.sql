use sql_challenge;
create table product7(
product_id int,
product_name varchar(30),
unit_price int,
primary key(product_Id));
create table sales4(
seller_id int,
product_Id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key(product_id) references product7(product_id));
select * from product7;
select * from sales4;
-- Q66.Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and
-- iPhone are products present in the Product table. Return the result table in any order
with cte as(
select s.buyer_id, group_concat(p.product_name) as products
from product7 p left join sales4 s
on p.product_Id=s.product_Id
group by buyer_id
order by buyer_id
)
select buyer_id from cte
where 'S8' in(products) and 'iphone' not in(products);