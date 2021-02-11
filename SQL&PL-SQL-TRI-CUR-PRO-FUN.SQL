1) Display number of employees joined after 15th of the month.

select count(employee_id) from njct_a_employees where extract(day from hire_date) >  15;
--NOT SURE


2) Display the country ID and number of cities we have in the country.

select country_id,count(city) from njct_a_locations group by country_id;
--NOT SURE CUZ SUPPOSE THE WE HAVE COUNTRY CODE BUT NO EMPLOYEE FROM THAT COUNTRY CITY
--    \_(*.*)_/


3) Display average salary of employees in each department who have commission percentage.

select department_id,avg(salary) from njct_a_employees
where COMMISSION_PCT is not NULL
group by department_id;
/*SELECT AVG(SALARY),DEPARTMENT_NAME FROM EMPLOYEES
WHERE COMMISSION_PCT = '&COMMISSION_PCT'--COMMISION PERCENT
GROUP BY DEPARTMENT_ID;*/


4) Display job ID, number of employees, sum of salary,\
and difference between highest salary
and lowest salary of the employees of the job.

select job_id,count(job_id) as Employee,
sum(salary) as sumsalary,max(salary)-min(salary) as difference 
from njct_a_employees group by job_id;
/*
---NOT TRIED BUT MAY BE 100%  RIGHT?? :(
--BY INNER JOIN

SELECT J.JOB_ID,COUNT(E.EMPLOYEE_ID),SUM(E.SALARY),J.MAX_SALARY-J.MIN_SALARY 
FROM JOBS J 
INNER JOIN EMPLOYEE E ON J.JOB_ID = E.JOB_ID 
GROUP BY JOB_ID;
--WITHOUT JOIN
SELECT J.JOB_ID,COUNT(E.EMPLOYEE_ID),SUM(E.SALARY),J.MAX_SALARY-J.MIN_SALARY 
FROM JOBS J,EMPLOYEE E
WHERE J.JOB_ID = E.JOB_ID
GROUP BY JOB_ID;
*/


5) Display job ID for jobs with average salary more than 10000.

SELECT J.JOB_ID,AVG(E.SALARY) FROM njct_a_JOBS J
JOIN njct_a_EMPLOYEEs E ON J.JOB_ID = E.JOB_ID
GROUP BY e.JOB_ID
having AVG(SALARY)>10000;



6) Display years in which more than 10 employees joined.
--EXACTLY REQUIRED QUERY
SELECT EXTRACT(YEAR FROM HIRE_DATE) AS RequiredYear,COUNT(HIRE_DATE)
FROM njct_a_EMPLOYEES
GROUP BY EXTRACT(YEAR FROM HIRE_DATE)
HAVING COUNT(HIRE_DATE) > 10;

/*
---(*-*)TRIAL :)
SELECT EXTRACT(YEAR FROM HIRE_DATE) AS YEAR,COUNT(HIRE_DATE) AS 'EMPLOYEE_HIRED' FROM EMPLOYEES
WHERE COUNT(HIRE_DATE) > 10
GROUP BY HIRE_DATE; 

SELECT DATEDIFF(HIRE_DATE,SYSDATE) FROM EMPLOYEES;

DESC EMPLOYEES;

SELECT * FROM EMPLOYEES WHERE DATEDIFF(HIRE_DATE,SYSDATE) > 1;

SELECT COUNT(HIRE_DATE),EXTRACT(YEAR FROM HIRE_DATE) FROM EMPLOYEES GROUP BY EXTRACT(YEAR FROM HIRE_DATE);

*/

7) Display departments in which more than five employees have commission percentage.
SELECT department_id,DEPARTMENT_NAME FROM njct_a_DEPARTMENTS
WHERE DEPARTMENT_ID IN (
SELECT DEPARTMENT_ID FROM njct_a_EMPLOYEES 
GROUP BY DEPARTMENT_ID
HAVING COUNT(COMMISSION_PCT) > 5);

/*
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID
    HAVING COUNT(COMMISSION_PCT) > 5);
*/


8) Display employee ID for employees who did more than one job in the past.

SELECT EMPLOYEE_ID from njct_a_JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(EMPLOYEE_ID) > 1;
/*
SELECT EMPLOYEE_ID from JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(EMPLOYEE_ID) > 1;
*/


