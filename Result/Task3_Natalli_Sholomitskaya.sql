/*2*/
select d.department_name, e.salary, j.job_title, l.city
from (((departments d
inner join employees e on e.department_id = d.department_id)
inner join jobs j  on e.job_id=j.job_id)
inner join locations l on d.location_id = l.location_id)
order by l.city;

/*4*/
select d.department_name, d.location_id, count(e.employee_id)
from departments d
left join employees e on d.department_id = e.department_id
group by d.department_name, d.location_id;

/*6*/
select jh.department_id, min(j.min_salary), max(j.max_salary)
from job_history jh 
inner join jobs j on jh.job_id=j.job_id 
group by jh.department_id;

/*7*/
select d.department_id, d.department_name, l.city
from departments d
inner join locations l on d.location_id = l.location_id 
where d.manager_id is null;

/*8 - a*/
select d.department_id, d.department_name, count(e.employee_id) as count_empl
from departments d 
inner join employees e on d.department_id = e.department_id 
group by d.department_id
order by count_empl  desc
limit 1; 

/*8 - b*/
select d.department_id, d.department_name, count(e.employee_id) as count_empl
from departments d 
inner join employees e on d.department_id = e.department_id 
group by d.department_id
order by count_empl
limit 1; 

/*8 - c*/
select d.department_id, d.department_name, count(e.employee_id) as count_empl
from departments d 
inner join employees e on d.department_id = e.department_id 
group by d.department_id
having count(e.first_name) < 3
order by count_empl;

/*10*/
select c.country_name, count(l.location_id) as cnt_loc
from countries c 
inner join locations l on c.country_id = l.country_id 
group by c.country_name;




  

