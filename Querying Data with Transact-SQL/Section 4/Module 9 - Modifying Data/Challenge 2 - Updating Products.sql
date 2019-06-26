--Problem 1
UPDATE SalesLT.Product
	SET ListPrice = 1.1*ListPrice
	WHERE ProductCategoryID = (SELECT ProductCategoryID 
								FROM [SalesLT].[ProductCategory] AS PC
								WHERE PC.Name='Bells and Horns')

--Problem 2
UPDATE SalesLT.Product
	SET DiscontinuedDate = GETDATE()
	WHERE ProductCategoryID = 37 
		AND ProductNumber<>'LT-L123'
