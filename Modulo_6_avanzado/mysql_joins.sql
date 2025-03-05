-- INNER JOINS: Da la interseccion entre dos tablas, en base
-- a una columna 'en comun', donde puede o no haber valores 
-- iguales que se van a intersecar.
SELECT B.BORROWE_ID, B.LASTNAME, B.COUNTRY,
	L.BORROWER_ID, L.LOAN_DATE
FROM BORROWER B INNER JOIN LOAN L
ON B.BORROWER_ID = L.BORROWER_ID;


-- OUTER JOINS:
-- Devuelve tanto las filas que tienen matcheos
-- como las que no. Hay 3 tipos de OUTER JOINS:
-- RIGHT OUTER JOIN:
-- Devuelve las filas con matcheo y tambien todas
-- las filas de la tabla derecha

-- RIGHT OUTER JOIN:
-- Devuelve las filas con matcheo y tambien todas
-- las filas de la tabla derecha

SELECT B.BORROWE_ID, B.LASTNAME, B.COUNTRY,
	L.BORROWER_ID, L.LOAN_DATE
FROM BORROWER B RIGHT OUTER JOIN LOAN L
ON B.BORROWER_ID = L.BORROWER_ID;

-- LEFT OUTER JOIN:
-- Devuelve las filas con matcheo y tambien todas
-- las filas de la tabla izquierda

SELECT B.BORROWE_ID, B.LASTNAME, B.COUNTRY,
	L.BORROWER_ID, L.LOAN_DATE
FROM BORROWER B LEFT OUTER JOIN LOAN L
ON B.BORROWER_ID = L.BORROWER_ID;

-- FULL OUTER JOIN
-- Es la UNION, devuelve todas las filas de ambas tablas, una tabla
-- que las contiene a ambas

SELECT B.BORROWE_ID, B.LASTNAME, B.COUNTRY,
	L.BORROWER_ID, L.LOAN_DATE
FROM BORROWER B FULL OUTER JOIN LOAN L
ON B.BORROWER_ID = L.BORROWER_ID;

