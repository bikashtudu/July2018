-- Challenge 3: Retrieve Customer Contact Details
-- 1. Retrieve customer contact names with middle names if known
SELECT FirstName + ' ' + ISNULL(MiddleName,'')+ ' '+LastName AS CustomerName
	FROM SalesLT.Customer;

-- 2. Retrieve primary contact details
--UPDATE SalesLT.Customer
--SET EmailAddress = NULL
--WHERE CustomerID % 7 = 1;

SELECT CustomerID, COALESCE(EmailAddress,Phone) AS PrimaryContact
	FROM SalesLT.Customer;

-- 3. Retrieve shipping status
--UPDATE SalesLT.SalesOrderHeader
--SET ShipDate = NULL
--WHERE SalesOrderID > 71899;
SELECT	SalesOrderID,
		OrderDate,
		CASE 
			WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
			ELSE 'Shipped'
		END AS Status
	FROM SalesLT.SalesOrderHeader
