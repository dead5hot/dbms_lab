/*
create table Owner(
	driver_id varchar(20),
	name varchar(20),
	hometown varchar(40),
	birthyear int NOT NULL,
	PRIMARY KEY(driver_id),
	CHECK (2023-birthyear>=18)
);
create table accident_record(
	report_number varchar(20),
	accident_year int,
	location varchar(20),
	driver_id varchar(20),
	PRIMARY KEY(report_number),
	FOREIGN KEY(driver_id) REFERENCES Owner(driver_id)
);

create table compensation_record(
	report_number varchar(20),
	damage_amount int,
	FOREIGN KEY(report_number) REFERENCES accident_record(report_number)
);


insert into Owner values('BR001','Liam','patna',2000);
insert into Owner values('UP001','Noah','kanpur',1995);
insert into Owner values('JH001','John','dhanbad',2000);
insert into Owner values('UP002','Owen','banaras',1985);
insert into Owner values('RJ001','Luke','kota',2001);
insert into Owner values('MP001','Jack','ujjain',2003);
insert into Owner values('CG001','Levi','raipur',2004);


insert into accident_record values('R141',2010,'patna','BR001');
insert into accident_record values('R146',2011,'kanpur','UP001');
insert into accident_record values('R151',2015,'dhanbad','JH001');
insert into accident_record values('R156',2017,'kota','UP001');
insert into accident_record values('R161',2018,'raipur','UP002');
insert into accident_record values('R162',2018,'gaya','RJ001');
insert into accident_record values('R163',2020,'lucknow','MP001');
insert into accident_record values('R164',2021,'kota','CG001');
insert into accident_record values('R169',2022,'delhi','CG001');



insert into compensation_record values('R141',20000);
insert into compensation_record values('R146',200000);
insert into compensation_record values('R151',300000);
insert into compensation_record values('R156',50000);
insert into compensation_record values('R161',75000);
insert into compensation_record values('R162',5000);
insert into compensation_record values('R163',10000);
insert into compensation_record values('R164',100000);
insert into compensation_record values('R169',90000);

-- /*
-- 1.
ALTER TABLE Owner
ADD car_model varchar(30)
AFTER name;

UPDATE Owner SET car_model = 'Nexon' WHERE driver_id = 'BR001';
UPDATE Owner SET car_model = 'Kia. Sonet' WHERE driver_id = 'UP001';
UPDATE Owner SET car_model = 'Tata. Punch' WHERE driver_id = 'JH001';
UPDATE Owner SET car_model = 'Renault. Kiger' WHERE driver_id = 'UP002';
UPDATE Owner SET car_model = 'Nissan. Magnite' WHERE driver_id = 'RJ001';
UPDATE Owner SET car_model = 'Hyundai' WHERE driver_id = 'MP001';
UPDATE Owner SET car_model = 'Mercedes-Benz' WHERE driver_id = 'CG001';

-- 2.
SELECT COUNT(report_number)
FROM accident_record
WHERE accident_year=2018;


-- 3.

SELECT SUM(damage_amount),AVG(damage_amount)
FROM compensation_record;

-- 4.
SELECT location, accident_year FROM accident_record WHERE report_number='R141';

-- 5.
CREATE or REPLACE VIEW Query1(Driver_Id,Name,Car_Model,Report_Number,Damage_Amount)
AS SELECT Owner.driver_id,Owner.name,Owner.car_model,accident_record.report_number,compensation_record.damage_amount
FROM Owner,accident_record,compensation_record
WHERE accident_record.accident_year > 2020 AND Owner.driver_id = accident_record.driver_id AND accident_record.report_number = compensation_record.report_number;

-- 6.
CREATE or REPLACE VIEW Query2(Driver_Id,Driver_Name,Report_Number)
AS SELECT Owner.driver_id,Owner.name,compensation_record.report_number
FROM Owner,accident_record,compensation_record
WHERE compensation_record.damage_amount < 210000 AND Owner.driver_id = accident_record.driver_id AND accident_record.report_number = compensation_record.report_number;


-- 7.
UPDATE compensation_record SET damage_amount = 300000 WHERE report_number = 'R169';

-- 8.
SELECT Max(damage_amount), Min(damage_amount)
FROM compensation_record;

*/