--This entity will keep information about each person that interacts with the bank, either as a customer, an employee, or any other role.
--Note: A Person can be an individual or an organization.

--                   TABLES CREATIONS
CREATE TABLE "Person" (
    "PersonID" INTEGER,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    "DateOfBirth" NUMERIC NOT NULL,
    "Email" TEXT NOT NULL,
    "PhoneNumber" TEXT NOT NULL,
    "ADDRESS" TEXT NOT NULL,
    "TaxIdentifier" TEXT NOT NULL,
    PRIMARY KEY ("PersonID")
--PersonID: This will be a unique ID number and primary identifier (later the surrogate primary key) of the entity. We will use an INTEGER.

--LastName: The person’s surname. We will use a VARCHAR(100) datatype.

--FirstName: The person’s first n We will use a VARCHAR(100) datatype.

--DateOfBirth: The person’s birth date We will use a DATE.

--Email: Their email a We will use a VARCHAR(100) datatype.

--PhoneNumber: Their phone n We will use a VARCHAR(20) datatype.

--Address: The person’s mailing address. Usually, you would store this information as separate attributes and entities (like Street, Street Number, City, State or Country). For simplicity’s sake, we’ll group it together here. We will use a VARCHAR(100) datatype.

--TaxIdentifier: This number or code is used to uniquely identify the person or organization for tax purposes (like SSNs or TINs in the US). We will use a VARCHAR(20) datatype. We will use this attribute as an additional Identifier for the entity.

);

CREATE TABLE "Branch"(
--This entity will keep basic information about the different branches or offices of the bank.
    "BranchID" INTEGER,
    "BranchName" TEXT UNIQUE NOT NULL,
    "branchCode" TEXT UNIQUE NOT NULL,
    "Address" TEXT NOT NULL,
    "PhoneNumber" TEXT NOT NULL,
    PRIMARY KEY("BranchID")
--BranchID: A unique identification number and the surrogate primary key of the table. INTEGER

--BranchName: The commercial name of the branch or office and an additional identifier. (There cannot be two branches with the same name.) VARCHAR(100) datatype.

--BranchCode: An internal code used to identify the branch in account numbers. This is also an additional identifier, as there cannot be two branches with the same code) and additional identifier (there cannot be two branches with the same code). VARCHAR(10) datatype.

--Address: The physical address of this branch. As with the Person entity, we are not normalizing this information for simplicity’s sake. VARCHAR(100) datatype.

--PhoneNumber: The branch phone number. VARCHAR(20) datatype.
);

CREATE TABLE "Employee" (
--This entity will store information about the persons that are also bank employees.
    "EmployeeID" INTEGER,
    "Position" TEXT NOT NULL,
    PRIMARY KEY("EmployeeID")
--EmployeeID: A unique ID number and the surrogate primary key of the table. INTEGER.

--Position: Describes the position of the employee. VARCHAR(20) d

--notes:
--Note #1: Each employee is related to a Person and to a Branch. We will see how to create those relationships later in this article.

--Note #2: Positions could (and should) be normalized in a separate entity. To keep the model simple, we are using a denormalized version.

);

CREATE TABLE "Customer" (
--This entity will store information about the persons that are also bank customers.
    "CustomerID" INTEGER,
    "CustomerType" TEXT NOT NULL,
    PRIMARY KEY("CustomerID")
--CustomerID: A unique identification number and the surrogate primary key of the table. INTEGER.

--CustomerType: Categorizes the client based on bank policies (g. regular, premium, etc.). VARCHAR(20) datatype.

--notes:

--Note #1: Each employee is related to a Person. We will see how to create those relationships later in this article.

--Note #2: Customer type could (and should) be normalized in a separate entity. To keep the model simple, we are using a denormalized version.
);

CREATE TABLE "Account"(
--This entity keeps information about the different accounts each customer or group of customers can have in the bank.
    "AccountID" INTEGER,
    "AccountNumber" INTEGER NOT NULL UNIQUE,
    "CurrentBalance" INTEGER NOT NULL UNIQUE,
    "DateOpened" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "DateClosed" NUMERIC DEFAULT NULL,
    "AccountStatus" TEXT NOT NULL,
    PRIMARY KEY("AccountID")
--AccountID: The surrogate primary key of the table. INTEGER
--AccountType: Defines the account type (e.g. savings, checking, credit, etc.) and serves as part of the entity’s unique identifier. VARCHAR(20) datatype.

--AccountNumber: Together with AccountType, this uniquely identifies the account in the bank. It usually includes the branch code. VARCHAR(20) datatype.

--CurrentBalance: The current balance available on the account. DECIMAL(10, 2) datatype.

--DateOpened: Date the account was opened. DATE.

--DateClosed: Date the account was closed. DATE datatype and not mandatory.

--AccountStatus: Defines if the account is active, suspended, closed, etc. VARCHAR(20) datatype.

--notes:
--Note #1: Each account is related to one or more Customer and to a Branch. We will see how to create those relationships later in this article.

--Note #2: Both account type and status could (and should) be normalized in separate entities. To keep the model simple, we are using a denormalized version.
);

