use employees;

CREATE TEMPORARY TABLE IF NOT EXISTS employees (id INT, name CHAR(5));

DESCRIBE tempTBL;
DESCRIBE employees;

INSERT INTO tempTBL VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MySQL');

SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM employees;