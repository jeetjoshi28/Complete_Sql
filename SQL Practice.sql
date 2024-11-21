-- To create the data base
-- SYNTEX CREATE DATABASE database_name;
create database student;
create database college;

-- if database is not exists then and then i will create the datavase if database is exists in system then i will give the warning
create database if not exists college;

-- To drop the database mean's that database delete
-- SYNTEX DROP DATABASE database_name; 
drop database student;
-- if database is exists then and ten i will drop otherwise not drop i will give the warning
drop database if exists company;

-- Show command is display the total databse 
show databases;


-- use the database mean's that if any changes are made the it will refelect on the use database
-- SYNTEX 
-- USE database_name;
use college;  


-- To create the table in database command is create 
-- SYNTEX
-- CREATE TABLE table_name(
-- column_name1 datatype constraint,
-- column_name2 datatype constraint,
-- column_name3 datatype constraint
-- );

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

-- To insert the dat in the table use the insert command to insert data
-- SYNTEX 
-- INSERT INTO table_name values("values1" , "values2" , "values3")
insert into student values(1,"Jeet Joshi", 24);
insert into student values(2, "Shyam" , 20);


-- To retrive the data from table use the command select
-- SYNTEX
-- select * from table_name;
select * from student;


-- practice question 1 
-- create a databse for your comapny named XYZ
	-- step 1: create a table inside this DB to store employee into (id , name and salary)
    -- step 2: Add following information in the DB :
		-- 1 , "adam" , 25000
		-- 2 "bob" , 30000
		-- 3 "casey" , 40000
	-- step 3: select & view all your table data.alter
    
create database justforu;

use justforu;

create table employee_info(
	emp_id INT(5) primary key,
    emp_name varchar(25),
    emp_salary INT(50)
);

insert into employee_info values(2, "bob" , 30000);
insert into employee_info values(3 , "casey" , 40000);
insert into employee_info values (1 , "adam" , 25000);

select * from employee_info;

drop database college;

create database university;

use university;

create table student(
	roll_no int primary key,
	name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into student (roll_no , name , marks , grade , city) 
	values 
		(101, "anil" , 78 , "C" , "Pune"), 
		(102,"Bhumika" , 93, "A" , "Mumbai"),
        (103, "Chetan" , 85 , "B" , "Mumbai"),
        (104, "Dhruv" , 96 , "A" , "Delhi"),
        (105, "Emanuel" , 12,  "F" , "Delhi"),
        (106 , "Farah" , 82 , "B" , "Delhi");
        
select * from student;
 
 
 select name , marks from student;

use university;


--  Distinct is return the unique value from database it remove the duplicate values from database
select distinct city from student;


select  * from student where marks > 80;

select * from student;

select * from student where city = "Mumbai";

-- Both condition are true then final condition are true otherwise not true
select * from student where marks > 80 && city = "Mumbai";


-- in OR any one condition are true then final condition are ture 
select * from student where marks > 80 || city = "Jaipur";


-- Between operator it is use retrive the data in range 
select * from student where marks between 80 AND 90;

-- IN operator it is use for to retrive the data in particular values
select * from student where city IN ("Delhi" , "Mumbai");

-- NOT IN operator it is use for reverse the condition 
select * from student where city NOT IN ("Delhi" , "Mumbai");

-- Limit it is use to apply the limit if i want to retrive the 5 student data then apply the limit 
select * from student limit 3;

use university;

select * from student order by city;

select * from student order by marks;

-- retrive the top 3 student by marks
select * from student order by marks desc limit 3;



-- Aggregate functions
-- count() , max() , min(), sum(), avg()

-- to retrive the max marks from student table
select max(marks) from student;

-- to retrive the min marks from the student table
select min(marks) from student;

-- to find the average marks of a class
select avg(marks) from student;

-- to count the totle student in the student table 
select count(name) from student;

-- group by clause it return the value in the group
select city, count(name) from student group by city; 

-- practice question 
-- write the query to find avg marks in each city in ascending order
select city, avg(marks) from student group by city order by avg(marks);

-- write the query to find avg marks in each city in descending order
select city, avg(marks) from student group by city order by avg(marks) desc;


select grade from student group by grade order by grade;

-- having clause
-- having clause is use to apply the condition on the group & where clause is apply on the normal rows

-- count number of student in each city where max marks cross 90

select city , count(roll_no) from student group by city having max(marks) > 90;

-- general order
-- select columns(s)
-- from table_name
-- where condition
-- group by column(s)
-- having condition
-- order by column(s) asc;

-- table telated queries 
-- update (to update existing rows)

SET SQL_SAFE_UPDATES = 0;

update student set grade = "o" where grade = "A";
select * from student;


-- added

update student set marks = marks + 1;


-- Delete it is use for delete rows in table 
-- SYNTEX
-- DELETE FROM table_name WHERE condition;

update student set marks  = 12 where roll_no = 105;
update student set grade = F where roll_no = 105;

select * from student;

delete from student where marks < 33;

select * from student;


-- FK 
use university;

create table dept (
	dept_id int primary key,
    name varchar(50)
);

create table teacher(
	id int primary key,
    name varchar(50),
    dept_id int,
    foreign key (dept_id) references dept(dept_id)
    on update cascade
    on delete cascade
);

