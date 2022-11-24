use sql_challenge;
create table salesperson(
sales_id int,
name varchar(30),
salary bigint,
commision_rate int,
hire_date date,
primary key(sales_id));


create table company(
com_id int,
name varchar(30),
city varchar(30),
primary key(com_id));

create table orders5(
order_id int,
order_date date,
com_id int,
sales_id int,
amount bigint,
primary key(order_id),
foreign key(com_id) references company(com_id),
foreign key(sales_id)references salesperson(sales_id));

select * from salesperson;
select * from company;
select * from orders5;

-- Q59.Write an SQL query to report the names of all the salespersons who did not have any orders related to
-- the company with the name "RED". Return the result table in any order
with cte as(
select s.sales_id,s.name as seller_name,c.name as company_name
from salesperson s left join orders5 o on s.sales_id=o.sales_id left join company c on o.com_id=c.com_id
)
select seller_name 
from cte where seller_name not in (select distinct seller_name from cte where company_name='RED');