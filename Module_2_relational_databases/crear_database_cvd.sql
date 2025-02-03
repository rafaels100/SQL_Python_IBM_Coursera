--Creamos una base de datos de cadio vascular diseases



CREATE TABLE PATIENTS(
	PATIENT_ID SERIAL PRIMARY KEY,
	FIRST_NAME VARCHAR(40),
	LAST_NAME VARCHAR(40),
	SSN INTEGER,
	BIRTH_DATE DATE,
	SEX CHAR(1),
	ADDRESS VARCHAR(40),
	DEPT_ID VARCHAR(4) REFERENCES DEPT_IT(MEDICAL PROCEDURES)
);
