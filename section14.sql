use employees;

Alter table departments_dup
drop column dept_manager;

alter table departments_dup
change column dept_no dept_no char(4) null;

alter table departments_dup
change column dept_name dept_name VARCHAR(40) NULL;

Drop table if exists departments_dup;
create table departments_dup
(
	dept_no char(4) null,
    dept_name varchar(40) null
    );
    
    insert into departments_dup
    (
    dept_no,
    dept_name
    )select 
    * 
    from departments;
    
    insert into departments_dup (dept_name)
    values ('Public Relation');
    
    delete from departments_dup
    where 
		dept_no = 'd002';
        
	insert into departments_dup(dept_no)
    values('d010'),('d011');

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

select * from dept_manager_dup
order by dept_no;

select * from departments_dup
order by dept_no;

select m.dept_no, m.emp_no , d.dept_name
from dept_manager_dup m
inner join 
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no ;


select * from employees;
select e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
from employees e
join dept_manager_dup m
on e.emp_no = m.emp_no;

delete from departments_dup
where dept_name = 'Public Relations';

select * from employees;
select * from dept_manager;

select e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from dept_manager m
left join employees e
on m.emp_no = e.emp_no
where last_name =  'Markovitch'
order by dept_no desc, emp_no;

select e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from  employees e
left join dept_manager m
on e.emp_no = m.emp_no
where e.last_name =  'Markovitch'
order by m.dept_no desc, e.emp_no;

select m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
from dept_manager m
inner join employees e on m.emp_no = e.emp_no
order by m.dept_no;

select m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
from dept_manager m
left join employees e on m.emp_no = e.emp_no
order by m.dept_no;

-- join
select 
    m.dept_no, m.emp_no, d.dept_name
    from 
    dept_manager_dup m
    inner join
    departments_dup d on m.dept_no = d.dept_no
    order by m.dept_no;

select 
    m.dept_no, m.emp_no, d.dept_name
    from 
    dept_manager_dup m,
    departments_dup d 
    where  m.dept_no = d.dept_no
    order by m.dept_no;
    
 select m.emp_no, e.first_name, e.last_name, m.deptno,e.hire_date 
 from dept_manager m, employees e 
 where  m.emp_no = e.emp_no
 order by m.emp_no ;
 
 select e.first_name, e.last_name, s.salary
 from employees e
 join salaries s on e.emp_no = s.emp_no
 where s.salary >145000;
 
 
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
    select @@global.sql_mode;
    set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
    
select * from titles;
select e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t 
on e.emp_no = t.emp_no
where e.first_name = 'Margareta' and e.last_name = 'Markovitch'
order by e.emp_no;

select dm.*, d.*
from dept_manager dm
cross join departments d
order by dm.emp_no, d.dept_no;
select dm.*, d.*
from dept_manager dm, departments d
order by dm.emp_no, d.dept_no;

select e.*, d.*
from 
departments d 
cross join
dept_manager dm 
join employees e on dm.emp_no = e.emp_no;

select dm.*, d.*
from departments d cross join dept_manager dm
where d.dept_no = 'd009'
order by d.dept_name;


select e.*, d.*
 from employees e cross join
 departments d 
 where e.emp_no <10011
 order by e.emp_no asc, d.dept_name;

select
    e.gender, avg(s.salary)  as average_salary
    from employees e
    join salaries s on e.emp_no = s.emp_no
    group by gender;
    
select 
      e.first_name,
      e.last_name,
      e.hire_date,
      m.from_date,
      d.dept_name
      from departments d
      join dept_manager m on d.dept_no = m.dept_no
      join employees e on m.emp_no = e.emp_no;
      
      select * from departments;
      select emp_no, count(emp_no) from titles
      group by emp_no
      order by emp_no;
      
      select * from titles
      where emp_no = 10142;
      
      SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    m.to_date,
    d.dept_name
FROM
    employees e
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
        INNER JOIN
    dept_manager m ON e.emp_no = m.emp_no
        INNER JOIN
    departments d ON m.dept_no = d.dept_no
    where t.title = 'manager'
    order by e.emp_no;
    
    
    SELECT

    e.first_name,

    e.last_name,

    e.hire_date,

    t.title,

    m.from_date,

    d.dept_name

