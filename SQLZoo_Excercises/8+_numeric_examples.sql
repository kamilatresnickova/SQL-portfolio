/* LECTURE 8+: NSS Tutorial (Numeric SQL)
Source: sqlzoo.net/wiki/NSS_Tutorial
Lecture includes: SUM, COUNT, ROUND, GROUP BY, HAVING
*/

-- 1. Check out one row
-- Task: Show the percentage who STRONGLY AGREE for question 1 at 'Edinburgh Napier University' for subject '(8) Computer Science'.
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science';

-- 2. Calculate how many agree or strongly agree
-- Task: Show the institution and subject for responses of at least 100 for question 15.
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND response >= 100;

-- 3. Unhappy Computer Students
-- Task: Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'.
 SELECT institution, score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < 50;

-- 4. More Computing or Creative Students?
-- Task: Show the subject and total responses for question 22 for '(8) Computer Science' and '(H) Creative Arts and Design'.
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
 GROUP BY subject;

-- 5. Strongly Agree Numbers
-- Task: Show the subject and total number of people who STRONGLY AGREE for question 22 for these two subjects.
-- Note: You have to multiply response by percentage.
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100.0)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
 GROUP BY subject;

-- 6. Strongly Agree, Percentage
-- Task: Show the percentage of students who STRONGLY AGREE for each subject for question 22.
-- Note: Use ROUND and weight the percentage by the number of responses.
SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
 GROUP BY subject;

-- 7. Scores for Institutions in Manchester 
-- Task: Show the average score for question 'Q22' for each institution  that include 'Manchester' in the name.
SELECT institution, ROUND(SUM(response * score) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%'
 GROUP BY institution
 ORDER BY institution;

-- 8. Numebr of Computing Students in Manchester
-- Task: Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.
SELECT institution, 
       SUM(sample), 
       SUM(CASE 
             WHEN subject = '(8) Computer Science' THEN sample 
             ELSE 0 
           END) AS comp_sample
  FROM nss
 WHERE question = 'Q01' 
   AND institution LIKE '%Manchester%'
 GROUP BY institution;