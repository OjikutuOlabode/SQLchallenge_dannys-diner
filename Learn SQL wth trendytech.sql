-- database collection of data, this data are held in form of table
-- table is data in row and columns
-- types of data; relational database and non relatonalor no sql data base  
-- SQL - STRUCTURED QUERY LANGUAGE 
-- SQL is the language, mysql is the database holding the data. 
-- show list òf databases
  SHOW DATABASES;

-- to create database 
create database trendytech;

-- TO DELETE DATABASE
DROP DATABASE trendytech;

-- to enter a databases
use trendytech;

-- how to know the database i am using
SELECT database();

-- creating table
CREATE TABLE employee
(
name varchar(50),
 age int,
 salary int
 );

-- check list of tables 
SHOW TABLES;

-- check structure of table
DESCRIBE employee; -- or 
desc employee;

-- to delete table
drop TABLE employee;

-- create table inside database not yet created
CREATE TABLE trendytech.employee
(
name varchar(50),
 age int,
 salary int
 );
 SHOW TABLES;
 
 
-- session 2
-- CRUD OPERATiONS
-- CREATE, READ, UPDATE, DELETE
-- CREATE with insert statement , READ with select statement, UPDATE wih update statement, DELETE with delete


-- creating a table
CREATE TABLE employee  (
firstname VARCHAR(20),
middlename VARCHAR(20) ,
lastname VARCHAR(20) ,
age int ,
salary int ,
location VARCHAR(20)
);
desc employee;
select * from employee;


-- fill data in table
INSERT INTO employee(firstname,middlename  ,lastname ,age, salary,location) 
VALUES ('Kapir', 'kumar', 'sharma', 28, 10000, 'banglore');

INSERT INTO employee(firstname,middlename  ,lastname ,age, salary,location) 
VALUES ('satish', 'kumar', 'sharma', 28, 10000, 'banglore');


-- multple inserts
INSERT INTO employee(firstname, lastname ,age, salary,location) 
VALUES ('rajesh', 'sharma', 32, 20000, 'banglore'),  ('sat', 'sharma', 28, 10000, 'banglore');
INSERT INTO employee() 
VALUES ('sat', 'sharma', 28, 10000, 'banglore');

-- null means unknown
-- ensurIng some Info arnt null
CREATE TABLE employee  (
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20) ,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL
);


-- default values

CREATE TABLE employee (
    firstname VARCHAR(20) NOT NULL,
    middlename VARCHAR(20),
    lastname VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL,
    location VARCHAR(20) DEFAULT 'bangalore' # this makes sure default location is banglore, so if no location is given banglore is inserted 
);

-- not null(cant be empty) and default()
CREATE TABLE employee  (
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20) ,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'bangalore'
);

-- sesson 3 primary key(cant be duplicated or null)

CREATE TABLE employee  (
id INT PRIMARY key,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20) ,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'bangalore'
);
--  or
CREATE TABLE employee  (
id INT auto_increment, -- automatically increase id
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20) ,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'bangalore',
primary key(id)
);

-- unique key can hold null values, but no duplcate
-- you can have only one prmary key
-- use prmary key to unquely identify each record  
-- in mysql unique key accept any number of null VALUES
-- purpose is to mke sure record dont duplicate
CREATE TABLE employee  (
id INT auto_increment, -- auto increament
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20) ,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'bangalore',
UNIQUE KEY(id)
);

CREATE TABLE employee (
id INT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20) ,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'bangalore'
);
DESC employee;

-- session 4
drop database trendytech;
create database trendytech;
use trendytech;

CREATE TABLE employee (
id INT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20) ,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'bangalore'
);
desc employee;
INSERT INTO employee(id, firstname, lastname , age, salary) 
VALUES ('1', 'rajesh', 'sharma', 28, 10000);

INSERT INTO employee(id, firstname, lastname, age, salary) 
VALUES ('2', 'kapil', 'sharma', 30, 20000);

INSERT INTO employee(id, firstname, lastname, age, salary) 
VALUES ('3', 'Maneesh', 'sharma', 32, 30000);
# select all columns 
select * from employee;

# select specfic columns 
select firstname, lastname from employee;
select * from employee 
where age > '29';

