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

