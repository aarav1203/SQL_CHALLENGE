use sql_challenge;
create table personal_profiles(
profile_id int,
name varchar(30),
followers int);

create table employee_company(
personal_profile_id int,
company_id int);

create table company_pages(
company_id int,
name varchar(50),
followers int);

-- Q100.The LinkedIn Creator team is looking for power creators who use their personal profile as a company
-- or influencer page. This means that if someone's Linkedin page has more followers than all the
-- companies they work for, we can safely assume that person is a Power Creator. Keep in mind that if a
-- person works at multiple companies, we should take into account the company with the most followers.
-- Write a query to return the IDs of these LinkedIn power creators in ascending order.

select * from personal_profiles;
select * from employee_company;
select * from company_pages;

with cte as(
select ec.personal_profile_id,ec.company_id,cp.name,cp.followers as company_followers
from employee_company ec left join company_pages cp
on ec.company_id=cp.company_id)
select profile_id from personal_profiles p
where followers>(select max(company_followers) from cte where personal_profile_id=p.profile_id group by personal_profile_id)
order by profile_id;