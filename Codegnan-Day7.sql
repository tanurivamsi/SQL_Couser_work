-- Joins -->Combining two or more tables of commom column
-- Types of Joins
/***
1) inner Join 
2) natural join
3) equi join 
4) non-equi join
5) self Join
6) left outer join
7) right outer join
8) full outer join
9) Cross join --> the product of rows in both the tables
***/

use mysqldatabase;
drop table example17;
create table example17(pid int auto_increment primary key, pname varchar(20),dob date,doj date,gender varchar(10),prof1 varchar(20),prof2 varchar(20),sal int);
insert into example17(pname,dob,doj,gender,prof1,prof2,sal) values
("vamsi","2006-12-11","2026-02-11","Male","Data Engineer","Data Analyst",100000),
("vani","2006-11-11","2026-03-11","Femal","Developer","Data Analyst",100000),
("venu","2004-04-11","2026-04-11","Male","Software Engineer","Data Analyst",100000) ;
select * from example17;
drop table example18;
create table example18(pid int auto_increment primary key,pname varchar(20),title varchar(20),devin varchar(20),scost numeric,dcost numeric,sold numeric,sal int);
insert into example18(pname,title,devin,scost,dcost,sold,sal) values
("vamsi","Data Engineer","Python","10000","122990","1000000",12122),
("vani","Data Analyst","Python","100200","12290","10000",123232),
("venu","Data Science","Python","101000","12990","10000",1232323) ;
select * from example18;


-- 1) Cross Join 
select e1.pid,e1.pname,e2.pid,e2.pname from example17 e1 cross join example18 e2;
-- 2) Inner Join
select e1.pid,e1.pname,e2.pid,e2.pname from example17 e1 cross join example18 e2 on e1.pid=e2.pid;
-- 3) natural join --> common column should be match
select e1.pid,e1.pname,e2.pid,e2.pname from example17 e1 natural join example18 e2;
-- 4) equi Join --> Equal Operator
select e1.pid,e1.pname,e2.pid,e2.pname from example17 e1,example17 e2 where e1.pid = e2.pid;
-- 5) Non-equi join --> Not Equal Operator
select e1.pid,e1.pname,e2.pid,e2.pname from example17 e1,example17 e2 where e1.pid != e2.pid;
select e1.pid,e1.pname,e2.pid,e2.pname from example17 e1,example17 e2 where e1.pid <> e2.pid;


-- Example
/***
1) How many programmers have done the DCA Course
2) How much revenue has been earned through the sales of packages developed in c.
3) display the details of software developed by rakesh
***/


