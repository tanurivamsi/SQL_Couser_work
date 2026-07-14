-- Constraints in my sql 
/***
1.Not Null
2.primary Key
3.check table
4.forign key
***/

-- Types of Constrains
-- 1.Column Level
-- 2.table Level 

use mysqldatabase; 

-- Not Null Constrain
create table example1(empID int Not Null,empName varchar(20),empsalary int);
desc example1;
insert into example1 value(0,"Vamsi",100000);
-- insert into example1 value(Null,"Vamsi",100000); --> Can not be Null 
select * from example1;

-- Unique Constrain --> To avoid duplicats
create table example2(empID int unique,empName varchar(20),empsalary int);
desc example2;
insert into example2 value(0,"Vamsi",100000);
-- insert into example2 value(0,"Vamsi",100000);  --> Can not be Duplicate in empID
insert into example2 value(1,"Vamsi",1000);
select * from example2;
alter table example1 add constraint uni1 unique(empID);
desc example1;

-- Composite Unique Key  : it is a table level constraine 
create table example3(empID int,empName varchar(20),emp_department int,unique(empID,empName,emp_department));
desc example3;

-- Primary Key   => It is combination of Not Null + Unique Constraints
-- It can be applied as a column level or table level
create table example4(empID int primary key,empName varchar(20),salary int);
insert into example4 values(1,"Vamsi",10000);
-- insert into example2 value(1,"Vamsi",1000); --> PrimaryKey Can not be dublicate and NotNull
desc example4;

-- Composite Primary Key
create table example5(empID int,empName varchar(20),salary int);
alter table example5 add constraint primary12 primary key(empID,empName,salary); 
desc example5;
insert into example5 values(1,"Vamsi",20000);
insert into example5 values(12,"Vamsi",20000);
-- insert into example5 values(1,"Vamsi",20000); --> composite primary key can not having dublicates and not null values in all columns
select * from example5;
-- drop table  example5;

-- Foreign Key:- It is table level constraint which is used to apply relationship between tables
/***
Before creating the foreign key to the table ,we need to creating a table with primary key ,
then we need to refer table with primary key in the creation of foreign key
1)the table with primary key is parent table
2)the table with foreign key is Child table table	
***/

create table example6(emp_ID int,empName varchar(20),salary int);
create table example7(empID int,empName varchar(20),salary int,foreign key(empID) references example6(empID)); 





