use sql_challenge;
create table salary1(
id int,
employee_Id int,
amount int,
pay_date date,
primary key(id),
foreign key(employee_id) references employee7(employee_id));

create table employee7(
employee_id int,
department_id int,
primary key(employee_id));

-- Q91.Write an SQL query to report the comparison result (higher/lower/same) of the average salary of
-- employees in a department to the company's average salary.
-- Return the result table in any order.
select * from salary1;
select * from employee7;
with cte1 as(
select s.pay_date,round(avg(amount),2) as comp_avg_month
from salary1 s inner join employee7 e
on s.employee_id=e.employee_id
group by month(pay_date)),
					cte2 as (
							select e.department_id,s.pay_date,round(avg(amount),2) as avg_month
						    from salary1 s inner join employee7 e
							on s.employee_id=e.employee_id
                            group by e.department_id,s.pay_date)
                           
                            select date_format(c2.pay_date,'%Y-%m') as pay_month,c2.department_id,
                            case when c2.avg_month>c1.comp_avg_month then 'higher'
								 when c2.avg_month<c1.comp_avg_month then 'lower'
                                 else 'same' end as comparison
                            from
                            cte1 c1 left join cte2 c2 
                            on c1.pay_date=c2.pay_date
                            order by department_id,month(c2.pay_date);