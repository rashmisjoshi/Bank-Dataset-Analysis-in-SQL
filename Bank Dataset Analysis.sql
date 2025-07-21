CREATE DATABASE bankingdataset;
use bankingdataset;

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;
SELECT * FROM Loans;
SELECT * FROM CreditCards;
SELECT * FROM Branches;
SELECT * FROM ATMs;


-- Calculate total number of customers:
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- Calculate total number of accounts
SELECT COUNT(*) AS TotalAccounts FROM Accounts;

-- Calculate total loan amount
SELECT SUM(Amount) AS TotalLoansAmount FROM Loans;

-- Calculate total credit limit across all credit cards
SELECT SUM(CreditLimit) AS TotalCreditLimit FROM CreditCards;

-- Find all active accounts
SELECT * FROM Accounts WHERE Status = 'Active';

-- Final all accounts made on 15th Jan 2023
SELECT * FROM Transactions WHERE TransactionDate > '2023-01-15';

-- Find loans with interest rates above 5.0
SELECT * FROM Loans WHERE InterestRate > 5.0;

-- Find credit cards with balances exceeding the credit limit
SELECT * FROM CreditCards WHERE Balance > CreditLimit;

-- Retrieve customer details along with their accounts
SELECT c.CustomerID, c.Name, c.Age, a.AccountNumber, a.AccountType, a.Balance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID;

-- Retrieve transaction details along with associated account and customer information
SELECT t.TransactionID, t.TransactionDate, t.Amount, t.Type, t.Description, a.AccountNumber, a.AccountType, c.Name AS CustomerName
FROM Transactions t
JOIN Accounts a ON t.AccountNumber = a.AccountNumber
JOIN Customers c ON a.CustomerID = c.CustomerID;

-- top 10 Customers with highest loan amount
SELECT c.Name, l.Amount AS LoanAmount
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
ORDER BY l.Amount DESC
LIMIT 10; 

-- Delete inactive accounts
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Accounts
WHERE Status = 'Inactive';

-- Find customers with multiple accounts
SELECT c.CustomerID, c.Name, COUNT(a.AccountNumber) AS NumAccounts
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(a.AccountNumber) > 1;

-- Print the first 3 characters of Name from Customers table
SELECT SUBSTRING(Name, 1, 3) AS FirstThreeCharactersOfName
FROM Customers;

-- Print the Name from Customers table into two columns FirstName and LastName
SELECT 
    SUBSTRING_INDEX(Name, ' ', 1) AS FirstName,
    SUBSTRING_INDEX(Name, ' ', -1) AS LastName
FROM Customers;

-- SQL query to show only odd rows from Customers Table
SELECT *
FROM Customers
WHERE MOD(CustomerID, 2) <> 0;

-- SQL query to determine the 5th highest Loan Amount without using LIMIT keyword
SELECT DISTINCT Amount
FROM Loans L1
WHERE 5 = (
    SELECT COUNT(DISTINCT Amount)
    FROM Loans L2
    WHERE L2.Amount >= L1.Amount
);

-- SQL query to show the second highest Loan from the Loans table using sub-query
SELECT MAX(Amount) AS SecondHighestLoan
FROM Loans
WHERE Amount < (
    SELECT MAX(Amount)
    FROM Loans
);

--  SQL query to list CustomerID whose account is INACTIVE
SELECT CustomerID
FROM Accounts
WHERE Status = 'Inactive';

-- SQL query to fetch the first row of the Customers table
SELECT *
FROM Customers
LIMIT 1;

-- SQL query to show the current date and time
SELECT NOW() AS CurrentDateTime;

-- SQL query to create a new table which consists of data and structure copied from the Customers
CREATE TABLE CustomersClone LIKE Customers;
INSERT INTO CustomersClone SELECT * FROM Customers;

-- SQL query to calculate how many days are remaining for customers to pay off the loans
SELECT 
    CustomerID,
    DATEDIFF(EndDate, CURDATE()) AS DaysRemaining
FROM Loans
WHERE EndDate > CURDATE();

-- Query to find the latest transaction date for each account
SELECT AccountNumber, MAX(TransactionDate) AS LatestTransactionDate
FROM Transactions
GROUP BY AccountNumber;

-- Find customers who opened their accounts more than a year ago
SELECT *
FROM Accounts
WHERE DATE_ADD(OpenDate, INTERVAL 1 YEAR) <= CURDATE();

-- Find the average age of customers
SELECT AVG(Age) AS AverageAge
FROM Customers;

-- Find accounts with less than minimum amount for accounts opened before 1st Jan 2022
SELECT AccountNumber, Balance
FROM Accounts
WHERE Balance < 25000
AND OpenDate <= '2022-01-01';

-- Find loans that are currently active
SELECT *
FROM Loans
WHERE EndDate >= CURDATE()
AND Status = 'Active';

-- Find the total amount of transactions for each account for a specific month
SELECT AccountNumber, SUM(Amount) AS TotalAmount
FROM Transactions
WHERE MONTH(TransactionDate) = 6  
AND YEAR(TransactionDate) = 2023
GROUP BY AccountNumber;

-- Find the average credit card balance for each customer
SELECT CustomerID, AVG(Balance) AS AverageCreditCardBalance
FROM CreditCards
GROUP BY CustomerID;

-- Find the number of Inactive ATMs per location
SELECT Location, COUNT(*) AS NumberOfActiveATMs
FROM ATMs
WHERE Status = 'Out of Service'
GROUP BY Location;











