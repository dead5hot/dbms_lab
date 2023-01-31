/*
create table Owner(
	driver_id varchar(20),
	name varchar(20),
	hometown varchar(40),
	birthyear int,
	PRIMARY KEY(driver_id)
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
insert into Owner values('UP002','Owen','banaras',2005);
insert into Owner values('RJ001','Luke','kota',2001);
insert into Owner values('MP001','Jack','ujjain',2003);
insert into Owner values('CG001','Levi','raipur',2004);


insert into accident_record values('R141',2010,'patna','BR001');
insert into accident_record values('R145',2021,'gaya','JH001');
insert into accident_record values('R149',2022,'delhi','UP001');
insert into accident_record values('R160',2023,'dhanbad','UP001');
insert into accident_record values('R169',2015,'raipur','MP001');



insert into compensation_record values('R141',20000);
insert into compensation_record values('R145',200000);
insert into compensation_record values('R149',300000);
insert into compensation_record values('R160',50000);
insert into compensation_record values('R169',75000);


-- 1.
ALTER TABLE Owner
ADD car_model varchar(30)
AFTER name;

*/


-- 2.

