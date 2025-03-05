-- 1- Retrieve the names, job start dates, and job titles of all employees who work for department number 5.
-- uso comillas invertidas para los identificadores, en este caso columnas con espacios
SELECT E.f_name,E.l_name, JH.`COL 2`
FROM employees_1 as E 
INNER JOIN jobshistory as JH 
ON E.emp_id=JH.`COL 1` 
WHERE E.dep_id ='5';

-- 2- Retrieve employee ID, last name, and department ID for all employees but department names for only those born before 1980.
SELECT e.emp_id, e.l_name, e.dep_id, D.`COL 2`
FROM employees_1 e
LEFT JOIN (
    SELECT *
    FROM departments_1 d
    INNER JOIN employees_1 e
    ON d.`COL 1` = e.dep_id
    WHERE DATEDIFF(CURRENT_DATE, e.b_date) >= 0
) AS D
ON e.dep_id = D.`COL 1`;


-- soluction profe
SELECT E.emp_id, E.l_name, E.dep_id, D.`COL 2`
FROM employees_1 AS E
LEFT OUTER JOIN departments_1 AS D
ON E.dep_id = D.`COL 1`
AND YEAR(E.b_date) < 1980;


--3- Retrieve the first name and last name of all employees but department ID and department names only for male employees.
SELECT E.f_name, E.l_name, E.dep_id, D.`COL 2`
FROM employees_1 AS E
LEFT OUTER JOIN departments_1 AS D
ON E.dep_id = D.`COL 1`
AND E.sex = 'M';
