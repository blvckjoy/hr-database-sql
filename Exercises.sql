--EXERCISES--

--List all employees and their job titles
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    job.job_title
FROM employees AS emp
    JOIN jobs AS job
    ON emp.job_id = job.job_id;

--Find all employees who work in the ‘HR’ department
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    dept.department_name
FROM employees AS emp
    JOIN departments AS dept
    ON emp.department_id = dept.department_id
WHERE dept.department_name = 'HR';

--Show the names and hire dates of employees hired after January 1, 2021
SELECT
    first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date > '2021-01-01';

--List all departments and their locations
SELECT *
FROM departments;

--Display the names and salaries of employees whose salary is above $60,000
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 60000
ORDER BY salary;

--Show each employee’s name, department name, and job title
SELECT
    emp.first_name,
    emp.last_name,
    dept.department_name,
    job.job_title
FROM departments AS dept
    JOIN employees AS emp
    ON dept.department_id = emp.department_id
    JOIN jobs AS job
    ON emp.job_id = job.job_id;

--Find all employees working in the ‘IT’ department along with their job titles
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    job.job_title
FROM departments AS dept
    JOIN employees AS emp
    ON dept.department_id = emp.department_id
    JOIN jobs AS job
    ON emp.job_id = job.job_id
WHERE dept.department_name = 'IT';

--Display the total number of employees in each department
SELECT
    dept.department_name,
    COUNT(emp.employee_id) AS total_employees
FROM employees AS emp
    JOIN departments AS dept
    ON emp.department_id = dept.department_id
GROUP BY dept.department_name;

--Show the highest salary in each department
SELECT
    dept.department_name,
    MAX(emp.salary) AS highest_salary
FROM employees AS emp
    JOIN departments AS dept
    ON emp.department_id = dept.department_id
GROUP BY dept.department_name;

--List all employees, their department, and location, ordered by department name
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    dept.department_name,
    dept.location
FROM employees AS emp
    JOIN departments AS dept
    ON emp.department_id = dept.department_id
ORDER BY dept.department_name;

--Find the average salary for each job title
SELECT
    job.job_title,
    AVG(emp.salary) AS avg_salary
FROM employees emp
    JOIN jobs job
    ON emp.job_id = job.job_id
GROUP BY job.job_title;

--Get a count of employees hired in each year
SELECT
    YEAR(hire_date) AS hire_year,
    COUNT(employee_id) AS employee_count
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--Which departments have more than one employee?
SELECT
    dept.department_name,
    COUNT(emp.employee_id) AS employee_count
FROM employees emp
    JOIN departments dept
    ON emp.department_id = dept.department_id
GROUP BY dept.department_name
HAVING COUNT(emp.employee_id) > 1;

--List employees who are managers (Job Title contains ‘Manager’)
SELECT
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    job.job_title,
    dept.department_name
FROM employees AS emp
    JOIN jobs AS job
    ON emp.job_id = job.job_id
    JOIN departments dept
    ON emp.department_id = dept.department_id
WHERE job.job_title LIKE '%Manager%';

--Find employees whose last name starts with ‘K’
SELECT
    employee_id,
    first_name,
    last_name
FROM employees
WHERE last_name LIKE 'K%';
