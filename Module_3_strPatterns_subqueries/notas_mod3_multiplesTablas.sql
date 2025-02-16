SELECT * FROM employees
	WHERE dep_id IN 
		(SELECT dep_id FROM departments
			WHERE loc_id=1);

SELECT * FROM employees;
SELECT * FROM departments;

-- 1) Obtener el departamento con los empleados que ganen mas de 70000
SELECT dep_id, dep_name FROM departments WHERE dep_id
	IN (SELECT dep_id FROM employees WHERE salary > 70000);

-- DOS TABLAS EN EL FROM (IMPLICIT JOIN)
-- Se puede pedir info de dos tablas diferentes en el FROM, el resultado
-- es un FULL JOIN
SELECT * FROM employees, departments;
-- Toda fila en la primera tabla es joineada con toda fila en la segunda
-- Pero esto no tiene mucho sentido, repite filas sin matchear nada

-- MEJOR: Unimos segun el dep_id
SELECT * FROM employees E, departments D
	WHERE (E.dep_id = D.dep_id);
-- NOTA: Se puede usar AS o no.

