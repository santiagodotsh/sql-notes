--------------------------------------------
-- INDEX (optimizes query performance)
--------------------------------------------

/*
  An index is a data structure that speeds up data retrieval on one or more columns.
  It improves query performance, especially for SELECT, WHERE, JOIN, and ORDER BY operations.
  Use CREATE INDEX to define an index, balancing performance gains with storage and update costs.
*/

-- CREATE INDEX
CREATE INDEX idx_employee_name ON employees (employee_name); -- Index on employee_name column

-- CREATE UNIQUE INDEX
CREATE UNIQUE INDEX idx_employee_email ON employees (employee_email); -- Unique index on employee_email column

-- CREATE COMPOSITE INDEX
CREATE INDEX idx_employee_name_email ON employees (employee_name, employee_email); -- Composite index on employee_name and employee_email columns

-- EXECUTE INDEX
SELECT * FROM employees WHERE employee_name = 'Alice'; -- Query using index on employee_name column
SELECT * FROM employees WHERE employee_email = 'alice@example.com'; -- Query using index on employee_email column
SELECT * FROM employees WHERE employee_name = 'Alice' AND employee_email = 'alice@example.com'; -- Query using composite index on employee_name and employee_email columns

-- DROP INDEX
DROP INDEX idx_employee_name ON employees; -- Drop index on employee_name column
DROP INDEX idx_employee_email ON employees; -- Drop index on employee_email column
DROP INDEX idx_employee_name_email ON employees; -- Drop composite index on employee_name and employee_email columns

--------------------------------------------
-- TRIGGER (executes automatically on an event)
--------------------------------------------

/*
  A trigger is a database object that automatically executes in response to certain events on a particular table.
  Use CREATE TRIGGER to define a trigger, specifying the event, timing, and action.
  Triggers can be used to enforce business rules, audit changes, and maintain data integrity.
*/

-- CREATE TRIGGER
CREATE TRIGGER trg_employee_email_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
  IF NEW.employee_email <> OLD.employee_email THEN
    INSERT INTO employee_email_history (employee_id, old_email)
    VALUES (OLD.employee_id, OLD.employee_email);
  END IF;
END;

-- EXECUTE TRIGGER
UPDATE employees SET employee_email = 'alice@test.com' WHERE employee_id = 1;

-- DROP TRIGGER
DROP TRIGGER trg_employee_email_update;

--------------------------------------------
-- VIEW (virtual table)
--------------------------------------------

/*
  A view is a virtual table that represents the result of a SELECT query.
  It simplifies complex queries, hides sensitive data, and provides a consistent interface.
  Use CREATE VIEW to define a view, specifying the query that defines the view's contents.
*/

-- CREATE VIEW
CREATE VIEW employee_details AS
SELECT employee_id, employee_name, employee_email
FROM employees
WHERE employee_age > 20;

-- EXECUTE VIEW
SELECT * FROM employee_details;

-- DROP VIEW
DROP VIEW employee_details;

--------------------------------------------
-- STORED PROCEDURE (predefined SQL logic)
--------------------------------------------

/*
  A stored procedure is a set of SQL statements that perform a specific task or operation.
  It encapsulates business logic, improves code reusability, and enhances security.
  Use CREATE PROCEDURE to define a stored procedure, specifying input/output parameters and logic.
*/

-- CREATE PROCEDURE
CREATE PROCEDURE sp_get_employee_details (IN emp_id INT)
BEGIN
  SELECT employee_name, employee_email
  FROM employees
  WHERE employee_id = emp_id;
END;

-- EXECUTE PROCEDURE
CALL sp_get_employee_details(1);

-- DROP PROCEDURE
DROP PROCEDURE sp_get_employee_details;

--------------------------------------------
-- TRANSACTION (group of SQL statements)
--------------------------------------------

/*
  A transaction is a group of SQL statements that are executed as a single unit of work.
  It ensures data consistency, integrity, and isolation, with the ability to commit or rollback changes.
  Use BEGIN TRANSACTION to start a transaction, COMMIT to save changes, and ROLLBACK to undo changes.
*/

-- BEGIN TRANSACTION
BEGIN TRANSACTION;

-- SQL STATEMENTS
UPDATE employees SET employee_salary = employee_salary + 1000 WHERE employee_id = 1;
DELETE FROM employee_email_history WHERE employee_id = 1;

-- COMMIT TRANSACTION
COMMIT;

-- ROLLBACK TRANSACTION
ROLLBACK;

--------------------------------------------
-- CONCURRENCY CONTROL (manage data access)
--------------------------------------------

/*
  Concurrency control is the process of managing simultaneous access to shared data in a database.
  It prevents conflicts, ensures data consistency, and maintains data integrity.
  Use locking mechanisms, isolation levels, and transaction management to control concurrency.
*/

-- LOCKING MECHANISMS
SELECT * FROM employees WITH (TABLOCKX); -- Exclusive lock on employees table
SELECT * FROM employees WITH (TABLOCK); -- Shared lock on employees table
SELECT * FROM employees WITH (UPDLOCK); -- Update lock on employees table
SELECT * FROM employees WITH (XLOCK); -- Exclusive lock on employees table

-- ISOLATION LEVELS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; -- Allows dirty reads
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Prevents dirty reads
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Prevents non-repeatable reads
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Prevents phantom reads

-- TRANSACTION MANAGEMENT
BEGIN TRANSACTION; -- Start a transaction
COMMIT; -- Save changes
ROLLBACK; -- Undo changes
