--------------------------------------------
-- INSERT (inserts data into a table)
--------------------------------------------

/*
  INSERT is used to insert data into a table.
  The VALUES keyword is used to specify the values to be inserted.
  The values must be in the same order as the columns in the table.
*/

INSERT INTO users (name, age, email) VALUES ('Alice', 25, 'alice@example.com'); -- Insert a single row

--------------------------------------------
-- UPDATE (updates data in a table)
--------------------------------------------

/*
  UPDATE is used to update existing data in a table.
  The SET keyword is used to specify the columns to be updated.
  The WHERE keyword is used to specify the rows to be updated.
*/

UPDATE users SET age = 26 WHERE name = 'Alice'; -- Update a single row

--------------------------------------------
-- DELETE (deletes data from a table)
--------------------------------------------

/*
  DELETE is used to delete data from a table.
  The WHERE keyword is used to specify the rows to be deleted.
*/

DELETE FROM users WHERE name = 'Alice'; -- Delete a single row
