# Bank Database Schema

## Overview

This project defines a relational database schema for a bank. The schema includes tables for storing information about people, branches, employees, customers, accounts, loans, loan payments, and transactions. It also defines the relationships between these entities.


## ER Diagram

<img src = "https://github.com/khalwsh/cs50-sql-solutions/blob/main/Fina-Project/ERD.jpeg">

## Scope


* representing a bank system database
* in this database you can be person or customer or empolyee and have representation for your transactions

## Functional Requirements

* you can check requirements [here](https://github.com/khalwsh/cs50-sql-solutions/blob/main/Fina-Project/Bank%20system/bank%20system%20data%20base.txt)


## Tables and Their Descriptions

### Person

This table stores information about every person that interacts with the bank, including customers and employees.

- **PersonID** (INTEGER, Primary Key): Unique ID number for each person.
- **FirstName** (TEXT): The person's first name.
- **LastName** (TEXT): The person's surname.
- **DateOfBirth** (NUMERIC): The person's birth date.
- **Email** (TEXT): The person's email address.
- **PhoneNumber** (TEXT): The person's phone number.
- **Address** (TEXT): The person's mailing address.
- **TaxIdentifier** (TEXT): A unique identifier for tax purposes.

### Branch

This table stores basic information about the different branches or offices of the bank.

- **BranchID** (INTEGER, Primary Key): Unique ID number for each branch.
- **BranchName** (TEXT): The commercial name of the branch.
- **BranchCode** (TEXT): An internal code used to identify the branch.
- **Address** (TEXT): The physical address of the branch.
- **PhoneNumber** (TEXT): The branch phone number.

### Employee

This table stores information about bank employees.

- **EmployeeID** (INTEGER, Primary Key): Unique ID number for each employee.
- **Position** (TEXT): Describes the position of the employee.

### Customer

This table stores information about bank customers.

- **CustomerID** (INTEGER, Primary Key): Unique ID number for each customer.
- **CustomerType** (TEXT): Categorizes the client based on bank policies (e.g., regular, premium).

### Account

This table keeps information about the different accounts each customer can have in the bank.

- **AccountID** (INTEGER, Primary Key): Unique ID number for each account.
- **AccountNumber** (INTEGER): The account number.
- **CurrentBalance** (INTEGER): The current balance available on the account.
- **DateOpened** (NUMERIC): The date the account was opened.
- **DateClosed** (NUMERIC): The date the account was closed.
- **AccountStatus** (TEXT): Defines if the account is active, suspended, closed, etc.

### Loan

This table keeps information about the different loans that the bank grants to customers.

- **LoanID** (INTEGER, Primary Key): Unique ID number for each loan.
- **LoanType** (TEXT): The type of loan (e.g., personal, mortgage).
- **LoanAmount** (REAL): The total amount of the loan.
- **InterestRate** (REAL): The yearly interest rate.
- **Term** (INTEGER): Duration of the loan in months.
- **StartDate** (NUMERIC): The date the loan starts.
- **EndDate** (NUMERIC): The date the loan ends.
- **Status** (TEXT): Defines if the loan is active, canceled, closed, etc.

### LoanPayment

This table stores information about scheduled loan payments.

- **LoanPaymentID** (INTEGER, Primary Key): Unique ID number for each loan payment.
- **ScheduledPaymentDate** (NUMERIC): The scheduled date of each payment.
- **PaymentAmount** (REAL): The total amount to be paid.
- **PrincipalAmount** (REAL): The principal amount to be paid.
- **InterestAmount** (REAL): The interest amount to be paid.
- **PaidAmount** (REAL): The actual amount paid.

### Transaction

This table represents each operation performed in the bank, such as deposits and withdrawals.

- **TransactionID** (INTEGER, Primary Key): Unique ID number for each transaction.
- **Amount** (REAL): The amount involved in the transaction.
- **TransactionType** (TEXT): The type of transaction (e.g., deposit, withdrawal).
- **TransactionDate** (NUMERIC): The date and time of the transaction.

## Relationships

### Person_Employee

This table creates a relationship between the `Person` and `Employee` tables.

- **Person_id** (INTEGER): Foreign key referencing `Person(PersonID)`.
- **Employee_id** (INTEGER): Foreign key referencing `Employee(EmployeeID)`.

### Branch_Employee

This table creates a relationship between the `Branch` and `Employee` tables.

- **Branch_id** (INTEGER): Foreign key referencing `Branch(BranchID)`.
- **Employee_id** (INTEGER): Foreign key referencing `Employee(EmployeeID)`.

### Customer_Account

This table creates a relationship between the `Customer` and `Account` tables.

- **Customer_id** (INTEGER): Foreign key referencing `Customer(CustomerID)`.
- **Account_id** (INTEGER): Foreign key referencing `Account(AccountID)`.

### Branch_Account

This table creates a relationship between the `Branch` and `Account` tables.

- **Branch_id** (INTEGER): Foreign key referencing `Branch(BranchID)`.
- **Account_id** (INTEGER): Foreign key referencing `Account(AccountID)`.

### Loan_LoanPayment

This table creates a relationship between the `Loan` and `LoanPayment` tables.

- **Loan_id** (INTEGER): Foreign key referencing `Loan(LoanID)`.
- **LoanPayment_id** (INTEGER): Foreign key referencing `LoanPayment(LoanPaymentID)`.

### LoanPayment_Transaction

This table creates a relationship between the `LoanPayment` and `Transaction` tables.

- **Transaction_id** (INTEGER): Foreign key referencing `Transaction(TransactionID)`.
- **LoanPayment_id** (INTEGER): Foreign key referencing `LoanPayment(LoanPaymentID)`.

### Account_Transaction

This table creates a relationship between the `Account` and `Transaction` tables.

- **Transaction_id** (INTEGER): Foreign key referencing `Transaction(TransactionID)`.
- **Account_id** (INTEGER): Foreign key referencing `Account(AccountID)`.

### Employee_Transaction

This table creates a relationship between the `Employee` and `Transaction` tables.

- **Transaction_id** (INTEGER): Foreign key referencing `Transaction(TransactionID)`.
- **Employee_id** (INTEGER): Foreign key referencing `Employee(EmployeeID)`.

### Transaction_Transaction

This table creates a self-referencing relationship in the `Transaction` table.

- **Transaction_id1** (INTEGER): Foreign key referencing `Transaction(TransactionID)`.
- **Transaction_id2** (INTEGER): Foreign key referencing `Transaction(TransactionID)`.

## Notes

- Ensure that all necessary foreign keys are properly indexed for optimal performance.
- Additional normalization could be performed for fields like `Position`, `CustomerType`, `AccountType`, and `TransactionType` for a more normalized database schema.

