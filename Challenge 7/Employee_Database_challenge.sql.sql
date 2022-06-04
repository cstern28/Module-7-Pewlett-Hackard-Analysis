-- Deliverable 1
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO Retiredups
FROM employees as e
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date between '1-1-1952' and '12-31-1955'
ORDER BY e.emp_no ASC;

SELECT * FROM Retiredups

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
from_date,
to_date,
first_name,
last_name,
title

INTO RetireTitles
FROM retiredups 
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

SELECT count(title), title 
INTO CountTitles
FROM RetireTitles
GROUP BY title
ORDER BY count DESC;

-- Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date,
t.title

INTO Mentor
FROM employees AS e
INNER JOIN dept_emp AS d
ON (e.emp_no = d.emp_no)
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE d.to_date = '9999-01-01' AND (e.birth_date BETWEEN '01-01-1965' AND '12-31-1965')
ORDER BY e.emp_no ASC;

-- Deliverable 3
SELECT count(e.emp_no) 
INTO CountActiveEmp
FROM employees AS e
INNER JOIN dept_emp AS d
ON (e.emp_no = d.emp_no)
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE d.to_date = '9999-01-01' AND (e.birth_date NOT BETWEEN '01-01-1965' AND '12-31-1965')

-- Check Table
SELECT * FROM CountTitles

-- Check Table
SELECT * FROM RetireTitles

-- Drop table to-redo because had error
DROP TABLE RetireTitles CASCADE;