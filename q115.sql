use sql_challenge;
create table student3(
id int,
name varchar(30),
marks int);
insert into student3 values(1,'Ashley',81);
insert into student3 values(2,'Samantha',75);
insert into student3 values(4,'Julia',76);
insert into student3 values(3,'Belvet',84);
select * from student3;

-- Q115.Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by
-- the last three characters of each name. If two or more students both have names ending in the same
-- last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

select name from student3
where marks>75 
order by substring(name,-3,3) ,id;