CREATE TABLE "Loan" (  
--This entity keeps information about the different loans that the bank grants to customers
    "LoanID" INTEGER,
    "LoanTYPE" TEXT NOT NULL,
    "LoanAmount" REAL NOT NULL,
    "InterestRate" REAL NOT NULL,
    "Term" INTEGER,
    "StartDate" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "EndDate" NUMERIC NOT NULL,
    "status" TEXT,
    PRIMARY KEY("LoanID")
--LoanID: The surrogate primary key of the table. INTEGER

--LoanType: Defines the type of loan granted to the customer (e.g. personal, mortgage, auto). VARCHAR(20) datatype.

--LoanAmount: Total amount of the loan. DECIMAL(10, 2) datatype.

--InterestRate: The yearly interest rate used to calculate interest. DECIMAL(10, 2) datatype.

--Term: Duration (in months) of the loan. INTEGER

--StartDate: The date the loan becomes DATE datatype.

--EndDate: The date the loan should be completely paid. DATE

--Status: Defines if the loan is active, canceled, closed, etc. VARCHAR(20) datatype.

--notes:
--Note #1: Each loan is related to one Customer. We will see how to create those relationships later in this article.

--Note #2: Both loan type and status could (and should) be normalized in separate entities. To keep the model simple, we are using a denormalized version.
);

CREATE TABLE "LoanPayment" (
--Loans usually have a scheduled number of payments that include both principal and interest.
    "LoanPaymentID" INTEGER,
    "ScheduledPaymentDate"NUMERIC NOT NULL,
    "PaymentAmount" REAL NOT NULL,
    "PrincipalAmount" REAL NOT NULL,
    "InterestAmount" REAL NOT NULL,
    "PaidAmount" REAL NOT NULL,
    PRIMARY KEY("LoanPaymentID")
--LoanPaymentID: The surrogate primary key of the table. INTEGER

--ScheduledPaymentDate: The pre-scheduled date of each payment. DATE

--PaymentAmount: The expected total amount to be paid on the scheduled date. DECIMAL(10, 2) datatype.

--PrincipalAmount: The expected principal amount to be paid on the scheduled date. DECIMAL(10, 2) datatype.

--InterestAmount: The expected interest amount to be paid on the scheduled date. DECIMAL(10, 2) datatype.

--PaidAmount: The actual amount paid. DECIMAL(10, 2) datatype.

--PaidDate: The actual date when the payment was completed. DATE datatype and not mandatory.
);

CREATE TABLE "Transaction"(
--Each operation performed in a bank is usually represented by one transaction (e.g. deposit, withdrawal) or multiple transactions (e.g. account transfers).
    "TransactionID" INTEGER,
    "Amount" REAL NOT NULL,
    "TransactionTYPE" TEXT NOT NULL,
    "TransactionDate" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY("TransactionID")
--TransactionID: The surrogate primary key of the table. INTEGER

--TransactionType: Defines the type of transaction performed (e.g. deposit, withdrawal, transfer). VARCHAR(20) datatype.

--Amount: The amount involved in the operation. DECIMAL(10, 2) datatype.

--TransactionDate: The date and time the transaction was performed. DATETIME

--notes:

--Note #1: Each transaction is related to one Account and can be related to another Transaction (for example, when a transfer between two accounts is performed). It can also be related to an Employee if it was performed manually in an office/branch. And as we mentioned before, it can also be related to a LoanPayment. We will see how to create those relationships later in this article.

--Note #2: Transaction types could (and should) be normalized in a separate entity. To keep the model simple, we are using a denormalized version.
);

--                   RELATIONS CREATIONS

CREATE TABLE "Person_Employee"(
    "Person_id" INTEGER,
    "Employee_id" INTEGER,
    PRIMARY KEY("Person_id","Employee_id"),
    FOREIGN KEY("Person_id") REFERENCES "Person"("PersonID"),
    FOREIGN KEY("Employee_id") REFERENCES "Employee"("EmployeeID")
--Each Employee in our model is a single Person, but not all persons are employees. Once again, we need to establish a 1:N relationship between the two tables, N being either 0 or 1.
);

CREATE TABLE "Branch_Employee"(
    "Branch_id" INTEGER,
    "Employee_id" INTEGER,
    PRIMARY KEY("Branch_id","Employee_id"),
    FOREIGN KEY("Branch_id") REFERENCES "Branch"("BranchID"),
    FOREIGN KEY("Employee_id") REFERENCES "Employee"("EmployeeID")
--All employees work at a branch of the bank, and every branch can have many employees, so we need to create a 1:N relationship between the Branch and Employee entities.
);

