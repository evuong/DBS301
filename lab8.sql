--The HR (Human Resources) department needs a list of Department IDs 
--for departments that do not contain the job ID of ST_CLERK.

SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees
WHERE UPPER(job_id) = 'ST_CLERK';

--a list of countries that have no departments located in them. 
--Display country ID and the country name. Use SET operators.

SELECT country_id, country_name
FROM countries
MINUS
SELECT country_id, country_name
FROM departments
JOIN locations USING (location_id)
JOIN countries USING (country_id);

--The Vice President needs very quickly from you a list of departments 10, 50, 20 in that order.
--Display the job id and department ID.

SELECT job_id, department_id
FROM employees
WHERE department_id = 10
UNION 
SELECT job_id, department_id
FROM employees
WHERE department_id = 50
UNION
SELECT job_id, department_id
FROM employees
WHERE department_id = 20;
