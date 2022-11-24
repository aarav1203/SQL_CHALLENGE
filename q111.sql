use sql_challenge;
create table company1(
company_code varchar(30),
founder varchar(30));


create table lead_manager(
lead_manager_code varchar(30),
company_code varchar(30));

create table senior_manager(
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

create table manager(
manager_code varchar(30),
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

create table employee10(
employee_code varchar(30),
manager_code varchar(30),
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

insert into company1 values('C1','Monika');
insert into company1 values('C2','Samantha');

insert into lead_manager values('LM1','C1');
insert into lead_manager values('LM2','C2');

insert into senior_manager values('SM1','LM1','C1');
insert into senior_manager values('SM2','LM1','C1');
insert into senior_manager values('SM3','LM2','C2');

insert into manager values('M1','SM1','LM1','C1');
insert into manager values('M2','SM3','LM2','C2');
insert into manager values('M3','SM3','LM2','C2');

insert into employee10 values('E1','M1','SM1','LM1','C1');
insert into employee10 values('E2','M1','SM1','LM1','C1');
insert into employee10 values('E3','M2','SM3','LM2','C2');
insert into employee10 values('E4','M3','SM3','LM2','C2');


-- Q111.Given the table schemas below, write a query to print the company_code, founder name, total number
-- of lead managers, total number of senior managers, total number of managers, and total number of
-- employees. Order your output by ascending company_code.

SELECT C.COMPANY_CODE,
       C.FOUNDER,
  (SELECT COUNT(DISTINCT LEAD_MANAGER_CODE) 
   FROM LEAD_MANAGER L
   WHERE L.COMPANY_CODE = C.COMPANY_CODE) as lead_manager_count,
  (SELECT COUNT(DISTINCT SENIOR_MANAGER_CODE)
   FROM SENIOR_MANAGER S
   WHERE S.COMPANY_CODE = C.COMPANY_CODE) as senior_manager_count,
  (SELECT COUNT(DISTINCT MANAGER_CODE)
   FROM MANAGER M
   WHERE M.COMPANY_CODE = C.COMPANY_CODE) as manager_count,
  (SELECT COUNT(DISTINCT EMPLOYEE_CODE) 
   FROM EMPLOYEE10 E
   WHERE E.COMPANY_CODE = C.COMPANY_CODE)as employee_count
FROM COMPANY1 C
ORDER BY C.COMPANY_CODE ASC;