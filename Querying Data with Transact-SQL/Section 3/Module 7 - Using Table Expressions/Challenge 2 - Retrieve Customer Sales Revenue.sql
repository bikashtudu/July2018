WITH Company_SalesRevenue(CompanyContact,TotalDue)
AS
(
	SELECT	CONCAT(ISNULL(C.CompanyName,''),' (',ISNULL(C.FirstName,''),' ',ISNULL(C.Lastname,''),')') AS CompanyContact,
			SOH.TotalDue AS TotalDue 
		FROM [SalesLT].[Customer] AS C
		INNER JOIN [SalesLT].[SalesOrderHeader] AS SOH
			ON C.CustomerID = SOH.CustomerID
)
SELECT	CompanyContact,
		SUM(TotalDue) AS TotalRevenue
	FROM Company_SalesRevenue
	GROUP BY CompanyContact
	ORDER BY CompanyContact;