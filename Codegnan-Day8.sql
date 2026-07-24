-- subQuary --> It defines as  Quary inside a quary
-- Types of subquaries 
/***
1) single row subquary --> 
2) multiple row subquary
3) multiple column subquary
4) corelated Subquary
5) 
***/
select * from example17;
select * from example18;
--  SINGLE ROW 
select pname,title,sal from example18 where sid = (select pid from example17 where pid = 1);
select max(sal) as second_max_sal from example18 WHERE  sal < (select max(sal) from example18);
select max(sal) as Third_max_sal from example18 WHERE  sal < (select max(sal) from example18  WHERE  sal < (select max(sal) from example18));
-- Multiple row subquary
select sid,pname,title,sal from example18 where sid =any(select pid from example17 where pid > 1);
select sid,pname,title,sal from example18 where sid =all(select pid from example17 where pid = 1);

use mysqldatabase;
-- 
create table example19(eid int,first_name varchar(20),last_name varchar(20),sal int,doj date,dep varchar(20));
insert into example19 values(1,"vamsi","tanuri",200000,"2022-12-1","Banking"),(2,"vasi","tanri",2000,"2022-02-1","Insurence")
,(3,"ramsi","tanai",200022,"2023-12-1","Banking"),(4,"vasu","tanu",20000,"2022-12-1","Insurence");
create table insentive(eid int,doi date,amount int);
insert into insentive values(1,"2022-11-1",200330),(2,"2012-12-1",20330)
,(3,"2022-12-1",20330),(4,"2022-1-12",20030);
select * from example19;
select * from insentive;
-- 1)
select substr(first_name,3) from example19;
-- 2)
select lower(first_name) from example19;
select upper(first_name) from example19;
-- 3)
select * from example19 where  first_name like "%u";
-- 4) 
select length(first_name) as size_of_string from example19;
-- 5)
select concat(first_name,"_",last_name) as Concatination from example19;
-- 6)
select replace(first_name,"i","u") as Concatination from example19;
-- 7)
select * from example19 where  doj < "2023-01-01";
