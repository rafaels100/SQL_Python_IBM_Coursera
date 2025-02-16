-- 1) Obtener la info de los empleados que tienen job_id
SELECT * FROM jobs;
SELECT * FROM employees;

SELECT * FROM employees 
	WHERE job_id IN
		(SELECT job_id FROM jobs);

-- 2) Obtener la informacion del trabajo cuyos empleados ganan mas de 70000
SELECT * FROM jobs
	WHERE job_id IN
		(SELECT job_id FROM employees 
			WHERE salary > 70000);

-- 3) Obtener la info de los empleados que tienen job_id, pero esta vez
-- usando implicit JOIN
SELECT * FROM employees E, jobs J
	WHERE E.job_id = J.job_id;

-- NOTA: Una vez usaste aliases para las tablas en la clausula FROM,
-- podes usarlos para referirte a las columnas de esas tablas
SELECT E.f_name, E.l_name, J.job_title FROM employees E, jobs J
	WHERE E.job_id = J.job_id;

-- 4) Obtener la lista de empleados cuyo trabajo es Software Engineer
-- usando subqueries
SELECT * FROM employees
	WHERE job_id IN
		(SELECT job_id FROM jobs
			WHERE job_title='Software Engineer');

-- 5) Obtener la lista de empleados cuyo trabajo es Software Engineer
-- usando implicit join
SELECT * FROM employees E, jobs J
	WHERE E.job_id=(SELECT job_id FROM jobs 
						WHERE job_title='Software Engineer');

-- SOLUCION PROFITO:
SELECT *
	FROM employees E, jobs J
		WHERE E.job_id = J.job_id AND J.job_title = 'Software Engineer';

-- 6) Obtener la informacion del trabajo y una lista de empleados
-- cuyo año de nacimiento es mayor a 1985

-- Para obtener la lista de trabajos con empleados nacidos luego de 1985,
-- puedo usar subqueries
SELECT job_id, job_title FROM jobs
	WHERE job_id IN 
		(SELECT job_id FROM employees
			WHERE EXTRACT(YEAR FROM b_date) > 1985);

-- Pero si quiero tambien los nombre de los empleados, debo usar 
-- las dos tablas al mismo tiempo, implicit JOIN
SELECT E.f_name, E.l_name, J.job_id, J.job_title
	FROM employees E, jobs J
		WHERE E.job_id = J.job_id AND EXTRACT(YEAR FROM E.b_date) > 1985;

-- Este truco de usar lo que queres matchear con la condicion extra que queres
-- lo usa bastante el profito

-- EXTRA 1: Empleados que pertenecen al dep_id con mayor valor?
SELECT * FROM employees
	WHERE dep_id = (SELECT MAX(dep_id) FROM departments);

-- EXTRA 2: Nombre empleados y sus respectivos departamentos
SELECT * FROM departments;
SELECT * FROM employees;
SELECT f_name, dep_name 
	FROM employees E, departments D
		WHERE E.dep_id = D.dep_id;
	
