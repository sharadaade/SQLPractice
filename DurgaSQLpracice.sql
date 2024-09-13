
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

-------------------------------------------------------------------------------------
-- What is difference between delete and truncate?
-- delete:-
-- using delete command we can delete one record with where condition
-- delete command  support where clause
-- delete commad cannot reset the identity

-- truncate:-
-- using truncate we can only delete all records from table
-- we cant delete one by one record
-- truncate command can not support where condition

-- NOTE: -
-- when we have a table with identity column values
-- 1) when we apply delete command ,all records will be delete but identity will not reset
-- 2)  when we apply truncate command ,all records will be delete identity will be reset

create table t1
(
	id int identity(1,1),
	name varchar(10)
)

use database@7pm

insert into t1 values ('cc'), ('dd'), ('jj'), ('mm')

select * from t1

delete from t1

drop table t1
-----------------------------
-- when we apply truncate on old table then old data ate deleted from table
truncate table t1


-- constraints:
-- constraint means condition
-- constraints are used to avoid data duplication(redundency) and repetation
-- constraints are used to make the data consistency

-- types of constraints:
-- 1.unique
-- 2.not null
-- 3.primary key
-- 4.check
-- 5.default
-- 6.foreign key


--  we can apply constraints in two differnt ways
--  option1: applying constraint without name
--  syntax:
--  create table tablename(column1 datatype constraintname, column2 datatype(size))

--  option2: applying constraint with name
--  syntax:
--  create table tablename(column1 datatype constraint constraintname constrainttype, column2 datatype(size))

sp_help emp2

-- to get constraint details only
sp_helpconstraint emp2

create table emp3(id int constraint unq_emp3_id unique, name varchar(20))
sp_helpconstraint emp3

---unique:
-- will accept unique vaues only
-- will not accept duplicate values
-- will accept only one null value ,because one null value is treated as unique

sp_helpconstraint emp
-- to create constraint for existing table
alter table emp
add unique(id)
-- to drop the constraint
alter table emp
drop constraint UQ__emp__3213E83E0A820218

-- not null: 
-- will not accept any null values,but it will accept duplicate values
create table emp4(id int not null,name varchar(20))
insert into emp4 values(1,'sai') --insert
insert into emp4 values(1,'sai') --insert
insert into emp4 values(null,'sai') --not insert
insert into emp4 values(2,'sai') --insert

select*from emp4

-- primarykey:
-- it will accept unique values
-- it will not accept duplicate values
-- it will not accept null values
-- in sql server a table should have only one primary key
-- more than one primary in a table not allowed

create table emp5(id int primary key,name varchar(20))

sp_helpconstraint emp5

insert into emp5 values(1,'sai')---insert
insert into emp5 values(1,'sai')---not insert
insert into emp5 values(2,'sai')---insert
insert into emp5 values(null,'sai')---not insert

--Note: when the table alreday having duplicate data,when we apply constraint
--      like primary key or unique explicitly that cant apply.

-- check:
-- it is a special constraint which is used to apply some conditions on any column based on requirement
create table emp7
(
id int primary key,
name varchar(20),
age int check(age between 20 and 80)
)

insert into emp7 values(1,'sai',35)-- insert
select*from emp7



-- Default:
-- syntax: default(value)
-- ex: default(1)
-- when we have a table with default constraint on perticular column
-- if u not supply that column value then it will take default value.
-- though the table is having default constraint when we supply column value, supplied value only consider.

create table emp8(id int default(1),name varchar(20))

insert into emp8 values(1,'sai')
insert into emp8 values(2,'sai')
insert into emp8 values(3,'sai')
insert into emp8 values('mohan')
--Error--Column name or number of supplied values does not match table

-- definition.
insert into emp8(name) values('mohan')
insert into emp8(name) values('durga')
select*from emp8

