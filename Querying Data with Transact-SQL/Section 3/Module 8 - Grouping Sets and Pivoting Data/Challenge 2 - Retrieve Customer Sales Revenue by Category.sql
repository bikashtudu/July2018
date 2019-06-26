SELECT	CompanyName, 
		ISNULL([Accessories],0) AS [Accessories], 
		ISNULL([Bikes],0) AS [Bikes],
		ISNULL([Clothing],0) AS [Clothing], 
		ISNULL([Components],0) AS [Components]
FROM 
	(
	SELECT	C.CompanyName,
			CAT.ParentProductCategoryName AS ParentCategory,
			SOD.LineTotal
	FROM   [SalesLT].[SalesOrderHeader] AS SOH
		INNER JOIN [SalesLT].[SalesOrderDetail] as SOD
			ON SOH.SalesOrderID = SOD.SalesOrderID
		INNER JOIN [SalesLT].[Customer] AS C
			ON C.CustomerID = SOH.CustomerID
		INNER JOIN [SalesLT].[Product] AS P
			ON SOD.ProductID = P.ProductID
		INNER JOIN SalesLT.vGetAllCategories AS CAT
			ON P.ProductcategoryID = cat.ProductCategoryID	
	) AS CPR
	PIVOT ( SUM(LineTotal) FOR ParentCategory IN([Accessories], [Bikes], [Clothing], [Components])) AS PVT