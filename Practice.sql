
create table StudentList(
	id int primary key,
	firstname varchar(20),
	middlename varchar(20),
	lastname varchar(20),
	age int,
	class varchar(10),
	gender char,
	gmail varchar(30),
	homeaddress varchar(50)
)

select * from StudentList where age = 24;

select * from StudentList where class = '0';

select * from StudentList;

select id, age from StudentList;


insert into StudentList values (1,'sharad', 'sahebrao','aade', 24, 'MCA', 'M','aadesharad@gmail.com','sushi vadgaon tl.georai');

insert into StudentList values (2,'ganesh', 'ginyandev','aade', 22, 'MBA', 'M','aadeganesh@gmail.com','sushi vadgaon tl.georai');

insert into StudentList values (3,'dattu', 'baban','aade', 23, '0', 'M','aadedattu@gmail.com','sushi vadgaon tl.georai');

