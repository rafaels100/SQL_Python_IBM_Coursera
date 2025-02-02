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


--Ejercicios:
--1) Retrieve the fun facts and filming locations of all films.
SELECT FunFacts, Locations FROM FilmLocations;

--2) Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000), along with filming locations and release years.
SELECT Title, Locations, ReleaseYear FROM FilmLocations WHERE ReleaseYear <= 2000;

--3) Retrieve the names, production company names, filming locations, and release years of the films not written by James Cameron.
SELECT Title, Locations, ReleaseYear FROM FilmLocations WHERE Writer != 'James Cameron';
