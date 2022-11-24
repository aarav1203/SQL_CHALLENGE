use sql_challenge;
create table tvprogram(
program_date datetime,
content_id int,
channel varchar(30),
primary key(program_date, content_id)
);
create table content(
content_id varchar(30),
title varchar(30),
kids_content enum('Y','N'),
content_type varchar(30),
primary key(content_id)
);

select * from tvprogram;
select * from content;

-- Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.
-- Return the result table in any order

select c.title
from tvprogram t inner join content c 
on t.content_id=c.content_id
where kids_content='Y' and content_type='Movies' and year(program_date)=2020 and month(program_date)=6;