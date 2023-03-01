
drop table  department ;
drop table  course ;
drop table  courseStudent; 
drop table  student ;
drop table  teacher ;
drop table  studentTeacher; 

CREATE TABLE department(

dep_id INTEGER PRIMARY KEY,
dep_name VARCHAR,
hod VARCHAR

);

CREATE TABLE course(
dep_id_fk INTEGER FOREIGN KEY REFERENCES department(dep_id),
  cname VARCHAR,
cid INTEGER PRIMARY KEY);

CREATE table student(
std_id INTEGER PRIMARY KEY,
  std_name VARCHAR(20),
  std_major VARCHAR (20),
  std_gender VARCHAR(10),
  std_phone_no INTEGER,
  std_email VARCHAR(20),
  std_hire_date VARCHAR(15),
  std_GPA DECIMAL(5),
);

CREATE TABLE courseStudent(

cid INTEGER FOREIGN KEY REFERENCES course(cid),
std_id INTEGER  FOREIGN KEY  REFERENCES student(std_id),
);



CREATE table teacher(
tech_id INTEGER PRIMARY KEY,
  tech_name VARCHAR,
  tech_phone_no INTEGER,
  tech_mail VARCHAR,
  tech_gender VARCHAR,
  tech_major VARCHAR ,
  tech_salary INTEGER,
);
create table studentTeacher(
std_id INTEGER FOREIGN KEY  REFERENCES student(std_id),
tech_id INTEGER   FOREIGN KEY REFERENCES teacher(tech_id),
);
select * from department 
select * from course 
select * from courseStudent 
select * from student 
select * from teacher 
select * from studentTeacher 

