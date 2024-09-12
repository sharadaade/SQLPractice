-- Single line comment

/* 
	Multi 
    Line 
    comment 
*/

CREATE DATABASE OK

SELECT name FROM sys.databases


SELECT name FROM sys.tables;


SELECT name AS TABLE_NAME
FROM sys.tables;


SELECT name FROM sys.tables;


alter database ok modify name = DemoDB

execute sp_renamedb 'DemoDb','DemoDBX'