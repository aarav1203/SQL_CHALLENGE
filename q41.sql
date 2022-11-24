use sql_challenge;
create table warehouse(
name varchar(30),
product_id int,
units int,
primary key(name, product_id)
);
create table products3(
product_id int,
product_name varchar(30),
width int,
length int,
height int,
primary key(product_id)
);
select * from warehouse;
select * from products3;

select w.name as warehouse_name,sum(w.units*p.width*p.length*p.height) as volume
from warehouse w left join products3 p
on w.product_id=p.product_id
group by w.name; 