9) Display job ID of jobs that were done by more than 3 employees for more than 100 days.

select job_id from njct_a_employees 
where TO_DATE(HIRE_DATE,'YYYY-MM-DD')-TO_DATE(SYSDATE,'YYYY-MM-DD') > 100
group by job_id
having count(job_id) > 3;
/*
select TO_CHAR(sysdate,'DDD') from dual;
SELECT TO_DATE(HIRE_DATE, 'YYYY-MM-DD') -  TO_DATE(SYSDATE, 'YYYY-MM-DD') DateDiff FROM njct_a_employees;
*/


10) Display department ID, year, and Number of employees joined.

SELECT DEPARTMENT_ID,EXTRACT(YEAR FROM HIRE_DATE) AS Y_E_A_R,COUNT(EMPLOYEE_ID) AS NO_OF_EMPLOYEE FROM njct_a_EMPLOYEEs 
GROUP BY EXTRACT(YEAR FROM HIRE_DATE),DEPARTMENT_ID
order by DEPARTMENT_ID;
/*SELECT DEPARTMENT_ID,EXTRACT(YEAR FROM HIRE_DATE) AS 'YEAR',COUNT(EMPLOYEE_ID) AS 'NO OF EMPLOYEE'
FROM EMPLOYEE 
GROUP BY EXTRACT(YEAR FROM HIRE_DATE);
*/


11) Display departments where any manager is managing more than 5 employees.

select manager_id, count(manager_id) as underEmployee from njct_a_employees
group by manager_id
having count(manager_id) > 5;

/*
SELECT DEPARTMENT_NAME FROM DEPARTMENT1
WHERE DEPARTMENT_ID = (
SELECT DEPARTMENT_ID FROM EMPLOYEE
GROUP BY MANAGER_ID
HAVING COUNT(MANAGER_ID) > 5
);
*/

12) Display department name, manager name, and city.
/*
DEPARTMENTS -> DEPARTMENT_NAME,MANAGER_ID;
EMPLOYEES -> MANAGER_NAME;
LOCATIONS -> CITY;
*/

select d.department_name,e.first_name,l.city from njct_a_departments d
join njct_a_employees e on d.department_id = e.department_id
join njct_a_locations l on d.location_id = l.location_id;

13) Display country name, city, and department name.

select cn.country_name,l.city,d.department_name from njct_a_locations l
join njct_a_countries cn on l.country_id = cn.country_id
join njct_a_departments d on l.location_id = d.location_id;


14) Display job title, department name, employee last name, starting date for all jobs from 2000 to 2005.

select j.job_title,d.department_name,e.last_name from njct_a_job_history jh
join njct_a_jobs j on jh.job_id = j.job_id
join njct_a_employees e on jh.employee_id = e.employee_id
join njct_a_departments d on jh.department_id = d.department_id
where extract(year from jh.start_date) between 2000 and 2005;

insert into NJCT_A_JOB_HISTORY values(116,'19-mar-2001','18-mar-2003',21,502);

insert into NJCT_A_JOB_HISTORY values(115,'19-mar-1999','18-mar-2001',31,801);
select * from NJCT_A_JOB_HISTORY;


15) Display job title and average salary of employees

select jt.job_title,temp.avgsalary from njct_a_jobs jt
join ( select e.job_id,avg(e.salary) avgsalary from njct_a_jobs j
join njct_a_employees e on e.job_id = j.job_id
group by e.job_id) temp on jt.job_id = temp.job_id;


16) Display details of jobs that were done by any employee who is currently drawing more than 15000 of salary.

select distinct j.job_id,j.job_title from njct_a_jobs j
join njct_a_employees e on j.job_id = e.job_id
where e.salary > 15000;

17) Display department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.

select d.department_name,temp.first_name,temp.salary from njct_a_departments d
join (select distinct m.department_id,m.first_name,m.salary from njct_a_employees m
join njct_a_employees e on e.manager_id = m.employee_id
where (extract(year from sysdate)-extract(year from m.hire_date))>5) temp
on d.department_id = temp.department_id;
/*
select distinct m.first_name,m.salary from njct_a_employees m
join njct_a_employees e on e.manager_id = m.employee_id
where (extract(year from sysdate)-extract(year from m.hire_date))>5;

*/


