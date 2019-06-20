-- Problem 1
SELECT DISTINCT 
		CUST.CITY, 
		CUST.STATE, 
        CUST.ZIP
	FROM CUSTOMER AS CUST;
    
-- Problem 2
SELECT 	EMP.EMPNAME,
		EMP.DEPARTMENT,
		EMP.EMAIL
	FROM EMPLOYEE AS EMP
    WHERE PHONE LIKE '3-%';
  
-- Problem 3  
SELECT *
	FROM RESOURCETBL
	WHERE RATE BETWEEN 10 AND 20;
  
-- Problem 4  
SELECT 	EVTREQ.EVENTNO,
		EVTREQ.DATEAUTH,
		EVTREQ.STATUS
	FROM EVENTREQUEST AS EVTREQ
    WHERE STATUS IN ('Approved','Denied')
		AND YEAR(DATEAUTH)=2018 
        AND MONTH(DATEAUTH) = 7;

-- Problem 5
SELECT 	LOC.LOCNO, 
		LOC.LOCNAME
	FROM LOCATION AS LOC
    INNER JOIN FACILITY AS FAC
		ON LOC.FACNO = FAC.FACNO
	WHERE FAC.FACNAME = 'Basketball Arena';
  
-- Problem 6  
SELECT 	EVTPLN.PLANNO,
		COUNT(EVTPLN.LINENO) AS EVENTPLANLINENUMBER, 
		SUM(EVTPLN.RESNO) AS RESOURCESASSIGNED
	FROM EVENTPLANLINE AS EVTPLN
    GROUP BY EVTPLN.PLANNO
    HAVING COUNT(EVTPLN.LINENO) > 0

    
	
