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