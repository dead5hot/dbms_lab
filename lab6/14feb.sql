-- Sailor (Sid, Sname, Rating, Age),
-- Reserve (Sid, Bid, Date),
-- Boat (Bid, Bname, Color)
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

*/



-- 1.
SELECT S.Sid, S.Sname
FROM Sailor S
WHERE S.Rating > ANY (
	SELECT S2.Rating
	FROM Sailor S2
	WHERE S2.Sname = 'Art'
);

-- 2.
SELECT S.Sid, S.Sname
FROM Sailor S
WHERE S.Rating >= ALL (
	SELECT S2.Rating
	FROM Sailor S2
);

-- 3.
SELECT S.Sid, S.Sname
FROM Sailor S
WHERE S.Rating <= ALL (
	SELECT S2.Rating
	FROM Sailor S2
);

-- 4.
SELECT *
FROM Boat B
WHERE B.Color NOT IN (
	SELECT B2.Color
	FROM Boat B2
	WHERE B2.Color = 'Red'
);

-- 5.
SELECT *
FROM Boat B
WHERE B.Bname != 'Interlake';

-- 6.
SELECT *
FROM Sailor S
WHERE S.Sname IN (
	'Zorba',
	'Horatio',
	'Dustin'
);

-- 7.
SELECT *
FROM Boat
WHERE Color = ANY (
	SELECT Color
	FROM Boat
	WHERE Color = 'Red' OR Color = 'Blue' OR Color = "Black"
);

-- 8.
SELECT S.Sid
FROM Sailor S
WHERE S.Sid NOT IN(
	SELECT R.Sid
	FROM Reserve R
	WHERE R.Date = "1998-06-11" OR R.Date = "1998-12-11"
);

-- 9.
SELECT B.Bid
FROM Boat B
WHERE B.Bid NOT IN (
	SELECT R.Bid
	FROM Reserve R
	WHERE R.Date BETWEEN "1998-06-11" AND "1998-12-11"
);

-- 10.
SELECT S.Sname
FROM Sailor S
WHERE S.Rating BETWEEN 7 AND 10;

-- 11.
SELECT S.Sname
FROM Sailor S
WHERE S.Age NOT BETWEEN 25 AND 40;

-- 12.
SELECT *
FROM Sailor S
WHERE EXISTS (
	SELECT *
	FROM Reserve R
	WHERE R.Sid = S.Sid
);

-- 13.
SELECT S.Sname
FROM Sailor S
WHERE S.Sid IN (
	SELECT R.Sid
	FROM Reserve R
	WHERE R.Bid IN (
		SELECT B.Bid
		FROM Boat B
		WHERE B.Color = 'Red' AND B.Color NOT IN (
			SELECT B1.Bid
			FROM Boat B1
			WHERE B1.Color = 'Black'
		)
	)
);

-- 14.
SELECT S.Sname
FROM Sailor S
WHERE NOT EXISTS (
	SELECT *
	FROM Boat B
	WHERE NOT EXISTS (
		SELECT *
		FROM Reserve R
		WHERE R.Sid = S.Sid AND R.Bid = B.Bid
	)
 );
