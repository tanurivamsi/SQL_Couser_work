-- DML Commands
use mysqldatabase;
create table employee_d(
employee_id int(3),
employee_name varchar(20),
designation varchar(20),
salary int(10)
);

insert into employee_d values(01,"Vamsi","Data Engineer",100000);
insert into employee_d values(01,"Vamsi","Data Engineer",100);
insert into employee_d values(01,"Vamsi","Data Engineer",1010);
insert into employee_d values(01,"Vamsi","Data Engineer",101100);
select * from employee_d;

-- Clauses in mysql 
/***
1) Where clause
2) order by
3) Group by
4) Having

***/
SET sql_safe_updates = 0;
-- Where clause
delete from employee_d where salary = 100;
truncate table employee_d;
desc employee_d;

-- Update command
-- it is a DML command to update a value by using Where clause
update employee_d set salary = 20000 where salary = 100;

-- alter command : It is a ddl command to alter the table like:
-- adding,deleting,changing datatype,adding contrains
-- Syntax
-- alter table <table Name> add (<column-name> datatype);
alter table employee_d add (domain varchar(20));
update employee_d set domain = "Finace" where salary >= 100000;
update employee_d set domain = "Health Care" where salary < 100000;

select * from employee_d;

-- Dropping specific column using alter
alter table employee_d drop column designation;
-- Modifying column datatype using alter command 
alter table employee_d modify column employee_id integer;
desc employee_d;
