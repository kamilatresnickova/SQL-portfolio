/* LECTURE 2: SELECT from WORLD
Source: sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
Lecture includes: ROUND, Arithmetic operations, XOR, <>, NOT LIKE, LEFT, LENGTH
*/

-- 1. Introduction
-- Task: Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world;

-- 2. Large Countries
-- Task: Show the name for countries that have a population of at least 200 million.
SELECT name FROM world WHERE population >= 200000000;

-- 3. Per capita GDP
-- Task: Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population FROM world WHERE population >= 200000000;

-- 4. South America in millions
-- Task: Show the name and population in millions for the countries of South America.
SELECT name, population/1000000 FROM world WHERE continent = 'South America';

-- 5. France, Germany, Italy
-- Task: Show the name and population for France, Germany and Italy.
SELECT name, population FROM world
 WHERE name IN ('France', 'Germany', 'Italy');

-- 6. United
-- Task: Show the countries which have a name that includes the word 'United'.
SELECT name FROM world
 WHERE name LIKE '%United%';

-- 7. Two ways to be big
-- Task: Show the countries that are big by area (>3 million) or big by population (>250 million).
SELECT name, population, area FROM world
 WHERE area > 3000000 OR population > 250000000;

-- 8. One or the other (XOR)
-- Task: Show the countries that are big by area or big by population but not both.
SELECT name, population, area FROM world
 WHERE area > 3000000 XOR population > 250000000;

-- 9. Rounding
-- Task: For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000.0, 2), ROUND(gdp/1000000000.0, 2) FROM world
 WHERE continent = 'South America';

-- 10. Trillion dollar economies
-- Task: Show name and per-capita GDP for countries with a GDP of at least one trillion. Round this value to the nearest 1000. 
SELECT name, ROUND(gdp/population, -3) FROM world
 WHERE gdp >= 1000000000000;

-- 11. Name and capital have the same length
-- Task: Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital FROM world
 WHERE LENGTH(name) = LENGTH(capital);

-- 12. Matching name and capital
-- Task: Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital FROM world
 WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;

-- 13. All the vowels
-- Task: Find the country that has all the vowels and no spaces in its name.
SELECT name FROM world
 WHERE name LIKE '%a%' 
   AND name LIKE '%e%' 
   AND name LIKE '%i%' 
   AND name LIKE '%o%' 
   AND name LIKE '%u%' 
   AND name NOT LIKE '% %';