select * from employee 
where firstname = 'Maneesh'; # it is case insensitive

-- to make it case sensitive use binary
select * from employee  
where binary firstname = 'maneesh'; # it is case sensitive here

-- to change names of the records, Alias use as 
 select lastname as Surname, firstname from employee;
 
# update
# ========
update employee set lastname = 'sinha' where firstname = 'maneesh';
select * from employee;

update employee set location = 'hyderabad' where firstname = 'kapil';
-- this will change location for every record
update employee set location = 'hyderabad';

-- increase salary by 5000
update employee set salary = salary + 5000;
update employee set location = 'banglore' where firstname = 'maneesh' and lastname = 'sinha';

# delete, first use select to be certain of the record being deleted

delete from employee 
where id = '3';
-- delete all record 
delete from employee;

# alter command , deals with structure of table
desc employee;
-- ADD COLUMN JOBTTLE
ALTER table employee add column jobtitle varchar(50);
-- DELETE COLUMN
ALTER table employee DROP column jobtitle;
-- iNCREASE LENGHT OF FiRST NAME  
ALTER table employee MODIFY column firstname varchar(30);
desc employee;
-- remove primary key
ALTER table employee drop primary key ;
-- add primary key
ALTER table employee add primary key(id) ;

-- DDL DATA DEFiNiTiON LANGUAGE : DEALS WiTH TABLE STRUCTURE e.g create, alter, drop
-- DML DATA MANiPULATiON LANGUAGE : DEALS WiTH DATA e.g insert, update, delete
-- TRUNCATE also delete all records, it drops table and recreates it. its a ddl command

-- SESSiON 5
--  foreign key costraint
# STUDENTS TABLE
/* student_id
student_fname
student_lname
student_mname
student_email
student_email
student_phone
student_alternate_phone
student_email
enrollment_date
years_of_exp
student_company
batch_date
source_of_joining
location */
drop DATABASE trendytech;
create DATABASE trendytech;
use trendytech;
drop table students;
CREATE TABLE students (
 student_id int AUTO_INCREMENT,
student_fname varchar(30) not null,
student_lname varchar(30) not null,
student_mname varchar(30),
student_email  varchar(30) not null,
student_phone   varchar(15) not null,
student_alternate_phone varchar(15),
enrollment_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
selected_course int not null DEFAULT 1,
years_of_exp int NOT NULL,
student_company varchar(30),
batch_date varchar(30) not null,
source_of_joining varchar(30) not null,
location varchar(30) not null,
PRIMARY KEY(student_id),
unique key(student_email),
foreign key(selected_course) REFERENCES courses(course_id)
);
desc students;



INSERT INTO students (student_fname, student_lname, student_email ,student_phone, selected_course, years_of_exp, 
student_company, batch_date, source_of_joining, location ) 
values ('rohit', 'Sharma', 'rohit@gmail.com', 91919191, 2, 6, 'walmart', '5-02-2021', 'linkedin', 'bangalore');

INSERT INTO students (student_fname, student_lname, student_email ,student_phone, years_of_exp, 
student_company, batch_date, source_of_joining, location ) 
values ('virat', 'kohli', 'virat@gmail.com', 92929292, 3, 'flipkart', '5-02-2021', 'linkedin', 'hyderabad');

INSERT INTO students (student_fname, student_lname, student_email ,student_phone, selected_course, years_of_exp, 
batch_date, source_of_joining, location ) 
values ('shikhar', 'dhawan', 'shikhar@gmail.com', 93939393, 3, 12, '19-02-2021', 'google', 'bangalore');

INSERT INTO students (student_fname, student_lname, student_email ,student_phone, years_of_exp, 
student_company, batch_date, source_of_joining, location ) 
values ('rahul', 'dravid', 'rahul@gmail.com', 94949494, 8, 'walmart', '19-02-2021', 'quora', 'chennai');

INSERT INTO students (student_fname, student_lname, student_email ,student_phone, years_of_exp, 
student_company, batch_date, source_of_joining, location ) 
values ('kapil', 'dev', 'kapil@gmail.com', 9291292292, 15, 'microsoft', '5-02-2021', 'friend', 'pune'),
('brian', 'lara', 'brian@gmail.com', 9291297292, 18, 'tcs', '5-02-2021', 'youtube', 'pune'),
('carl', 'hooper', 'carl@gmail.com', 9291297392, 20, 'wipro', '19-02-2021', 'youtube', 'pune'),
('saurabh', 'ganguly', 'saurabh@gmail.com', 9291297492, 14, 'wipro', '19-02-2021', 'google', 'chennai');

