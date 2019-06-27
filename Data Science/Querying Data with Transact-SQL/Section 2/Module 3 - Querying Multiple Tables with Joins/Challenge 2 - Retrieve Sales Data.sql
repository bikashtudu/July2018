--Problem 1
SELECT	C.CompanyName, 
		C.FirstName, 
		C.LastName,
		SOH.SalesOrderID,
		SOH.TotalDue
	FROM [SalesLT].[Customer] AS C
	LEFT JOIN [SalesLT].[SalesOrderHeader] AS SOH
		ON C.CustomerID = SOH.CustomerID
	ORDER BY SOH.SalesOrderID DESC;

-- Problem 2
SELECT	C.CustomerID, 
		C.CompanyName,
		C.FirstName,
		C.LastName,
		C.Phone
	FROM SalesLT.Customer AS C
	LEFT JOIN [SalesLT].[CustomerAddress] AS CA
		ON C.CustomerID = CA.CustomerID
	WHERE CA.AddressID IS NULL;

-- Problem 3
SELECT C.CustomerID, P.ProductID
	FROM SalesLT.Customer AS C
	FULL JOIN SalesLT.SalesOrderHeader AS SOH
		ON C.CustomerID=SOH.CustomerID
	FULL JOIN [SalesLT].[SalesOrderDetail] AS SOD
		ON SOH.SalesOrderID =SOD.SalesOrderID
	FULL JOIN  [SalesLT].[Product] AS P
		ON SOD.ProductID= P.ProductID
	WHERE SOH.SalesOrderID IS NULL
	ORDER BY ProductID, CustomerID;