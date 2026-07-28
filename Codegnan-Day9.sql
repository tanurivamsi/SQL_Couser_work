

select * from example19;
select * from insentive;
-- multiple column sub quary
select dep,sal from example19 where (dep,sal) in (select dep,max(sal) from example19 group by dep);
-- Corelated Subquary --> Inner quary depends upon outer quary . comparision with in a single table . the inner quary executed for each row of outer quary
select e.dep,e.sal from example19 e where e.sal < (select avg(i.amount) from insentive i where i.eid = e.eid);
-- Non-Corelated subquary 
select * from example19 where sal < (select max(sal) from example19);
-- Operator(EXIST)
select e.eid,e.first_name,e.sal from example19 e where exists(select i.eid  from insentive i where e.eid = i.eid);
select e.eid,e.first_name,e.sal from example19 e where not exists(select i.eid  from insentive i where e.eid = i.eid);