select * from students;



CREATE TABLE courses (
course_id int not null,
course_name VARCHAR(30),
course_duration_months int not null,
course_fee int not null,
PRIMARY KEY(course_id)
);
desc courses;

INSERT INTO courses values (1, 'big data', 6, 50000);
INSERT INTO courses values (2, 'web development', 3, 20000);
INSERT INTO courses values (3, 'data science', 6, 40000);
INSERT INTO courses values (4, 'devops', 1, 10000);
SELECT * from courses;
/*parent table - courses
child table - students
*/
desc students;

# FOREiGN KEY CONSTRAiNT iS USED TO PREVENT ACTiONS THAT WOULD DESTOY LiNKS BETWEEN TWO TABLES
-- FOREiGN KEY iS A FiELD iN ONE TABLE THAT REFERS TO THE PRiMARY KEY iN ANOTHER TABLE
/* SELECTED_COURSE iS A FOREiGN KEY iN STUDENTS TABLE WHiCH REFERS O PRiMARY KEY iN ANOTHER TABLE
THE TABLE WiTH FOREiGN KEY iS CALLED THE CHiLD TABLE,
THE TABLE WiTH PRiMARY KEY iS CALLED PARENT TABLE OR REFEENCED TABLE
*/



-- session 6
select * from students;
select * from courses;
show tables;

# DISTINCT removes duplicae
-- view locations
SELECT DISTINCT location from students;

-- view companies 
SELECT DISTINCT student_company from students;

-- source of joining 
SELECT DISTINCT source_of_joining from students;


-- ORDER by
-- it is ascendng by default
SELECT  * FROM STUDENTS
ORDER BY years_of_exp;
SELECT  * FROM STUDENTS
ORDER BY years_of_exp desc;

SELECT  * FROM STUDENTS
ORDER BY student_fname, years_of_exp ;

--- limit
-- limt is used alongwith order by 
-- studemts wth least experence 
SELECT  * FROM STUDENTS
ORDER BY years_of_exp 
LIMIT 3;

SELECT  * FROM STUDENTS
ORDER BY enrollment_date 
LIMIT 3,2; # 3 means start from fourth record , 2 means pck only two records 

-- LIKE
-- NAMES THAt  have RA in them
SELECT  * FROM STUDENTS
WHERE student_fname
LIKE '%ra%' ;
-- names that start WITH RA
SELECT  * FROM STUDENTS
WHERE student_fname
LIKE 'ra%' ;

-- names that end with UL
SELECT  * FROM STUDENTS
WHERE student_fname
LIKE '%ul' ;

SELECT  * FROM STUDENTS
WHERE student_fname
LIKE '%at' ;
-- students wth only 5 character
SELECT  * FROM STUDENTS
WHERE student_fname
LIKE '_____' ; -- use backslash to escape WIldcards

-- sesson 7
SELECT distinct source_of_joining, enrollment_date from students
order  by enrollment_date desc;

-- session 8
-- aggregate functions
SELECT count(*) FROM students;
SELECT count(DISTINCT student_company) AS num_company FROM students;
select count(*) from students where batch_date like '%-02-%';
select count(*) from students where batch_date like '19-%';

-- group by
SELECT source_of_joining, count(*) from students
GROUP BY source_of_joining; # data in group by must be in select column

SELECT location, source_of_joining, count(*) from students
GROUP BY location, source_of_joining; # we group to perform agregate funct.

