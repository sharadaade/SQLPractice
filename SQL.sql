create table emplast
(
 id int unique not null identity(1,1),
 name varchar(20),
 age int check(age between 20 and 120)
)

insert into  emplast values (1, 'fall',20)
insert into emplast (id, name, age) values (2,'heimendinger', 120)

select * from emplast

create table t10
(
 id int default(1),
 name varchar(20),
)

insert into t10 (name)values ('apa')

select * from t10


-- 