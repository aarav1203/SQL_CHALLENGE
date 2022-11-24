use sql_challenge;
create table employee5(
employee_id int,
employee_name varchar(30),
manager_id int,
primary key(employee_id));

select * from employee5;

-- Q.71 Write an SQL query to find employee_id of all employees that directly or indirectly report their work to
-- the head of the company.The indirect relation between managers will not exceed three managers as the company is small.
-- Return the result table in any order
with cte as(
select e.employee_Id as employee_id ,e.manager_Id as manager_id,m.manager_id as senior_manager,sm.manager_id as head_manager
from employee5 e inner join employee5 m
on e.manager_id=m.employee_id inner join employee5 sm
on m.manager_id=sm.employee_id inner join employee5 ssm 
on sm.manager_id=ssm.employee_id
)
select employee_Id from cte
where employee_id <> manager_id and (manager_id=1 or senior_manager=1 or head_manager=1);