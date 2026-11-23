
-- BANKSPHERE - DIGITAL BANKING PLATFORM

-- 1. Create Database
CREATE DATABASE BankSphereDB;

USE BankSphereDB;


-- 2. CUSTOMER TABLE
CREATE TABLE Customer
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    NationalID NVARCHAR(30) UNIQUE
);


-- 3. ACCOUNT TABLE
CREATE TABLE Account
(
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    AccountType NVARCHAR(20),
    Balance DECIMAL(15,2)
        CHECK (Balance >= 0),
    OpenedDate DATE,
    Status NVARCHAR(20)
        DEFAULT 'Active',

    CONSTRAINT FK_Account_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
);

-- 4. TRANSACTION TABLE
CREATE TABLE [Transaction]
(
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT,
    TransactionType NVARCHAR(20),
    Amount DECIMAL(15,2)
        CHECK (Amount > 0),
    TransactionDate DATETIME2,
    RelatedAccountID INT NULL,

    CONSTRAINT FK_Transaction_Account
        FOREIGN KEY (AccountID)
        REFERENCES Account(AccountID)
);

-- 5. BRANCH TABLE
CREATE TABLE Branch
(
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName NVARCHAR(100),
    City NVARCHAR(50)
);

-- 6. CARD TABLE
CREATE TABLE Card
(
    CardID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT,
    CardNumberMasked NVARCHAR(20),
    ExpiryDate DATE,
    Status NVARCHAR(20),

    CONSTRAINT FK_Card_Account
        FOREIGN KEY (AccountID)
        REFERENCES Account(AccountID)
);

-- 7. FRAUDFLAG TABLE
CREATE TABLE FraudFlag
(
    FlagID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT,
    Reason NVARCHAR(200),
    FlaggedOn DATETIME2,
    Reviewed BIT DEFAULT 0,

    CONSTRAINT FK_FraudFlag_Transaction
        FOREIGN KEY (TransactionID)
        REFERENCES [Transaction](TransactionID)
);


----------------------------------------------insert data to each Table------------------------------------------------------------------------

USE BankSphereDB;
INSERT INTO Customer (FirstName, LastName, Email, NationalID)
VALUES
('Arun','Kumar','arun@gmail.com','NID001'),
('Priya','Sharma','priya@gmail.com','NID002'),
('Rahul','Verma','rahul@gmail.com','NID003'),
('Sneha','Reddy','sneha@gmail.com','NID004'),
('Karthik','Raj','karthik@gmail.com','NID005'),
('Divya','Nair','divya@gmail.com','NID006'),
('Vikram','Singh','vikram@gmail.com','NID007'),
('Anitha','Devi','anitha@gmail.com','NID008'),
('Suresh','Babu','suresh@gmail.com','NID009'),
('Meena','Kumari','meena@gmail.com','NID010'),
('Ravi','Chandran','ravi@gmail.com','NID011'),
('Pooja','Mehta','pooja@gmail.com','NID012'),
('Ajay','Patel','ajay@gmail.com','NID013'),
('Kavya','Iyer','kavya@gmail.com','NID014'),
('Manoj','Das','manoj@gmail.com','NID015'),
('Nithya','Rao','nithya@gmail.com','NID016'),
('Santhosh','Kumar','santhosh@gmail.com','NID017'),
('Lakshmi','Menon','lakshmi@gmail.com','NID018'),
('Vijay','Krishnan','vijay@gmail.com','NID019'),
('Harini','Sundar','harini@gmail.com','NID020'),
('Deepak','Mohan','deepak@gmail.com','NID021'),
('Swathi','Ramesh','swathi@gmail.com','NID022'),
('Gokul','Nathan','gokul@gmail.com','NID023'),
('Ramya','Bala','ramya@gmail.com','NID024'),
('Prakash','Rajan','prakash@gmail.com','NID025'),
('Aishwarya','Suresh','aishwarya@gmail.com','NID026'),
('Naveen','Kumar','naveen@gmail.com','NID027'),
('Keerthana','Mohan','keerthana@gmail.com','NID028'),
('Madhan','Raj','madhan@gmail.com','NID029'),
('Shalini','Devi','shalini@gmail.com','NID030');
GO

