# BankSphere – Digital Banking Platform

## Project Overview

BankSphere is a console-based Digital Banking Platform developed for a retail bank.

It manages customers and their Savings and Checking accounts, processes financial transactions, manages payment cards, and identifies suspicious transactions for manual review.

## Key Functionalities

- **Customer and Account Management:** Register, update and delete customers. Open, freeze and close accounts.
- **Transaction Processing:** Deposit, withdraw and transfer money with balance validation.
- **Card Management:** Issue, block and expire payment cards.
- **Fraud Flagging:** Identify suspicious transaction patterns and flag them for manual review.
- **Reporting:** Generate account statements, monthly transaction volume, top spending customers and unreviewed fraud flags.

## Database

Database name: `BankSphereDB`

The database contains six tables:

1. Customer
2. Account
3. Transaction
4. Branch
5. Card
6. FraudFlag

## Project Structure

The project follows a layered structure:

- `entity` – Stores entity classes.
- `dao` – Contains database access and service implementations.
- `exception` – Handles custom exceptions.
- `util` – Contains utility and database connection classes.
- `main` – Contains the main application module.
- `tests` – Contains unit tests.

## Sprint Plan

| Sprint | Focus |
|---|---|
| Sprint 1 | Database Design |
| Sprint 2 | Object-Oriented Programming |
| Sprint 3 | Advanced Programming |
| Sprint 4 | Database Connectivity, Unit Testing and Integration |

## Technologies

- Programming Language: Python
- Database: SQL Server
- Version Control: Git and GitHub

## Project Objective

To develop a digital banking application by applying database design, programming concepts, object-oriented principles, database connectivity, exception handling and unit testing.
