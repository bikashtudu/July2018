--Question 1
SELECT DISTINCT City, StateProvince
	FROM [SalesLT].[Address];

--Question 2
SELECT TOP 10 PERCENT Name
	FROM [SalesLT].[Product]
	ORDER BY Weight DESC;

--Question 3
SELECT Name
	FROM [SalesLT].[Product]
	ORDER BY Weight DESC
	OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;