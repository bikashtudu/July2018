--Problem 1
SELECT	UPPER(Name) AS ProductName, 
		ROUND(Weight,0) AS ApproxWeight
	FROM [SalesLT].[Product] ;

--Problem 2
SELECT	UPPER(Name) AS ProductName, 
		ROUND(Weight,0) AS ApproxWeight,
		Year(SellStartDate) AS SellStartYear,
		DATENAME(month,SellStartDate) AS SellStartMonth
	FROM [SalesLT].[Product] ;

-- Problem 3
SELECT	UPPER(Name) AS ProductName, 
		ROUND(Weight,0) AS ApproxWeight,
		Year(SellStartDate) AS SellStartYear,
		DATENAME(month,SellStartDate) AS SellStartMonth,
		SUBSTRING(ProductNumber,1,2) AS ProductType
	FROM [SalesLT].[Product] ;

-- Problem 4
SELECT	UPPER(Name) AS ProductName, 
		ROUND(Weight,0) AS ApproxWeight,
		Year(SellStartDate) AS SellStartYear,
		DATENAME(month,SellStartDate) AS SellStartMonth,
		SUBSTRING(ProductNumber,1,2) AS ProductType
	FROM [SalesLT].[Product] 
	WHERE ISNUMERIC(SIZE)=1;