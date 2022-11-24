use sql_challenge;
create table customer3(
id int ,
name varchar(30),
primary key(id)
);
create table order4(
id int,
customerid int,
primary key(id),
foreign key(customerid) references customer3(id)
);
select * from customer3;
select * from order4;

-- Q53.Write an SQL query to report all customers who never order anything.
-- Return the result table in any order.

select c.name as customers
from customer3 c left join order4 o
on c.id=o.customerid
where o.id is null;