18) Display employee name, job title for the jobs employee did in the past where the job was done less than six months.

select e.first_name,j.job_title from njct_a_employees e
join (select m.employee_id,m.job_id from njct_a_job_history m
join njct_a_job_history y on extract(year from m.start_date) = extract(year from y.end_date) and m.employee_id = y.employee_id
where (extract(month from m.end_date)-extract(month from m.start_date))<6) temp
on e.employee_id = temp.employee_id
join njct_a_jobs j on temp.job_id = j.job_id;


19) Display department name, average salary and number of employees with commission within the department.

select d.department_name,temp.avgsalary,temp.comm_count from njct_a_departments d
join (select department_id,avg(salary) avgsalary,count(commission_pct) comm_count from njct_a_employees 
group by department_id) temp
on temp.department_id = d.department_id;



20) Display the month in which more than 5 employees joined in any department located in Sydney.

select loc.month from njct_a_locations l
join (select temp.month,d.location_id from njct_a_departments d
join (select department_id,extract(month from hire_date) month from njct_a_employees
group by extract(year from hire_date),extract(month from hire_date),department_id
having count(extract(month from hire_date)) > 5) temp
on d.department_id = temp.department_id) loc
on l.location_id = loc.location_id
where city like 'sydeny';

/*	this query dives the department_id
select department_id,count(extract(month from hire_date)),extract(month from hire_date),extract(year from hire_date) from njct_a_employees
group by extract(year from hire_date),extract(month from hire_date),department_id
having count(extract(month from hire_date)) > 1;
*/

/*	this query will give loactions 
select location_id from njct_a_departments d
join (select department_id from njct_a_employees
group by extract(year from hire_date),extract(month from hire_date),department_id
having count(extract(month from hire_date)) > 1) temp
on d.department_id = temp.department_id;
*/

/*
select city from njct_a_locations l
join (select location_id from njct_a_departments d
join (select department_id from njct_a_employees
group by extract(year from hire_date),extract(month from hire_date),department_id
having count(extract(month from hire_date)) > 1) temp
on d.department_id = temp.department_id) loc
on l.location_id = loc.location_id
where city like 'sydeny';
*/


21) Display details of departments in which the maximum salary is more than 10000.

select d.department_id,d.department_name from njct_a_departments d
join (select distinct department_id from njct_a_employees
where job_id in (select job_id from njct_a_jobs
where max_salary > 10000)) temp
on d.department_id = temp.department_id;



22) Display jobs into which employees joined in the current year.

select j.job_id,job_title from njct_a_jobs j
join (select job_id from njct_a_employees
where extract(year from hire_date) = extract(year from sysdate)) ji
on j.job_id = ji.job_id;



23) Display employees who did not do any job in the past.

select employee_id,first_name,last_name from njct_a_employees
where employee_id not in(select employee_id from njct_a_job_history);

24) Display job title and average salary for employees who did a job in the past.

select job_title,temp.avg_salary from njct_a_jobs j
join (select job_id,avg(salary) avg_salary from njct_a_employees
where employee_id in (select employee_id from njct_a_job_history)
group by job_id) temp
on j.job_id = temp.job_id;
/*
select job_id,avg(salary) from njct_a_employees
group by job_id;
*/


25) Display country name, city, and number of departments where department has more than 5 employees.

select c.country_name,temp1.city,temp1.no_of_dept from njct_a_countries c
join (select l.location_id,l.city,l.country_id,temp.no_of_dept from njct_a_locations l
join (select location_id,count(location_id) no_of_dept from njct_a_departments d 
join (select department_id from njct_a_employees
group by department_id
having count(department_id) > 3) ed
on d.department_id = ed. department_id
group by location_id) temp
on temp.location_id = l.location_id) temp1
on c.country_id = temp1.country_id;
/*
select location_id,count(location_id) no_of_dept from njct_a_departments d
join (select department_id from njct_a_employees
group by department_id
having count(department_id) > 3) ed
on d.department_id = ed. department_id
group by location_id;
*/




26) Display details of manager who manages more than 5 employees.

