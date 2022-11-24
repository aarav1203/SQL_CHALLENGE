use sql_challenge;

create table projects(
task_id int,
start_date date,
end_date date);

insert into projects values(1,'2015-10-01','2015-10-02');
insert into projects values(2,'2015-10-02','2015-10-03');
insert into projects values(3,'2015-10-03','2015-10-04');
insert into projects values(4,'2015-10-13','2015-10-14');
insert into projects values(5,'2015-10-14','2015-10-15');
insert into projects values(6,'2015-10-28','2015-10-29');
insert into projects values(7,'2015-10-30','2015-10-31');

-- Q146.Write a query to output the start and end dates of projects listed by the number of days it took to
-- complete the project in ascending order. If there is more than one project that have the same number
-- of completion days, then order by the start date of the project.

select * from projects;
with cte as(
select *,date_sub(start_date,interval task_id day) as gp_date
from projects
)
select start_date,end_date from(
select gp_date,min(start_date) as start_date,max(end_date) as end_date
from cte 
group by gp_date
order by count(*) 
)a;