--Problem 1
SELECT SOH.SalesOrderID, SOH.CustomerID, C.FirstName, C.LastName
	FROM [SalesLT].[SalesOrderHeader] AS SOH
	CROSS APPLY dbo.ufnGetCustomerInformation(SOH.CustomerID) AS C

--Problem 2
SELECT	C.CustomerID, 
		C.FirstName, 
		C.LastName,
		A.AddressLine1,
		A.City
	FROM [SalesLT].[CustomerAddress] AS CA
	INNER JOIN [SalesLT].[Address] AS A
		ON A.AddressID = CA.AddressID
	CROSS APPLY dbo.ufnGetCustomerInformation(CA.CustomerID) AS C