INSERT INTO Account (CustomerID, AccountType, Balance, OpenedDate, Status)
VALUES
(1,'Savings',25000,'2025-01-10','Active'),
(2,'Checking',45000,'2025-01-15','Active'),
(3,'Savings',18000,'2025-02-01','Active'),
(4,'Checking',52000,'2025-02-05','Active'),
(5,'Savings',30000,'2025-02-10','Active'),
(6,'Checking',15000,'2025-03-01','Active'),
(7,'Savings',42000,'2025-03-05','Active'),
(8,'Checking',28000,'2025-03-10','Frozen'),
(9,'Savings',35000,'2025-04-01','Active'),
(10,'Checking',60000,'2025-04-05','Active'),
(11,'Savings',22000,'2025-04-10','Active'),
(12,'Checking',48000,'2025-05-01','Active'),
(13,'Savings',27000,'2025-05-05','Active'),
(14,'Checking',55000,'2025-05-10','Active'),
(15,'Savings',32000,'2025-06-01','Active'),
(16,'Checking',19000,'2025-06-05','Closed'),
(17,'Savings',41000,'2025-06-10','Active'),
(18,'Checking',36000,'2025-07-01','Active'),
(19,'Savings',29000,'2025-07-05','Active'),
(20,'Checking',63000,'2025-07-10','Active'),
(21,'Savings',24000,'2025-08-01','Active'),
(22,'Checking',47000,'2025-08-05','Active'),
(23,'Savings',38000,'2025-08-10','Active'),
(24,'Checking',21000,'2025-09-01','Active'),
(25,'Savings',44000,'2025-09-05','Active'),
(26,'Checking',57000,'2025-09-10','Active'),
(27,'Savings',31000,'2025-10-01','Active'),
(28,'Checking',26000,'2025-10-05','Active'),
(29,'Savings',39000,'2025-10-10','Active'),
(30,'Checking',68000,'2025-11-01','Active');
GO

INSERT INTO [Transaction] (AccountID, TransactionType, Amount, TransactionDate, RelatedAccountID)
VALUES
(1,'Deposit',5000,'2026-01-01 09:00:00',NULL),
(2,'Withdrawal',2000,'2026-01-02 10:30:00',NULL),
(3,'Transfer',3000,'2026-01-03 11:00:00',4),
(4,'Deposit',7000,'2026-01-04 12:00:00',NULL),
(5,'Withdrawal',1500,'2026-01-05 13:00:00',NULL),
(6,'Transfer',2500,'2026-01-06 14:00:00',7),
(7,'Deposit',8000,'2026-01-07 09:30:00',NULL),
(8,'Withdrawal',1000,'2026-01-08 10:00:00',NULL),
(9,'Transfer',4000,'2026-01-09 11:30:00',10),
(10,'Deposit',6000,'2026-01-10 12:30:00',NULL),
(11,'Withdrawal',2200,'2026-01-11 13:30:00',NULL),
(12,'Transfer',3500,'2026-01-12 14:30:00',13),
(13,'Deposit',9000,'2026-01-13 09:00:00',NULL),
(14,'Withdrawal',1800,'2026-01-14 10:00:00',NULL),
(15,'Transfer',4500,'2026-01-15 11:00:00',16),
(16,'Deposit',5500,'2026-01-16 12:00:00',NULL),
(17,'Withdrawal',1200,'2026-01-17 13:00:00',NULL),
(18,'Transfer',2800,'2026-01-18 14:00:00',19),
(19,'Deposit',7500,'2026-01-19 09:30:00',NULL),
(20,'Withdrawal',3000,'2026-01-20 10:30:00',NULL),
(21,'Transfer',3200,'2026-01-21 11:30:00',22),
(22,'Deposit',6500,'2026-01-22 12:30:00',NULL),
(23,'Withdrawal',1700,'2026-01-23 13:30:00',NULL),
(24,'Transfer',2900,'2026-01-24 14:30:00',25),
(25,'Deposit',8500,'2026-01-25 09:00:00',NULL),
(26,'Withdrawal',2600,'2026-01-26 10:00:00',NULL),
(27,'Transfer',3700,'2026-01-27 11:00:00',28),
(28,'Deposit',4000,'2026-01-28 12:00:00',NULL),
(29,'Withdrawal',1900,'2026-01-29 13:00:00',NULL),
(30,'Transfer',5000,'2026-01-30 14:00:00',1);
GO

