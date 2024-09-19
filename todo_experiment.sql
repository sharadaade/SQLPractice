
create table usertable
(
	id int not null primary key identity(1,1),
	username varchar(50) unique,
	email varchar(100),
	password varchar(255),
	created_at timestamp
)

select * from usertable

delete from usertable where id = 1

insert into usertable (username, email, password,created_at) 
values 
('sharadaade', 'aadesharad@gmail.com','Sharad@123', getdate())


select * from login where username = 'sharadaade' and password = 'Sharad@123'