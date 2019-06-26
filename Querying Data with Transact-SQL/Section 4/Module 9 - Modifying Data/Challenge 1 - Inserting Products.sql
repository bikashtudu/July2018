-- Problem 1
--INSERT INTO SalesLT.Product(Name, ProductNumber,StandardCost, ListPrice, ProductCategoryID, SellStartDate)
--	VALUES('LED Lights','LT-L123',2.56,12.9, 37, GETDATE())
SELECT SCOPE_IDENTITY() AS ProductID;
SELECT * FROM SalesLT.Product WHERE ProductID = (SELECT SCOPE_IDENTITY()) ;

-- Problem 2
INSERT INTO SalesLT.ProductCategory(ParentProductCategoryID, Name)
VALUES (4,'Bells and Horns');
DECLARE @ProductID int = (SELECT SCOPE_IDENTITY());
INSERT INTO SalesLT.Product(Name, ProductNumber,StandardCost, ListPrice, ProductCategoryID, SellStartDate)
	VALUES
	('Bicycle Bell','BB-RING',2.47,4.99, @ProductID, GETDATE()),
	('Bicycle Horn','BB-PARP',1.29,3.75, @ProductID, GETDATE())
