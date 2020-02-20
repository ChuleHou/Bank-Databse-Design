Create table Bank(
Bankname     VARCHAR(15)    NOT NULL,
Address      VARCHAR(30),
Phonenumber  INT            NOT NULL,
SWIFT        VARCHAR(8)     NOT NULL,
RNumber      VARCHAR(9)     NOT NULL,
IDnumber     VARCHAR(11)    NOT NULL,
PRIMARY KEY (SWIFT,Address,IDnumber)
);

Create table Customer(
Phonenumber  VARCHAR(11)    NOT NULL,
IDnumber     VARCHAR(11)    NOT NULL,
Fname        VARCHAR(15)    NOT NULL,
Mname        VARCHAR(1)     NOT NULL,
Lname        VARCHAR(15)    NOT NULL,
Address      VARCHAR(30),
Email        VARCHAR(99)    NOT NULL,
Bdate        DATE,
Anumber      VARCHAR(16)    NOT NULL,
FOREIGN KEY (IDnumber) REFERENCES Bank(IDnumber),
PRIMARY KEY (Lname,Mname,Fname)
);

Create table Card(
Fname        VARCHAR(15)    NOT NULL,
Mname        VARCHAR(15)    NOT NULL,
Lname        VARCHAR(15)    NOT NULL,
Cnumber      VARCHAR(16)   NOT NULL,
Scode        VARCHAR(3)     NOT NULL,
Ctype        CHAR           NOT NULL,
FOREIGN KEY (Fname) REFERENCES Customer(Fname),
FOREIGN KEY (Lname) REFERENCES Customer(Lname),
FOREIGN KEY (Mname) REFERENCES Customer(Mname),
PRIMARY KEY (Fname,Lname,Mname,Cnumber)
);

Create table Account(
Anumber      VARCHAR(16)    NOT NULL,
RNumber      VARCHAR(9)     NOT NULL,
BStatementid VARCHAR(10)    NOT NULL,
Atype        CHAR(10)       NOT NULL,
Cnumber      VARCHAR(16)        NOT NULL,
Abalance     INT            NOT NULL,
Drate        VARCHAR(9)     NOT NULL,
FOREIGN KEY (Rnumber) REFERENCES Bank(Rnumber),
FOREIGN KEY (Cnumber) REFERENCES Card(Cnumber),
PRIMARY KEY (Anumber,Rnumber)
);

Create table Employee(
EFname       VARCHAR(15)    NOT NULL,
EMname       VARCHAR(15)    NOT NULL,
ELname       VARCHAR(15)    NOT NULL,
Ssn          CHAR(9)        NOT NULL,
Address      VARCHAR(30),
Phonenumber  INT            NOT NULL,
Postion      CHAR(99),
IDnumber     VARCHAR(11)    NOT NULL,
Email        VARCHAR(99)    NOT NULL,
Company      VARCHAR(15)    NOT NULL,
FOREIGN KEY (Company) REFERENCES Bank(Bankname),
PRIMARY KEY (Ssn,IDnumber)
);

Select*From Employee;
Select*From Account;
Select*From Card;
Select*From Customer;
Select*From Bank;

Insert Into Account Values (1234567890123456,123456789,1234567890,'Checking',1234567890098765,3000000,'3.1%');
Insert Into Account Values (1234567890123455,123456789,1234567890,'Checking',1234567890098764,-2000,'3.5%');

Select*From Employee;
Select*From Account;
Select*From Card;
Select*From Customer;
Select*From Bank;

Insert Into Customer Values (57399999999,12345678901,'GG','G','GGG','234 asd','saidjoas@gmail.com','1986-04-05',1234567890123456);

Select*From Employee;
Select*From Account;
Select*From Card;
Select*From Customer;
Select*From Bank;

DELETE From Account Where Account.Abalance<0;

Select*From Employee;
Select*From Account;
Select*From Card;
Select*From Customer;
Select*From Bank;

ALTER TABLE Customer DROP COLUMN Mname CASCADE;

Select*From Employee;
Select*From Account;
Select*From Card;
Select*From Customer;
Select*From Bank;

-- check balance
Select Account.Abalance
From Account
Order by Abalance DESC;

-- check Deposit rate
Select Account.Drate
From Account,Customer
Where Account.Anumber=Customer.Anumber;

-- check how many people's balance above 1 million dollar
Select Count(Account.Abalance)
From Account
Where Account.Abalance >= 1000000 
Order by Account.Abalance DESC;


DROP TABLE Employee;
DROP TABLE Account;
DROP TABLE Card;
DROP TABLE Customer;
DROP TABLE Bank;








