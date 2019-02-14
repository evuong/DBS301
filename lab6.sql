SET PAGESIZE 200;
SET AUTOCOMMIT ON;

INSERT INTO EMPLOYEES
VALUES (333, 'Edward', 'Vuong', 'EVUONG1', '416.322.1234', SYSDATE, 'AD_VP', NULL, 0.2, NULL, 90);

UPDATE EMPLOYEES
SET salary = 2500
WHERE last_name IN ('Matos', 'Whalen');

SELECT last_name 
FROM employees
WHERE department_id =
    (SELECT department_id
    FROM employees
    WHERE last_name = 'Abel');

SELECT last_name||', '||first_name
FROM employees
WHERE salary = 
    (SELECT MIN(salary)
    FROM employees);
    
SELECT last_name||', '||first_name, city
FROM employees JOIN departments USING (department_id)
JOIN locations USING (location_id)
WHERE salary = 
    (SELECT MIN(salary)
    FROM employees);

SELECT last_name||', '||first_name, department_id
FROM employees
WHERE (salary, department_id) IN
    (SELECT MIN(salary), department_id
    FROM employees
    GROUP BY department_id)
ORDER BY department_id;


SELECT last_name, city
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id)
WHERE (salary, city) IN 
    (SELECT MIN(salary), city
    FROM employees
    JOIN departments USING (department_id)
    JOIN locations USING (location_id)
    GROUP BY city);

SELECT last_name, salary
FROM employees
WHERE salary < ANY 
    (SELECT MIN(salary)
    FROM employees
    GROUP BY department_id)
ORDER BY salary DESC, last_name;

SELECT last_name, job_id, salary
FROM employees
WHERE salary IN 
    (SELECT salary
    FROM employees
    WHERE department_id = 60)
ORDER BY salary, last_name;