CREATE TABLE SALESREP
AS 
    SELECT employee_id "RepID", first_name, last_name, phone_number "Phone#", salary, commission_pct "Commission"
    FROM employees
    WHERE department_id = 80;
    
CREATE TABLE CUST (
    CUST#       NUMBER(6),
    CUSTNAME    VARCHAR2(30),
    CITY        VARCHAR2(20),
    RATING      CHAR(1),
    COMMENTS    VARCHAR2(200),
    SALESREP#   NUMBER(7)
);

DROP TABLE CUST;

CREATE TABLE CUST (
    CUST#       NUMBER(6),
    CUSTNAME    VARCHAR2(30)
        CONSTRAINT cust_name_NN NOT NULL,
    CITY        VARCHAR2(20)
        CONSTRAINT city_NN NOT NULL,
    RATING      CHAR(1),
    COMMENTS    VARCHAR2(200),
    SALESREP#   NUMBER(7),
    
    CONSTRAINT cust_id_PK PRIMARY KEY (CUST#),
    CONSTRAINT cust_name_uniq UNIQUE (CUSTNAME),
    CONSTRAINT rating_check CHECK (RATING IN ('A','B','C','D','G','E','F','H')),
    CONSTRAINT sales_rep_FK FOREIGN KEY (SALESREP#) REFERENCES employees(employee_id)
);

describe cust;

INSERT INTO CUST VALUES (501, 'ABC LTD', 'Montreal', 'C', NULL, 201);
INSERT INTO CUST VALUES (502, 'Black Giant', 'Ottawa', 'B', NULL, 202);
INSERT INTO CUST VALUES (503, 'Mother Goose', 'London', 'B', NULL, 202);
INSERT INTO CUST values (701, 'MIKE and SAM inc.', 'Kingston', 'A', NULL, 102);
INSERT INTO CUST VALUES (702, 'BLUE SKY LTD', 'Vancouver', 'B', NULL, 102);
INSERT INTO CUST VALUES (703, 'RED PLANET', 'Mississauga', 'C', NULL, 107);
INSERT INTO CUST VALUES (717, 'blue sky ltd', 'Regina', 'D', NULL, 102);

CREATE TABLE GOODCUST
AS
    SELECT cust# "CustId",
    custname "Name",
    city "Location",
    salesrep# "RepId"
    FROM CUST
    WHERE rating IN ('A','B');

SELECT * FROM goodcust;

ALTER TABLE salesrep
ADD JobCode VARCHAR2(12);

DESC SALESREP;

ALTER TABLE salesrep
MODIFY salary NUMBER(8,2) NOT NULL;

ALTER TABLE goodcust
DROP CONSTRAINT city_NN;

ALTER TABLE salesrep
MODIFY first_name VARCHAR2(37);

DESCRIBE salesrep;

SELECT MAX(LENGTH("Name"))
FROM goodcust;

ALTER TABLE goodcust
MODIFY "Name" VARCHAR2(17);

ALTER TABLE salesrep
SET UNUSED (jobcode);

ALTER TABLE salesrep
DROP UNUSED columns;

ALTER TABLE goodcust
ADD CONSTRAINT cust_id_PK PRIMARY KEY ("CustId");

ALTER TABLE salesrep
ADD CONSTRAINT rep_id_PK PRIMARY KEY ("RepID");

ALTER TABLE goodcust
ADD CONSTRAINT name_unique UNIQUE ("Name");

ALTER TABLE salesrep
ADD CONSTRAINT phone_uniq UNIQUE ("Phone#");

ALTER TABLE salesrep
ADD CONSTRAINT salary_range CHECK(salary BETWEEN 6000 AND 12000);

ALTER TABLE salesrep
ADD CONSTRAINT commission_range CHECK("Commission" < 0.5);

ALTER TABLE goodcust
ADD CONSTRAINT rep_id_FK FOREIGN KEY ("RepId") REFERENCES salesrep("RepID");

UPDATE goodcust
SET "RepId" = NULL;

ALTER TABLE goodcust
DISABLE CONSTRAINT rep_id_FK;

UPDATE goodcust
SET "RepId" = 202
WHERE "CustId" < 700;

UPDATE goodcust
SET "RepId" = 102
WHERE "CustId" > 700;

ALTER TABLE goodcust
DROP CONSTRAINT rep_id_FK;

ALTER TABLE salesrep
DROP CONSTRAINT salary_range;

ALTER TABLE salesrep
ADD CONSTRAINT salary_range CHECK(salary BETWEEN 5000 AND 15000);

SELECT  constraint_name, constraint_type, search_condition, table_name
FROM     user_constraints      
WHERE table_name IN ('SALESREP','GOODCUST')
ORDER  BY  4 , 2;


