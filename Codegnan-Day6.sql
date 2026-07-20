use mysqldatabase;
-- Set Operators --> WHEN WE ADD ADD A SET OPERATORS BOTH TABLES SHOULD CONSISTS SAME ORDER OF THE COLUMNS AND DATATYBE MUST BE A COMPATABLE
/***
1) UNION -->
2) UNION ALL --> RETRIEVING ALL RECORDS FROM BOTH TABLES
3) INTERSECT --> COMMON ROWS OR RECORDS
4) EXCEPT(MINUS) 
***/
SELECT * FROM EXAMPLE16;
SELECT * FROM EXAMPLE15;
SELECT * FROM EXAMPLE13;
INSERT INTO EXAMPLE13 VALUES(4,"VANI",13323);

INSERT INTO EXAMPLE15 VALUES(2,"VANI",13323),(3,"VONI",1332),(4,"VAHI",1323);
ALTER TABLE EXAMPLE15 ADD COLUMN DEP VARCHAR(20);
SELECT * FROM EXAMPLE15 UNION SELECT * FROM EXAMPLE16;
SELECT * FROM EXAMPLE15 UNION ALL SELECT * FROM EXAMPLE16;
-- SELECT * FROM EXAMPLE15 INTERSECT SELECT * FROM EXAMPLE16;
-- SELECT * FROM EXAMPLE15 EXCEPT SELECT * FROM EXAMPLE16;

-- AGGRIGATION FUNCTIONS
/***
1) SUM() --> SUM OF ALL values
2) AVG() --> AVERAGE FROM ALL RECORDS
3) MAX() --> MAXIMUM VALUE FROM COLUMN VALUES
4) MIN() --> MINIMUM VALUE FROM COLUMN VALUES
5) COUNT() -->  COUNT OF ALL VALUES
***/

SELECT SUM(SALARY) AS TOTAL_SALARY FROM EXAMPLE16;
SELECT AVG(SALARY) AS AVERAGE_SALARY FROM EXAMPLE16;
SELECT MAX(SALARY) AS MAXIMUM_SALARY FROM EXAMPLE16;
SELECT MIN(SALARY) AS MINIMUM_SALARY FROM EXAMPLE16;
SELECT COUNT(EMPNAME) AS COUNT_SALARY FROM EXAMPLE16;

-- SYSTEM 

SELECT USER();
SELECT CONNECTION_ID();
SELECT DATABASE();

-- NUMERICAL FUNCTIONS 
/***
FUNCTIONS-----------------------------------------PURPOSE
ABS()                                             Absolute Values
CEIL()/CEILING                                    Round up
Floor()                                           Round Down
Truncate()                                        Remove decimal
MOD()                                             Remainder
Power()                                           Calculate Power 
SQRT()                                            Calculate Square root
RAND()                                            Random number
SIGN()                                            Sign of Number
Greatest()                                        Highest Value
Least()                                           lowest Vlaue
PI()                                              PI Value
Log()                                             Log value of the number
Log10()                                           log 10 value of the number
Exp()                                             exponential Value
***/
select CEIL(2.5);
select floor(2.5);
select round(2.4);
select truncate(2.4);
select rand();
select log(2.5);
select log10(2.5);
select greatest(1,3,4,5);
select least(1,3,4,5);
select exp(3);
select mod(2,133);
select sqrt(144);
select power(2,12);
select ABS(-2.4);
select sign(-2.4);


-- Interview questions
-- !)
select * from example16 where empname like "V%";
-- 2)
select * from example16 where salary between  1000 and 2000;
-- 3)
select * from example15
intersect
select * from example16;
-- 4)
select * from example15
except
select * from example16;

-- 5)
alter table example16 add column exp int;
SET sql_safe_updates = 0;
update example16 set exp = 5 where empid = 1;
select empname from example16 where exp = 5;

-- 6)
select empname from example16 where empname like "%i";






