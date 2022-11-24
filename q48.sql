use sql_challenge;
create table books(
book_id int,
name varchar(30),
available_from date,
primary key(book_id)
);
create table orders3(
order_id int,
book_id int,
quantity int,
dispatch_date date,
primary key(order_id),
foreign key(book_id) references books(book_id)
);
select * from books;
-- Q48. Write an SQL query that reports the books that have sold less than 10 copies in the last year,
-- excluding books that have been available for less than one month from today. Assume today is
-- 2019-06-23.

-- INSUFFICIENT DATA ORDERS TABLE DATA IS NOT GIVEN