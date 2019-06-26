--Problem 1
SELECT ProductID, Name, ListPrice
	FROM [SalesLT].[Product]
	WHERE ListPrice > (SELECT AVG(UnitPrice) FROM [SalesLT].[SalesOrderDetail])

--Problem 2
SELECT ProductID, Name, ListPrice
	FROM [SalesLT].[Product]
	WHERE ListPrice >= 100
		OR ProductID IN
		(SELECT ProductID 
			FROM [SalesLT].[SalesOrderDetail] 
			WHERE UnitPrice <100)
--Problem 3
SELECT	P.ProductID, 
		P.Name, 
		P.ListPrice, 
		(SELECT AVG(UnitPrice) 
			FROM [SalesLT].[SalesOrderDetail] AS SOD
			WHERE SOD.ProductID = P.ProductID
			)AS AvgUnitPrice
	FROM [SalesLT].[Product] AS P

--Problem 4
SELECT	P.ProductID, 
		P.Name, 
		P.ListPrice,
		(SELECT AVG(UnitPrice) 
			FROM [SalesLT].[SalesOrderDetail] AS SOD
			WHERE SOD.ProductID = P.ProductID
			)AS AvgUnitPrice
	FROM [SalesLT].[Product] AS P
	WHERE StandardCost > (SELECT AVG(UnitPrice) 
			FROM [SalesLT].[SalesOrderDetail] AS SOD
			WHERE SOD.ProductID = P.ProductID
			);