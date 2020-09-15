use employees;

SELECT 
    first_name, last_name
FROM
    employees;

    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' and  first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND (gender = 'M' or gender = 'F');
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan';
        
	-- using a professional way 
    -- IN structural is a faster way than a OR structue
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark' , 'Jacob');

    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mark%');
    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_') ;
    

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%') ;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name not LIKE ('%Jack%') ;
    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
    

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;


SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL; -- if there is no first name is null, database is well organized.
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark';

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' and hire_date >= '2000-01-01';

SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    

SELECT DISTINCT
    gender
FROM
    employees;
    
select distinct hire_date
from employees;
use employees;

select count(distinct first_name)
from employees;

select count(*)
from salaries
where salary >= 100000;

select count(*)
from dept_manager;

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name;


SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

select first_name
from employees
group by first_name;

select distinct first_name 
from employees;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;


select 
	first_name, count(first_name) as names_count
    from employees
    group by first_name
    having count(first_name)>250
    order by first_name;
    
select * from salaries
group by emp_no;

select *, avg(salary) as average_salary
from salaries
group by emp_no
having avg(salary)>120000
order by emp_no;

select *, avg(salary) from salaries
where salary >120000
group by emp_no
order by emp_no;













    

    
    
    
    
    
    
