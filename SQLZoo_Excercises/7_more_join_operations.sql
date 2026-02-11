/* LECTURE 7: More JOIN operations
Source: sqlzoo.net/wiki/More_JOIN_operations
Lecture includes: Multiple JOINs, Aliasing, Filtering on linked tables
*/

-- 1. 1962 movies
-- Task: List the films released in 1962 and the budget is over 2000000 [Show id, title]
SELECT id, title FROM movie 
WHERE yr = 1962 AND budget > 2000000;

-- 2. When was Citizen Kane released?
-- Task: Give year of 'Citizen Kane'.
SELECT yr FROM movie WHERE title = 'Citizen Kane';

-- 3. Star Trek movies
-- Task: List all of the Star Trek movies, include the id, title and yr. Order by year.
SELECT id, title, yr FROM movie 
 WHERE title LIKE '%Star Trek%' ORDER BY yr;

-- 4. id for actor Glenn Close
-- Task: What id number does the actor 'Glenn Close' have?
SELECT id FROM actor 
WHERE name = 'Glenn Close';

-- 5. id for Casablanca
-- Task: What is the id of the 1942 film 'Casablanca'?
SELECT id FROM movie 
WHERE yr = 1942 AND title = 'Casablanca';

-- 6. Cast list for Casablanca
-- Task: Obtain the cast list for 'Casablanca' (use movieid=132689).
SELECT name FROM actor 
  JOIN casting ON id=actorid 
 WHERE movieid = 132689;

-- 7. Alien cast list
-- Task: Obtain the cast list for the film 'Alien'.
SELECT name FROM actor
  JOIN casting ON (actor.id = actorid)
  JOIN movie ON (movie.id = movieid)
 WHERE title = 'Alien';

-- 8. Harrison Ford movies
-- Task: List the films in which 'Harrison Ford' has appeared.
SELECT title FROM movie
  JOIN casting ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
 WHERE name = 'Harrison Ford';

-- 9. Harrison Ford as a supporting actor
-- Task: List the films where 'Harrison Ford' has appeared - but not in the starring role.
-- Note: ord=1 is the starring role.
SELECT title FROM movie
  JOIN casting ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
 WHERE name = 'Harrison Ford' AND ord <> 1;

-- 10. Lead actors in 1962 movies
-- Task: List the films together with the leading star for all 1962 films.
SELECT title, name FROM movie
  JOIN casting ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
 WHERE yr = 1962 AND ord = 1;

-- 11. Busy years for Rock Hudson
-- Task: Which were the busiest years for 'Rock Hudson'? Show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr, COUNT(title) FROM movie 
  JOIN casting ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
 WHERE name = 'Rock Hudson'
 GROUP BY yr
HAVING COUNT(title) > 2;

-- 12. Lead actor in Julie Andrews movies
-- Task: List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, name FROM movie
  JOIN casting ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
 WHERE movieid IN (
   SELECT movieid FROM casting
    WHERE actorid IN (
      SELECT id FROM actor
       WHERE name='Julie Andrews'))
   AND ord = 1;

-- 13. Actors with 15+ leading roles
-- Task: Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name FROM actor
  JOIN casting ON (id = actorid)
  WHERE ord = 1
 GROUP BY name
 HAVING COUNT(*) >= 15
 ORDER BY name

-- 14. 1978 films by cast size
-- Task: List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid) FROM movie
  JOIN casting ON (movie.id = movieid)
 WHERE yr = 1978
 GROUP BY title
 ORDER BY COUNT(actorid) DESC, title;

-- 15. Art Garfunkel collaborators
-- Task: List all the people who have worked with 'Art Garfunkel'.
SELECT name FROM actor
  JOIN casting ON (actor.id = actorid)
 WHERE movieid IN (
   SELECT movieid FROM casting JOIN actor ON (actorid=actor.id) 
   WHERE name = 'Art Garfunkel') 
   AND name <> 'Art Garfunkel';