/*Create command*/

create database UMS;

use UMS;

create table Students(
student_id int primary key,
roll_no int unique,
first_name varchar(10),
last_name varchar(10),
email varchar(30),
phone varchar(20),
dob varchar(10),
gender enum('F', 'M', 'O'),
admission_year varchar(10),
status enum('Admitted', 'Not admitted')
);

create table Departments(
department_id int primary key,
department_name varchar(20),
hod_name varchar(20),
office_phone varchar(20)
);

alter table Students
add column department_id int;

alter table Students
add constraint fk
Foreign Key (department_id)
references Departments(department_id); 

create table Faculty(
faculty_id int primary key,
first_name varchar(10),
last_name varchar(10),
email varchar(10),
phone varchar(20),
designation varchar(10)
);

alter table Faculty
add column department_id int;

alter table Faculty
add constraint fk_2
Foreign Key (department_id)
references Departments(department_id); 

create table Courses(
course_id int primary key,
course_code int unique,
course_name varchar(10),
credits varchar(10),
semester int);

alter table Courses
add column department_id int;

alter table Courses
add column faculty_id int;

alter table Courses
add constraint fk_3
Foreign Key (department_id)
references Departments(department_id);

alter table Courses
add constraint fk_4
Foreign Key (faculty_id)
references Faculty(faculty_id);

create table Enrollments(
enrollment_id int primary key,
student_id int references Students(student_id),
course_id int references Courses(course_id),
semester int,
academic_year int);

create table Attendance(
attendance_id int primary key,
student_id int references Students(student_id),
course_id int references Courses(course_id),
date varchar(10),
status varchar(10)
);

create table Exams(
exam_id int primary key,
course_id int references Courses(course_id),
exam_type varchar(10),
exam_date varchar(10),
max_marks int
);

create table Results(
result_id int primary key,
student_id int references Students(student_id),
exam_id int references Exams(exam_id),
marks_obtained int,
grade varchar(2)
);

create table Fees(
fee_id int primary key,
student_id int references Students(student_id),
semester int,
total_amount int,
paid_amount int,
payment_date varchar(10),
status varchar(10)
);

insert into attendance values(1, 1, 1, '14-2-2026', 'eligible');
insert into attendance values(2 ,2 ,2, '14-2-2026', 'NA');

insert into departments values
(1, 'MCA', 'Kaiser Sir', 222222),
(2, 'Electronics', 'XYZ', 333333);

insert into faculty values
(1, 'Syed', 'Mohsin', 'mohsin@', 44444444, 'Professor', 1),
(2, 'Naira', 'Shah', 'naira@', 55555555, 'Professor', 2);

insert into courses values
(1, 101, 'DBMS', 4, 1, 1, 1),
(2, 102, 'DE', 2, 1, 1, 2);

insert into enrollments values
(1, 1, 1, 1, 2025),
(2, 2, 2, 1, 2024);

insert into exams values
(1, 1, 'regular', '12-2-2025', 20),
(2, 2, 'regular', '13-2-2025', 20);

insert into fees values
(1, 1, 1, 24200, 24200, '12-2-2025', 'eligible'),
(2, 2, 1, 14400, 14400, '12-2-2025', 'eligible');

insert into results values
(1, 1, 1, 100, 'O'),
(2, 2, 2, 100, 'O');

insert into students values
(1, 2, 'Fadeela', 'Naqash', 'fadee@', 777777, '21-09-2001', 'F', 2025, 'Admitted', 1),
(2, 1, 'Khushboo', 'Jan', 'jan@', 888888, '1-01-2002', 'F', 2025, 'Admitted', 2);


/*Retrieval command*/
select * from Students;

select * from Departments;

select * from Faculty;

select * from Courses;

select * from Erollments;

select * from Attendance;

select * from exams;

select * from results;

select * from fees;
  
delete from attendance 
where attendance_id = 2;



/*Update command*/
update attendance
set date = '12-2-2024';

update courses
set semester = 2
where course_id = 1;

update students
set roll_no = 1
where student_id = 1;

update faculty
set phone = 888888
where faculty_id = 1;

update departments
set office_phone = 1111111
where department_id = 1;

update enrollments
set semester = 2
where enrollment_id = 1;

update exams
set exam_date = '12-2-2026'
where exam_id = 1;

update fees
set semester = 2
where fee_id = 1;

update results
set grade = 'O+'
where result_id = 1;



/*Delete Command*/
delete from courses
where course_id = 2;

delete from students
where student_id = 2; 

delete from faculty
where faculty_id = 2;

delete from departments
where department_id = 2;

delete from enrollments
where enrollment_id = 2;

delete from exams
where exam_id = 2;

delete from fees
where fee_id = 2;

delete from results
where result_id = 2;

drop table attendance;

drop table courses;

drop table students;

drop table faculty;

drop table fees;

drop table results;

drop table enrollments;

drop table exams;

drop table departments;

drop database ums;
