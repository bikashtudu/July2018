-- Challenge 2: Retrieve Customer and Sales Data

-- 1
SELECT CONVERT(NVARCHAR, CustomerID) +': '+ CompanyName AS CustomerCompany
	FROM SalesLT.Customer;

-- 2
SELECT	SalesOrderNumber + ' ('+STR(RevisionNumber,1)+')' AS OrderRevision,
		CONVERT(NVARCHAR,OrderDate,102) AS OrderDate
	FROM SalesLT.SalesOrderHeader;