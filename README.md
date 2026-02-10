# SQL Learning Journey & Portfolio 

This repository serves as a professional archive of my SQL progress, featuring exercises from SQLZoo, SQLBolt, and custom data analysis projects.

---

## 🎓 Education & Exercises
Below is a detailed log of my learning path.

<details>
<summary><b>SQLZoo (Click to expand)</b></summary>

## SQLZoo - Practice Notes

Detailed record of completed lessons and key technical skills acquired.

### Lesson 0: SELECT Basics
*Focus: Initial data retrieval and basic filtering.*
* **Fundamental Syntax:** Selecting specific columns using `SELECT` and `FROM`.
* **Filtering Data:** Using the `WHERE` clause to isolate specific records (e.g., filtering by country name).
* **Set Membership:** Using `IN` to check if a value matches any value in a list (e.g., `name IN ('Brazil', 'Mexico')`).
* **Range Filtering:** Implementing `BETWEEN` to find values within a specific numerical range (inclusive).

### Lesson 1: SELECT Names
*Focus: Pattern matching and string manipulation.*
* **Pattern Search:** Mastering the `LIKE` operator to find specific strings.
* **Wildcards:** * `%` (Percentage) - represents any number of characters.
    * `_` (Underscore) - represents exactly one single character.
* **String Patterns:** Finding entries that start with, end with, or contain specific letters (e.g., `%land`, `C%ia`).
* **Advanced Patterns:** Using multiple underscores to find words of a specific length or with specific characters at certain positions (e.g., `_t%`).

### Lesson 2: SELECT from WORLD
*Focus: Calculations, rounding, and logical operators.*
* **Basic Aggregations:** Using `SUM` and `COUNT` for world-scale data.
* **Calculated Columns:** Performing arithmetic operations directly in the query (e.g., `GDP / population` to calculate GDP per capita).
* **Numerical Rounding:** * `ROUND(value, 2)` to round to decimal places.
    * `ROUND(value, -3)` to round to the nearest thousand.
* **Logical Logic (XOR):** Using `OR` and `AND` combinations to filter records that meet one condition or another, but not both.
* **String Functions:** * `LENGTH()` to compare the number of characters in names and capitals.
    * `LEFT(column, 1)` to extract and compare the first letter of strings.
* **Inequality:** Using the `<>` (not equal to) operator to find discrepancies between related columns.

### Lesson 3: SELECT from Nobel
*Focus: Advanced filtering, logical operators, and handling special characters.*

* **Logical Operators:** Mastering complex queries using combinations of `AND`, `OR`, and `NOT`.
* **Set Membership:** Using `IN` to efficiently filter multiple specific categories, such as Nobel Prize subjects.
* **Escape Characters:** Handling apostrophes in strings by doubling the single quote (e.g., `'Eugene O''Neill'`), which is crucial for maintaining data integrity.
* **Advanced Sorting:**
    * Implementing `ORDER BY` with multiple columns and mixed directions (`DESC` for years, `ASC` for names).
    * **Custom Sorting Logic:** Using boolean expressions in `ORDER BY` (e.g., `subject IN ('Physics','Chemistry')`) to force specific records to the bottom of the result set for customized reporting.

  ### Lesson 4: SELECT within SELECT
*Focus: Mastering subqueries and nested logic.*

* **Internal Queries:** Learning to use the result of one query as a filter for another.
* **Global Comparisons:** Using subqueries to compare individual records against global values (e.g., countries with a higher GDP than the UK).
* **Percentage Calculations:** Using nested SELECT statements to perform calculations against a specific reference value (e.g., population as a percentage of Germany).
* **Advanced Keywords (ALL/ANY):** Comparing a single value against every value returned by a subquery.
* **Correlated Subqueries:** Understanding complex "query-within-a-query" logic where the inner query refers back to the outer table.

  ### Lesson 5: SUM and COUNT
*Focus: Data aggregation and group-level analysis.*

* **Aggregate Functions:** Using `SUM`, `COUNT`, `AVG`, `MIN`, and `MAX` to summarize large datasets.
* **Unique Values:** Implementing `DISTINCT` to identify unique categories within a column.
* **Data Grouping:** Mastering the `GROUP BY` clause to perform calculations across different categories (e.g., counting countries per continent).
* **Advanced Filtering (HAVING):** Learning to filter aggregated results (e.g., finding continents with a total population over a certain threshold), which is distinct from the `WHERE` clause.

### Lesson 6: The JOIN operation
*Focus: Combining data from multiple related tables.*

* **Relational Logic:** Using `JOIN` (Inner Join) to combine rows from two tables based on a related column (e.g., `game.id = goal.matchid`).
* **Table Aliasing:** Managing queries involving multiple tables by clearly defining source columns to avoid ambiguity.
* **Filtering Joined Data:** Applying `WHERE` clauses to combined datasets (e.g., finding goals scored in a specific stadium).
* **Conditional Aggregation:** Implementing `CASE WHEN` within a `SUM` function to create pivot-table style summaries directly in SQL (Task 13).
* **JOIN with GROUP BY:** Combining multiple tables and then performing complex aggregations on the resulting dataset.

</details>

<details>
<summary><b>SQLBolt (Click to expand)</b></summary>

## SQLBolt - Practice Notes
Detailed record of completed lessons and key technical skills acquired.

### Lesson 1: SELECT Queries 101
*Focus: Fundamental data retrieval from tables.*
* **Column Selection:** Selecting specific data points (e.g., title, director) to minimize query load and focus on relevant information.
* **Full Table Scan:** Utilizing `SELECT *` to quickly inspect the table structure and all available data fields.

### Lesson 2: Queries with Constraints
*Focus: Filtering data using numerical and logical operators.*
* **ID Lookup:** Performing precise searches for specific records using unique identifiers (IDs).
* **Range Filtering:** Implementing the `BETWEEN` operator for temporal analysis (e.g., filtering movies by release years).
* **Result Limitation:** Using `LIMIT` to restrict the output to the first X records, an essential practice for optimizing performance in large-scale databases.

### Lesson 3: Queries with Constraints (Text)
*Focus: String manipulation and pattern matching.*
* **Pattern Matching:** Using the `LIKE` operator combined with the `%` wildcard for fuzzy searches (e.g., finding all titles within a movie franchise).
* **Logical Negation:** Utilizing `!=` and `NOT` to exclude specific data points, a critical skill for data cleaning and auditing.
* **Unique Identification:** Implementing `DISTINCT` alongside `ORDER BY` to generate clean, alphabetically sorted lists of unique values (e.g., unique director lists without duplicates).
   
</details>
