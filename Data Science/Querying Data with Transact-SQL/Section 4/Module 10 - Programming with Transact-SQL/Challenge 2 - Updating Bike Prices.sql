--Problem 1
DECLARE @MarketAvgPrice MONEY = 2000;
DECLARE @MarketMaxPrice MONEY= 5000;
DECLARE @AvgListPrice MONEY;
DECLARE @MaxListPrice MONEY;
DECLARE @BikeProdCatID TABLE
(ProductCategoryID INT);

INSERT INTO  @BikeProdCatID(ProductCategoryID)
(SELECT DISTINCT ProductCategoryID
	 FROM SalesLT.vGetAllCategories
		WHERE ParentProductCategoryName = 'Bikes');
	
SELECT @AvgListPrice =  AVG(ListPrice), @MaxListPrice = MAX(ListPrice)
FROM SalesLT.Product
WHERE ProductCategoryID IN
	(SELECT ProductCategoryID FROM @BikeProdCatID );

WHILE @AvgListPrice < @MarketAvgPrice
BEGIN
	UPDATE SalesLT.Product
	SET ListPrice= 1.1*ListPrice
	WHERE ProductCategoryID IN
		(SELECT ProductCategoryID FROM @BikeProdCatID );

	SELECT @AvgListPrice =  AVG(ListPrice), @MaxListPrice = MAX(ListPrice)
	FROM SalesLT.Product
	WHERE ProductCategoryID IN
		(SELECT ProductCategoryID FROM @BikeProdCatID );
	
	IF @MaxListPrice >=@MarketMaxPrice
		BREAK;
END
