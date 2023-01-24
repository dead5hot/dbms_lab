/* create table branch(
	branch_name varchar(20),
	branch_city varchar(20),
	assets int NOT NULL,
	PRIMARY KEY(branch_name)
);
create table customer(
	customer_name varchar(20),
	branch_name varchar(20),
	customer_city varchar(20),
	FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);
create table loan(
	loan_number varchar(20),
	branch_name varchar(20),
	amount int,
	FOREIGN KEY(branch_name) REFERENCES customer(branch_name)
);
*/
create table borrower(
	customer_name varchar(20),
	loan_number varchar(20),
	FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
	FOREIGN KEY(loan_number) REFERENCES loan(loan_number)
);
/*
create table account(
	account_number int,
	branch_name varchar(20),
	balance int,
	FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);
insert into table branch values();
CREATE VIEW Query1(C_Name,B_Name,B_city)
AS SELECT customer.customer_name, branch.branch_name, branch.branch_city
FROM customer, branch, loan
WHERE loan,amount>50000 and loan.branch_name and customer.branch_name=branch.branch_name;
*/