select det.employee_id manager,det.first_name,det.last_name,temp.no_of_emp from njct_a_employees det
join (select m.employee_id,count(m.employee_id) no_of_emp from njct_a_employees m
join njct_a_employees e on m.employee_id = e.manager_id
group by m.employee_id
having count(m.employee_id) > 5) temp
on det.employee_id = temp.employee_id;

27) Display the departments into which no employee joined in last two years.

select * from njct_a_departments
where department_id not in(select distinct department_id from njct_a_employees
where (extract(year from sysdate)-extract(year from hire_date)) < 2);


28) Display the details of departments in which the max salary is greater than 10000 for employees who did a job in the past.

select * from njct_a_departments d
join (select jh.department_id from njct_a_jobs j
join njct_a_job_history jh
on jh.job_id = j.job_id
where max_salary > 10000) temp
on d.department_id = temp.department_id;

29) Display third highest salary of all employees

select min(salary)
from (select distinct salary from njct_a_employees
where rownum < 4
order by salary desc);

1) Find out the name of the employee and name of the department for the employee who is
managing for employee 103.

declare

v_eid njct_a_employees.employee_id%type;
v_fn njct_a_employees.first_name%type;
v_did njct_a_employees.department_id%type;
v_dn njct_a_departments.department_name%type;

begin

v_eid := &v_eid;

select e.first_name,e.department_id into v_fn,v_did from njct_a_employees e
join njct_a_employees m on e.employee_id = m.manager_id
where m.employee_id = v_eid;

select department_name into v_dn from njct_a_departments where department_id = v_did;

dbms_output.put_line('Manager Name :- '|| v_fn);
dbms_output.put_line('Department Name :- '|| v_dn);

end;


2) Display the year in which maximum number of employees joined along with how many joined in each month in that year.

declare
v_max_count number;
v_year number;
v_month number;
v_count number;

cursor curmonthwise(v_month_year number)
is select extract(month from hire_date),count(extract(month from hire_date)) from njct_a_employees
where extract(year from hire_date) = v_month_year
group by extract(month from hire_date);

begin

select max(count(extract(year from hire_date))) into v_max_count from njct_a_employees
group by extract(year from hire_date);

select extract(year from hire_date) into v_year from njct_a_employees
group by extract(year from hire_date)
having count(extract(year from hire_date)) = v_max_count;

dbms_output.put_line('Year : '||v_year);
dbms_output.put_line('No. of Employee Joined : '||v_max_count);

open curmonthwise(v_year);
loop
fetch curmonthwise into v_month,v_count;

dbms_output.put_line('MONTH : '||v_month||' No of Employee Hired : '||v_count);

exit when curmonthwise%NOTFOUND;
end loop;

close curmonthwise;
exception 
when invalid_cursor then
dbms_output.put_line('Cursor is invalid, kindly contact the administrator');
end;

3) Change salary of employee 130 to the salary of the employee with first name ‘Joe’. If Joe is
not found then take average salary of all employees. If more than one employee with first 
name ‘Joe’ is found then take the least salary of the employees with first name Joe. [Use
Exceptions] 

3) Change salary of employee 130 to the salary of the employee with first name ‘Joe’. If Joe is
not found then take average salary of all employees. If more than one employee with first 
name ‘Joe’ is found then take the least salary of the employees with first name Joe. [Use
Exceptions]
/*
salary of 130 to the fn->joe
if joe is notfound 
then 
salary of 130 = avg(salary)
else if more than one joe is found the min(salary of joe);
*/
declare 

v_salary njct_a_employees.salary%TYPE;

begin

select salary into v_salary from njct_a_employees where first_name like 'Joe';
update njct_a_employees set salary = v_salary where employee_id = 130;
dbms_output.put_line('Salary Updated Successfully');

exception
when no_data_found then
  select avg(salary) into v_salary from njct_a_employees;
  update njct_a_employees set salary = v_salary where employee_id = 130;
  dbms_output.put_line('Salary Updated Successfully');
when too_many_rows then
  select min(salary) into v_salary from njct_a_employees where first_name like 'Joe';
  update njct_a_employees set salary = v_salary where employee_id = 130;
  dbms_output.put_line('Salary Updated Successfully');
when others then
  dbms_output.put_line('An error occurred');

