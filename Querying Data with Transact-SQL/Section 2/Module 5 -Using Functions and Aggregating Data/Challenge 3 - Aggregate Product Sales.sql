--Problem 1
SELECT	P.Name,
		SUM(SOD.LineTotal) AS TotalRevenue
	FROM [SalesLT].[Product] AS P
	INNER JOIN [SalesLT].[SalesOrderDetail] AS SOD
		ON P.ProductID = SOD.ProductID
	GROUP BY P.Name
	ORDER BY TotalRevenue DESC;

--Problem 2
SELECT	P.Name,
		SUM(SOD.LineTotal) AS TotalRevenue
	FROM [SalesLT].[Product] AS P
	INNER JOIN [SalesLT].[SalesOrderDetail] AS SOD
		ON P.ProductID = SOD.ProductID
	WHERE P.ListPrice > 1000
	GROUP BY P.Name
	ORDER BY TotalRevenue DESC;

--Problem 3
SELECT	P.Name,
		SUM(SOD.LineTotal) AS TotalRevenue
	FROM [SalesLT].[Product] AS P
	INNER JOIN [SalesLT].[SalesOrderDetail] AS SOD
		ON P.ProductID = SOD.ProductID
	WHERE P.ListPrice > 1000
	GROUP BY P.Name
	HAVING SUM(SOD.LineTotal) >20000
	ORDER BY TotalRevenue DESC;
