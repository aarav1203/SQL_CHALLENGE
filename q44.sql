use sql_challenge;
create table employee1(
id int ,
name varchar(30),
department varchar(30),
manager_id int,
primary key(id)
);
select * from employee1;

-- Q44. Write an SQL query to report the managers with at least five direct reports.
-- Return the result table in any order
with cte as(
select e.id,e.name ,m.id as manager_id,m.name as manager_name from employee1 e left	
 join employee1 m
on m.id=e.manager_id where e.manager_id is not null
)
select manager_name as name from cte
group by manager_name having count(*)>=5;
