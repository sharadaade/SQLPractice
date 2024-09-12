
create table todouser(
	userid int identity(1,1) unique,
	username varchar(10) primary key, 
	userpassword varchar(8)
	);
-------------------------------------------------------------------------------------------------------------------
select * from todouser
-------------------------------------------------------------------------------------------------------------------
create table usertask(
	taskid int identity(1,1) primary key,
	username varchar(10) foreign key references todouser(username),
	tasktitle varchar(20),
	taskdiscription varchar(500),
	iscompleted bit default 0
)
-------------------------------------------------------------------------------------------------------------------

insert into todouser values ('chirag', '12345678') 
-------------------------------------------------------------------------------------------------------------------

insert into usertask values ('chirag','home', 'grossory details', 0) 
-------------------------------------------------------------------------------------------------------------------

insert into usertask values ('chirag','home', 'grossory details', 0) 

-------------------------------------------------------------------------------------------------------------------

select * from todouser
select * from usertask

-------------------------------------------------------------------------------------------------------------------

select userid from  todouser where username = 'chirag' AND userpassword = '12345678'