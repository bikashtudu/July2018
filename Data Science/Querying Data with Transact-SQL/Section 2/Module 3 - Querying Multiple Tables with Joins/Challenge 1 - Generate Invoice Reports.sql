-- Problem 1
SELECT C.CompanyName, SOH.SalesOrderID, SOH.TotalDue
	FROM SalesLT.Customer AS C
	INNER JOIN SalesLT.SalesOrderHeader AS SOH
		ON C.CustomerID = SOH.CustomerID;

-- Problem 2
SELECT	C.CompanyName, 
		SOH.SalesOrderID, 
		SOH.TotalDue, 
		ISNULL(A.AddressLine1+', ','')+ISNULL(A.AddressLine2,'') AS  StreetAddress,
		A.City,
		A.StateProvince,
		A.PostalCode,
		A.CountryRegion
	FROM SalesLT.Customer AS C
	INNER JOIN SalesLT.SalesOrderHeader AS SOH
		ON C.CustomerID = SOH.CustomerID
	INNER JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID AND CA.AddressType='Main Office'
	INNER JOIN [SalesLT].[Address] AS A
		ON CA.AddressID = A.AddressID;
