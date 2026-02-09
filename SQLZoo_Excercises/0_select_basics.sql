/* LEKCE 0: SELECT Basics
Source: sqlzoo.net/wiki/SELECT_basics
Lecture includes: WHERE, IN, BETWEEN
*/

-- 1. Introducing the world table of countries
-- Task: Modify code to show the population of Germany.
  SELECT population FROM Germany
  WHERE name = 'Germany';


-- 2. Scandinavia
-- Task: Show the name and population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');


-- 3. Just the right size
-- Task: Modify code to show the country and the area for countries with an area between 200 000 and 250 000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;