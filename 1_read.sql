--------------------------------------------
-- SELECT (retrieves data from a table)
--------------------------------------------

/*
  SELECT is used to retrieve data from a table.
  The * character is used to retrieve all columns.
  The column names are used to retrieve specific columns.
*/

SELECT * FROM users; -- * means all columns

SELECT name FROM users; -- retrieves only the name column

SELECT user_id, name FROM users; -- retrieves only the user_id and name columns

--------------------------------------------
-- DISTINCT (removes duplicates)
--------------------------------------------

SELECT DISTINCT age FROM users; -- retrieves only the unique ages

--------------------------------------------
-- WHERE (filters rows)
--------------------------------------------

SELECT * FROM users WHERE age = 25; -- retrieves all columns where age is 25

SELECT name FROM users WHERE age = 25; -- retrieves the name column where age is 25

SELECT * FROM users WHERE age > 25; -- retrieves all columns where age is greater than 25
SELECT * FROM users WHERE age < 25; -- retrieves all columns where age is less than 25

SELECT * FROM users WHERE age >= 25; -- retrieves all columns where age is greater than or equal to 25
SELECT * FROM users WHERE age <= 25; -- retrieves all columns where age is less than or equal to 25

SELECT * FROM users WHERE age <> 25; -- retrieves all columns where age is not equal to 25 (standard SQL)
SELECT * FROM users WHERE age != 25; -- retrieves all columns where age is not equal to 25

SELECT DISTINCT age FROM users WHERE age > 25; -- retrieves only the unique ages where age is greater than 25

--------------------------------------------
-- ORDER BY (sorts rows)
--------------------------------------------

SELECT * FROM users ORDER BY age; -- retrieves all columns and sorts by age in ascending order (default)

SELECT * FROM users ORDER BY age DESC; -- retrieves all columns and sorts by age in descending order

SELECT * FROM users WHERE age > 25 ORDER BY age DESC; -- retrieves all columns where age is greater than 25 and sorts by age in descending order

--------------------------------------------
-- LIKE (matches patterns)
--------------------------------------------

SELECT * FROM users WHERE email LIKE '%@gmail.com'; -- retrieves all columns where email ends with @gmail.com

SELECT * FROM users WHERE email LIKE 'john%'; -- retrieves all columns where email starts with john

SELECT * FROM users WHERE email LIKE '%@%'; -- retrieves all columns where email contains @

--------------------------------------------
-- AND, OR, NOT (logical operators)
--------------------------------------------

SELECT * FROM users WHERE age > 25 AND email LIKE '%@gmail.com'; -- retrieves all columns where age is greater than 25 and email ends with @gmail.com

SELECT * FROM users WHERE age > 25 OR email LIKE '%@gmail.com'; -- retrieves all columns where age is greater than 25 or email ends with @gmail.com

SELECT * FROM users WHERE NOT age = 25; -- retrieves all columns where age is not equal to 25

--------------------------------------------
-- LIMIT (limits rows)
--------------------------------------------

SELECT * FROM users LIMIT 5; -- retrieves the first 5 rows (default is ascending order)

SELECT * FROM users ORDER BY age DESC LIMIT 5; -- retrieves the first 5 rows sorted by age in descending order

--------------------------------------------
-- NULL (checks for null)
--------------------------------------------

SELECT * FROM users WHERE email IS NULL; -- retrieves all columns where email is null

SELECT * FROM users WHERE email IS NOT NULL; -- retrieves all columns where email is not null

--------------------------------------------
-- MIN, MAX, AVG, SUM, COUNT (aggregate functions)
--------------------------------------------

SELECT MIN(age) FROM users; -- retrieves the minimum age
SELECT MAX(age) FROM users; -- retrieves the maximum age

SELECT AVG(age) FROM users; -- retrieves the average age

SELECT SUM(age) FROM users; -- retrieves the sum of ages

SELECT COUNT(*) FROM users; -- retrieves the total number of rows
SELECT COUNT(age) FROM users; -- retrieves the number of non-null ages

--------------------------------------------
-- IN (checks for multiple values)
--------------------------------------------

SELECT * FROM users WHERE age IN (25, 30); -- retrieves all columns where age is 25 or 30

SELECT * FROM users WHERE age NOT IN (25, 30); -- retrieves all columns where age is not 25 or 30

SELECT * FROM users WHERE name IN ('Alice', 'Bob'); -- retrieves all columns where name is Alice or Bob

--------------------------------------------
-- BETWEEN (checks for a range of values)
--------------------------------------------

SELECT * FROM users WHERE age BETWEEN 25 AND 30; -- retrieves all columns where age is between 25 and 30

SELECT * FROM users WHERE age NOT BETWEEN 25 AND 30; -- retrieves all columns where age is not between 25 and 30

--------------------------------------------
-- AS (aliases columns or tables)
--------------------------------------------

SELECT name AS full_name FROM users; -- aliases the name column as full_name

--------------------------------------------
-- CONCAT (concatenates strings)
--------------------------------------------

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users; -- concatenates first_name and last_name with a space in between

--------------------------------------------
-- GROUP BY (groups rows)
--------------------------------------------

SELECT age, COUNT(*) FROM users GROUP BY age; -- groups by age and counts the number of rows for each age

--------------------------------------------
-- HAVING (filters groups)
--------------------------------------------

SELECT age, COUNT(*) FROM users GROUP BY age HAVING COUNT(*) > 1; -- groups by age and counts the number of rows for each age, then filters groups with more than 1 row

--------------------------------------------
-- CASE (conditional logic)
--------------------------------------------

SELECT
  CASE
    WHEN age < 18 THEN 'Minor'
    WHEN age >= 18 AND age < 65 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group
FROM users; -- assigns age groups based on age

--------------------------------------------
-- IFNULL (replaces null values)
--------------------------------------------

SELECT IFNULL(email, 'N/A') FROM users; -- replaces null values in email with 'N/A'
