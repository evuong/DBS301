SELECT last_name, salary, ROUND(salary*1.05), (salary*1.05-salary)*12
FROM employees
WHERE department_id IN (40, 60, 70);

SELECT TO_CHAR(sysdate+1, 'Monthddth "of year " YYYY')
FROM dual;


SELECT CASE job_id WHEN 'ST_CLERK' THEN last_name||', '||first_name||' is '||job_id
            WHEN 'ST_MAN' THEN last_name||', '||first_name||' is '||job_id
            WHEN 'SA_REP' THEN last_name||', '||first_name||' is '||job_id
ELSE job_id END "Employee+Job"
FROM employees
WHERE last_name LIKE '%s' 
AND (first_name LIKE 'C%' OR first_name LIKE 'K%')
ORDER BY last_name;

SELECT last_name, hire_date, 
CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS "Number of Years Worked"
FROM employees
WHERE hire_date BETWEEN '13-01-01' AND '13-12-31'
ORDER BY "Number of Years Worked";

SELECT last_name, hire_date, 
CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS "Number of Years Worked"
FROM employees
WHERE hire_date BETWEEN '18-01-01' AND '18-12-31'
ORDER BY "Number of Years Worked";

SELECT city, country_id,
CASE WHEN state_province IS NULL THEN 'Province Unknown'
ELSE state_province END "state_province"
FROM locations
WHERE LENGTH(city) >= 8
AND city LIKE 's%'
OR city LIKE 'S%';

SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(hire_date+365, 'Wednesday'), 'DD-MON-YY DAY, MONTH "the " fmDdspth "of year " YYYY')  AS "Salary Review Date"
FROM employees
WHERE hire_date > '2014-12-31';

