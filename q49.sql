use sql_challenge;
create table enrollments(
student_id int,
course_id int,
grade int,
primary key(student_id,course_id)
);

select * from enrollments;

--  Q49.Write a SQL query to find the highest grade with its corresponding course for each student. In case of
-- a tie, you should find the course with the smallest course_id.
-- Return the result table ordered by student_id in ascending order.
select student_id,course_id,grade from(
select *,rank() over(partition by student_id order by grade desc,course_id) rn 
from enrollments)a
where rn=1
order by student_id;