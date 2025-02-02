--Ejercicios:
--1) Retrieve the fun facts and filming locations of all films.
SELECT FunFacts, Locations FROM FilmLocations;

--2) Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000), along with filming locations and release years.
SELECT Title, Locations, ReleaseYear FROM FilmLocations WHERE ReleaseYear <= 2000;

--3) Retrieve the names, production company names, filming locations, and release years of the films not written by James Cameron.
SELECT Title, Locations, ReleaseYear FROM FilmLocations WHERE Writer != 'James Cameron';
