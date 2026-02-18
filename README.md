# SQL Learning Journey & Portfolio 

This repository serves as a professional archive of my SQL progress, currently featuring exercises from SQLZoo and SQLBolt. Custom data analysis projects comming soon.

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
* **JOIN with GROUP BY:** Combining multiple tables and then performing complex aggregations on the resulting 
dataset.

### Lesson 7: More JOIN operations
*Focus: Navigating complex many-to-many relationships.*

* **Multi-Table Joins:** Linking three tables (`movie`, `actor`, `casting`) to retrieve interconnected data.
* **Starring Roles Analysis:** Using the `ord` column to distinguish between lead and supporting roles.
* **Nested Subqueries in Joins:** Utilizing subqueries to find collaborators and specific groups of actors (e.g., all co-stars of Art Garfunkel).
* **Advanced Aggregations with Joins:** Combining `GROUP BY` and `HAVING` to identify busy years for actors or filter by the number of starring roles.
* **Sorting by Aggregate Results:** Ordering film lists based on the size of the cast.

### Lesson 8: Using NULL
*Focus: Handling missing data and conditional logic.*

* **NULL Detection:** Using `IS NULL` and `IS NOT NULL` to identify missing entries in a database.
* **Join Variations:** Comparing `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` to understand how they handle records that don't have matching counterparts (crucial for data gap analysis).
* **The COALESCE Function:** Mastering `COALESCE` to provide default values when a field is `NULL`, ensuring cleaner reports and preventing calculation errors.
* **Advanced Case Logic:** Using `CASE WHEN` to categorize data into custom groups based on specific conditions, creating new dimensions for analysis.
* **Aggregating with NULLs:** Understanding that `COUNT(column)` ignores `NULL` values while `COUNT(*)` includes them.

### Lesson 8+: Numeric SQL (NSS Tutorial)
*Focus: Performing calculations on survey data and weighted averages.*

* **Weighted Aggregations:** Calculating actual counts from percentages by multiplying response rates with sample sizes (e.g., `SUM(response * A_STRONGLY_AGREE / 100)`).
* **Ratio Analysis:** Using `SUM(response * value) / SUM(response)` to find weighted averages across different groups.
* **Conditional Summing:** Implementing `SUM(CASE WHEN ...)` to create side-by-side comparisons of different categories (e.g., comparing Computing vs. Arts enrollment).
* **Data Granularity:** Mastering the use of `GROUP BY` on non-unique fields like institutions to summarize large-scale survey results.

### Lesson 9: Window Functions
*Focus: Advanced data ranking and partitioned calculations.*

* **RANK() & OVER:** Implementing ranking systems that operate across the entire dataset without collapsing rows, unlike standard aggregation.
* **PARTITION BY:** Segmenting window calculations into groups (e.g., calculating party rankings independently for each constituency).
* **Nested Analytical Queries:** Using subqueries to wrap window functions, allowing for high-level filtering (e.g., extracting only the top-ranked record from each group).
* **Data Synthesis:** Combining window-based logic with `GROUP BY` to generate complex summary reports, such as total election seats won.

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

### Lesson 4: Filtering and sorting query results
*Focus: Refining result sets and data presentation.*
* **Result Limitation:** Using `LIMIT` to restrict the number of rows returned, which is essential for performance when testing queries.
* **Pagination:** Implementing `OFFSET` to skip a specific number of rows, a key technique for building paginated data views.
* **Complex Sorting:** Combining `ORDER BY` with multiple columns and directions to organize data logically.

### Lesson 5: Simple SELECT Queries (Review)
*Focus: Consolidating core retrieval skills.*
* **Comprehensive Filtering:** Applying multiple `WHERE` clauses to real-world datasets (North American cities) to extract specific insights.
* **Geospatial Logic:** Sorting data based on coordinates (latitude/longitude) to analyze geographic trends.

### Lessons 6-7: Multi-table queries with JOINs
*Focus: Connecting related data across different tables.*
* **Inner Joining:** Using `JOIN` to combine rows from two tables based on a shared key (Primary/Foreign Key relationship).
* **Outer Joining:** Implementing `LEFT JOIN` and `RIGHT JOIN` to include rows even when there are no matching values in the connected table, crucial for identifying data gaps.

### Lesson 8: A short note on NULLs
*Focus: Dealing with missing or incomplete information.*
* **Existence Checking:** Utilizing `IS NULL` and `IS NOT NULL` to filter records with missing data points.
* **Asymmetric Joins:** Leveraging `LEFT JOIN` to find "orphaned" records (e.g., buildings with no employees).

### Lesson 9: Queries with expressions
*Focus: Real-time data transformation and calculations.*
* **Arithmetic Expressions:** Performing calculations directly within the `SELECT` statement to create new metrics (e.g., combined sales in millions).
* **Aliasing:** Using `AS` to give descriptive names to calculated columns, making the output audit-ready and readable.

### Lessons 10-12: Aggregates and Order of Execution
*Focus: Summarizing data and understanding the SQL engine.*
* **Aggregate Functions:** Mastering `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX` to summarize entire datasets.
* **Data Grouping:** Using `GROUP BY` to perform calculations across specific categories (e.g., average employment years per role).
* **Group Filtering:** Utilizing `HAVING` to filter aggregated results, a distinct process from the row-level `WHERE` filter.
* **Query Lifecycle:** Understanding the logical order of execution to write more efficient and bug-free code.

### Lessons 13-15: Data Modification (CRUD)
*Focus: Creating, updating, and deleting records.*
* **Inserting Data:** Adding new records to tables while maintaining data type integrity.
* **Precise Updates:** Using `UPDATE` with specific `WHERE` clauses to modify existing data without affecting unintended rows.
* **Safe Deletion:** Implementing `DELETE` to remove obsolete or incorrect records from the database.

### Lessons 16-18: Schema Management
*Focus: Building and modifying the database structure.*
* **Table Creation:** Defining new table schemas with appropriate data types (TEXT, INTEGER, FLOAT).
* **Schema Evolution:** Using `ALTER TABLE` to add new columns or modify existing structures without losing data.
* **Clean Up:** Utilizing `DROP TABLE` to safely remove entire tables from the database.
   
</details>
