CREATE TABLE Flights(
	flno int PRIMARY KEY,
	from_city varchar(30),
	to_city varchar(30),
	distance int,
	departs time,
	arrives time,
	price int
);

CREATE TABLE Aircraft(
	aid int PRIMARY KEY,
	aname varchar(30),
	cruisingrange int
);

CREATE TABLE Certified(
	eid int,
	aid int
);

CREATE TABLE Employees(
	eid int,
	ename varchar(30),
	salary int
);

INSERT INTO Flights VALUES( 105 , "Kolkata"   , "Mumbai"    ,     1080 , "04:30:00" , "06:30:00" ,  5250 );
INSERT INTO Flights VALUES( 106 , "Kolkata"   , "Bengaluru" ,     1095 , "07:30:00" , "10:30:00" ,  6250 );
INSERT INTO Flights VALUES( 107 , "Chennai"   , "Bengaluru" ,      565 , "08:30:00" , "09:45:00" ,  3250 ); 
INSERT INTO Flights VALUES( 108 , "Ranchi"    , "Kolkata"   ,      425 , "10:50:00" , "12:45:00" ,  4355 ); 
INSERT INTO Flights VALUES( 109 , "Kolkata"   , "Delhi"     ,     1525 , "13:50:00" , "16:45:00" ,  6355 );

INSERT INTO Aircraft VALUES( 201 , "Boeing_717"  , 1500 ); 
INSERT INTO Aircraft VALUES( 202 , "Boeing_757"  , 1700 ); 
INSERT INTO Aircraft VALUES( 203 , "Boeing_767"  , 1800 ); 
INSERT INTO Aircraft VALUES( 204 , "Boeing_777"  , 2000 ); 
INSERT INTO Aircraft VALUES( 205 , "Boeing_787"  , 1900 ); 
INSERT INTO Aircraft VALUES( 208 , "Airbus_A330" , 3200 ); 
INSERT INTO Aircraft VALUES( 209 , "Airbus_A350" , 3100 ); 

INSERT INTO Certified VALUES( 505 ,  201 );  
INSERT INTO Certified VALUES( 505 ,  203 ); 
INSERT INTO Certified VALUES( 506 ,  205 ); 
INSERT INTO Certified VALUES( 508 ,  203 ); 
INSERT INTO Certified VALUES( 505 ,  204 ); 
INSERT INTO Certified VALUES( 505 ,  202 ); 
INSERT INTO Certified VALUES( 505 ,  204 ); 
INSERT INTO Certified VALUES( 502 ,  203 ); 
INSERT INTO Certified VALUES( 502 ,  204 ); 
INSERT INTO Certified VALUES( 502 ,  205 ); 
INSERT INTO Certified VALUES( 502 ,  201 ); 
INSERT INTO Certified VALUES( 501 ,  208 ); 

INSERT INTO Employees VALUES( 501 , "Jhon"      ,  79000 ); 
INSERT INTO Employees VALUES( 502 , "Harry"     ,  89000 ); 
INSERT INTO Employees VALUES( 503 , "Nick"      ,  75000 ); 
INSERT INTO Employees VALUES( 504 , "Bill"      ,  72000 ); 
INSERT INTO Employees VALUES( 505 , "Smith"     ,  75000 ); 
INSERT INTO Employees VALUES( 506 , "Ananya"    ,  85000 ); 
INSERT INTO Employees VALUES( 507 , "Arundhati" ,  78000 ); 
INSERT INTO Employees VALUES( 508 , "Nilesh"    ,  82000 );

SELECT * FROM Flights;
SELECT * FROM Aircraft;
SELECT * FROM Certified;
SELECT * FROM Employees;


-- 1.
SELECT DISTINCT  A.aname
FROM  Aircraft A
WHERE  A.Aid IN(
	SELECT C.aid
	FROM Certified C, Employees E
	WHERE C.eid = E.eid AND NOT EXISTS(
		SELECT *
		FROM Employees E1
		WHERE E1.eid = E.eid AND E1.salary < 80000
));


-- 4.
SELECT ename
FROM Employees e
JOIN Certified c IN c.eid = e.eid
JOIN Aircraft a IN a.aid = c.aid;
