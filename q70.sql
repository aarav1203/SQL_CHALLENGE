use sql_challenge;
create table students2(
student_id int,
student_name varchar(30),
primary key(student_id));

create table subjects(
subject_name varchar(30),
primary key(subject_name));

create table examinations(
student_id int,
subject_name varchar(30)
);
select * from students2;
select * from subjects;
select * from examinations;

-- Q70.Write an SQL query to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.

with student_subject as (
SELECT
    student_id,
    student_name,
    subject_name
FROM Students2, Subjects
ORDER BY 1
), student_exam as (
SELECT
    student_id,
    subject_name,
    COUNT(*) as attended_exams
FROM Examinations
GROUP BY 1, 2 
ORDER BY 1
) 
SELECT
    ss.student_id,
    ss.student_name,
    ss.subject_name,
    IFNULL(se.attended_exams,0) as attended_exams
FROM student_subject as ss LEFT JOIN student_exam as se
ON ss.student_id = se.student_id
AND ss.subject_name = se.subject_name
ORDER BY 1, 3;


