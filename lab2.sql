SELECT employee_id, last_name || ', ' || first_name AS "Employee Name", salary
FROM employees
WHERE salary BETWEEN 9000 AND 10500
ORDER BY salary DESC, last_name;

SELECT employee_id, last_name || ', ' || first_name AS "Employee Name", salary, job_id
FROM employees
WHERE salary BETWEEN 9000 AND 10500
AND job_id in ('IT_PROG', 'SA_REP')
ORDER BY salary DESC, last_name;

SELECT employee_id, last_name, salary, job_id
FROM employees
WHERE salary >= 10500
OR salary <= 9000
AND job_id in ('IT_PROG', 'SA_REP')
ORDER BY salary DESC, last_name;

SELECT job_id, first_name || ' ' || last_name "Employee Name"
FROM employees
WHERE first_name LIKE '%e%'
AND (first_name LIKE '%a%'
OR first_name LIKE '%g%');

SELECT last_name, salary, commission_pct, salary*(1+commission_pct)
FROM employees
WHERE commission_pct IS NOT null
AND employee_id > 100
ORDER BY salary DESC;