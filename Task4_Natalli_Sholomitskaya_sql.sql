/*6*/
/*Решение простое*/
select jh.department_id, min(j.min_salary) as min_sal, max(j.max_salary) as max_sal
from job_history jh 
inner join jobs j on jh.job_id=j.job_id 
group by jh.department_id;

/*Решение с подзапросом*/
with slr as (select jh.department_id, min(j.min_salary) as min_sal, max(j.max_salary) as max_sal
from job_history jh 
inner join jobs j on jh.job_id=j.job_id 
group by jh.department_id)
select * from slr;

/*7!!!*/
/*Решение простое*/
select e.department_id, d.department_name, count(*) as emp_cnt from employees e
left join jobs j on e.job_id = j.job_id and j.job_title = 'Sales Representative'
join departments d on e.department_id = d.department_id 
group by e.department_id, d.department_name 
having count(j.job_title) = 0; 


/* Тут я запуталась*/
with sl as (select e.department_id, d.department_name, count(*) as emp_cnt from employees e
left join jobs j on e.job_id = j.job_id and j.job_title = 'Sales Representative'
join departments d on e.department_id = d.department_id 
group by e.department_id, d.department_name)
select * from sl
having count(sl.job_title) = 0;

/*8 - a*/
/*Решение простое*/
select d.department_id, d.department_name, count(e.employee_id) as count_empl
from departments d 
inner join employees e on d.department_id = e.department_id 
group by d.department_id
order by count_empl  desc
limit 1; 

/*Решение с подзапросом*/
with t as (select e.department_id, d.department_name, count(*) as emp_cnt from employees e
join departments d on e.department_id = d.department_id 
group by e.department_id, d.department_name)
select * from t
where emp_cnt = (select max(emp_cnt) from t) 


/*8 - b*/
/*Решение простое*/
select d.department_id, d.department_name, count(e.employee_id) as count_empl
from departments d 
inner join employees e on d.department_id = e.department_id 
group by d.department_id
order by count_empl
limit 1; 

/*Решение с подзапросом*/
with tbl as (select e.department_id, d.department_name, count(*) as emp_cnt from employees e
join departments d on d.department_id = e.department_id 
group by e.department_id, d.department_name
order by emp_cnt)
select tbl.department_id, tbl.department_name, tbl.emp_cnt from tbl
where emp_cnt = (select min(emp_cnt) from tbl);

/*8 - c*/

/*Решение простое*/
select d.department_id, d.department_name, count(e.employee_id) as count_empl
from departments d 
inner join employees e on d.department_id = e.department_id 
group by d.department_id
having count(e.first_name) < 3
order by count_empl;

/*Решение с подзапросом*/
with t as (select d.department_id, d.department_name, count(*) as emp_cnt from departments d
join employees e on e.department_id = d.department_id 
group by d.department_id, d.department_name
order by emp_cnt)
select * from t
where emp_cnt < 3;


  

