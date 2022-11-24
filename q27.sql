use sql_challenge;
create table users(
user_id int ,
name varchar(30),
mail varchar(30),
primary key(user_id)
);

-- Q27.Write an SQL query to find the users who have valid emails.
-- A valid e-mail has a prefix name and a domain where:
-- ● The prefix name is a string that may contain letters (upper or lower case), digits, underscore
-- '_', period '.', and/or dash '-'. The prefix name must start with a letter.
-- ● The domain is '@leetcode.com'.
-- Return the result table in any order

select * from Users
    where mail regexp '^[a-zA-Z]+[a-zA-Z0-9_\\./\\-]{0,}@leetcode.com$'
    order by user_id;
