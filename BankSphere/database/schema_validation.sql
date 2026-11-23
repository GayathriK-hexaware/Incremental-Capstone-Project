USE BankSphereDB;
GO

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

--Test 5 – Negative Account balance
INSERT INTO Account (CustomerID, AccountType, Balance, OpenedDate)
VALUES (1, 'Savings', -1000.00, '2026-11-23');

--Test 6 – Valid Transaction amount
INSERT INTO [Transaction]
(AccountID, TransactionType, Amount, TransactionDate)
VALUES (1, 'Deposit', 1000.00, GETDATE());

--Test 7 – Account default
INSERT INTO Account
(CustomerID, AccountType, Balance, OpenedDate)
VALUES (2, 'Checking', 8000.00, '2026-11-23');

SELECT TOP 1 *
FROM Account
ORDER BY AccountID DESC;

--Test 8 – Invalid CustomerID in Account
INSERT INTO Account
(CustomerID, AccountType, Balance, OpenedDate)
VALUES (9999, 'Savings', 5000.00, GETDATE());

--Test 9 – Invalid AccountID in Transaction
INSERT INTO [Transaction]
(AccountID, TransactionType, Amount, TransactionDate)
VALUES (9999, 'Deposit', 1000.00, GETDATE());

--Test 10 – Invalid AccountID in Card
INSERT INTO Card
(AccountID, CardNumberMasked, ExpiryDate, Status)
VALUES (9999, '**** **** **** 1234', '2028-12-31', 'Active');

--Test 11 – Invalid TransactionID in FraudFlag
INSERT INTO FraudFlag
(TransactionID, Reason, FlaggedOn)
VALUES (9999, 'Invalid transaction reference', GETDATE());