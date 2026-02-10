/* LECTURE 5: SUM and COUNT
Source: sqlzoo.net/wiki/SUM_and_COUNT
Lecture includes: SUM, COUNT, DISTINCT, GROUP BY, HAVING
*/

-- 1. Total world population
-- Task: Show the total population of the world.
SELECT SUM(population) FROM world;

-- 2. List of continents
-- Task: List all the continents - just once each.
SELECT DISTINCT continent FROM world;

-- 3. GDP of Africa
-- Task: Give the total GDP of Africa.
SELECT SUM(gdp) FROM world
 WHERE continent = 'Africa';

-- 4. Count the big countries
-- Task: How many countries have an area of at least 1,000,000?
SELECT COUNT(name) FROM world
 WHERE area >= 1000000;

-- 5. Baltic states population
-- Task: What is the total population of ('Estonia', 'Latvia', 'Lithuania')?
SELECT SUM(population) FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. Counting countries for each continent
-- Task: For each continent show the continent and number of countries.
SELECT continent, COUNT(name) FROM world
 GROUP BY continent;

-- 7. Counting big countries in each continent
-- Task: For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name) FROM world
 WHERE population >= 10000000
 GROUP BY continent;

-- 8. Counting big continents
-- Task: List the continents that have a total population of at least 100 million.
-- Note: Use HAVING to filter based on an aggregate value.
SELECT continent FROM world
 GROUP BY continent
HAVING SUM(population) >= 100000000;

