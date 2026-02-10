/* SQL BOLT: Lessons 1-3 (Full Completion)
Source: sqlbolt.com
*/

-- LESSON 1: SELECT Queries 101
-- Task 1: Find the title of each film.
SELECT title FROM movies;

-- Task 2: Find the director of each film.
SELECT director FROM movies;

-- Task 3: Find the title and director of each film.
SELECT title, director FROM movies;

-- Task 4: Find the title and year of each film.
SELECT title, year FROM movies;

-- Task 5: Find all the information about each film.
SELECT * FROM movies;


-- LESSON 2: Queries with Constraints (WHERE)
-- Task 1: Find the movie with a row id of 6.
SELECT * FROM movies WHERE id = 6;

-- Task 2: Find the movies released in the years between 2000 and 2010.
SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;

-- Task 3: Find the movies not released in the years between 2000 and 2010.
SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;

-- Task 4: Find the first 5 Pixar movies and their release year.
SELECT title, year FROM movies LIMIT 5;


-- LESSON 3: Queries with Constraints (Text/LIKE)
-- Task 1: Find all the Toy Story movies.
SELECT * FROM movies WHERE title LIKE "Toy Story%";

-- Task 2: Find all the movies directed by John Lasseter.
SELECT * FROM movies WHERE director = "John Lasseter";

-- Task 3: Find all the movies (and director) not directed by John Lasseter.
SELECT * FROM movies WHERE director != "John Lasseter";

-- Task 4: Find all the WALL-* movies.
SELECT * FROM movies WHERE title LIKE "WALL-%";

-- Task 5: List all directors of Pixar movies (alphabetically), without duplicates.
SELECT DISTINCT director FROM movies ORDER BY director ASC;