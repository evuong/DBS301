SELECT location_id AS City#, city, state_province || ' IN THE ' || country_id AS "Province with Country Code" 
FROM locations
WHERE location_id < 1501;

SELECT employee_id, last_name, commission_pct AS "Emp Comm"
FROM employees;

describe locations;

SELECT DISTINCT department_id, job_id 
FROM employees
ORDER BY department_id;

SELECT last_name "LName", job_id "Job Title", Hire_Date "Job Start"
FROM employees;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM orderlines;