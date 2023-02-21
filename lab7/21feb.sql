/*
CREATE TABLE Sailor(
        Sid int,
        Sname varchar(30),
        Rating int,
        Age real,
        PRIMARY KEY(Sid)
);

CREATE TABLE Boat(
        Bid int,
        Bname varchar(30),
        Color varchar(20),
        PRIMARY KEY(Bid)
);

CREATE TABLE Reserve(
        Sid int,
        Bid int,
        Date date,
        FOREIGN KEY(Sid) REFERENCES Sailor(Sid),
        FOREIGN KEY(Bid) REFERENCES Boat(Bid)
);

INSERT INTO Sailor VALUES( 22, "Dustin" ,  7  , 45   );
INSERT INTO Sailor VALUES( 29, "Brutus" ,  1  , 33   );
INSERT INTO Sailor VALUES( 31, "Lubber" ,  8  , 55   );
INSERT INTO Sailor VALUES( 32, "Andy"   ,  8  , 25.5 );
INSERT INTO Sailor VALUES(  5, "Art"    ,  3  , 25.5 );
INSERT INTO Sailor VALUES( 58, "Rusty"  ,  10 , 35   );
INSERT INTO Sailor VALUES( 64, "Rusty"  ,  10 , 35   );
INSERT INTO Sailor VALUES( 71, "Zorba"  ,  10 , 16   );
INSERT INTO Sailor VALUES( 74, "Horatio",  9  , 35   );
INSERT INTO Sailor VALUES( 95, "Bob"    ,  3  , 63.5 );

INSERT INTO Boat VALUES( 101, "Interlake", "Blue");
INSERT INTO Boat VALUES( 102, "Interlake", "Red");
INSERT INTO Boat VALUES( 103, "Clipper", "Green");
INSERT INTO Boat VALUES( 104, "Marine", "Red");

INSERT INTO Reserve VALUES( 22, 101, "1998-10-10");
INSERT INTO Reserve VALUES( 22, 102, "1998-10-10");
INSERT INTO Reserve VALUES( 22, 103, "1998-08-10");
INSERT INTO Reserve VALUES( 22, 104, "1998-07-10");
INSERT INTO Reserve VALUES( 31, 102, "1998-10-11");
INSERT INTO Reserve VALUES( 31, 103, "1998-06-11");
INSERT INTO Reserve VALUES( 31, 104, "1998-12-11");
INSERT INTO Reserve VALUES( 64, 101, "1998-05-09");
INSERT INTO Reserve VALUES( 64, 102, "1998-08-09");
INSERT INTO Reserve VALUES( 74, 103, "1998-08-09");
INSERT INTO Reserve VALUES( 95, 101, "1998-10-10");

SELECT * FROM Sailor;
SELECT * FROM Reserve;
SELECT * FROM Boat;


-- 1.
SELECT AVG(Age)
FROM Sailor;

-- 2.
SELECT AVG(Age)
FROM Sailor
WHERE Rating = 10;

-- 3.
SELECT S.Sname, S.Age
FROM Sailor S
WHERE S.Age >= ALL (
	SELECT S1.Age
	FROM Sailor S1
);

-- 4.
SELECT COUNT(Sid)
FROM Sailor;

-- 5.
SELECT COUNT(DISTINCT(Sname))
FROM Sailor;

-- 6.
SELECT S.Sname, S.Age
FROM Sailor S
WHERE S.Age > ALL (
	SELECT S1.Age
	FROM Sailor S1
	WHERE S1.Rating = 10
);



CREATE TABLE Student_information(
	sname varchar(30),
	sid int,
	age real,
	PRIMARY KEY(sid)
);

CREATE TABLE Marks_details(
	sid int,
	cid varchar(6),
	gpa real,
	grade varchar(3),
	FOREIGN KEY(sid) REFERENCES Student_information(sid)
);

CREATE TABLE Attendance(
	sid int,
	perc_attend real,
	FOREIGN KEY(sid) REFERENCES Student_information(sid)
);


insert into Student_information values('Liam',9221,21);
insert into Student_information values('Noah',9222,22);
insert into Student_information values('John',9223,23);
insert into Student_information values('Owen',9224,26);
insert into Student_information values('Owen',9228,18);
insert into Student_information values('Luke',9225,20);
insert into Student_information values('Jack',9226,19);

insert into Marks_details values(9226,'md001',9.8,'A+');
insert into Marks_details values(9225,'ms002',9.2,'A');
insert into Marks_details values(9224,'ms002',8.0,'B+');
insert into Marks_details values(9223,'md001',7.5,'B');
insert into Marks_details values(9222,'hs001',6.0,'C+');
insert into Marks_details values(9221,'hs001',5.7,'C');
insert into Marks_details values(9228,'hs002',7.7,'B+');

insert into Attendance values(9221,0);
insert into Attendance values(9223,92.7);
insert into Attendance values(9222,80.1);
insert into Attendance values(9224,75.4);
insert into Attendance values(9226,60.5);
insert into Attendance values(9225,77.2);
insert into Attendance values(9228,88.2);


-- 1.
SELECT COUNT(Sid)
FROM Marks_details
WHERE grade = 'A';

-- 2.
SELECT COUNT(Sid)
FROM Marks_details
WHERE gpa > (
	SELECT AVG(gpa)
	FROM Marks_details
);

-- 3.
SELECT COUNT(DISTINCT(sname))
FROM Student_information;

-- 4.
SELECT SI.sname
FROM Student_information SI, Attendance A
WHERE SI.sid = A.sid AND A.perc_attend = (
	SELECT MIN(A1.perc_attend)
	FROM Attendance A1
);

-- 5.
SELECT SI.sname
FROM Student_information SI, Attendance A
WHERE SI.sid = A.sid AND A.perc_attend = (
	SELECT MAX(A1.perc_attend)
	FROM Attendance A1
);

-- 6.
SELECT MD.gpa, SI.age
FROM Marks_details MD, Student_information SI, Attendance A
WHERE MD.sid = SI.sid AND SI.sid = A.sid AND A.perc_attend > (
	SELECT AVG(A1.perc_attend)
	FROM Attendance A1
);

*/