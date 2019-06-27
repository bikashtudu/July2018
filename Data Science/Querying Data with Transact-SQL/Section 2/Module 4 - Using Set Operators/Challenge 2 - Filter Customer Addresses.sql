-- Problem 1
SELECT C.CompanyName
	FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Main Office'
EXCEPT
SELECT C.CompanyName
FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Shipping'
ORDER BY CompanyName

-- Problem 2
SELECT C.CompanyName
	FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Main Office'
INTERSECT
SELECT C.CompanyName
FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID	
	WHERE CA.AddressType = 'Shipping'
ORDER BY CompanyName