end;
/*
select employee_id,first_name,salary from njct_a_employees order by first_name;

select min(salary) from njct_a_employees where first_name like 'C'
group by first_name ;s
*/

4) Display Job Title and Name of the Employee who joined the job first day. 
/*
select job_title,first_name from njct_a_jobs j
join njct_a_employees e on e.job_id = j.job_id
where TO_DATE(HIRE_DATE,'YYYY-MM-DD')-TO_DATE(SYSDATE,'YYYY-MM-DD')  = 0;
*/
declare
v_firstname njct_a_employees.first_name%TYPE;
v_job_title njct_a_jobs.job_title%TYPE;

cursor cur_first_day
is select job_title,first_name from njct_a_jobs j
join njct_a_employees e on e.job_id = j.job_id
where TO_DATE(HIRE_DATE,'YYYY-MM-DD')-TO_DATE(SYSDATE,'YYYY-MM-DD')  = 0;

begin

open cur_first_day;

if cur_first_day%rowcount = 0 then
dbms_output.put_line('No one have First Day TODAY!!!');
else 
loop
fetch cur_first_day into v_job_title,v_firstname;
exit when cur_first_day%NOTFOUND;
dbms_output.put_line('JOB : '||v_job_title||' Employee Name :'||v_firstname);
end loop;
end if;

close cur_first_day;

exception
when INVALID_CURSOR then --INVALID_CURSOR
dbms_output.put_line('INVALID CURSOR CHECK AGAIN!!');
end;

/*
open cur_first_day;
loop
fetch cur_first_day into v_job_title,v_firstname;
exit when cur_first_day%NOTFOUND;
dbms_output.put_line('JOB : '||v_job_title||' Employee Name :'||v_firstname);
end loop;
close cur_first_day;
exception
when no_data_found then --INVALID_CURSOR
dbms_output.put_line('No one have First Day TODAY!!!');
*/



/*
select * from njct_a_employees;
update njct_a_employees set hire_date = '19-12-20' where employee_id =117;


open cur_first_day;

if cur_first_day%notfound then
dbms_output.put_line('No one have First Day TODAY!!!');
else 
loop
fetch cur_first_day into v_job_title,v_firstname;
exit when cur_first_day%NOTFOUND;
dbms_output.put_line('JOB : '||v_job_title||' Employee Name :'||v_firstname);
end loop;
end if;

close cur_first_day;

exception
when INVALID_CURSOR then --INVALID_CURSOR
dbms_output.put_line('INVALID CURSOR CHECK AGAIN!!');

*/

5) Ensure no changes can be made to EMPLOYEES table before 6am and after 10pm in a day.

SELECT TO_CHAR(CURRENT_DATE, 'HH24') FROM DUAL; 
/*
CREATE OR REPLACE TRIGGER trg_sunday
BEFORE INSERT ON employee
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
    IF TO_CHAR(SYSDATE, 'D') = '1' THEN   ---Should be 1 rather than 7
        RAISE_APPLICATION_ERROR(-20000, 'Cannot insert record on sunday'); 
    END IF;
END;

for sunday
*/

create or replace trigger no_change_on_njct_a_employees
before insert or update or delete on njct_a_employees
for each row
declare
v_time number;
begin

select TO_CHAR(CURRENT_DATE, 'HH24') into v_time from dual;

if (v_time > 6 AND v_time < 22) then
RAISE_APPLICATION_ERROR(-20101, 'DML ALLOW BETWEEN 6AM AND 10PM');
else
dbms_output.put_line('DML DONE SUCCESSFULLY!');
end if;

end;

/*
create or replace trigger no_change_on_njct_a_employees
before insert or update or delete on njct_a_employees
for each row
declare
v_time number;
e_time exception;
begin

select TO_CHAR(CURRENT_DATE, 'HH24') into v_time from dual;

if (v_time > 6 AND v_time < 22) then
raise e_time;
else
dbms_output.put_line('DML is allow this time!!!!');
end if;

EXCEPTION
when e_time then
dbms_output.put_line('DML is not allow this time!!!!');

end;

*/


6) Whenever the job is changed for an employee write the following details into job history.
Employee ID, old job ID, old department ID, hire date of the employee for start date, system
date for end date. But if a row is already present for employee job history then the start date
should be the end date of that row +1.

