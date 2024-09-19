-- Running 



-- IIF function:
------------
-- iif function is the replacement of case expression
-- iif is the short hand way of writing case expession
-- •Introduced in SQL Server 2012
-- •Returns one of two the values, depending on whether the Boolean expression evaluates to true or false
-- •IIF is a shorthand way for writing a CASE expression
-- Syntax : IIF ( boolean_expression, true_value, false_value )

Create table Employees2
(
Id int primary key identity,
Name nvarchar(10),
GenderId int
)

Insert into Employees2 values ('Mark', 1)
Insert into Employees2 values ('John', 1)
Insert into Employees2 values ('Amy', 2)
Insert into Employees2 values ('Ben', 1)
Insert into Employees2 values ('Sara', 2)
Insert into Employees2 values ('David', 1)

select*from Employees2

---Using CASE statement
SELECT Name, GenderId,
CASE WHEN GenderId = 1 THEN 'Male' ELSE 'Female'  END AS Gender
FROM Employees2

---Using IIF function
SELECT Name, GenderId,
IIF(GenderId = 1, 'Male', 'Female') AS Gender
FROM Employees2


-- Join
-- Joins are used to retrieve the data from two or more tables and display in one table formate

-- Type of join
--------------------
--1) inner join
--2) outer join  -- left join or left outer join
				 -- right join or right outer join
				 --	full join or full outer join

--3) cross join
--4) self join

-- inner join:
----------------
-- it will return matching rows from both tables
-- and eleminate non matching rows


select * from parent
select * from child

create table tt1
(
id int,
name varchar(10)
)

create table tt2
(
idd int,
data varchar(10),
game varchar(10),
loc varchar(10)
)

select * from tt1
select * from tt2

insert into tt1 values (1, 'aaa')
insert into tt1 values (2, 'bbb')
insert into tt1 values (3, 'ccc')
insert into tt1 values (4, 'ddd')
insert into tt1 values (5, 'eee')
insert into tt1 values (10, 'fff')


insert into tt2 values (77, 'corejj', 'apex', 'bb')
insert into tt2 values (2, 'thanatos', 'val', 'uk')
insert into tt2 values (3, 'fall', 'lol', 'usa')
insert into tt2 values (7, 'faker', 'lol', 'uk')
insert into tt2 values (18, 'apa', 'mid', 'thi')
insert into tt2 values (22, 'notail', 'dota', 'uk')
insert into tt2 values (99, 'dynamo', 'pubg', 'ind')

-- different ways to replace the null values
-- 1. Replacing null values using ISNULL()




-- views in sql server:-
--------------------------
-- 1.view is a saved sqlquery
-- 2.view is for reusability
-- 3.it saves lot of time
-- 4.view is a window or virtual table
-- 5.a table which is used to create a view is called base table
-- 6.view will provide security i.e row level and column level
-- 7.views can be updatable
-- 8.view can be alter and drop

-- types of views
-------------------
-- 1.simple view
-- 2.complex view
-- 3.encrypted view
-- 4.schembinding view

-- simple view:
-----------------
-- a view which is create for single table or single select statement
-- syntax:
-- create view viewname
-- as
-- select statement

create view vw1
as 
select * from parent where id in(1,3,5)

-- run or exxecute the view
select * from vw1 

-- see the query from view
sp_helptext vw1

-- to get the list of all view
select * from sysobjects where xtype = 'v'

-- create view to count the no of employees based on department







select * from Emplo

-- indexes in sql:
--------------
-- indexes are used to get or access the data from table quickly
-- if there is no indexes in table , sql server engine will arrange table ,after table scan we will get records.
-- always table scan will give bad performence

-- types of indexes:
-- 1.clustered index
-- 2.non clustered index

-- in sql serevr indexes will work automatically
-- clustered index:
-----------------------------
-- 1.it will create automatically when we create table with primary key
-- 2.a table should have only one clustered index
-- 3.clustered index will arrange the records in physical order

-- non-clustered index:
-----------------------------
-- 1.it will create automatically when we create table with unique key
-- 2.a table may have more than one non clustered index
-- 3.non clustered index will not arrange the records in physical order

