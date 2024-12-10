--------------------------------------------
-- CREATE TABLE (creates a table)
--------------------------------------------

/*
  CREATE TABLE is used to create a new table.
  The table name is specified after the CREATE TABLE keywords.
  The columns are specified in parentheses.
  Each column is specified by a name and a data type.
  The PRIMARY KEY constraint is used to specify the primary key column.
*/

CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT, -- Auto-increment ID
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  age INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Auto-timestamp

  PRIMARY KEY (user_id), -- Primary key ensures uniqueness for ID
  UNIQUE (email), -- Ensure unique emails
  CHECK (age >= 18) -- Validate age if using MySQL 8.0+
);

--------------------------------------------
-- ALTER TABLE (modifies a table)
--------------------------------------------

/*
  ALTER TABLE is used to modify an existing table.
  The table name is specified after the ALTER TABLE keywords.
  The ADD COLUMN keyword is used to add a new column.
  The RENAME COLUMN keyword is used to rename a column.
  The MODIFY COLUMN keyword is used to modify an existing column.
  The DROP COLUMN keyword is used to delete a column.
*/

ALTER TABLE users
ADD COLUMN last_name VARCHAR(100) NOT NULL; -- Add last_name column

ALTER TABLE users
RENAME COLUMN name TO first_name; -- Rename name to first_name

ALTER TABLE users
MODIFY COLUMN last_name VARCHAR(150) NOT NULL; -- Change last_name length

ALTER TABLE users
DROP COLUMN last_name; -- Delete last_name column

--------------------------------------------
-- DROP TABLE (deletes a table)
--------------------------------------------

/*
  DROP TABLE is used to delete a table.
  The table name is specified after the DROP TABLE keywords.
*/

DROP TABLE users;

--------------------------------------------
-- Relationships in SQL
--------------------------------------------

/*
  Relationships in SQL are used to define how tables are connected to each other.
  There are three main types of relationships: 1:1, 1:N, and N:M.
  These relationships are established using foreign keys.
*/

--------------------------------------------
-- 1:1 Relationship
--------------------------------------------

/*
  A 1:1 relationship is a relationship where one record in a table is associated with exactly one record in another table.
  In this type of relationship, a foreign key is used to link the two tables.
*/

CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_name VARCHAR(100) NOT NULL,
  employee_email VARCHAR(255) NOT NULL UNIQUE,
  employee_age INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

  CHECK (employee_age >= 18)
);

CREATE TABLE dnis (
  dni_id INT PRIMARY KEY AUTO_INCREMENT,
  dni_number VARCHAR(15) NOT NULL UNIQUE,
  employee_id INT NOT NULL UNIQUE,

  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

--------------------------------------------
-- 1:N Relationship
--------------------------------------------

/*
  A 1:N relationship is a relationship where one record in a table is associated with one or more records in another table.
  In this type of relationship, a foreign key is used to establish the connection between the tables.
*/

CREATE TABLE companies (
  company_id INT PRIMARY KEY AUTO_INCREMENT,
  company_name VARCHAR(100) NOT NULL
);

ALTER TABLE employees ADD COLUMN company_id INT;

ALTER TABLE employees ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

--------------------------------------------
-- N:M Relationship
--------------------------------------------

/*
  An N:M relationship is a relationship where one record in a table is associated with one or more records in another table, and vice versa.
  In this case, a third table, known as a junction table, is used to link the two tables.
*/

CREATE TABLE languages (
  language_id INT PRIMARY KEY AUTO_INCREMENT,
  language_name VARCHAR(100) NOT NULL
);

CREATE TABLE employee_languages (
  employee_id INT,
  language_id INT,

  PRIMARY KEY (employee_id, language_id),

  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (language_id) REFERENCES languages(language_id)
);

--------------------------------------------
-- Self Join
--------------------------------------------

/*
  A self join is a join where a table is joined with itself.
  This is used to compare rows within the same table.
*/

ALTER TABLE employees ADD COLUMN manager_id INT;

ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
