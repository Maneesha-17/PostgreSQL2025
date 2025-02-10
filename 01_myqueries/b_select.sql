select * from employees;

select distinct department from employees;

 department 
------------
 Finance
 HR
 Tech
 
select * from employees limit 2; 

id | first_name | last_name | age | department 
----+------------+-----------+-----+------------
  1 | Alice      | Smith     |  29 | HR
  2 | Bob        | Johnson   |  35 | Tech

ALTER TABLE employees ADD COLUMN dept_id INT;

UPDATE employees SET dept_id = 1 WHERE department = 'HR';
UPDATE employees SET dept_id = 2 WHERE department = 'Tech';

select first_name, last_name, age from employees where age >= 30;
select * from employees where age >= 30 and department = 'HR';
select * from employees where age >= 30 or department = 'HR';
SELECT first_name, last_name FROM employees WHERE department IN ('HR', 'Finance');
SELECT first_name, last_name FROM employees WHERE first_name LIKE '%d';
SELECT first_name, last_name FROM employees WHERE age BETWEEN 30 AND 35; --includes both