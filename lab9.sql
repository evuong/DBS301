SELECT last_name||', '||first_name "EMPLOYEE NAME"
FROM employees
WHERE salary IN (
    SELECT MIN(salary)
    FROM employees
    JOIN departments USING (department_id)
    GROUP BY department_id);

CREATE VIEW ALLEMPS AS 
SELECT employee_id, last_name, salary, department_id, department_name, city, country_id
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id)
JOIN countries USING (country_id);

SELECT employee_id, last_name, salary, city
FROM ALLEMPS;

SELECT SUM(salary), city
FROM ALLEMPS
GROUP BY city;

UPDATE ALLEMPS
SET salary = salary+100
WHERE salary IN (
    SELECT MIN(salary)
    FROM ALLEMPS
    GROUP BY department_id);

INSERT INTO ALLEMPS
VALUES (999, 'Flay', 35000, 90, 'Executive', 'Beijing', 'CN');

DELETE FROM ALLEMPS
WHERE UPPER(last_name) = UPPER('Vargas');

CREATE VIEW ALLDEPTS AS 
SELECT department_id, department_name, city, country_name
FROM departments
JOIN locations USING (location_id)
JOIN countries USING (country_id);

SELECT department_id, department_name, city
FROM ALLDEPTS;

SELECT city, COUNT(department_id)
FROM ALLDEPTS
GROUP BY city;

CREATE VIEW ALLDEPTSUMM AS
SELECT department_id, department_name, COUNT(employee_id) "NUM_EMPLOYEES", COUNT(salary) "NUM_PAID_EMPLOYEES", SUM(salary) "TOTAL SALARY"
FROM departments
JOIN employees USING (department_id)
GROUP BY department_id, department_name;

SELECT department_name, NUM_EMPLOYEES
FROM ALLDEPTSUMM
WHERE NUM_EMPLOYEES > (
    SELECT ROUND(AVG(NUM_EMPLOYEES))
    FROM ALLDEPTSUMM);

