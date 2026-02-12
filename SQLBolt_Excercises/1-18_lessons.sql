/* SQL BOLT: Lessons 1-18 (Full Completion)
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



-- LESSON 4: Filtering and sorting query results
-- Task 1: List all directors of Pixar movies (alphabetically), without duplicates.
SELECT DISTINCT director FROM movies ORDER BY director ASC;

-- Task 2: List the last four Pixar movies released (ordered from most recent to least).
SELECT title FROM movies ORDER BY year DESC LIMIT 4;

-- Task 3: List the first five Pixar movies sorted alphabetically.
SELECT title FROM movies ORDER BY title ASC LIMIT 5;

-- Task 4: List the next five Pixar movies sorted alphabetically.
SELECT title FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;

-- LESSON 5: Simple SELECT Queries (Review)
-- Task 1: List all the Canadian cities and their populations.
SELECT city, population FROM north_american_cities WHERE country = 'Canada';

-- Task 2: Order all the cities in the United States by their latitude from north to south.
SELECT city FROM north_american_cities WHERE country = 'United States' ORDER BY latitude DESC;

-- Task 3: List all the cities west of Chicago, ordered from west to east.
SELECT city FROM north_american_cities WHERE longitude < -87.629798 ORDER BY longitude ASC;

-- Task 4: List the two largest cities in Mexico (by population).
SELECT city FROM north_american_cities WHERE country = 'Mexico' ORDER BY population DESC LIMIT 2;

-- Task 5: List the third and fourth largest cities (by population) in the United States.
SELECT city FROM north_american_cities WHERE country = 'United States' ORDER BY population DESC LIMIT 2 OFFSET 2;

-- LESSON 6: Multi-table queries with JOINs
-- Task 1: Find the domestic and international sales for each movie.
SELECT title, domestic_sales, international_sales FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;

-- Task 2: Show the sales numbers for each movie that did better internationally than domestically.
SELECT title, domestic_sales, international_sales FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id WHERE international_sales > domestic_sales;

-- Task 3: List all the movies by their ratings in descending order.
SELECT title, rating FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id ORDER BY rating DESC;

-- LESSON 7: OUTER JOINs
-- Task 1: Find the list of all buildings that have employees.
SELECT DISTINCT building FROM employees;

-- Task 2: Find the list of all buildings and their capacity.
SELECT building_name, capacity FROM buildings;

-- Task 3: List all buildings and the distinct employee roles in each building (including empty buildings).
SELECT DISTINCT building_name, role FROM buildings LEFT JOIN employees ON building_name = building;

-- LESSON 8: A short note on NULLs
-- Task 1: Find the name and role of all employees who have not been assigned to a building.
SELECT name, role FROM employees WHERE building IS NULL;

-- Task 2: Find the names of the buildings that hold no employees.
SELECT building_name FROM buildings LEFT JOIN employees ON building_name = building WHERE name IS NULL;

-- LESSON 9: Queries with expressions
-- Task 1: List all movies and their combined sales in millions of dollars.
SELECT title, (domestic_sales + international_sales) / 1000000 AS combined_sales FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;

-- Task 2: List all movies and their ratings in percent.
SELECT title, (rating * 10) AS rating_percent FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;

-- Task 3: List all movies that were released on even numbered years.
SELECT title, year FROM movies WHERE year % 2 = 0;

-- LESSON 10: Queries with aggregates (Pt. 1)
-- Task 1: Find the longest time that an employee has been at the studio.
SELECT MAX(years_employed) FROM employees;

-- Task 2: For each role, find the average number of years employed by employees in that role.
SELECT role, AVG(years_employed) FROM employees GROUP BY role;

-- Task 3: Find the total number of employee years worked in each building.
SELECT building, SUM(years_employed) FROM employees GROUP BY building;

-- LESSON 11: Queries with aggregates (Pt. 2)
-- Task 1: Find the number of Artists in the studio (without a HAVING clause).
SELECT COUNT(*) FROM employees WHERE role = 'Artist';

-- Task 2: Find the number of employees of each role in the studio.
SELECT role, COUNT(*) FROM employees GROUP BY role;

-- Task 3: Find the total number of years employed by all Engineers.
SELECT role, SUM(years_employed) FROM employees GROUP BY role HAVING role = 'Engineer';

-- LESSON 12: Order of execution of a Query
-- Task 1: Find the number of movies each director has directed.
SELECT director, COUNT(title) FROM movies GROUP BY director;

-- Task 2: Find the total domestic and international sales that can be attributed to each director.
SELECT director, SUM(domestic_sales + international_sales) AS total_sales FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id GROUP BY director;

-- LESSON 13: Inserting rows
-- Task 1: Add the studio's new production, Toy Story 4 to the list of movies.
INSERT INTO movies (title, director, year, length_minutes) VALUES ('Toy Story 4', 'John Lasseter', 2019, 100);

-- Task 2: Toy Story 4 made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table.
INSERT INTO boxoffice (movie_id, rating, domestic_sales, international_sales) VALUES (15, 8.7, 340000000, 270000000);

-- LESSON 14: Updating rows
-- Task 1: The director for A Bug's Life is incorrect, it was actually directed by John Lasseter.
UPDATE movies SET director = 'John Lasseter' WHERE title = "A Bug's Life";

-- Task 2: The year that Toy Story 2 was released is incorrect, it was actually released in 1999.
UPDATE movies SET year = 1999 WHERE title = 'Toy Story 2';

-- Task 3: Toy Story 3 was directed by Lee Unkrich.
UPDATE movies SET title = 'Toy Story 3', director = 'Lee Unkrich' WHERE title = 'Toy Story 8';

-- LESSON 15: Deleting rows
-- Task 1: Remove all movies released before 2005.
DELETE FROM movies WHERE year < 2005;

-- Task 2: Andrew Stanton has left the studio, so please remove all movies directed by him.
DELETE FROM movies WHERE director = 'Andrew Stanton';

-- LESSON 16: Creating tables
-- Task 1: Create a new table named Database with the following columns: Name, Version, Download_count.
CREATE TABLE Database (Name TEXT, Version FLOAT, Download_count INTEGER);

-- LESSON 17: Altering tables
-- Task 1: Add a column named Aspect_ratio with a FLOAT data type.
ALTER TABLE movies ADD Aspect_ratio FLOAT;

-- Task 2: Add another column named Language with a TEXT data type (Default: English).
ALTER TABLE movies ADD Language TEXT DEFAULT 'English';

-- LESSON 18: Dropping tables
-- Task 1: We've sadly reached the end of our lessons, let's clean up by dropping the Movies table.
DROP TABLE movies;

-- Task 2: And drop the BoxOffice table as well.
DROP TABLE boxoffice;