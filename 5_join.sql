--------------------------------------------
-- INNER JOIN (returns only matching rows)
--------------------------------------------

-- 1:1 Relationship
SELECT employee_name, dni_number FROM employees
JOIN dnis -- INNER JOIN is the default join type
ON employees.employee_id = dnis.employee_id;

-- 1:N Relationship
SELECT employee_name, company_name FROM employees
JOIN companies
ON employees.company_id = companies.company_id;

-- N:M Relationship
SELECT employee_name, language_name FROM employees
JOIN employee_languages
ON employees.employee_id = employee_languages.employee_id
JOIN languages
ON employee_languages.language_id = languages.language_id;

--------------------------------------------
-- LEFT JOIN (returns all rows from the left table, and the matched rows from the right table)
--------------------------------------------

-- 1:1 Relationship
SELECT employee_name, dni_number FROM employees
LEFT JOIN dnis
ON employees.employee_id = dnis.employee_id;

-- 1:N Relationship
SELECT employee_name, company_name FROM employees
LEFT JOIN companies
ON employees.company_id = companies.company_id;

-- N:M Relationship
SELECT employee_name, language_name FROM employees
LEFT JOIN employee_languages
ON employees.employee_id = employee_languages.employee_id
LEFT JOIN languages
ON employee_languages.language_id = languages.language_id;

--------------------------------------------
-- RIGHT JOIN (returns all rows from the right table, and the matched rows from the left table)
--------------------------------------------

-- 1:1 Relationship
SELECT employee_name, dni_number FROM employees
RIGHT JOIN dnis
ON employees.employee_id = dnis.employee_id;

-- 1:N Relationship
SELECT employee_name, company_name FROM employees
RIGHT JOIN companies
ON employees.company_id = companies.company_id;

-- N:M Relationship
SELECT employee_name, language_name FROM employees
RIGHT JOIN employee_languages
ON employees.employee_id = employee_languages.employee_id
RIGHT JOIN languages
ON employee_languages.language_id = languages.language_id;

--------------------------------------------
-- FULL JOIN (returns all rows when there is a match in one of the tables)
--------------------------------------------

-- 1:1 Relationship
SELECT employee_name, dni_number FROM employees
LEFT JOIN dnis
ON employees.employee_id = dnis.employee_id
UNION
SELECT employee_name, dni_number FROM employees
RIGHT JOIN dnis
ON employees.employee_id = dnis.employee_id;

-- 1:N Relationship
SELECT employee_name, company_name FROM employees
LEFT JOIN companies
ON employees.company_id = companies.company_id
UNION
SELECT employee_name, company_name FROM employees
RIGHT JOIN companies
ON employees.company_id = companies.company_id;

-- N:M Relationship
SELECT employee_name, language_name FROM employees
LEFT JOIN employee_languages
ON employees.employee_id = employee_languages.employee_id
LEFT JOIN languages
ON employee_languages.language_id = languages.language_id
UNION
SELECT employee_name, language_name FROM employees
RIGHT JOIN employee_languages
ON employees.employee_id = employee_languages.employee_id
RIGHT JOIN languages
ON employee_languages.language_id = languages.language_id;
