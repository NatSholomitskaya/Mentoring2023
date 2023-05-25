/*3*/
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

