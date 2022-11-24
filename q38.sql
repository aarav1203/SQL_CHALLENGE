use sql_challenge;
create table departments(
id int ,
name varchar(30),
primary key(id)
);
create table students(
id int,
name varchar(30),
department_id int,
primary key(id)
);

select * from departments;
select * from students;

--  Q38.Write an SQL query to find the id and the name of all students who are enrolled in departments that no
-- longer exist. Return the result table in any order.

select s.id,s.name
from departments d right join students s
on d.id=s.department_id
where d.name is null;


