/* 1 From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.*/

select salesman.name AS "Salesman",
customer.cust_name, customer.city 
from salesman,customer 
where salesman.city=customer.city;

/* 2 From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city. */

select orders.ord_no, orders.purch_amt,
customer.cust_name, customer.city 
from orders, customer 
where orders.purch_amt between 500 and 2000;


/* 5 From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.*/

select a.cust_name as "Customer Name", a.city as "customer city", b.name as "Salesman", b.city as "salesman city", b.commission
from customer a
inner join salesman b
on a.salesman_id=b.salesman_id
where b.commission>.12
and a.city <> b.city;

/* 6 From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.*/

select orders.ord_no, orders.ord_date, orders.purch_amt, customer.cust_name as "Customer Name", customer.grade, salesman.name as "Salesman", salesman.commission
from ((orders
inner join customer on orders.salesman_id=customer.salesman_id)
inner join salesman on customer.salesman_id=salesman.salesman_id);

/* 8 From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.*/

select a.cust_name as "customer name", a.city as "customer city", a.grade, b.name as "salesman", b.city as "salesman city"
from customer a
inner join salesman b on a.salesman_id=b.salesman_id
order by customer_id;

/* 9 From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. */

select a.cust_name, a.city as "customer city", a.grade, b.name as "Salesman", b.city as "salesmancity"
from customer a
inner join salesman b on a.salesman_id=b.salesman_id
where a.grade < 300
order by customer_id;

/* 21 From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.*/

select * from item_mast 
inner join company_mast
on item_mast.pro_com=company_mast.com_id; 

/* 23  From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name.t */

select a.com_name, avg(b.pro_price) 
from company_mast a
inner join  item_mast b
on b.pro_com=a.com_id
group by a.com_name; 

/* 24  From the following tables write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. Return average value and company name*/

select a.com_name, avg(b.pro_price)
from company_mast a
inner join  item_mast b
on b.pro_com=a.com_id
group by a.com_name
having avg(b.pro_price) >= 350; 

/* 26 From the following tables write a SQL query to display all the data of employees including their department*/

select a.dpt_name, a.dpt_allotment, b.emp_idno, b.emp_fname, b.emp_lname
from emp_department a
inner join emp_details b
on a.dpt_code=b.emp_dept;

/* 27 From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.*/

select a.emp_fname, a.emp_lname, b.dpt_name, b.dpt_allotment
from emp_details a
inner join emp_department b
on a.emp_dept=b.dpt_code;

/* 28 From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees. */

select a.dpt_name, a.dpt_allotment, b.emp_fname, b.emp_lname
from emp_department a
inner join emp_details b
on a.dpt_code=b.emp_dept
where a.dpt_allotment > 50000;

/*29  From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.*/

select emp_department.dpt_name
from emp_department
inner join emp_details
on emp_department.dpt_code=emp_details.emp_dept
group by emp_department.dpt_name
having count(*) > 2;