-- min and max
SELECT min(years_of_exp) FROM students;
SELECT max(years_of_exp) FROM students;
SELECT student_fname FROM students order by years_of_exp LIMIT 1;# PERSON WITH LEAST YEAR OF EXPERiENCE
 SELECT source_of_joining, max(years_of_exp) FROM students
 GROUP BY source_of_joining;
 
 -- SUM
 SELECT source_of_joining, SUM(years_of_exp) FROM students
 GROUP BY source_of_joining;
 -- AVERAGE
 SELECT source_of_joining, AVG(years_of_exp) FROM students
 GROUP BY source_of_joining;
 
 SELECT location, AVG(years_of_exp) FROM students
 GROUP BY location;
 SELECT student_company, max(years_of_exp) FROM students
 GROUP BY student_company;
 
 -- sesson 9 data type
 delete from courses
 where course_id = 4;
 SELECT * from courses;
 
 CREATE TABLE courses_new (
course_id int not null,
course_name VARCHAR(30),
course_duration_months DECIMAL(3,1) not null,
course_fee int not null,
PRIMARY KEY(course_id)
);
desc courses_new;

INSERT INTO courses_new values (1, 'big data', 6.5, 50000);
INSERT INTO courses_new values (2, 'web development', 3.5, 20000);
INSERT INTO courses_new values (3, 'data science', 6, 40000);
SELECT * from courses_new;
UPDATE courses_new set course_fee= 40000 where course_id = 2;

-- to know when changes are made
drop TABLE courses_new;

CREATE TABLE courses_new (
course_id int not null,
course_name VARCHAR(30),
course_duration_months DECIMAL(3,1) not null,
course_fee int not null,
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),# TiME OF CHANGE iS iNDCATED WHEN UPDATED
PRIMARY KEY(course_id)
);
INSERT INTO courses_new(course_id, course_name, course_duration_months, course_fee) values (1, 'big data', 6.5, 50000);
INSERT INTO courses_new(course_id, course_name, course_duration_months, course_fee) values (2, 'web development', 3.5, 20000);
INSERT INTO courses_new(course_id, course_name, course_duration_months, course_fee) values (3, 'data science', 6, 40000);

INSERT INTO courses_new(course_id, course_name, course_duration_months, course_fee) values (4, 'devops', 10.5, 10000);
SELECT * from courses_new;
UPDATE courses_new SET course_fee = 40000 
where course_id = 2;


-- SESSiON 10 
-- LOGiCAL OPERATOR
DESC students;
SELECT * FROM students
where location != 'bangalore'; # not from bangalore

select * from courses  where course_name like '%data%';
select * from courses  where course_name not like '%data%';
-- students from bangalore who joined through linkedin and have less than 8 years of experince 
select * from students where years_of_exp < 8 and source_of_joining = 'linkedin' and location = 'bangalore';
select * from students where years_of_exp < 8 or years_of_exp >12;
select * from students where years_of_exp not between 8 and 12;

select * from students where student_company in('flipkart', 'walmart' , 'microsoft');
select * from students where student_company not in('flipkart', 'walmart' , 'microsoft');

# CASE
-- if course duration = 4 , diploma if> 4 == masters
SELECT course_id, course_name, course_fee,
CASE
WHEN course_duration_months > 4 THEN 'masters'
ELSE 'diploma'
END as course_type
from courses;

-- walmart,flipkart,microsoft are productbased others servicebased
SELECT student_id, student_fname, student_lname, student_company, 
case 
when student_company in ('walmart','flipkart','microsoft') then 'product based'
when student_company is null then 'invalid company'
else 'service based'
end as Company_type
from  students;

-- SESSiON 11
-- JOiNS
# Which course did Rahul enrol
SELECT * from courses;
SELECT * from students;

#innerjoin
SELECT student_fname, student_lname, course_name
from students join courses
on selected_course = course_id; # default join is inner join, only matching records are considered

#left outer join
-- all matching records are considered
-- all nonmatchng record in left are also consdered	and added wth null

CREATE TABLE students_latest as SELECT * from students;# duplcates the table
CREATE TABLE courses_latest as SELECT * from courses;
SELECT * from courses;
INSERT INTO courses values (4, 'data structures', 4, 20000);
SELECT * from courses_latest;

DELETE from courses_latest where course_id = 2;

SELECT student_fname, student_lname, course_name
from students_latest join courses_latest
on selected_course = course_id; # inner join 

SELECT student_fname, student_lname, course_name
from students_latest left join courses_latest
on selected_course = course_id; # left outer join 

#right outer join
-- all matching records from left and right table are considered
-- all nonmatchng record in right are also consdered and added wth null

