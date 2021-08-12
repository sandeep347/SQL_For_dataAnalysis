--creating a database 
create database hotelmanagement;

--deleting the database

drop database sandeep

--alter the database 

use TRAINING;
ALTER DATABASE TRAINING
MODIFY name = worksop;

--create the table and inserting  values

USE database_name
create table person_tbl
(
ID INT,
first_name varchar(20),
last_name varchar(20),
age int,
salary int

primary key (ID)
)

insert into person_tbl

values(1,'sandeep','prabhu','22',50000)

insert into person_tbl
values(2,'rupesh','naik','22',200000)

insert into person_tbl
values
(3,'mahesh','kg','22',250000),
(4,'Prashant','pai','45',360000),
(5,'uashant','iyer','46',860000),
(6,'eshwar','shenoy','47',760000),
(7,'sushhant','pik','40',660000),
(8,'nishhant','prabhu','42',430000)

--add new column to the database
alter table person_tbl
add city varchar(29);

select * from person_tbl

--update city column in the database 
update person_tbl
set city ='Bankok'
where ID=1

--modify or alter name of the table 
alter table person_tbl
modify person_tbl='listofpeople';
