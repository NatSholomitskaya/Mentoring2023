/*2*/
select count(last_name)  
from employees e 
where last_name like '%n'



/*9*/
select extract(year from hire_date) as years, count(first_name)  
from employees e 
group by years
order by years;


/*10*/
select count(location_id) as locations, country_id 
from locations l
group by country_id;

select * from regions r ;
select * from jobs j ;
select * from departments d ;
select * from job_history jh ;
select * from employees e ;
select * from locations l 

/*6*/
select jh.department_id, min(j.min_salary), max(j.max_salary)
from job_history jh 
inner join jobs j on jh.job_id=j.job_id 
group by jh.department_id;
/*7*/

select department_id, department_name, location_id 
from departments d
where manager_id is null;



  

