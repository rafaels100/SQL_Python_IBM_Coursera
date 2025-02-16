CREATE DATABASE company_db;

-- Connect to the new database
\c company_db

-- creo tabla departments, que no depende de nadie
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dep_name VARCHAR(50),
    manager_id INT,
    loc_id INT
);

-- agrego data
INSERT INTO departments (dept_id, dep_name, manager_id, loc_id) VALUES
(1, 'HR', 101, 1),
(2, 'Engineering', 102, 2),
(3, 'Marketing', 103, 3);

-- creo el resto de tablas que tienen foreing keys

-- tabla locations 
CREATE TABLE locations (
    loc_id INT PRIMARY KEY,
    dep_id INT REFERENCES departments(dept_id)
);

-- agrego data
INSERT INTO locations (loc_id, dep_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- tabla jobs
CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary DECIMAL,
    max_salary DECIMAL
);

-- data jobs
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
(1, 'HR Manager', 50000, 80000),
(2, 'Software Engineer', 70000, 120000),
(3, 'Marketing Specialist', 40000, 70000);

-- tabla employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    ssn VARCHAR(15),
    b_date DATE,
    sex CHAR(1),
    address VARCHAR(100),
    job_id INT REFERENCES jobs(job_id),
    salary DECIMAL,
    manager_id INT,
    dep_id INT REFERENCES departments(dept_id)
);

-- data employess
INSERT INTO employees (emp_id, f_name, l_name, ssn, b_date, sex, address, job_id, salary, manager_id, dep_id) VALUES
(1, 'John', 'Doe', '123-45-6789', '1985-07-23', 'M', '123 Elm St', 1, 60000, NULL, 1),
(2, 'Jane', 'Smith', '987-65-4321', '1990-09-15', 'F', '456 Oak St', 2, 95000, 1, 2),
(3, 'Alice', 'Johnson', '555-11-2233', '1987-04-11', 'F', '789 Pine St', 3, 50000, 1, 3);

-- tabla job history
CREATE TABLE job_history (
    emp_id INT REFERENCES employees(emp_id),
    start_date DATE,
    job_id INT REFERENCES jobs(job_id),
    dept_id INT REFERENCES departments(dept_id)
);

-- data job history
INSERT INTO job_history (emp_id, start_date, job_id, dept_id) VALUES
(1, '2010-01-01', 1, 1),
(2, '2015-06-15', 2, 2),
(3, '2018-03-20', 3, 3);

