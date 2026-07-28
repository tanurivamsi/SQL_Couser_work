-- View 
/***
To create Virtual Tables and temporary tables and where it can not dublicates the data
* TYPES OF VIEWS:- 
1) Simple View --> It is a view to create single table . while adding a data to it
2) Complex view -->  It is a view which is created by adding a data more then one table
* SYNTAX OF VIEW
CREATE VIEW <VIEW-NAME> AS SELECT <COLUMN-NAMES> FROM <TABLE-NAME> <CONDITION>
***/
use mysqldatabase;
select * from example19;
DROP VIEW V1;
create view v1 as select first_name,sal,dep from example19 where SAL > 10000;
SELECT * FROM V1;
-- INSERTION ON VIEW 
insert into v1 values("vamsi1",2000,"Finance");
SELECT * FROM V1;
-- DELETION ON VIEW 
delete from v1 where sal = 2000;
select * from example19;
-- UPDATE ON VIEW 
update v1 set sal = 1000 where sal = 2000;
select * from example19;
SELECT * FROM V1;

-- Create complex view
select * from example18;
select * from example19;
create view v2 as select e.sid,e.title,e.sal,d.first_name,d.dep from example18 e,example19 d where e.sid = d.eid;
select * from v2;

-- joins in views
create view v3 as select e.sid,e.title,e.sal,d.first_name,d.dep from example18 e inner join example19 d where e.sid = d.eid;
select * from v3;

-- Corelated subquary
create view v4 as select e.sid,e.title,e.sal from example18 e where e.sal = (select d.eid from example19 d where e.sid = d.eid);
select * from v4;

desc v3;


