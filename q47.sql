use sql_challenge;
create table project(
project_id int,
employee_id int,
primary key(project_id,employee_id),
foreign key(employee_id) references employee2(employee_id)
);
create table employee2(
employee_id int,
name varchar(30),
experience_years int,
primary key(employee_id)
);
select * from project;
select * from employee2;

-- Q47.Write an SQL query that reports the most experienced employees in each project. In case of a tie,
-- report all employees with the maximum number of experience years. Return the result table in any order.
with cte as(
select p.project_id,p.employee_id,e.experience_years
from project p left join employee2 e
on p.employee_id=e.employee_id)
select project_id,employee_id from cte c
where experience_years=(select max(experience_years) from cte where project_id=c.project_id group by project_id)
order by project_Id;