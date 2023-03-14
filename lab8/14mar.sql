/*
SELECT S.rating,
HAVING COUNT(*) > 1


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

-- a.
SELECT S.Sid, S.Sname
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


-- b.
SELECT S.Sid, S.Sname
FROM Sailor S
WHERE NOT EXISTS (
        SELECT *
        FROM Boat B
        WHERE NOT EXISTS (
                SELECT *
                FROM Reserve R
                WHERE R.Sid = S.Sid AND R.Bid = B.Bid
        ) && B.Color = 'Red'
);

-- c.
SELECT R.*
FROM Reserve R, Boat B
WHERE R.Bid = B.Bid && B.Bname = 'Interlake';


-- d.
SELECT S.Rating, AVG(S.age)
FROM Sailor S
GROUP BY S.Rating;

-- e.
SELECT S.Rating, AVG(S.age), S.Age
FROM Sailor S
GROUP BY S.Rating
HAVING COUNT(*) > 1 && S.Age >= 18;

-- f.
SELECT COUNT(*)
FROM Reserve R, Boat B
WHERE R.Bid = B.Bid && B.Color = 'Red';


