
-- Entity/object means in database is table

create database database@7pm

use database@7pm

use master

create table details(id int, name varchar(10), address varchar(10),salary int)

insert into details values(1,'sharad','bid',25000)

insert into details values(2,'Fall','bid',250000), (3,'caps','UK',40000)
insert into details values(4,'zaka','korea',220000), (5,'jojo','canada',699999)
insert into details values(6,'thanatos','england',22500), (6,'blaber','canada',null)
insert into details values(7,'chovy','korea',22500), (8,'faker','korea',null)

select * from details where name = 'Fall'
select * from details where salary = 25000

select * from details

select * from userlog
insert into userlog  (usename, [password]) values ('sharadaade','sharad123')
insert into userlog values ('corejj','core123',44)

update userlog set fevnumber = 99 where usename = 'corejj'

drop database database@7pm

-- showing details of table
-- sp means Stored procedure
sp_help userlog

select * from userlogin

alter table userlog
alter column usename varchar(20)

-- Add column in table
alter table userlog
add age int

-- drop column from table
alter table userlog
drop column age

-- 
begin transaction
DELETE FROM details where id = 1

--rollback gets the data back when we delete the data/record from table
rollback

-- commit => is say delete the record permanently after rollback also
commit

select * from details

-- How to get complete tanble information
-- sp_help tablename

sp_help details

-- How to get all table list from current database
select * from sysobjects where xtype ='U'

-- Compare with
select * from details where name = 'Fall'

-- To change the table name
-- sp_rename 'old_tablename' , 'new_tablename'

sp_rename 'userlog' , 'userlogin'

-- To change the column name
-- sp_rename 'tablename.oldcolumnname' , 'tablename.newcolumnname'
sp_rename 'userlogin.luckynum' , 'fevnumber'
sp_rename 'details.details.nickname' , 'capname'

-- Copy data from one table to new table
-- Taking all data and storing in new table 
select * into employee from details

-- and 
select * from userlogin where username = 'corejj' and fevnumber = 99 
----------------------------------------------
-- or 
select * from userlogin where username = 'corejj' or fevnumber = 23 

-- != not equal
select * from userlogin where fevnumber != 23

-- Select multiple or 
select * from details where id = 1 or id = 2 or id = 3
-- Short cut 
select * from details where id in(1,2,3)

-- To get null value record
select * from details where salary is null

-- To get unique record from coolumn
select distinct address from details

-- To get data in order (order by)
-- by default order in ascending order
select * from details order by salary

-- To get in decending order
select * from details order by salary desc

-- group by clause
select address,count(*) from details group by address

-- Top 2 record
select top 2* from details order by salary desc

select * from details order by salary desc

-- % group of character
-- _ single character

select * from details where nickname like 'c%'
select * from details where nickname not like 'j%'
select * from details where nickname like '_h%' 


-- Set operator -----
-- union
-- unionall
-- intersect
-- except

create table table2 
(
	id int,
	product varchar(20)
)

insert into table1 values (1, 'banana'), (2, 'mango'), (3, 'gauva'), (4, 'lemon'), (2, 'orange'), (3, 'gauva')
insert into table1 values (4, 'lemon'), (5, 'orange'), (6, 'custerd'), (7, 'apple')

insert into table2 values (4, 'lulu'), (5, 'avocado'), (6, 'mushroom')

-- Combines two result sets and returns only distinct (unique) rows. or remove duplicate data
select * from table1
union
select * from table2

-- Combines two result sets and returns duplicate data also.
-- Combines two result sets without removing duplicate rows.
select * from table1
union all
select * from table2

-- Returns only the rows that exist in both result sets.
select * from table1
intersect
select * from table2

-- Returns the rows in the first result set that do not exist in the second result set.
select * from table1
except
select * from table2

select * from table1
select * from table2

--------------------------------------------------------------
-- Identity
-- identity(seed value, increment value)

create table emp1
(
id int identity(1, 1),
name varchar(20),
address varchar(50)
)

-- add column
alter table emp1
add age int

-- delete column
alter table emp1
drop column address

set identity_insert emp1 on
insert into emp1 (id,name,age)values (6,'fall',24)
insert into emp1 values ('jocker',19), ('jaz', 55), ('smolder',22), ('heimendinger',300)

-- to get deetails of table
sp_help emp1

-- explicitly we cannot insert the value of identity 
-- if you want to set identity follow below command or need to set indentity set on
set identity_insert emp1 on

-- when we delete record and then we want to start identity from again 1 then follow below step
-- dbcc means database consistency check
-- dbcc checkident(table_name, reseed, 0)
dbcc checkident(emp1, reseed, 0)

select * from emp1


sp_rename 'userlogin.usename' , 'username'

select * from employee

select * from details

select * from userlogin

-- show table 
select * from sysobjects where xtype = 'u'