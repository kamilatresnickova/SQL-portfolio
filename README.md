# SQL Learning Journey & Portfolio 

This repository serves as a professional archive of my SQL progress, featuring exercises from SQLZoo, SQLBolt, and custom data analysis projects.

---

## 🎓 Education & Exercises
Below is a detailed log of my learning path.

<details>
<summary><b>SQLZoo - Completed Lessons & Learning Outcomes (Click to expand)</b></summary>

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

</details>

<details>
<summary><b>SQLBolt (Coming soon)</b></summary>
Log for SQLBolt exercises.
</details>