SELECT student_fname, student_lname, course_name
from students_latest RIGHT JOIN courses_latest
on selected_course = course_id; # rght outer join 

 -- full outer join everythng shows
 -- use union
 
SELECT student_fname, student_lname, course_name
from students_latest left join courses_latest
on selected_course = course_id # left outer join 
union
SELECT student_fname, student_lname, course_name
from students_latest RIGHT JOIN courses_latest
on selected_course = course_id; # rght outer join 

-- cross join multples
select  * from students,courses; 

# session 12
 -- where vs having
 -- poblem statement: get total number of students that joined from each sourceof joining 
 SELECT source_of_joining, count(*) as total from students GROUP BY source_of_joining; 
 
 --  lead source through which more than 1 person registered 
 -- where is best used before grouping , where is for individual records
 -- having is used after group by and filters aggregate RECORDS
 
 -- prob. statemnt: total no of people who registered through linkedin 
 SELECT source_of_joining, count(*) as total
 from students 
 GROUP BY source_of_joining
 HAVING source_of_joining = 'linkedin';# long method
 
 
 SELECT source_of_joining, count(*) as total
 from students 
 WHERE source_of_joining = 'linkedin'
 GROUP BY source_of_joining; # better method
 
 -- using where and havING together
 -- prob. stat. ---the locating from which more than one student has joined and student experienc  is more than10
 SELECT location, count(*) as total 
 from students 
 where years_of_exp > 10
 GROUP BY location 
 HAVING total > 1;
 
 #Session 13 over and parton by
 drop table employee2;
 CREATE TABLE employee2
(
first_name varchar(20),
 last_name varchar(20),
 age int,
 salary int,
 location VARCHAR(20)
 );
 INSERT INTO employee2 
values ('rohit', 'Sharma',32 , 20000, 'hyderabad');
 
 INSERT INTO employee2
values ('sachin', 'sharma', 28, 10000, 'bangalore');

INSERT INTO employee2
values ('shikhar', 'dhawan', 32, 25000, 'hyderabad');

INSERT INTO employee2 
values ('shane', 'warne', 30, 20000, 'bangalore');

INSERT INTO employee2
values ('kapil', 'dev', 34, 10000, 'pune'),
('rahul', 'dravid', 31, 20000, 'bangalore'),
('saurabh', 'ganguly', 32, 15000, 'pune');
-- one complier.mysql
SELECT * FROM employee2;

-- problem statement: how many people are in each location and THEiR average salary

select location, count(location) as Total, avg(salary) as Average from employee2
group by location;

-- problem statement: how many people are in each location and THEiR average salary include first n last name
-- solve using join
select first_name, last_name, employee2.location, total_count, avg_salary 
from employee2 JOIN
(select location, count(location) as total_count, avg(salary) as avg_salary from employee2
group by location) temptable 
on employee2.location = temptable.location;

-- can be done with over partition by
select first_name, last_name, location,
count(location) over (PARTITION BY location) as total,
avg(salary)  over (PARTITION BY location) as average
from employee2; #easier

# Session 14
-- row number 
 SELECT first_name, last_name, salary,
 ROW_NUMBER()  over(ORDER BY salary) as row_num from employee2;
 
 -- 5th hghest salary
SELECT * from (SELECT first_name, last_name, salary,
 ROW_NUMBER()  over(ORDER BY salary DESC) as row_num from employee2) temptable 
 where row_num = 5;
 
 -- row numbr for partition based on location
 SELECT first_name, last_name, location, salary,
 ROW_NUMBER() over(PARTITION BY location order by salary DESC) from employee2;
 
 -- hghst salary for each location
 select * from (SELECT first_name, last_name, location, salary,
 ROW_NUMBER() over(PARTITION BY location order by salary DESC) as rownum from employee2) temptable 
 where rownum = 1;
 # ordr is mandatory, use row num whn there are no duplcate   
  
  -- Session15
  -- rank and dense rank
  
  SELECT first_name, last_name, salary,
 RANK()  over(ORDER BY salary) as row_num from employee2; #rank assigns same number for duplicate but skips next number
 
 SELECT first_name, last_name, salary,
 DENSE_RANK()  over(ORDER BY salary) as row_num from employee2; # dense rank assigns same number for duplicate and doesn't skips next number