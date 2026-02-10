/* LECTURE 3: SELECT from Nobel
Source: sqlzoo.net/wiki/SELECT_from_nobel_tutorial
Lecture includes: Single quotes, Logical operators (AND, OR, NOT), IN, ORDER BY
*/

-- 1. Winners from 1950
-- Task: Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950;

-- 2. 1962 Literature
-- Task: Show who won the 1962 prize for literature.
SELECT winner FROM nobel
 WHERE yr = 1962 AND subject = 'literature';

-- 3. Albert Einstein
-- Task: Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel
 WHERE winner = 'Albert Einstein';

-- 4. Recent Peace Prizes
-- Task: Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000;

-- 5. Literature in the 1980's 
-- Task: Show all details (yr,subject,winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner FROM nobel
 WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Only Presidents
-- Task: Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama.
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7. John
-- Task: Show the winners with first name John.
SELECT winner FROM nobel
 WHERE winner LIKE 'John%';

-- 8. Chemistry and Physics from different years
-- Task: Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner FROM nobel
 WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984);

 --9. Exclude Chemists and Medics
 --Task: Show the year, subject, and name of winners for 1980 excluding chemistry and medicine.
 SELECT yr, subject, winner FROM nobel
 WHERE yr = 1980 AND subject NOT IN ('chemistry','medicine')

-- 10. Early Medicine, Late Literature
-- Task: Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004).
SELECT yr, subject, winner FROM nobel
 WHERE (subject = 'medicine' AND yr < 1910) OR (subject = 'literature' AND yr >= 2004);

-- 11. Umlaut
-- Task: Find all details of the prize won by PETER GRÜNBERG.
SELECT * FROM nobel
 WHERE winner = 'Peter Grünberg';

-- 12. Apostrophe
-- Task: Find all details of the prize won by EUGENE O'NEILL.
-- NOTE: Use two single quotes to escape a single quote in a string.
SELECT * FROM nobel
 WHERE winner = 'Eugene O''Neill';

-- 13. Knights of the realm
-- Task: List the winners, year and subject where the winner starts with Sir. Show the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel
 WHERE winner LIKE 'Sir%'
 ORDER BY yr DESC, winner;

-- 14. Chemistry and Physics last
-- Task: Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
-- NOTE: The expression (subject IN ('Chemistry','Physics')) returns 0 or 1. Sorting by this forces them to the bottom.
SELECT winner, subject FROM nobel
 WHERE yr = 1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;