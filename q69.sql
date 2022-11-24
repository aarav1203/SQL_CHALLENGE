use sql_challenge;
create table logs(
log_id int,
primary key(log_id));
insert into logs values(1);
insert into logs values(2);
insert into logs values(3);
insert into logs values(7);
insert into logs values(8);
insert into logs values(10);
select * from logs;

-- Q69.Write an SQL query to find the start and end number of continuous ranges in the table Logs.
-- Return the result table ordered by start_id.
with cte as(
select log_Id,log_id-row_number() over(order by log_id) as gp
from logs
)
select distinct first_value(log_id) over(partition by gp order by log_Id) as start,
		first_value(log_id) over(partition by gp order by log_id desc) as end
        from cte;