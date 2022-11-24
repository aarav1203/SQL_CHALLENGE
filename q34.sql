use sql_challenge;
create table products2(
product_id int,
product_name varchar(30),
product_category varchar(30),
primary key(product_id)
);

create table orders2(
product_id int,
order_date date,
unit int,
foreign key(product_id) references products2(product_id)
);

-- Q34.Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
-- and their amount.
-- Return result table in any order.
-- ORDERS TABLE DATA IS NOT GIVEN IN THIS QUESTIONS