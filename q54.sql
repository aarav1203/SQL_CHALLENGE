use sql_challenge;
create table employee3(
employee_id int,
team_id int,
primary key(employee_id));

select * from employee3;

-- Q54.Write an SQL query to find the team size of each of the employees.
-- Return result table in any order.

select e1.employee_id,count(e1.team_id) as team_size
from employee3 e1 inner join employee3 e2
on e1.team_id=e2.team_id
group  by e1.employee_Id
order by employee_id ;