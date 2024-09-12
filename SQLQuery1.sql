SELECT name 
FROM sys.databases;


CREATE TABLE School(
	StudentID int PRIMARY KEY NOT NULL,
	Name varchar(50),
	Class varchar(50),
	Fee int,
	Address varchar(50),
	MobNo int
)