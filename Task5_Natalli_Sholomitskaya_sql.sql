(select r.region_name,  round(avg(e.salary), 0) as dep_manager_salary_avg
from employees e
join departments d on d.manager_id = e.employee_id
join locations l on d.location_id = l.location_id 
join countries c on l.country_id = c.country_id 
join regions r on c.region_id = r.region_id 
group by r.region_name) dep_manager ;


(select region_name, round(avg(t.salary), 0) as manager_salary_avg
from (select distinct r.region_name, e.employee_id, e.first_name, d.department_id, e.salary
from employees e
join departments d on d.department_id = e.department_id
join employees e2 on e.employee_id = e2.manager_id
join locations l on d.location_id = l.location_id 
join countries c on l.country_id = c.country_id 
join regions r on c.region_id = r.region_id 
where e.employee_id not in (select manager_id from departments d where manager_id is not null)) t
group by region_name) manager;


(SELECT r.region_name, round(avg(e.salary), 0) as worker_salary_avg
FROM employees  e
RIGHT JOIN employees e2 ON e.manager_id = e2.employee_id
join departments d on e.department_id = d.department_id
join locations l on d.location_id =l.location_id 
join countries c on l.country_id = c.country_id 
join regions r on c.region_id = r.region_id
WHERE e2.manager_id is not null
and e.employee_id not in (select manager_id from departments d where manager_id is not null)
group by r.region_name) worker;


select dep_manager.region_name, worker_salary_avg, manager_salary_avg, dep_manager_salary_avg from (select r.region_name,  round(avg(e.salary), 0) as dep_manager_salary_avg
from employees e
join departments d on d.manager_id = e.employee_id
join locations l on d.location_id = l.location_id 
join countries c on l.country_id = c.country_id 
join regions r on c.region_id = r.region_id 
group by r.region_name) dep_manager
join (select region_name, round(avg(t.salary), 0) as manager_salary_avg
from (select distinct r.region_name, e.employee_id, e.first_name, d.department_id, e.salary
from employees e
join departments d on d.department_id = e.department_id
join employees e2 on e.employee_id = e2.manager_id
join locations l on d.location_id = l.location_id 
join countries c on l.country_id = c.country_id 
join regions r on c.region_id = r.region_id 
where e.employee_id not in (select manager_id from departments d where manager_id is not null)) t
group by region_name) manager on dep_manager.region_name = manager.region_name
join (SELECT r.region_name, round(avg(e.salary), 0) as worker_salary_avg
FROM employees  e
RIGHT JOIN employees e2 ON e.manager_id = e2.employee_id
join departments d on e.department_id = d.department_id
join locations l on d.location_id =l.location_id 
join countries c on l.country_id = c.country_id 
join regions r on c.region_id = r.region_id
WHERE e2.manager_id is not null
and e.employee_id not in (select manager_id from departments d where manager_id is not null)
group by r.region_name) worker on manager.region_name = worker.region_name
order by dep_manager.region_name desc;

select j.job_title, e.first_name, e.last_name, e.salary, count(e2.manager_id) as count_emp, round(avg(e2.salary), 0) as avg_sal, round(e.salary/round(avg(e2.salary), 0)*100, 2) as "dev%"  
from employees e 
join jobs j on j.job_id = e.job_id
join employees e2 on e.employee_id = e2.manager_id
group by j.job_title, e.first_name, e.last_name, e.salary
order by e.salary desc;