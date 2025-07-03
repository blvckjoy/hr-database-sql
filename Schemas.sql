--CREATE THE SCHEMAS

DROP TABLE IF EXISTS employees
GO
DROP TABLE IF EXISTS departments
GO
DROP TABLE IF EXISTS jobs
GO

CREATE TABLE departments
(
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(20),
    location VARCHAR(20)
);

CREATE TABLE jobs
(
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(20)
);

CREATE TABLE employees
(
    employee_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    department_id VARCHAR(10),
    --FK
    job_id VARCHAR(10),
    --FK
    hire_date DATE,
    salary INT,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);