
DROP TABLE IF EXISTS petsale;



CREATE TABLE petsale (
	id_animal INTEGER NOT NULL,
	type_animal VARCHAR(20),
	saleprice DECIMAL(6,2),
	saledate DATE,
	quantity INTEGER,
	PRIMARY KEY (id_animal)
	);


INSERT INTO petsale VALUES
(1,'Cat',450.09,'2018-05-29',9),
(2,'Dog',666.66,'2018-06-01',3),
(3,'Parrot',50.00,'2018-06-04',2),
(4,'Hamster',60.60,'2018-06-11',6),
(5,'Goldfish',48.48,'2018-06-14',24);