INSERT INTO Branch (BranchName, City)
VALUES
('Central Branch','Chennai'),
('Anna Nagar Branch','Chennai'),
('T Nagar Branch','Chennai'),
('Adyar Branch','Chennai'),
('Velachery Branch','Chennai'),
('Tambaram Branch','Chennai'),
('Coimbatore Main Branch','Coimbatore'),
('RS Puram Branch','Coimbatore'),
('Madurai Main Branch','Madurai'),
('Anna Nagar Branch','Madurai'),
('Trichy Main Branch','Trichy'),
('Salem Branch','Salem'),
('Erode Branch','Erode'),
('Tiruppur Branch','Tiruppur'),
('Vellore Branch','Vellore'),
('Pondicherry Branch','Pondicherry'),
('Bangalore Main Branch','Bangalore'),
('Whitefield Branch','Bangalore'),
('Mysore Branch','Mysore'),
('Hyderabad Main Branch','Hyderabad'),
('Secunderabad Branch','Hyderabad'),
('Mumbai Main Branch','Mumbai'),
('Andheri Branch','Mumbai'),
('Pune Main Branch','Pune'),
('Delhi Main Branch','Delhi'),
('Noida Branch','Noida'),
('Kochi Main Branch','Kochi'),
('Trivandrum Branch','Trivandrum'),
('Kolkata Main Branch','Kolkata'),
('Ahmedabad Main Branch','Ahmedabad');
GO

INSERT INTO Card (AccountID, CardNumberMasked, ExpiryDate, Status)
VALUES
(1,'**** **** **** 1001','2028-12-31','Active'),
(2,'**** **** **** 1002','2028-11-30','Active'),
(3,'**** **** **** 1003','2027-10-31','Active'),
(4,'**** **** **** 1004','2029-09-30','Active'),
(5,'**** **** **** 1005','2028-08-31','Active'),
(6,'**** **** **** 1006','2027-07-31','Blocked'),
(7,'**** **** **** 1007','2029-06-30','Active'),
(8,'**** **** **** 1008','2028-05-31','Active'),
(9,'**** **** **** 1009','2027-04-30','Expired'),
(10,'**** **** **** 1010','2029-03-31','Active'),
(11,'**** **** **** 1011','2028-02-29','Active'),
(12,'**** **** **** 1012','2027-01-31','Active'),
(13,'**** **** **** 1013','2029-12-31','Active'),
(14,'**** **** **** 1014','2028-11-30','Blocked'),
(15,'**** **** **** 1015','2027-10-31','Active'),
(16,'**** **** **** 1016','2029-09-30','Active'),
(17,'**** **** **** 1017','2028-08-31','Active'),
(18,'**** **** **** 1018','2027-07-31','Expired'),
(19,'**** **** **** 1019','2029-06-30','Active'),
(20,'**** **** **** 1020','2028-05-31','Active'),
(21,'**** **** **** 1021','2027-04-30','Active'),
(22,'**** **** **** 1022','2029-03-31','Active'),
(23,'**** **** **** 1023','2028-02-28','Active'),
(24,'**** **** **** 1024','2027-01-31','Blocked'),
(25,'**** **** **** 1025','2029-12-31','Active'),
(26,'**** **** **** 1026','2028-11-30','Active'),
(27,'**** **** **** 1027','2027-10-31','Active'),
(28,'**** **** **** 1028','2029-09-30','Active'),
(29,'**** **** **** 1029','2028-08-31','Active'),
(30,'**** **** **** 1030','2027-07-31','Active');
GO

