use sql_challenge;
create table student4(
student_id int,
student_name varchar(30),
primary key(student_id));
create table exam(
exam_id int,
student_id int,
score int,
primary key(exam_id, student_id));

-- Q134.A quiet student is the one who took at least one exam and did not score the high or the low score.
-- Write an SQL query to report the students (student_id, student_name) being quiet in all exams. Do not
-- return the student who has never taken any exam.Return the result table ordered by student_id.

select * from student4;
select * from exam;

with cte1 as(
select exam_id,max(score) as max_score,min(score) as min_score
from exam group by exam_id
),cte2 as(
select distinct e.student_id,s.student_name,e.exam_id,e.score,c.min_score ,c.max_score
from exam e left join student4 s
on e.student_id=s.student_id left join cte1 c on c.exam_id=e.exam_id
)
select student_id,student_name
from cte2 c where score <>min_score and score<>max_score
group by student_id having count(student_id)=(select count(student_id) from exam where c.student_id=student_id group by student_id)
