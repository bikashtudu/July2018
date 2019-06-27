--Problem 1
DELETE FROM SalesLT.Product
	WHERE ProductCategoryID = (SELECT ProductCategoryID
								FROM SalesLT.ProductCategory AS PC
								WHERE PC.Name = 'Bells and Horns')

DELETE FROM SalesLT.ProductCategory
	WHERE Name = 'Bells and Horns'