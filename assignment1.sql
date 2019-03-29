SELECT cust_no, cname, country_cd
FROM customers
WHERE country_cd LIKE UPPER('&input')
AND country_cd = 'BE';

SELECT cust_no, cname, order_no
FROM customers 
    JOIN orders USING (cust_no) 
    JOIN orderlines USING (order_no)
WHERE cust_type = 'GO Outlet'
AND prod_no IN (40303, 40301, 40306)
ORDER BY cust_no;

SELECT cust_no, cname, order_no
FROM customers 
    JOIN orders USING (cust_no) 
    JOIN orderlines USING (order_no)
WHERE prod_no IN (40310, 40303, 60101)
AND cust_no > 1140
ORDER BY order_no;


SELECT cust_no, cname, order_no, prod_name, price*qty "SALES"
FROM customers 
    RIGHT JOIN orders USING (cust_no) 
    JOIN orderlines USING (order_no) 
    RIGHT JOIN countries ON country_cd = country_id
    JOIN products USING (prod_no)
WHERE UPPER(country_name) = UPPER('&input')
    AND city LIKE 'L%'
    AND UPPER(country_name) = UPPER('United Kingdom')
ORDER BY cust_no DESC;

SELECT cname, order_no, SUM(price*qty)
FROM customers 
    RIGHT JOIN orders USING (cust_no) 
    JOIN orderlines USING (order_no)
WHERE city = 'London'
GROUP BY cname, order_no
ORDER BY SUM(price*qty) DESC;

SELECT order_dt, COUNT(order_no)
FROM orders
WHERE TO_DATE(order_dt, 'DD-Mon-YYYY') BETWEEN TO_DATE('01-Jan-2015', 'DD-Mon-YYYY') AND TO_DATE('31-Dec-2015', 'DD-Mon-YYYY')
GROUP BY order_dt
HAVING COUNT(order_no) > 1;


SELECT cust_no, cname, country_name
FROM customers 
    RIGHT JOIN orders USING (cust_no) 
    FULL JOIN countries ON country_cd = country_id
WHERE country_name IN ('Canada', 'United Kingdom')
AND TO_DATE(order_dt, 'DD-Mon-YYYY') BETWEEN TO_DATE('01-Jan-2014', 'DD-Mon-YYYY') AND TO_DATE('31-Dec-2014', 'DD-Mon-YYYY');

SELECT SUM(COUNT(cust_no))||' customers have not placed an order' "COUNT"
FROM customers
WHERE cust_no NOT IN
    (SELECT cust_no
    FROM customers)
GROUP BY cust_no;


SELECT cust_no, cname, country_name
FROM customers 
    LEFT JOIN countries ON country_cd = country_id
WHERE country_cd IN (SELECT country_cd FROM customers WHERE cname LIKE 'Supras%')
AND (cname LIKE 'A%' OR cname LIKE 'B%');

SELECT employee_id, last_name, job_id,
        CASE        WHEN job_id LIKE '%VP' THEN salary*1.3
                    WHEN job_id LIKE '%MAN' THEN salary*1.2
                    WHEN job_id LIKE '%MGR' THEN salary*1.2
        ELSE salary END "NEWSALARY"
FROM employees
WHERE salary NOT BETWEEN 6000 AND 11000
AND (job_id LIKE '%VP' OR job_id LIKE '%MAN' OR job_id LIKE '%MGR')
ORDER BY salary DESC;

SELECT department_id, job_id, MIN(salary)
FROM employees
WHERE salary BETWEEN 6000 AND 18000
AND job_id NOT LIKE '%REP'
AND job_id NOT LIKE 'IT%'
AND job_id NOT LIKE 'SA%'
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

SELECT last_name, salary, job_id
FROM employees
WHERE salary > ALL
    (SELECT MIN(salary)
    FROM employees
    LEFT JOIN departments USING (department_id) 
    JOIN locations USING (location_id)
    WHERE country_id <> 'US'
    GROUP BY department_id, country_id)
AND job_id NOT LIKE '%PRES'
AND job_id NOT LIKE '%VP'
ORDER BY job_id;