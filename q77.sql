use sql_challenge;
create table variables(
name varchar(30),
value int,
primary key(name));

create table expressions(
left_operand varchar(15),
operator enum('<', '>', '='),
right_operand varchar(30),
primary key(left_operand, operator, right_operand) );
insert into variables values('x',66);
insert into variables values('y',77);

-- Q77.Write an SQL query to evaluate the boolean expressions in Expressions table.
-- Return the result table in any order
select * from variables;
select * from expressions;
with cte as(
select name,
		case when name like'x%' then value end as 'x_val',
        case when name like 'y%' then value end as 'y_val'
        from variables),
        cte2 as(
		select left_operand,operator,right_operand,max(x_val) as x_val,max(y_val) as y_val
		from cte v inner join expressions e
		on v.name=e.left_operand or v.name=e.right_operand
		group by left_operand,operator,right_operand)
												select left_operand,operator,right_operand,
                                                case when left_operand='x' and right_operand='y' and operator='<' and x_val<y_val then 'true'
													 when left_operand='x' and right_operand='y' and operator='>' and x_val>y_val then 'true'
													 when left_operand='x' and right_operand='x' and operator='='  and x_val=x_val then 'true' 
                                                     when left_operand='x' and right_operand='y' and operator='='  and x_val=y_val then 'true' 
                                                     when left_operand='y' and right_operand='x' and operator='<' and y_val<x_val then 'true'
													 when left_operand='y' and right_operand='x' and operator='>' and y_val>x_val then 'true'
													 when left_operand='y' and right_operand='y' and operator='='  and y_val=y_val then 'true' 
                                                     when left_operand='y' and right_operand='x' and operator='='  and x_val=y_val then 'true'
                                                     else 'false' end as value
                                                     from cte2;
                                                     