create or replace trigger TRIGGER_NJCT_A_JOB_HISTORY
after update of job_id
on njct_a_employees
for each row
declare
cursor curtrial
is
select max(end_date) from NJCT_A_JOB_HISTORY where employee_id=:old.employee_id;

v_count number;
v_date date;

begin

select count(employee_id) into v_count from NJCT_A_JOB_HISTORY where employee_id = :old.employee_id;

if (v_count > 0) then
open curtrial;
fetch curtrial into v_date;

insert into njct_a_job_history 
values (:old.employee_id,v_date + 1,sysdate,:old.job_id,:old.department_id);

close curtrial;
dbms_output.put_line('if');

else
insert into njct_a_job_history 
values (:old.employee_id,:old.hire_date,sysdate,:old.job_id,:old.department_id);

dbms_output.put_line('else');
end if;

end;
/*
create or replace trigger trigger_job_history
after update of job_id
on njct_a_employees
for each row
begin

insert into njct_a_job_history 
values (:old.employee_id,:old.hire_date,sysdate,:old.job_id,:old.department_id);

end;

if(employee_id is there in njct_a_job_history) then
start_date = end_date + 1;
end_date = sysdate;
else
insert into njct_a_job_history 
values (:old.employee_id,:old.hire_date,sysdate,:old.job_id,:old.department_id);
end i0f;
*/
/*0000000000000000000*/
create or replace trigger trigger_job_history
after update of job_id
on njct_a_employees
for each row
declare
v_count number;
v_date date;--v_employee_id njct_a_job_history.employee_id%TYPE;
cursor curtrial(v_employee_id number) IS 
select end_date from (select end_date from njct_a_job_history where employee_id = v_employee_id order by end_date desc) where rownum = 1;
begin

select count(employee_id) into v_count from njct_a_job_histroy where employee_id = :old.employee_id;

if (v_count = 0) then
insert into njct_a_job_history 
values (:old.employee_id,:old.hire_date,sysdate,:old.job_id,:old.department_id);
else
--v_employee_id := :old.employee_id;
open curtrial(:old.employee_id);

fetch curtrial into v_date;

insert into njct_a_job_history 
values (:old.employee_id,v_date + 1,sysdate,:old.job_id,:old.department_id);

close curtrial;

end if;

end;
/*0000000000000000000*/


















/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
weekday(start_date,end_date);

create or replace function fnx_week_day_trial(start_date date,last_date date)
return number
is
begin
if (start_date < last_date) then

end if;
end;
/*

COMPARING DATE GRATER AND SMALLER

declare
start_date date;
last_date date;
begin 

start_date := '18-03-01';
last_date := '19-03-03';

if (start_date < last_date) then
dbms_output.put_line('wrong');
else
dbms_output.put_line('right');
end if;

end;
*/
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
-- PROCEDURE THAT GIVES DATE DIFFERENCE OF WEEKDAYS
declare 
start_date date;
last_date date;
v_date date;
v_count number;
begin
start_date := '10-02-21';
last_date := '10-03-21';
if (start_date < last_date) then

v_date := start_date;
v_count := 0;

loop

if(TO_CHAR(v_date,'D') != 1) then
v_count := v_count + 1;
end if;
v_date := (v_date + 1);
exit when v_date = last_date;

end loop;
dbms_output.put_line('No. of WEEK DAYS : '|| v_count);
else
dbms_output.put_line('Check the Dates Again!!!!');
end if;
end;
-- FUNCTION OF ABOVE

/*
SELECT ( SYSDATE + 21 ) FROM DUAL;
*/
create or replace function fnx_week_day_trial(start_date date,last_date date)
return number
is

v_date date;
v_count number;

begin

if (start_date < last_date) then

v_date := start_date;
v_count := 0;

loop

if(TO_CHAR(v_date,'D') != 1) then
v_count := v_count + 1;
end if;
v_date := (v_date + 1);
exit when v_date = last_date;

end loop;
RETURN v_count;
else
RETURN -1;
end if;

end;

SELECT fnx_week_day_trial('10-02-21','10-03-21') FROM DUAL;



--select * from dictionary where TABLE_NAME like '%TRIGG%';
-- SELECT * from USER_TRIGGERS where TABLE_NAME like'';
