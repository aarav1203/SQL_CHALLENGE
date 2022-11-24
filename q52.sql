use sql_challenge;
create table customer2(
id int,
name varchar(30),
refree_id int,
primary key(id));

select * from customer2;

-- Q52.Write an SQL query to report the names of the customer that are not referred by the customer with id
-- = 2.Return the result table in any order.

select name from customer2 
where refree_id <>2 or refree_id is null;
