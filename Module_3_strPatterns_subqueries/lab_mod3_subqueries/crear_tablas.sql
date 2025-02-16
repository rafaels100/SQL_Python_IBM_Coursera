-- Me conceto al database, tengo que crearlo previamente
\c company_db

-- creo tabla departments, que no depende de nadie
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dep_name VARCHAR(50),
    manager_id INT,
    loc_id INT
);

-- tabla locations 
CREATE TABLE locations (
    loc_id INT PRIMARY KEY,
    dep_id INT REFERENCES departments(dept_id)
);

-- tabla jobs
CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary DECIMAL,
    max_salary DECIMAL
);

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

-- tabla job history
CREATE TABLE job_history (
    emp_id INT REFERENCES employees(emp_id),
    start_date DATE,
    job_id INT REFERENCES jobs(job_id),
    dept_id INT REFERENCES departments(dept_id)
);
