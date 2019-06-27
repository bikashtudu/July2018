--Problem 1
SELECT	P.ProductID,
		P.Name, 
		PMC.Name,
		PMC.Summary
	FROM [SalesLT].[Product] AS P
	INNER JOIN [SalesLT].[vProductModelCatalogDescription] AS PMC
	ON P.ProductModelID = PMC.ProductModelID;

--Problem 2
DECLARE @distColor TABLE(Color nvarchar(15));
INSERT INTO @distColor
SELECT DISTINCT Color FROM [SalesLT].[Product];
SELECT ProductID, Name, Color
FROM [SalesLT].[Product]
WHERE Color IN (SELECT Color FROM @distColor)

--Problem 3
SELECT	P.ProductID,
		P.Name AS ProductName,
		AC.ProductCategoryName,
		AC.ParentProductCategoryName
FROM [SalesLT].[Product] AS P
	INNER JOIN dbo.ufnGetAllCategories() AS AC
	ON P.ProductCategoryID = AC.ProductCategoryID