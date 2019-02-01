SELECT department_id, MIN(hire_date), MAX(hire_date)
FROM employees
GROUP BY department_id
HAVING MAX(hire_date) < '2000-01-01' AND (department_id = 20 OR department_id > 40)
ORDER BY MAX(hire_date) DESC;

SELECT country_name, LENGTH(country_name)
FROM countries
ORDER BY LENGTH(country_name) DESC;

SELECT job_id, ROUND(salary/12)
FROM employees
WHERE salary >= 15000
AND LOWER(job_id) NOT LIKE '%pres'
AND LOWER(job_id) NOT LIKE '%vp'
ORDER BY salary;

SELECT country_name
FROM countries
WHERE LOWER(country_name) LIKE LOWER('&letter%');

SELECT NEXT_DAY(SYSDATE, 'SATURDAY') "Next Saturday"
FROM dual;

SELECT REPLACE(LOWER(country_name), 'a', ' ')
FROM countries;

SELECT department_id, MAX(salary), MIN(salary), ROUND(AVG(salary))
FROM employees
GROUP BY department_id
ORDER BY avg(salary) DESC;

SELECT ROUND(AVG(salary)-MIN(salary)) "The Gap"
FROM employees;

SELECT department_id "No.", job_id "Job", COUNT(job_id) "How Many"
FROM employees
GROUP BY department_id, job_id
HAVING COUNT(job_id) > 1
ORDER BY COUNT(job_id) DESC;

SELECT TO_CHAR(SYSDATE-10, 'DAY YYYY-MM-DD')
FROM dual;

SELECT * FROM countries
WHERE LOWER(country_name) LIKE LOWER('&EnterLetter%');

SELECT department_id, employees.job_id, COUNT(job_id)
FROM employees
GROUP BY department_id, job_id
HAVING COUNT(job_id) > 2
ORDER BY department_id, job_id;

SELECT employees.department_id, department_name, MAX(salary)
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
GROUP BY employees.department_id, department_name
ORDER BY department_id;

SELECT manager_id, COUNT(employee_id)
FROM employees
GROUP BY manager_id
HAVING manager_id > 102
AND COUNT(employee_id) > 2
ORDER BY COUNT(employee_id) DESC;

SELECT prod_no, SUM(price*qty)
FROM orderlines
GROUP BY prod_no
HAVING prod_no BETWEEN 50000 AND 59999
ORDER BY prod_no;




