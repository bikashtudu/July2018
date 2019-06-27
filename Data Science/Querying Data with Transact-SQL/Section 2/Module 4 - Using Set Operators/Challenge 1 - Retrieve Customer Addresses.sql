-- Problem 1
SELECT C.CompanyName, A.AddressLine1, A.City, 'Billing' AS AddressType
	FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Main Office';

-- Problem 2
SELECT C.CompanyName, A.AddressLine1, A.City, 'Shipping' AS AddressType
	FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Shipping';

-- Problem 3
SELECT C.CompanyName, A.AddressLine1, A.City, 'Billing' AS AddressType
	FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Main Office'
UNION ALL
SELECT C.CompanyName, A.AddressLine1, A.City, 'Shipping' AS AddressType
	FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Shipping'
ORDER BY CompanyName, AddressType
