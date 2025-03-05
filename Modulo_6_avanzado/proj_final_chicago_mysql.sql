-- 1- Write and execute a SQL query to list the school names, community names and average attendance for communities with a hardship index of 98.
SELECT S.NAME_OF_SCHOOL, S.COMMUNITY_AREA_NAME, S.AVERAGE_STUDENT_ATTENDANCE
FROM chicago_public_schools AS S
INNER JOIN 
chicago_socioeconomic_data AS C
USING (COMMUNITY_AREA_NAME)
WHERE C.HARDSHIP_INDEX = 98;


-- 2- Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type and community name.

SELECT DISTINCT(LOCATION_DESCRIPTION)
FROM chicago_crime;

SELECT * 
FROM chicago_crime
WHERE LOCATION_DESCRIPTION LIKE 'SCHOOL';


-- VIEWS
-- 3- Write and execute a SQL statement to create a view showing the columns listed in the following table, with new column names as shown in the second column.
--Column name in CHICAGO_PUBLIC_SCHOOLS 	Column name in view
-- NAME_OF_SCHOOL 	School_Name
-- Safety_Icon 	Safety_Rating
-- Family_Involvement_Icon 	Family_Rating
-- Environment_Icon 	Environment_Rating
-- Instruction_Icon 	Instruction_Rating
-- Leaders_Icon 	Leaders_Rating
--Teachers_Icon 	Teachers_Rating
CREATE VIEW vista_nombres_escuelas(School_Name, Safety_Rating, Family_Rating, Environment_Rating, Instruction_Rating, Leaders_Rating, Teachers_Rating)
AS 
SELECT NAME_OF_SCHOOL, Safety_Icon, Family_Involvement_Icon, Environment_Icon, Instruction_Icon, Leaders_Icon, Teachers_Icon FROM chicago_public_schools;

-- STORE PROCEDURES
-- 1- Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter as an integer and a in_Leader_Score parameter as an integer.
DELIMITER $$
CREATE PROCEDURE UPDATE_LEADERS_SCORE(in_School_ID INTEGER, in_Leaders_Score INTEGER)
BEGIN
	UPDATE chicago_public_schools
	SET Leaders_Score = in_Leaders_Score
	WHERE School_ID = in_School_ID;
END;
$$
DELIMITER ;

-- 2- CALL IT
CALL UPDATE_LEADERS_SCORE(610038, 40);

-- TRANSACTIONS
-- You realize that if someone calls your PROCEDURE with a score outside of the allowed range (0-99), then the score will be updated with the invalid data and the icon will remain at its previous value. There are various ways to avoid this problem, one of which is using a transaction.

-- 1- Update your stored procedure definition. Add a generic ELSE clause to the IF statement that rolls back the current work if the score did not fit any of the preceding categories.
DROP PROCEDURE IF EXISTS UPDATE_LEADERS_SCORE;
DELIMITER $$
CREATE PROCEDURE UPDATE_LEADERS_SCORE(in_School_ID INTEGER, in_Leaders_Score INTEGER)
BEGIN
	IF in_Leaders_Score >= 0 AND in_Leaders_Score <= 99 THEN
		UPDATE chicago_public_schools
		SET Leaders_Score = in_Leaders_Score
		WHERE School_ID = in_School_ID;
	ELSE
		SELECT 'Go F yourself';
		ROLLBACK;
	END IF;
END;
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS UPDATE_LEADERS_SCORE;
DELIMITER $$
CREATE PROCEDURE UPDATE_LEADERS_SCORE(in_School_ID INTEGER, in_Leaders_Score INTEGER)
BEGIN
	START TRANSACTION;
		UPDATE chicago_public_schools
		SET Leaders_Score = in_Leaders_Score
		WHERE School_ID = in_School_ID;
		IF in_Leaders_Score >= 0 AND in_Leaders_Score <= 99 THEN
			SELECT 'El cambio se realizo satisfactoriamente';
		ELSE
			SELECT 'Se descartan los cambios';
			ROLLBACK;
		END IF;
	COMMIT;
END;
$$
DELIMITER ;