-- syntax to create index:
---------------------------
create index indexname
on tablename(columnname)


create index ix_Emplo_id
on Emplo(id)

-- to get index details
sp_help Emplo

----to get only index details
sp_helpindex Emplo

-- to drop index
drop index ix_Emplo_id on Emplo

sp_helpindex Emplo
-- When we apply primary key then clustered index automatically created for that table
create table tblindex(id int primary key,name varchar(10))

create table tableindex(id int primary key, name varchar(20), address varchar(20))

sp_helpindex tableindex

insert into tableindex values(1, 'jj', 'pune')
insert into tableindex values(2, 'kk', 'bid')
insert into tableindex values(3, 'mm', 'solapur')
insert into tableindex values(4, 'rr', 'novida')

select * from tableindex
sp_helpindex tableindex


create table tableindex1(id int unique, name varchar(20), address varchar(20))

insert into tableindex1 values(1, 'jj', 'pune')
insert into tableindex1 values(2, 'kk', 'bid')
insert into tableindex1 values(3, 'mm', 'solapur')
insert into tableindex1 values(4, 'rr', 'novida')

select * from tableindex1

sp_helpindex tableindex
sp_helpindex tableindex1

create nonclustered  index myindex
on tableindex(id)


---------------------------------------------
-- trigger
-- trigger is a special type of stored procedure
-- trigger is an event which will be fired automatically when we execute commands
-- trigger is used to monitor user activities and store the information.
-- triggers are used to apply some conditions on table
-- triggers are used to provide restriction on tables and databases which should not access.

-- types of triggers:
------------------
-- 1.DML Triggers
-- 2.DDL Triggers
-- DML Triggers will be fired in responce to DML commands like insert,delete, update
-- DDL Triggers will be fired in responce to DDL command like alter,drop,create
-- sql server support after triggers only i.e after insert,after update,after delete
-- where as oracle suport both after and before triggers
-- Triggers will use internally magical tables
-- magical tables are used to strore trigger information
-- magical tables are 2 types

-- 1.inserted magical table
-- 2.deleted magical table
-- inserted magical table: will store information when insert trigger will be fired
-- deleted magical table: will store information when delete trigger will be fired

-- Synatx:
-- create trigger triggername
-- on tablename
-- for insert or delete or update
-- as
-- begin
-- statements to be execute
-- end


create table ttt
(
 id int primary key,
 name varchar(10),
 gender varchar(10),
 age int
)
-- create trigger for insert
create trigger quadt
on Emplo
for insert
as 
begin
 select * from inserted
end;


select * from ttt


create table tblcapture
(
id int identity,
caturedate varchar(100)
)

select * from tblcapture

-------------------------------------------
create trigger trfroinsert
on ttt
for insert  
as
begin
 declare @id int
 select @id = id from inserted
 insert into tblcapture values
 ('New Employee with id = ' + CAST(@id as nvarchar(10)) + 'Is inserted at' + CAST(getdate() as varchar(50)))
end;

insert into ttt values (15, 'fall','male', 25)


select * from sysobjects where xtype = 'tr'

drop trigger trfroinnsert

select * from tblsamp

-- Creating procedure
---------------------------------
-- Syntax: -
---------------------------------
-- create procedure procedure__name
--	@column_name datatype,
--  @column__name datatype
-- as
-- begin
--	Query
-- end;

-- Example:-
create procedure prodeleted
@id int
as
begin
 delete from tblsamp where id = @id
end;

-- Execcuting procedure 
exec prodeleted 55

-------------------------------
select * from tblsamp
sp_help tblsamp


-- creeating store procedure for inserting data  
------------------------------------------------------
create procedure pro_insert
@id int,
@name varchar(50),
@address varchar(50),
@salary int
as
begin
	insert into tblsamp (id, name, address, salary) values (@id, @name, @address, @salary)
end;


-- inserting data with procedure
exec pro_insert 22, 'corejj', 'usa', 25000

exec pro_insert 23, 'gautam', 'ind', 999000

execute pro_insert 999, 'chris', 'vakhanda', 60000
------------------------------------------------------


