--table info
   -- Instructor (
     --   ins_id:     unique identification number of the instructors,    
       -- lastname:   last name of the instructors,
        --firstname:  first name of the instructors,
        --city:       name of the cities where instructors are located,
       -- country:    two-letter country code of the countries where instructors are located
   -- )
   
  
--1) Insert a new instructor record with id 4 for Sandip Saha who lives in Edmonton, CA into the “Instructor” table.
INSERT INTO Instructor (ins_id, lastname, firstname, city, country) VALUES (4, 'Sandip', 'Saha', 'Edmonton', 'CA');

--2) Insert two new instructor records into the “Instructor” table. First record with id 5 for John Doe who lives in Sydney, AU. Second record with id 6 for Jane Doe who lives in Dhaka, BD.

INSERT INTO Instructor (ins_id, lastname, firstname, city, country) VALUES (5, 'John', 'Doe', 'Sydeny', 'AU'), (6, 'Jane', 'Doe', 'Dhaka', 'BD');

--3) Insert a new instructor record with id 7 for Antonio Cangiano who lives in Vancouver, CA into the “Instructor” table.
INSERT INTO Instructor (ins_id, lastname, firstname, city, country) VALUES (7, 'Antonio', 'Cangiano', 'Vancouver', 'CA');

--4) Insert two new instructor records into the “Instructor” table. First record with id 8 for Steve Ryan who lives in Barlby, GB. Second record with id 9 for Ramesh Sannareddy who lives in Hyderabad, IN.
INSERT INTO Intructor (ins_id, lastname, firstname, city, country) VALUES (8, 'Steve', 'Ryan', 'Barlby', 'GB'), (9, 'Ramesh', 'Sannareddy', 'Hyderabad', 'IN');

--5) Update the city for Sandip to Toronto.
UPDATE Instructor SET city = 'Toronto' WHERE firstname = 'Sandip';

--6) Update the city and country for Doe with id 5 to Dubai and AE respectively.
UPDATE Instructor SET city = 'Dubai', country = 'AE' WHERE lastname = 'Doe';

--7) Update the city of the instructor record to Markham whose id is 1.
UPDATE Instructor SET city = 'Markham' WHERE ins_id = 1;

--8) Update the city and country for Sandip with id 4 to Dhaka and BD respectively.
UPDATE Instructor SET city = 'Dhaka', country = 'BD' WHERE firstname = 'Sandip';

--9) Remove the instructor record of Doe whose id is 6.
DELETE FROM Instructor
WHERE ins_id = 6;

--10) Remove the instructor record of Hima.
DELETE FROM Instructor
WHERE firstname = 'Hima';
