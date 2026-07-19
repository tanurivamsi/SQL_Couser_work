use mysqldatabase;
-- Operators 
/***
1)Arithmatic Operators --> +,-,*,/
2)Logic Operator --> AND,OR,NOT
3)Relation Operator --> <,>,>=,<=,<>,=
4)Some spacial comparisions operators --> ALL , EXIST, BETWEEN,LIKE,IN
***/
-- Arithematic Operators
SET sql_safe_updates = 0;
create table example16(empid int,empname varchar(10),salary int);
INSERT into example16 values(1,"Vamsi",1000),(2,"Vasi",1000),(3,"Vasa",1000),(4,"Vane",1000);
update example16 set salary = salary+1000 where empname = "Vamsi";
update example16 set salary = salary*1000 where empname = "Vasi";
update example16 set salary = salary-1000 where empname = "Vasi";
update example16 set salary = salary/1000 where empname = "Vasa";
update example16 set salary = salary%1000 where empname = "Vane";

-- Logical Operators 
select * from example16 where empid = 1 and empname = "Vamsi";
select * from example16 where empid = 1 OR empname = "Vamsi";
select * from example16;

-- Some spacial comparisions operators --> ALL , EXIST, BETWEEN,LIKE,IN
-- Like Operator
select * from example16 where empname like "Va%" AND salary = 1000 ; -- multible characters can be anything
select * from example16 where empname like "_as" or salary = 1; -- First most character can be anything 
select * from example16 where empid in (1,2,3,4);
select * from example16 where empname in ("Vamsi","Vasa");
INSERT into example15 values(1,"Vamsi",1000);
select * from example15 where empname = ALL(select empname from example16 where empid = 1);
select * from example15 where empname = ANY(select empname from example16 where empid = 1);
select * from example15 where empname = ALL(select empname from example16);
select * from example15 where empname = ANY(select empname from example16);
alter table example16 add column department varchar(10);
select * from example16;
update example16 set department = "DataEngi" where empid = 1;
update example16 set department = "Datasce" where empid = 2;
update example16 set department = "Datasce" where empid = 3;
update example16 set department = "DataEngi" where empid = 4;
-- Clauses in MYsql
/***
1) Where Clause
1) Orderby Clause --> To arrange the data in ascending or descending order alter
1) group by Clause -- Grouping the column catogery
1) Having Clause
***/
-- Order by --> To arrange the data in ascending or descending order alter
select * from example16 order by empid desc; 
select * from example16 order by empname desc; 

-- Group by Clause
select department,sum(salary) from example16 group by department;
-- Having Clause
select department,sum(salary) as Sum_of_salaries from example16 group by department having sum(salary)>10000;



