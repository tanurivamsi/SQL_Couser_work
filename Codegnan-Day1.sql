create database mysqldatabase; -- creating DataBases
show databases;            -- Display the DataBases
use mysqldatabase;      -- Using current DataBases
show tables;            -- Displaying Tables in the current database

-- Performing Commands
-- 1) DDL (Data Defination Language) --> Create,alter,truncate,drop,rename
-- 2) DML (Data Manipulation Language) -->insert,delete,update
-- 3) DCL (Data control Language) --> Grant,revoke
-- 4) TCL (Transaction Control Language) --> Commit,rollback and savepoint
-- 5) DQL (Data Query Language)  --> Select

-- 6) DataTypes
-- 6.1) int
-- 6.2) varchar
-- 6.3) blob
-- 6.4) date
-- 6.5) decimal

 


-- 1.1) Create Command to create table
create table commands(id int(10),command varchar(20),operations varchar(20));
desc commands; -- Description of table 
drop table  commands;
select * from commands;
