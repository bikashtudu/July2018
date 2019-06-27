--Problem 1
SELECT	a.CountryRegion, 
		a.StateProvince, 
		SUM(soh.TotalDue) AS Revenue
	FROM SalesLT.Address AS a
	JOIN SalesLT.CustomerAddress AS ca 
		ON a.AddressID = ca.AddressID
	JOIN SalesLT.Customer AS c 
		ON ca.CustomerID = c.CustomerID
	JOIN SalesLT.SalesOrderHeader as soh 
		ON c.CustomerID = soh.CustomerID
	GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
	ORDER BY a.CountryRegion, a.StateProvince;

--Problem 2
SELECT	a.CountryRegion, 
		a.StateProvince, 
		SUM(soh.TotalDue) AS Revenue,
		CHOOSE(1+GROUPING_ID(a.CountryRegion)+GROUPING_ID(a.StateProvince),
			CONCAT(a.StateProvince,' Total'),
			CONCAT(a.CountryRegion,' Total'),
			'Grand Total') AS Level
	FROM SalesLT.Address AS a
	JOIN SalesLT.CustomerAddress AS ca 
		ON a.AddressID = ca.AddressID
	JOIN SalesLT.Customer AS c 
		ON ca.CustomerID = c.CustomerID
	JOIN SalesLT.SalesOrderHeader as soh 
		ON c.CustomerID = soh.CustomerID
	GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
	ORDER BY a.CountryRegion, a.StateProvince;

--Problem 3
SELECT	a.CountryRegion, 
		a.StateProvince, 
		a.City,
		SUM(soh.TotalDue) AS Revenue,
		CHOOSE(1+GROUPING_ID(a.CountryRegion)+GROUPING_ID(a.StateProvince)+GROUPING_ID(a.City),
			CONCAT(a.City,' Total'),
			CONCAT(a.StateProvince,' Total'),
			CONCAT(a.CountryRegion,' Total'),
			'Grand Total') AS Level
	FROM SalesLT.Address AS a
	JOIN SalesLT.CustomerAddress AS ca 
		ON a.AddressID = ca.AddressID
	JOIN SalesLT.Customer AS c 
		ON ca.CustomerID = c.CustomerID
	JOIN SalesLT.SalesOrderHeader as soh 
		ON c.CustomerID = soh.CustomerID
	GROUP BY ROLLUP(a.CountryRegion, a.StateProvince,a.City)
	ORDER BY a.CountryRegion, a.StateProvince,a.City;
