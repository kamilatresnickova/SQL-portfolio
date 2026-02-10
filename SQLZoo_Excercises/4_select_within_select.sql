/* LECTURE 4: SELECT within SELECT
Source: sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
Lecture includes: Subqueries, ALL, ANY keywords
*/

-- 1. Bigger than Russia
-- Task: List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2. Richer than UK
-- Task: Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
  WHERE continent = 'Europe' 
    AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name = 'United Kingdom');

-- 3. Neighbors of Argentina and Australia
-- Task: List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent FROM world
  WHERE continent IN 
    (SELECT continent FROM world 
     WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- 4. Between Canada and Poland
-- Task: Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE name = 'Canada')
    AND population < (SELECT population FROM world WHERE name = 'Poland');

-- 5. Percentages of Germany
-- Task: Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- Note: Use CONCAT and ROUND for the percentage format.
SELECT name, 
       CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100), '%') AS percentage
  FROM world
 WHERE continent = 'Europe';

-- 6. Bigger than every country in Europe
-- Task: Which countries have a GDP greater than every country in Europe? [Give the name only.]
-- Note: 'ALL' allows you to compare a value to every value in a list.
SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);

-- 7. Largest in each continent
-- Task: Find the largest country (by area) in each continent, show the continent, the name and the area.
-- Note: This is a correlated/synchronized subquery.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

-- 8. First country of each continent (alphabetically)
-- Task: List each continent and the name of the country that comes first alphabetically.
SELECT continent, name FROM world x
  WHERE name = (SELECT MIN(name) FROM world y WHERE y.continent = x.continent);

-- 9. Difficult Questions (Population density/totals)
-- Task: Find the continents where all countries have a population <= 25,000,000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population FROM world x
  WHERE 25000000 >= ALL(SELECT population FROM world y WHERE x.continent = y.continent);

-- 10. Three times bigger
-- Task: Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent FROM world x
  WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND x.name <> y.name);
