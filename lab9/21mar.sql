CREATE TABLE Emp(
	eid int,
	ename varchar(20),
	age int,
	salary real,
	PRIMARY KEY(eid)
);

CREATE TABLE Works(
	eid int,
	did int,
	pct_time int,
	PRIMARY KEY(eid, did)
);

CREATE TABLE Dept(
	did int,
	budget real,
	managerid int,
	PRIMARY KEY(did)
);

INSERT Emp VALUES(106,'Kumar',25,56000);
INSERT Emp VALUES(107,'Smita',24,52000);
INSERT Emp VALUES(109,'Ranit',29,64000);
INSERT Emp VALUES(110,'Vishal',28,45000);
INSERT Emp VALUES(112,'Udita',24,60000);
INSERT Emp VALUES(113,'Nitesh',26,53000);
INSERT Emp VALUES(115,'Abhay',26,50000);
INSERT Emp VALUES(116,'Om',23,80000);



INSERT Dept VALUES(46,60000,63);
INSERT Dept VALUES(47,50000,69);
INSERT Dept VALUES(48,60000,75);
INSERT Dept VALUES(50,100000,85);
INSERT Dept VALUES(62,100000,65);
INSERT Dept VALUES(63,500000,75);


INSERT Works VALUES(106,47,15);
INSERT Works VALUES(106,48,85);
INSERT Works VALUES(109,50,75);
INSERT Works VALUES(109,62,25);
INSERT Works VALUES(112,62,55);
INSERT Works VALUES(112,63,45);
INSERT Works VALUES(113,62,35);
INSERT Works VALUES(115,62,100);
INSERT Works VALUES(116,46,90);
INSERT Works VALUES(106,46,100);

SELECT * FROM Emp;
SELECT * FROM Works;
SELECT * FROM Dept;

-- 1.
-- SELECT e.ename, e.age
-- FROM Emp e, Works w, Works w1
-- WHERE e.eid = w.eid && w.did = 50 && w1.did = 62 && w1.eid = w.eid;

gpt:
SELECT e.ename, e.age
FROM Emp e
JOIN Works w1 ON e.eid = w1.eid AND w1.did = 50
JOIN Works w2 ON e.eid = w2.eid AND w2.did = 62;


-- 2.
SELECT did, COUNT(eid) as num_employees
FROM Works
GROUP BY did;

gpt:
-- SELECT d.did, COUNT(w.eid) as num_employees
-- FROM Dept d
-- LEFT JOIN Works w ON d.did = w.did
-- GROUP BY d.did;


-- 3.
SELECT eid, SUM(budget) as budget_total
FROM Dept d
JOIN Works w ON d.did = w.did
GROUP BY eid;

gpt:
-- SELECT e.eid, SUM(d.budget) as budget_total
-- FROM Emp e
-- JOIN Works w ON e.eid = w.eid
-- JOIN Dept d ON w.did = d.did
-- GROUP BY e.eid;


-- 4.
SELECT ename
FROM Emp E
WHERE E.salary > ANY(
	SELECT SUM(D.budget)
	FROM Works W,Dept D
	WHERE W.did=D.did AND E.eid=W.eid
	GROUP BY W.eid
);

gpt:
-- SELECT e.ename
-- FROM Emp e
-- JOIN Works w ON e.eid = w.eid
-- JOIN Dept d ON w.did = d.did
-- WHERE e.salary > (
-- 	SELECT SUM(d.budget)
-- 	FROM Dept d
-- 	JOIN Works w2 ON d.did = w2.did 
-- 	WHERE w2.eid = e.eid
-- )
-- GROUP BY e.eid;

-- 5.
gpt:
SELECT managerid
FROM Dept
GROUP BY managerid
HAVING MIN(budget) > 100000;

-- 6.
gpt:
SELECT managerid
FROM Dept
WHERE budget = (SELECT MAX(budget) FROM Dept);

-- 7.
gpt:
SELECT d.managerid
FROM Dept d
GROUP BY d.managerid
HAVING SUM(d.budget) > 80000;
