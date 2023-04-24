-- 1.
CREATE TABLE Students(
	sid int,
	name varchar(30),
	marks int
);

CREATE TABLE BACKUP_Students AS
SELECT *
FROM Students;

INSERT INTO Students VALUES(100,'Liam',75);
INSERT INTO Students VALUES(101,'Noah',65);
INSERT INTO Students VALUES(102,'Emma',85);
INSERT INTO Students VALUES(103,'Levi',95);
INSERT INTO Students VALUES(104,'Jack',45);

SELECT * FROM Students;
SELECT * FROM BACKUP_Students;

DELIMITER $$
CREATE TRIGGER backup_trigger
BEFORE DELETE
ON Students FOR EACH ROW
BEGIN
	INSERT INTO BACKUP_Students VALUES(old.sid, old.name, old.marks);
END $$
DELIMITER ;

DELETE FROM Students
WHERE sid = 102;

SELECT * FROM Students;
SELECT * FROM BACKUP_Students;



-- 2.
CREATE TABLE Marks(
	tid int,
	name varchar(30),
	subj1 real,
	subj2 real,
	subj3 real,
	total real,
	per real
);

SELECT * FROM Marks;

CREATE TRIGGER Total_Marks_Calculator
BEFORE INSERT ON
Marks FOR EACH ROW SET
new.total = new.subj1 + new.subj2 + new.subj3,
new.per = new.total * 100 / 300;


INSERT INTO Marks VALUES(100,'Liam',75,54,74,0,0);
INSERT INTO Marks VALUES(101,'Noah',65,74,87,0,0);
INSERT INTO Marks VALUES(102,'Emma',85,84,97,0,0);
INSERT INTO Marks VALUES(103,'Levi',95,49,87,0,0);
INSERT INTO Marks VALUES(104,'Jack',45,29,37,0,0);

SELECT * FROM Marks;