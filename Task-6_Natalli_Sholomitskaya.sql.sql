 /*1. Получить уровень зарплаты каждого сотрудника: меньше 5000 считается Low, больше или равно 5000 и меньше 10000 считается Normal, больше или равно 10000 считается High.*/
 SELECT FIRST_NAME,
       SALARY,
       CASE
           WHEN SALARY < 5000 THEN 'Low'
           WHEN SALARY >= 5000 AND SALARY < 10000 THEN 'Normal'
           WHEN SALARY >= 10000 THEN 'High'
           ELSE 'Unknown'
       END
       LEVEL_SALARY 
  FROM EMPLOYEES e 
ORDER BY SALARY;
 
/*2. Для каждой страны показать регион в котором он находится*/
  SELECT COUNTRY_NAME,
       DECODE (REGION_ID,
               1, 'Europe',
               2, 'America',
               3, 'Asia',
               4, 'Africa',
               'Unknown')
           REGION
  FROM COUNTRIES c;
 
/*3. Получить количество сотрудников, которых приняли на работу в каждый день недели.*/
SELECT TO_CHAR (HIRE_DATE, 'Day') day, COUNT (*) AS count_employees
FROM EMPLOYEES e 
GROUP BY TO_CHAR (HIRE_DATE, 'Day')
ORDER BY 2;

/*4. Получить список всех сотрудников которые приши на работу в феврале 2007го года.*/
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES e 
WHERE to_char(HIRE_DATE,'MM.YYYY') = '02.2007'; 

/*5. Получить список работников с увеличенными зарплатами на 20%.*/
SELECT FIRST_NAME, LAST_NAME, TO_CHAR (SALARY + SALARY * 0.20) new_salary
FROM EMPLOYEES e;

/*6. Получить список всех сотрудников заменив в значении PHONE_NUMBER все '.' на '-'*/
SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER, REPLACE (PHONE_NUMBER, '.', '-') new_phone_number
FROM EMPLOYEES e;

/*7. Получить список сотрудников: имя, фамилия, дата приема на работу, текущая дата.*/
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, SYSDATE
FROM EMPLOYEES e;

/*8. Получить первое 3х значное число телефонного номера сотрудника если его номер в формате ХХХ.ХХХ.ХХХХ*/
SELECT PHONE_NUMBER, SUBSTR (PHONE_NUMBER, 1, 3) new_phone_number
FROM EMPLOYEES e 
WHERE PHONE_NUMBER LIKE '___.___.____';

/*9. Получить список всех сотрудников у которых длина имени больше 10 букв*/
SELECT *
FROM EMPLOYEES e
WHERE LENGTH (FIRST_NAME) > 10;

/*10. Получить список всех сотрудников у которых в имени есть буква 'b'.*/
SELECT *
FROM EMPLOYEES e 
WHERE INSTR (LOWER (FIRST_NAME), 'b') > 0;

/*11. Получить список всех сотрудников зарплата которых кратна 1000*/
SELECT FIRST_NAME,  LAST_NAME, SALARY 
FROM EMPLOYEES e
WHERE MOD (SALARY, 1000) = 0
ORDER BY SALARY;

/*12. Получить список всех сотрудников которые работают в компании больше 20 лет*/
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE 
FROM EMPLOYEES e 
WHERE MONTHS_BETWEEN (SYSDATE, HIRE_DATE) / 12 > 20;

/*13. Получить список сотрудников, которые получают комиссионную надбавку, иначе указать значение 0.*/
SELECT FIRST_NAME, LAST_NAME, COALESCE(COMMISSION_PCT, 0) AS without_commission
FROM EMPLOYEES e
ORDER BY 3 desc;

/*14. Максимальная зарплата (среди отделов, где средняя зарплата более 15000)*/
SELECT MAX(SALARY) AS max_salary, FIRST_NAME, LAST_NAME  
FROM EMPLOYEES e
GROUP BY FIRST_NAME, LAST_NAME 
HAVING avg(SALARY) > 15000
ORDER BY 1;

/*15. Создать колонку, которая включает в себя имя сотрудника и его зарплату*/
SELECT CONCAT(FIRST_NAME, SALARY) AS new_field FROM EMPLOYEES e ;

/*16. Получить список всех сотрудников у которых длина имени больше 10 букв*/
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE LENGTH (FIRST_NAME) > 10;

/*17. Получить список всех сотрудников у которых в имени содержатся минимум 2 буквы 'a'*/
SELECT FIRST_NAME, EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE INSTR (LOWER (first_name), 'a', 1, 2) > 0;

/*18. Получить имена сотрудников без первой и последней буквы в имени*/
SELECT FIRST_NAME , SUBSTR (FIRST_NAME , 2, LENGTH (FIRST_NAME) - 2) AS short_name
FROM employees;

/*19. Получить список всех сотрудников которые пришли на работу в первый день июля*/
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE 
FROM EMPLOYEES e 
WHERE TO_CHAR (HIRE_DATE , 'MM/DD') = '07/01';

/*20. Получить минимальную зарплату из всех сотрудников job_id которыз заканчивается на слово 'CLERK'.*/
SELECT MIN(SALARY) as min_salary, JOB_ID
FROM EMPLOYEES e
having SUBSTR (JOB_ID, -5) = 'CLERK'
GROUP BY JOB_ID;