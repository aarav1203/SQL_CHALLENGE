use sql_challenge;
create table product6(
product_id int,
product_name varchar(30),
unit_price int,
primary key(product_Id));
create table sales3(
seller_id int,
product_Id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key(product_id) references product6(product_id));

select * from product6;
select * from sales3;

--  Q65.Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.
-- Return the result table in any order.
with cte as(
select seller_id,sum(price) as total_salesprice
from sales3
group by seller_id
)
select seller_id from cte where total_salesprice=(select max(total_salesprice) from cte) order by seller_id;


