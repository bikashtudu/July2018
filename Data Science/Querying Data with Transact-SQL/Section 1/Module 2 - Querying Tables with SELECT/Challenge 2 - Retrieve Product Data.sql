--Question 1
SELECT Name, Color, Size
	FROM [SalesLT].[Product]
	WHERE ProductModelID=1;

--Question 2
SELECT ProductNumber,Name 
	FROM [SalesLT].[Product]
	WHERE Color IN('Black','Red','White')
	AND Size IN ('S','M');

--Question 3
SELECT ProductNumber,Name 
	FROM [SalesLT].[Product]
	WHERE ProductNumber LIKE 'BK-%';

--Question 4
SELECT ProductNumber,Name 
	FROM [SalesLT].[Product]
	-- REGEX to match required condition
	WHERE	ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';