INSERT INTO FraudFlag (TransactionID, Reason, FlaggedOn, Reviewed)
VALUES
(1,'Unusual transaction amount','2026-01-01 09:05:00',0),
(2,'Multiple withdrawals detected','2026-01-02 10:35:00',0),
(3,'Rapid repeated transfer','2026-01-03 11:05:00',1),
(4,'Unusual deposit pattern','2026-01-04 12:05:00',0),
(5,'Withdrawal activity requires review','2026-01-05 13:05:00',1),
(6,'Rapid repeated transfer','2026-01-06 14:05:00',0),
(7,'Large deposit requires review','2026-01-07 09:35:00',0),
(8,'Unusual withdrawal pattern','2026-01-08 10:05:00',1),
(9,'Rapid repeated transfer','2026-01-09 11:35:00',0),
(10,'Unusual transaction amount','2026-01-10 12:35:00',0),
(11,'Multiple withdrawals detected','2026-01-11 13:35:00',1),
(12,'Rapid repeated transfer','2026-01-12 14:35:00',0),
(13,'Large deposit requires review','2026-01-13 09:05:00',0),
(14,'Unusual withdrawal pattern','2026-01-14 10:05:00',1),
(15,'Rapid repeated transfer','2026-01-15 11:05:00',0),
(16,'Unusual deposit pattern','2026-01-16 12:05:00',0),
(17,'Multiple withdrawals detected','2026-01-17 13:05:00',1),
(18,'Rapid repeated transfer','2026-01-18 14:05:00',0),
(19,'Large deposit requires review','2026-01-19 09:35:00',0),
(20,'Unusual withdrawal pattern','2026-01-20 10:35:00',1),
(21,'Rapid repeated transfer','2026-01-21 11:35:00',0),
(22,'Unusual transaction amount','2026-01-22 12:35:00',0),
(23,'Multiple withdrawals detected','2026-01-23 13:35:00',1),
(24,'Rapid repeated transfer','2026-01-24 14:35:00',0),
(25,'Large deposit requires review','2026-01-25 09:05:00',0),
(26,'Unusual withdrawal pattern','2026-01-26 10:05:00',1),
(27,'Rapid repeated transfer','2026-01-27 11:05:00',0),
(28,'Unusual deposit pattern','2026-01-28 12:05:00',0),
(29,'Multiple withdrawals detected','2026-01-29 13:05:00',1),
(30,'Rapid repeated transfer','2026-01-30 14:05:00',0);
GO

SELECT 'Customer' AS TableName, COUNT(*) AS TotalRows FROM Customer
UNION ALL
SELECT 'Account', COUNT(*) FROM Account
UNION ALL
SELECT 'Transaction', COUNT(*) FROM [Transaction]
UNION ALL
SELECT 'Branch', COUNT(*) FROM Branch
UNION ALL
SELECT 'Card', COUNT(*) FROM Card
UNION ALL
SELECT 'FraudFlag', COUNT(*) FROM FraudFlag;

select * from Customer
select * from Account
select * from [Transaction]
select * from Branch
select * from Card
select * from FraudFlag


--schema verification

--Test 1 – Valid row 
INSERT INTO Customer (FirstName, LastName, Email, NationalID)
VALUES ('Arun', 'Kumar', 'arun.validation@gmail.com', 'VAL1001');

--Test 2 – Duplicate Email
INSERT INTO Customer (FirstName, LastName, Email, NationalID)
VALUES ('Priya', 'Devi', 'arun.validation@gmail.com', 'VAL1002');

--Test 3 – Duplicate NationalID
INSERT INTO Customer (FirstName, LastName, Email, NationalID)
VALUES ('Karthik', 'Raj', 'karthik.validation@gmail.com', 'VAL1001');

--Test 4 - Valid Account balance
INSERT INTO Account (CustomerID, AccountType, Balance, OpenedDate)
VALUES (1, 'Savings', 5000.00, '2026-11-23');

--Test 2 – Negative Account balance
INSERT INTO Account (CustomerID, AccountType, Balance, OpenedDate)
VALUES (1, 'Savings', -1000.00, '2026-11-23');

--Test 3 – Valid Transaction amount
INSERT INTO [Transaction]
(AccountID, TransactionType, Amount, TransactionDate)
VALUES (1, 'Deposit', 1000.00, GETDATE());

--Test 1 – Account default
INSERT INTO Account
(CustomerID, AccountType, Balance, OpenedDate)
VALUES (2, 'Checking', 8000.00, '2026-11-23');

SELECT TOP 1 *
FROM Account
ORDER BY AccountID DESC;

--Test 1 – Invalid CustomerID in Account
INSERT INTO Account
(CustomerID, AccountType, Balance, OpenedDate)
VALUES (9999, 'Savings', 5000.00, GETDATE());