-- foreign key:
-- is used to maintain referential integrity between tables
-- is used to maintain relationship with tables
-- to work with forgeign key, one table should have primary key another table should have foreign key
-- the table which is having primary key is said to be parent table
-- the table which is having foreignkey is said to be child table
-- both tables should have atleast one common column name


-- Foreign key
create table tbldep
(
 deptid int primary key,
 deptname varchar(10)
)

create table tblemp
(
 name varchar(10),
 address varchar(20),
 deptid int foreign key references tbldep(deptid) on delete cascade on update cascade
)

select * from tbldep
select * from tblemp

insert into tbldep values (4, 'caps')
insert into tblemp values ('loo','um', 4)

update tbldep set deptid = 23 where deptid = 12 

delete from tbldep where deptid = 23


-- Functions in sql:
----------------
-- function is a statement or group statements which is used to perform
-- specific task.
-- 1.single row functions
-- 2.multi row functions
-- single row functions: these functions will process at a time single row and return result as single value
-- multi row functions: these functions will process at a time multiple rows and return result as single value

-- single row functions:
--------------------
-- 1.mathematical functions
-- 2.string functions

-- multi row functions:

--mathematical function
select ABS(-34)

select square(4)

select SQRT(25)

select POWER(2,3)

select FLOOR(13.8)

select ceiling(13.3)

select len('sharadaade')
select len('   ')

select LOWER('SHARAd')

select UPPER('sharad')  as name

select LTRIM('  core jj ') + ' team'

select RTRIM('nano     ')+ 'thanatos'

select ASCII('A')

select ASCII('a')

select REVERSE('sharad')

select 'durga'+ SPACE(10)+'soft'

create table employees
(
 id int primary key,
 name varchar(10),
 address varchar(20),
 salary int,
 role varchar(10)
)

select * from employees
insert into employees values (1,'sharad', 'bid',25000,'IT')
insert into employees values (2,'fall', 'bid',30000,'Gamer')

insert into employees values (3,'vishnu', 'bid',15000,'MIDC'),
							 (4,'dattu', 'pune',20000,'MIDC'),
							 (5,'vishnu', 'solapur',22000,'HR'),
							 (6,'vinod', 'pune',40000,'Executive'),
							 (7,'Bhim', 'IT',100000,'Mnager')

-- aggreagte function
select min(salary) from employees
select max(salary) from employees
select avg(salary) from employees
select sum(salary) from employees
select count(*) from employees

-- deterministic and non-deterministic functioon
-- deterministic function will give the same result everytime when we execute 
-- mon-deterministic function will give the different result everytime when we execute 

-- day(getdate()) : it gives the day from given date data 
select getdate()

select day(getdate())

select day('2024-01-13')

-- month(getdata()) : it gives the month from given date data
select MONTH(GETDATE())

select month('2024-1-13')

-- year(getdata()) : it gives the year from given date data
select YEAR(getdate())

select YEAR('2024-01-29')

-- dateadd(): it is used to add day or month or year to  the given date
select DATEADD(day,3,GETDATE())

select dateadd(month,1,GETDATE())

select dateadd(year,5,GETDATE())

-- datediff: - it is used to find the difference between two given dates interms of days, months, years

select datediff(year,'1999-05-20',GETDATE())

select datediff(month,'1999-05-20',GETDATE())

select DATEDIFF(day,'1999-05-20',GETDATE()) as days

-- EOMONTH -- end of the monnth
-- it returns the last day of the specified month
-- Syntax:
-- EOMONTH(start_date,[,month_to_add])

select EOMONTH(getdate())

select EOMONTH('2014-05-22')














sp_helpconstraint parent
sp_helpconstraint child

insert into emp7 values(1,'sai',89) --not insert
insert into emp7 values(1,'sai',19) --not insert

sp_rename 'userlogin.usename' , 'username'
select * from sysobjects where xtype='U'

select * from employee

select * from details

select * from userlogin

-- show table 
select * from sysobjects where xtype = 'u'