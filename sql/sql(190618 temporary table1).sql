use employees;

CREATE TEMPORARY TABLE IF NOT EXISTS tempTBL (id INT, name CHAR(5));

DESCRIBE tempTBL;
DESCRIBE employees;
-- 원래 존재하는 employees 를 불러온다.

INSERT INTO tempTBL VALUES (1, 'This');

SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM employees;