FROM

    employees e

        JOIN

    dept_manager m ON e.emp_no = m.emp_no

        JOIN

    departments d ON m.dept_no = d.dept_no

        JOIN

    titles t ON e.emp_no = t.emp_no
    
    order by first_name asc;
           


select * from dept_manager;

select
    e.*, m.*, d.*
FROM

    employees e

        JOIN

    dept_manager m ON e.emp_no = m.emp_no

        JOIN

    departments d ON m.dept_no = d.dept_no;
    
    
    select e.*, t.*
from 
    employees e
     join titles t ON e.emp_no = t.emp_no;

select d.dept_name, avg(salary) as average_salary
from departments d
join dept_manager m on d.dept_no = m.dept_no
join salaries s on m.emp_no = s.emp_no
group by dept_name
having average_salary >60000
order by average_salary desc;

select gender, count(m.emp_no) as number_of_managers
from employees e
INNER JOIN dept_manager m 
on e.emp_no = m.emp_no
group by gender;

SELECT

    e.gender, COUNT(dm.emp_no)

FROM

    employees e

        JOIN

    dept_manager dm ON e.emp_no = dm.emp_no

GROUP BY gender;

-- create employees_dup
create table employees_dup(
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M' , 'F'),
hire_date date
);
insert into employees_dup
select e.* from employees e
limit 20;

select * from employees_dup
order by emp_no;

-- insert a dplicate of the first row
insert into employees_dup value
('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

-- union vs union all
select 
     e.emp_no,
     e.first_name,
     e.last_name,
     null as dept_no,
     null as from_date
from employees_dup e
where e.emp_no =10001
union all select 
     null as emp_no,
     null as first_name,
     null as last_name,
     m.dept_no,
     m.from_Date
from dept_manager m;


SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no desc;


# select the first and last name from the "employees"
#emploee numbers that can be found inthe department manaer table

select e.first_name, e.last_name
from employees e
where e.emp_no in(select m.emp_no
from dept_manager m);

SELECT

    *

FROM

    dept_manager d

WHERE

    d.emp_no IN (SELECT

            e.emp_no

        FROM

            employees e

        WHERE

            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
insert into emp_manager
select u.*
from( select A.* from (       
     select 
     e.emp_no as employee_ID,
     MIN(de.dept_no) as department_code,
     (select emp_no
        from dept_manager
        where emp_no = 110022) as manager_ID 
	from employees e
    join 
    dept_emp de on e.emp_no = de.emp_no
    where e.emp_no <= 10020
    group by e.emp_no
    order by e.emp_no) as A
    union
select B.* from (       
     select 
     e.emp_no as employee_ID,
     MIN(de.dept_no) as department_code,
     (select emp_no
        from dept_manager
        where emp_no = 110039) as manager_ID 
	from employees e
    join 
    dept_emp de on e.emp_no = de.emp_no
    where e.emp_no > 10020
    group by e.emp_no
    order by e.emp_no
    limit 20) as B
    union
    select c.* from(
    select e.emp_no as employee_ID,
    min(de.dept_no) as department_code,
    (select emp_no from dept_manager
    where emp_no = 110039) as manager_id
    from employees e
    join 
    dept_emp de on e.emp_no = de.emp_no
    where e.emp_no =110022
    group by e.emp_no )as c union
    select d.* from (
    select e.emp_no as amployee_ID,
    min(de.dept_no) as department_code,
    (select emp_no from dept_manager
    where emp_no = 110022) as manager_id
    from employees e
    join dept_emp de on e.emp_no = de.emp_no
    where e.emp_no =110039
    group by e.emp_no) as d) as u;
    
    

select * from dept_emp;
drop table if exists emp_manager;
create table emp_manager(
emp_no int(11) not null,
dept_no char(4) null,
manager_no int(11) not null
);
-- exercise 2: subquries nested in select and from

select * from emp_manager
order by emp_manager.emp_no;
