SELECT  last_name||', '||first_name "NAME",
        hire_date,
        salary,
        department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE   (department_name LIKE 'A%' OR
        department_name LIKE 'S%') AND
        department_name LIKE '%g';

SELECT department_name, city, street_address, postal_code
FROM departments d JOIN locations l
ON d.location_id = l.location_id
ORDER BY city, department_name;

SELECT DISTINCT m.last_name||', '||m.first_name "MANAGER_NAME",
        department_name,
        city,
        postal_code,
        state_province
FROM employees m JOIN employees e
ON e.manager_id = m.employee_id
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
ORDER BY city, department_name;

SELECT e.manager_id "MGR#", m.last_name "MANAGER", e.employee_id "EMP#", e.last_name "EMPLOYEE"
FROM employees m JOIN employees e
ON e.manager_id = m.employee_id
ORDER BY e.manager_id;

SELECT l.*, country_name
FROM locations l JOIN countries c
ON l.country_id = c.country_id;

SELECT employee_id, last_name, job_id, department_id, grade
FROM employees e JOIN job_grades j
ON salary BETWEEN LOWEST_SAL AND HIGHEST_SAL;

SELECT e.employee_id, e.first_name, e.manager_id, m.first_name "MANAGER_NAME"
FROM employees e JOIN employees m
ON m.employee_id = e.manager_id
WHERE e.employee_id BETWEEN 30 AND 110
ORDER BY e.employee_id;

SELECT employee_id, last_name, department_name, city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
ORDER BY employee_id;

SELECT city, last_name||', '||first_name "NAME"
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
ORDER BY city;

SELECT employee_id, city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
FULL OUTER JOIN locations l
ON d.location_id = l.location_id
ORDER BY city;
