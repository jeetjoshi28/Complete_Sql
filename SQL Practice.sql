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

insert into dept values (101,"English"), (102,"IT");

select * from dept;

update dept set dept_id = 103 where dept_id = 102;

insert into teacher values (101,"Adam" , 101), (102,"Eve" , 102);

select * from teacher;

drop table teacher;


-- Alter command it is use for the change the schema of the table schema means design 
-- add column 
-- SYNTEX
-- ALTER TABLE table_name ADD COLUMN column_name datatype constraint;

alter table student add column age int;

select * from student;

-- DROP column 
-- SYNTEX
-- ALTER TABLE table_name DROP COLUMN column_name;

alter table student drop column age;

-- alter operations
alter table student add column age int not null default 19;

alter table student modify column age varchar(2);


-- give the error beacause we are trying to store large value our data type is varchar(2) and we are trying to store the value of 100 it is not possible that why gives the error
insert into student (roll_no , name ,  marks ,stu_age)
values (107, "Gargi" , 68 , 100);

alter table student change age stu_age int;


select * from student;

alter table student drop column age;

alter table student rename to student_data;
alter table student_data rename to student;

select * from student;


-- IMPORTANT DIFFERENT DROP vs TRUNCATE
-- Drop is delete the table with schema and Truncate is delete the table data not table schema if we want to re-enter the data in the table so we can do this uaing the help of truncate

truncate table student;

-- practice question 
-- QS in the student table:
	-- A. change the name of column "name" to "full_name"
    -- B. Delete all the students who scored marks less than 80
    -- C. Delete the column for grades.alter
    
-- Answer A

alter table student change name full_name varchar(50);

select * from student;

-- Answer B  
delete from student where marks < 80;

SET SQL_SAFE_UPDATES = 0;

-- Answer C
alter table student drop column grade;

-- JOINS IN SQL
-- Inner join
-- Return records that have matching values in both tables
-- STNTEX

-- SELECT column(s) 
-- FROM table A 
-- INNER JOIN table B
-- ON tableA.col_name = tableB.col_name;

create database college;
use college;

create table student(
	id int primary key,
    name varchar(50)
);

insert into student (id, name) 
	values 
	(101 , "Adam"), 
    (102, "Bob"),
    (103, "Casey");
    
select * from student;

create table course(
	id int primary key,
	course varchar(50)
);

insert into course (id , course) 
	values
    (102, "English"), 
    (105,"Math"),
    (103, "Science"),
    (107,"Computer Science");
    
select * from course;

select * from student inner join course on student.id = course.id;

select * from 
student as s
inner join course as c 
on s.id = c.id;

-- Left join 
-- Return all record from the left table, and the matched records from the right table

-- SYNTEX
-- SELECT column(s)
-- FROM tableA
-- LEFT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

select * from 
student as s
left join course as c
on s.id = c.id;

-- Right join
-- Return all record from the right table, and the matched records from the left table

-- SYNTEX
-- SELECT column(s)
-- FROM tableA
-- RIGHT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

select * from 
student as s
right join course as c
on s.id = c.id;


-- FULL join
-- Return all record when there is a match in either left or right table
-- in MYSQL full join statement or command are not exist but in oracle or postgresql full join commmand or statement are exist

-- in MYSQL we can perform full join using left join and right join then are union then we get the result of the full join
-- union give the unique data of the both table not generate the duplicate data 

select * from 
student as s 
left join course as c
on s.id = c.id
union
select * from 
student as s
right join course as c
on s.id = c.id;


-- Left Exclusive join
select * from 
student as s
left join course as c
on s.id = c.id 
where c.id is null;


-- Right Exclusive join 
select * from 
student as s
right join course as c
on s.id = c.id
where s.id is null;

-- self join 
-- It is a regular join but the table is joined with itself

-- SYNTEX
-- SELECT column(s)
-- FROM table as a 
-- JOIN table as b 
-- ON a.col_name = b.col_name;

create table employee(
	id int primary key,
    name varchar(50),
    manager_id int
);

insert into employee (id , name , manager_id) 
values
(101, "Adam" , 103),
(102, "Bob" , 104),
(103, "Casey" , NULL),
(104, "Donal" , "103");

select * from employee;

select a.name as manager_name , b.name from 
employee as a 
join employee as b
on a.id = b.manager_id;

-- SQL sun query
-- A subquery or inner query or nested query is a query within another sql query
-- it involves 2 select statements

-- SYNTEX
-- SELECT column(s)
-- FROM table_name
-- WHERE col_name operator
-- (subquery);

-- Example
-- Get names of all students who scored more than class average
-- step 1 :- Find the avg of class
-- step 2 :- Find the names of student with marks > avg


select * from student;

create table student_data(
	roll_no int primary key,
	name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into student_data (roll_no , name , marks , grade , city) 
	values 
		(101, "anil" , 78 , "C" , "Pune"), 
		(102,"Bhumika" , 93, "A" , "Mumbai"),
        (103, "Chetan" , 85 , "B" , "Mumbai"),
        (104, "Dhruv" , 96 , "A" , "Delhi"),
        (105, "Emanuel" , 12,  "F" , "Delhi"),
        (106 , "Farah" , 82 , "B" , "Delhi");
        
select * from student_data;

-- step 1
select avg(marks) from student_data;

-- step 2
select name, marks from student_data where marks > 74.33;


-- sub query 
select name, marks from student_data 
where marks > (select avg(marks) from student_data);


-- Example
-- Find the names of all students with even roll numbers
-- step 1 Find the even roll numbers
-- step 2 Find the names of students with even roll no

select * from student_data;

-- step 1
select roll_no from student_data where roll_no % 2 = 0;

select roll_no, name 
from student_data 
where roll_no in 
	(
		select roll_no from student_data where roll_no % 2 = 0
    );
    
-- Example using from
-- Find the max marks from the students of delhi

-- step 1 :- Find the student of delhi
-- step 2 :- find their max marks using the sublist in step 1

select * from student_data where city = "Delhi";


-- way 1
select max(marks) 
from (select * from student_data where city = "Delhi") as temp;


-- way 2 
select max(marks) from 
student_data where city = "Delhi";


