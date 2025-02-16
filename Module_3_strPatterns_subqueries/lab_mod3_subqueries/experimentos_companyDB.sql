SELECT * FROM employees;
SELECT * FROM departments;

--1) Obtener la info de los empleados cuyo salario es menor al promedio
SELECT f_name, l_name, salary, (SELECT AVG(salary) FROM employees) AS avg_salary FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- NOTA: No puedo usar un resultado de una subquery llevandolo de un lugar
-- a otro, debo recalcularlo

--2) Obtener la info del empleado mas viejo
SELECT * FROM employees
	WHERE b_date = (SELECT MIN(b_date) FROM employees);

--3) El salario promedio de los 2 que MAS ganan en la compañia
SELECT AVG(salary) FROM
	(SELECT salary FROM employees 
		ORDER BY salary DESC LIMIT 2);

--4) El salario promedio de los 2 que MENOS ganan en la compañia
SELECT AVG(salary) FROM
	(SELECT salary FROM employees 
		ORDER BY salary LIMIT 2);

--5) Obtener la informacion de los empleados mas viejos que el promedio

-- La cantidad en dias de la vida de los empleados
SELECT CURRENT_DATE - b_date FROM employees;

-- La cantidad de años, tomando en cuenta los años bisiestos con la funcion AGE
SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, b_date)) FROM employees;

-- Los empleados mas viejos que el promedio
SELECT * FROM employees
	WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, b_date)) > (SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, b_date))) FROM employees);

--6) De la tabla de job_history, extraer los emp_id, años de servicio, y
-- promedio de años de servicio de todos los empleados
SELECT emp_id, EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date)), (SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, start_date))) FROM job_history)
	FROM job_history;
