use sql_challenge;
create table occupations(
name varchar(30),
occupation varchar(30));

insert into occupations values('Samantha','Doctor');
insert into occupations values('Julia','Actor');
insert into occupations values('Maria','Actor');
insert into occupations values('Meera','Singer');
insert into occupations values('Ashely','Professor');
insert into occupations values('Ketty','Professor');
insert into occupations values('Christeen','Professor');
insert into occupations values('Jane','Actor');
insert into occupations values('Jenny','Doctor');
insert into occupations values('Priya','Singer');

-- 108.(1). Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by
-- the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For
-- example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
-- Query the number of occurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order

-- 1st Query output
select concat(name,'(',substr(occupation,1,1),')') as name
from occupations;

-- 2nd Query Output
with cte as(
select occupation,count(*) as occ_count
from occupations group by occupation)

select concat('There are a total of ',occ_count,' ',occupation,'s') as statement
from cte
order by occ_count;


