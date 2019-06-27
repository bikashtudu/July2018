-- Problem 1
SELECT	C.CompanyName,
		SOH.TotalDue,
		RANK() OVER(ORDER BY SOH.TotalDue DESC) AS DueRank
	FROM [SalesLT].[Customer] AS C
	INNER JOIN [SalesLT].[SalesOrderHeader] AS SOH
		ON C.CustomerID = SOH.CustomerID;