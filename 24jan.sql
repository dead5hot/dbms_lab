/*
create table branch(
	branch_name varchar(20),
	branch_city varchar(20),
	assets int NOT NULL,
	PRIMARY KEY(branch_name)
);
create table customer(
	customer_name varchar(20),
	branch_name varchar(20),
	customer_city varchar(20),
	PRIMARY KEY (customer_name),
	FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);
create table loan(
	loan_number varchar(20),
	branch_name varchar(20),
	amount int,
	PRIMARY KEY (loan_number),
	FOREIGN KEY(branch_name) REFERENCES customer(branch_name)
);

ALTER TABLE customer
ADD PRIMARY KEY (customer_name);

ALTER TABLE loan
ADD PRIMARY KEY (loan_number);

create table borrower(
	customer_name varchar(20),
	loan_number varchar(20),
	FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
	FOREIGN KEY(loan_number) REFERENCES loan(loan_number)
);
create table account(
	account_number int,
	branch_name varchar(20),
	balance int,
	FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);

insert into branch values('SBI001D','Dhanbad',100000);
insert into branch values('PNB002T','Tatanagar',70000);
insert into branch values('YBI002P','Patna',200000);
insert into branch values('ISI002K','Kolkata',150000);
insert into branch values('BOB011R','Rishikesh',75000);

insert into customer values('Liam','SBI001D','Patna');
insert into customer values('John','PNB002T','Bombay');
insert into customer values('Luke','YBI002P','Delhi');
insert into customer values('Levi','BOB011R','Shimla');
insert into customer values('Emma','SBI001D','Gaya');

insert into loan values('5001','SBI001D',50001);
insert into loan values('5002','PNB002T',5000);
insert into loan values('5003','YBI002P',900);
insert into loan values('5004','BOB011R',10000);
insert into loan values('5005','SBI001D',75000);

UPDATE loan
    -> SET amount=50001
    -> WHERE loan_number='5001';

UPDATE loan SET amount=75000 WHERE loan_number='5005';


insert into borrower values('Emma','5001');
insert into borrower values('Liam','5005');
insert into borrower values('John','5002');
insert into borrower values('Luke','5003');
insert into borrower values('Levi','5004');

insert into account values(15025057,'PNB002T',150000);
insert into account values(15025058,'ISI002K',50000);
insert into account values(15025059,'SBI001D',20000);
insert into account values(15025060,'YBI002P',1000);
insert into account values(15025061,'BOB011R',200000);

*/
/*

-- 1.
CREATE or REPLACE VIEW Query1(C_Name,B_Name,B_city)
AS SELECT customer.customer_name, branch.branch_name, branch.branch_city
FROM customer, branch, loan, borrower
WHERE loan.amount>50000 and loan.loan_number=borrower.loan_number and customer.customer_name=borrower.customer_name and loan.branch_name=branch.branch_name;

-- 2.
CREATE or REPLACE VIEW Query2(C_Name)
AS SELECT customer.customer_name
FROM customer
WHERE customer.customer_city='Bombay';

-- 3.
CREATE or REPLACE VIEW Query3(ACC_Number,B_Name,B_Assets)
AS SELECT account.account_number, branch.branch_name, branch.assets
FROM account, branch
WHERE account.balance>100000 and branch.branch_name=account.branch_name;

-- 4.
CREATE or REPLACE VIEW Query4(C_Name,B_Name,B_city,Lona_no)
AS SELECT customer.customer_name, customer.branch_name, branch.branch_city, borrower.loan_number
FROM customer, branch, borrower
WHERE customer.customer_name=borrower.customer_name and customer.branch_name=branch.branch_name;

-- 5.
DELETE borrower FROM borrower INNER JOIN loan WHERE loan.amount<1000 and borrower.loan_number=loan.loan_number;

-- 6.
UPDATE loan, branch
SET loan.amount = loan.amount + 10000
WHERE branch.assets>80000 and branch.branch_name=loan.branch_name;

*/