use sql_challenge;
create table employees(
id int,
name varchar(30),
primary key(id)
);
create table employeeuni(
id int,
unique_id int,
primary key(id,unique_id)
);

select * from employees;
select * from employeeuni;

-- Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
-- show null. Return the result table in any order
select en.unique_id,e.name
from employees e left join employeeuni en on e.id=en.id
order by name;
