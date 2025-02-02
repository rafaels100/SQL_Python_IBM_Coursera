--info tabla
--FilmLocations(
--Title:              titles of the films, 
--ReleaseYear:        time of public release of the films, 
--Locations:          locations of San Francisco where the films were shot, 
--FunFacts:           funny facts about the filming locations, 
--ProductionCompany:  companies who produced the films, 
--Distributor:        companies who distributed the films, 
--Director:           people who directed the films, 
--Writer:             people who wrote the films, 
--Actor1:             person 1 who acted in the films, 
--Actor2:             person 2 who acted in the films, 
--Actor3:             person 3 who acted 

--Para contar todas las filas en el dataset
SELECT COUNT(*) FROM FilmLocations;

--self explanatory
SELECT COUNT(Locations) FROM FilmLocations WHERE Writer="James Cameron";

SELECT DISTINCT Title FROM FilmLocations;

--se puede usar el distinct en conjunto con el count
SELECT COUNT(DISTINCT ReleaseYear) FROM FilmLocations WHERE ProductionCompany="Warner Bros. Pictures"

SELECT * FROM FilmLocations LIMIT 25;

--Incluso podemos obtener 25 a partir de una fila en especifico
SELECT * FROM FilmLocations LIMIT 15 OFFSET 10;

--Ejs
--1) Retrieve the number of locations of the films which are directed by Woody Allen.
SELECT COUNT(Locations) FROM FilmLocations WHERE Director = "Woody Allen";

--2) Retrieve the number of films shot at Russian Hill.
SELECT COUNT(Title) FROM FilmLocations WHERE Locations="Russian Hill";

--3) Retrieve the number of rows having a release year older than 1950 from the "FilmLocations" table
SELECT COUNT(*) FROM FilmLocations WHERE ReleaseYear < 1950;

--4) Retrieve the names of all unique films released in the 21st century and onwards, along with their release years.
SELECT DISTINCT(Title) FROM FilmLocations WHERE ReleaseYear >= 2000;

--5) Retrieve the directors' names and their distinct films shot at City Hall.
SELECT Director, DISTINCT(Title) FROM FilmLocations WHERE Locations='City Hall'; --NOPE! Esto no funciona porque la columna del DISNTICT es la que tiene que pautar 
--cuantas filas tendra, sino la columna del director va a dominary el distinct no tendra sentidos

SELECT DISTINCT(Title), Director FROM FilmLocations WHERE Locations='City Hall';

--6) Retrieve the number of distributors who distributed films with the 1st actor, Clint Eastwood.
SELECT COUNT(DISTINCT(Distributor)) FROM FilmLocations WHERE Actor1 = 'Clint Eastwood';

--7) Retrieve the names of the first 50 films.
SELECT DISTINCT(Title) FROM FilmLocations LIMIT 50;

--8) Retrieve the first 10 film names released in 2015.
SELECT DISTINCT(Title) FROM FilmLocations WHERE ReleaseYear = 2015 LIMIT 10;

--9) Retrieve the next 3 film names that follow after the first 5 films released in 2015.
SELECT DISTINCT(Title) FROM FilmLocations WHERE ReleaseYear = 2015 LIMIT 3 OFFSET 5;
