select * from employees;

select department_id, department_name, manager_id as "MNG"
from departments;

select employee_id, first_name, last_name, phone_number, department_id
from employees;

select first_name, last_name, hire_date, salary, salary + salary * 20 / 100 as "ANNUAL_SAL"
from employees;

select concat(last_name, '  ', first_name) as "FULL_NAME", concat(phone_number, ' - ', email) as "CONTACT_DETAILS"
from employees;

select distinct manager_id
FROM employees;

select concat(last_name, '  ', job_id) as "EMPLOYEE_AND_TITLE"
from employees;

select concat(first_name, ' ', last_name, ' ', salary, ' ', hire_date) as "HD",
first_name as "FN", last_name as "LN", salary as "SAL", hire_date as "HD" 
from employees;

select distinct salary
FROM employees;

select distinct department_id, job_id 
FROM employees;