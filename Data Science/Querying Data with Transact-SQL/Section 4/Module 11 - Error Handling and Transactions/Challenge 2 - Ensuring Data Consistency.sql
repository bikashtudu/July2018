-- Problem 1
DECLARE @SalesOrderID INT =71784;
DECLARE @ErrorMsg NVARCHAR(100) = CONCAT('SalesOrderID #',CONVERT(nvarchar(20),@SalesOrderID),' does not exists.');
BEGIN TRY
	IF NOT EXISTS(SELECT * FROM SalesLT.SalesOrderDetail WHERE SalesOrderID=@SalesOrderID)
		THROW 50001,@ErrorMsg,0;
	ELSE
	BEGIN
		BEGIN TRANSACTION
			DELETE FROM SalesLT.SalesOrderDetail 
				WHERE SalesOrderID = @SalesOrderID;
--			THROW 50001,@ErrorMsg,0;
			DELETE FROM SalesLT.SalesOrderHeader 
				WHERE SalesOrderID = @SalesOrderID;
		COMMIT TRANSACTION
	END 
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN 
		ROLLBACK TRANSACTION;
		PRINT 'Rolling Back'
	END
	ELSE
	BEGIN
		PRINT ERROR_MESSAGE();
	END
END CATCH;