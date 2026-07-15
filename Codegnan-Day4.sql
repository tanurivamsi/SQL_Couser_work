-- 
use mysqldatabase;
create table example7(empid int primary key,empname varchar(10),salary int);
create table example8(empid int,empname varchar(10),salary int,primary key(empid,empname,salary));
alter table example8 add constraint primary12 primary key(empid);

-- CasCade --> It is used to delete and upadate Operations from foreign key table to primary key table
create table example9(EmpID int,empname varchar(10),salary int,empid int,foreign key(empid,empname,salary) references example7(empid) on delete cascade);

insert into example7 values(1,"vamsi",10000),(2,"Vamsi",1000),(3,"Vamsi",10000);
insert into example9 values(1,"vamsi",10000),(2,"Vamsi",1000),(3,"Vamsi",10000);

delete from example7 where empid = 1;
desc example7;
select * from example7;

-- Set Null 
create table example10(empid int primary key,empname varchar(10),salary int);
drop table example11;
create table example11(depID int,depname varchar(10),empid int,foreign key(empid) references example10(empid) on delete set null);
insert into example10 values(1,"vamsi",10000),(2,"Vamsi",1000),(3,"Vamsi",10000);
insert into example11 values(1,"EEE",1),(2,"Vamsi",2),(3,"CSE",3);
select * from example10;
select * from example11;

-- Check Constraint --> It is constraint applied to the values enter are vaild or not based
 
create table example12(empid int,empname varchar(10),salary int,check(salary between 1 and 1000));
create table example13(empid int,empname varchar(10),age int,check(age between 18 and 60));
-- insert into example13 values(1,"Vamsi",70); 
select * from example13;


insert into example12 values(1,"Vamsi",100);

-- Auto incriment --> it will increment the number of a primary key
create table example15(empid int auto_increment primary key,empname varchar(10),salary int);
insert into example15(empname,salary)values("vamsi",10000);
insert into example15(empname,salary)values("Venu",20000);
select * from example15;

-- creating a table from another table 
create table example14 as select empid,empname,salary from example16 ;

-- Operators 
/***
1)Arithmatic Operators --> +,-,*,/
2)Logic Operator --> AND,OR,NOT
3)Relation Operator --> <,>
***/



