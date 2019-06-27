-- Challenge 1: Retrieve Customer Data

-- 1
SELECT * FROM SalesLT.Customer;

-- 2
SELECT Title, FirstName, MiddleName, LastName, Suffix
	FROM SalesLT.Customer;

-- 3
SELECT	SalesPerson, 
		Title+' '+LastName AS CustomerName,
		Phone
	FROM SalesLT.Customer;
