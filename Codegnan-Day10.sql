-- DCL Commands
use mysqldatabase;


show tables;
grant all on mysqldatabase.example10 to 'root@localhost';
select current_user();
show grants for 'root@localhost'; 

alter user 'root@localhost' identified by 'password';

-- revoke --> It is command to remove the the privilages from particular user.
/***
Syntax :
 revok <privilages> on <database-name>.<table.name> 

***/

revoke insert on mysqldatabase.* from 'root@localhost';

drop user 'root@localhost';

select user,host from mysql.user;