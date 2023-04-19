select email, phone_number
from employees
where email is not null and phone_number like '%55'

select distinct job_title 
from jobs
where job_title like '%clerk' /* Не работает, не знаю почему*/

select max_salary 
from jobs
limit 2

select * from employees
where first_name like 'V%'
or last_name like 'V%' and first_name not like 'P%' /* не уверена, что правильно, так как эти 2 условия должны работать как одно*/
order by hire_date

select * from countries
where region_id in (1, 3)
order by region_id

select first_name, last_name, email, hire_date
from employees
where hire_date >= '2003-03-13' and hire_date <= '2004-06-03'
order by email asc


