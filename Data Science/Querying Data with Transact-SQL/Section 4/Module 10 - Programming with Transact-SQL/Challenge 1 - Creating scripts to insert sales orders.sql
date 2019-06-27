--Problem 1
DECLARE @OrderDate DATE;
DECLARE @DueDate DATE;
DECLARE @CustomerID int;
DECLARE @OrderID int;

SET @OrderDate = GETDATE();
SET @DueDate = DATEADD(dd,7,GETDATE());
SET @CustomerID = 1;

INSERT INTO SalesLT.SalesOrderHeader
		(OrderDate,DueDate,CustomerID, ShipMethod)
	VALUES
		(@OrderDate,@DueDate,@CustomerID,'CARGO TRANSPORT 5');

SET @OrderID = SCOPE_IDENTITY();
PRINT @OrderID;

--Problem 2
-- DECLARE @OrderID INT;
DECLARE @ProductID int;
DECLARE @Quantity int;
DECLARE @UnitPrice INT;

-- SET @OrderID = 0;

SET @ProductID = 760;
SET @Quantity = 1;
SET @UnitPrice = 782.99;

IF EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID=@OrderID)
BEGIN
	INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice)
	VALUES(@OrderID, @Quantity, @ProductID, @UnitPrice)
END
ELSE
BEGIN
	PRINT 'The order does not exist';
END

