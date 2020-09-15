select emp_no, count(from_date) as num_of_contract
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date) > 1
order by emp_no;


SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;


select * from dept_emp
limit 100;