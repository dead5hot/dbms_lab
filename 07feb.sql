-- lab5 (07feb)
create table Student_information(
	student_name varchar(30),
	student_id int,
	age real,
	PRIMARY KEY(student_id)
);
create table Marks_details(
	sid int,
	gpa real,
	grade varchar(3),
	FOREIGN KEY(sid) REFERENCES Student_information(student_id)
);
create table Attendance(
	sid int,
	perc_attendance real,	
	FOREIGN KEY(sid) REFERENCES Student_information(student_id)
);
create table Sports_enrollment(
	s_name varchar(30),
	sports_id int,
	activity varchar(30)
);

insert into Student_information values('Liam',9221,21);
insert into Student_information values('Noah',9222,22);
insert into Student_information values('John',9223,23);
insert into Student_information values('Owen',9224,26);
insert into Student_information values('Luke',9225,20);
insert into Student_information values('Jack',9226,19);

insert into Marks_details values(9226,9.8,'A+');
insert into Marks_details values(9225,9.2,'A');
insert into Marks_details values(9224,8.0,'B+');
insert into Marks_details values(9223,7.5,'B');
insert into Marks_details values(9222,6.0,'C+');
insert into Marks_details values(9221,5.7,'C');

insert into Attendance values(9221,100);
insert into Attendance values(9223,92.7);
insert into Attendance values(9222,80.1);
insert into Attendance values(9224,75.4);
insert into Attendance values(9226,60.5);
insert into Attendance values(9225,77.2);

insert into Sports_enrollment values('Liam',001,'Table tennis');
insert into Sports_enrollment values('Noah',002,'Chess');
insert into Sports_enrollment values('John',003,'Cricket');
insert into Sports_enrollment values('Owen',004,'Football');
insert into Sports_enrollment values('Luke',005,'Cycle Racing');
insert into Sports_enrollment values('Jack',006,'Badminton');


-- 1.
SELECT Student_infromation.student_name, Marks_details.gpa, Marks_details.grade
FROM Student_information INNER JOIN Marks_details
ON Student_information.student_id = Marks_details.sid;

-- 2.

SELECT Student_information.student_name, Student_information.age, Marks_details.gpa, Marks_details.grade
FROM Student_infomation INNER JOIN Marks_details
ON Student_information.student_id = Marks_details.sid;

-- 3.

SELECT Student_information.student_name, Student_information.age, Marks_details.gpa, Attendance.perc_attendance
FROM Student_infomation INNER JOIN Marks_details
ON Student_information.student_id = Marks_details.sid
INNER JOIN Attendance
ON Student_information.student_id = Attendance.sid;

-- 4.
insert into Student_information values('Soham',109,23);


-- 5.
SELECT Sports_enrollment.activity
FROM Sports_enrollment INNER JOIN Student_information
ON Student_infomation.student_name = Sports_enrollment.s_name;

-- 6.

