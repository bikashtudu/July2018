--Problem 1

DECLARE @SalesOrderID INT =71774;
DECLARE @ErrorMsg NVARCHAR(100) = CONCAT('SalesOrderID #',CONVERT(nvarchar(20),@SalesOrderID),' does not exists.');
IF NOT EXISTS(SELECT * FROM SalesLT.SalesOrderDetail WHERE SalesOrderID=@SalesOrderID)
	THROW 50001,@ErrorMsg,0;
ELSE
BEGIN
	DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;
	DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;
END
GO

--Problem 2

DECLARE @SalesOrderID INT =71776;
DECLARE @ErrorMsg NVARCHAR(100) = CONCAT('SalesOrderID #',CONVERT(nvarchar(20),@SalesOrderID),' does not exists.');
BEGIN TRY
	IF NOT EXISTS(SELECT * FROM SalesLT.SalesOrderDetail WHERE SalesOrderID=@SalesOrderID)
		THROW 50001,@ErrorMsg,0;
	ELSE
	BEGIN
		DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;
		DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;
	END
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH
GO