CREATE TABLE "Customer_Account"(
    "Customer_id" INTEGER,
    "Account_id" INTEGER,
    PRIMARY KEY("Customer_id","Account_id"),
    FOREIGN KEY("Customer_id") REFERENCES "Customer"("CustomerID"),
    FOREIGN KEY("Account_id") REFERENCES "Account"("AccountID")
--A customer can usually have multiple accounts; depending on legislation and regulations, most systems allow shared accounts between multiple individual customers (family members, etc.). To represent this in our system, we are going to create a many-to-one (M:N) relationship between Customer and Account.
--After creating the relationship, we need to verify that the relationship is mandatory on the customer side. There can be customers without any account, but each account must be related to at least one customer.
);

CREATE TABLE "Branch_Account"(
    "Branch_id" INTEGER,
    "Account_id" INTEGER,
    PRIMARY KEY("Branch_id","Account_id"),
    FOREIGN KEY("Branch_id") REFERENCES "Branch"("BranchID"),
    FOREIGN KEY("Account_id") REFERENCES "Account"("AccountID")
--This is a 1:N relationship, since a single branch can have multiple accounts and each account must belong to one and only one branch.

--Customer – Loan
--This is usually a 1:N relationship, since loans are granted to a single customer but a customer can have multiple loans.
);

CREATE TABLE "Loan_LoanPayment"(
    "Loan_id" INTEGER,
    "LoanPayment_id" INTEGER,
    PRIMARY KEY("Loan_id","LoanPayment_id"),
    FOREIGN KEY("Loan_id") REFERENCES "Loan"("LoanID"),
    FOREIGN KEY("LoanPayment_id") REFERENCES "LoanPayment"("LoanPaymentID")
--This is also a 1:N relationship. We need to ensure that both sides are mandatory, since each payment must belong to a loan and each loan must have at least one scheduled payment.

--LoanPayment – Transaction
--A loan payment is usually paid in a single operation, but most banking systems will allow for partial payments. This means that we need to create a 1:N relationship between the Payment and Transaction entities but with both sides being non-mandatory.
);

CREATE TABLE "LoanPayment_Transaction"(
    "Transaction_id" INTEGER,
    "LoanPayment_id" INTEGER,
    PRIMARY KEY("Transaction_id","LoanPayment_id"),
    FOREIGN KEY("Transaction_id") REFERENCES "Transaction"("TransactionID"),
    FOREIGN KEY("LoanPayment_id") REFERENCES "LoanPayment"("LoanPaymentID")
)

CREATE TABLE "Account_Transaction"(
    "Transaction_id" INTEGER,
    "Account_id" INTEGER,
    PRIMARY KEY("Transaction_id","Account_id"),
    FOREIGN KEY("Transaction_id") REFERENCES "Transaction"("TransactionID"),
    FOREIGN KEY("Account_id") REFERENCES "Account"("AccountID")
--This is also a 1:N relationship, since transactions involve a single account and accounts can have multiple transactions.
);

CREATE TABLE "Empolyee_Transaction"(
    "Transaction_id" INTEGER,
    "Employee_id" INTEGER, -- Correct the column name spelling
    PRIMARY KEY("Transaction_id","Employee_id"),
    FOREIGN KEY("Transaction_id") REFERENCES "Transaction"("TransactionID"),
    FOREIGN KEY("Employee_id") REFERENCES "Employee"("EmployeeID")
--Most transactions are performed directly by users via banking apps, ONLINE BANKING, or ATMs. However, there are still some operations that can be made at a bank office and involve an employee. To support this, we need to establish a 1:N relationship between the Employee and Transaction entities and ensure that none of the sides are mandatory.

);

CREATE TABLE "Transaction_Transaction"(
    "Transaction_id1" INTEGER,
    "Transaction_id2" INTEGER,
    PRIMARY KEY("Transaction_id1","Transaction_id2"),
    FOREIGN KEY("Transaction_id1") REFERENCES "Transaction"("TransactionID"),
    FOREIGN KEY("Transaction_id2") REFERENCES "Transaction"("TransactionID")
--There are several scenarios where a transaction needs to be related to another transaction in the system. Some of them are:

--Transfers between two accounts. The transaction that “adds” money to the target account should be related to the one that “subtracts” money from the source account.
--Adjustments made to a charge should be related to the actual transaction that was later adjusted.
--In this case, we need to create a 1:N relationship to the same Transaction entity. We achieve this by selecting the 1:N button and just clicking on the desired entity. We also need to ensure that both sides of the relationship are not mandatory.
);