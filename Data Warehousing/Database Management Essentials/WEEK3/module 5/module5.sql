-- S!
SELECT 	EVTREQ.EVENTNO, 
		EVTREQ.DATEHELD, 
		COUNT(*) AS NumEventPlans
	FROM EVENTREQUEST AS EVTREQ
	INNER JOIN EVENTPLAN AS EVTP
		ON EVTREQ.EVENTNO= EVTP.EVENTNO
	WHERE YEAR(EVTP.WORKDATE)=2018 AND MONTH(EVTP.WORKDATE)=12
	GROUP BY EVTREQ.EVENTNO
    HAVING NumEventPlans > 1;

-- S2
SELECT 	EVTP.PLANNO, 
		EVTP.EVENTNO, 
		EVTP.WORKDATE, 
		EVTP.ACTIVITY
	FROM EVENTPLAN AS EVTP
    INNER JOIN EVENTREQUEST AS EVTREQ
		ON EVTP.EVENTNO = EVTREQ.EVENTNO
	INNER JOIN FACILITY AS FAC
		ON EVTREQ.FACNO = FAC.FACNO
	WHERE YEAR(EVTP.WORKDATE)=2018
		AND MONTH(EVTP.WORKDATE)=12
        AND FAC.FACNAME='Basketball arena';
        
        
-- S3
SELECT 	EVTREQ.EVENTNO, 
		EVTREQ.DATEHELD,
        EVTREQ.STATUS,
        EVTREQ.ESTCOST
	FROM EVENTREQUEST AS EVTREQ
	INNER JOIN  EVENTPLAN AS EVTP
		ON EVTREQ.EVENTNO = EVTP.EVENTNO
	INNER JOIN EMPLOYEE AS EMP
		ON EVTP.EMPNO = EMP.EMPNO
	INNER JOIN FACILITY AS FAC
		ON EVTREQ.FACNO = FAC.FACNO
	WHERE EMP.EMPNAME='Mary Manager'
		AND FAC.FACNAME='Basketball arena';

-- S4
SELECT 	EVTPL.PLANNO,
		EVTPL.LINENO,
        EVTPL.NUMBERFLD,
        LOC.LOCNAME,
        EVTPL.TIMESTART,
        EVTPL.TIMEEND
	FROM EVENTPLANLINE AS EVTPL
	INNER JOIN LOCATION AS LOC
		ON EVTPL.LOCNO = LOC.LOCNO
	INNER JOIN  FACILITY AS FAC
		ON LOC.FACNO = FAC.FACNO
	INNER JOIN EVENTPLAN AS EVTP
		ON EVTPL.PLANNO = EVTP.PLANNO
	WHERE FAC.FACNAME='Basketball arena'
		AND EVTP.ACTIVITY = 'Operation'
		AND EVTP.WORKDATE BETWEEN '2018-10-01' AND '2018-12-31';
        
-- M1
INSERT INTO FACILITY
	(FACNO, FACNAME)
	VALUES
    ('F105','Swimming Pool');

SELECT * FROM FACILITY;

-- M2
INSERT INTO LOCATION
	(LOCNO, FACNO, LOCNAME) 
    VALUES 
    ('L107', 'F105', 'Door');
    
SELECT * FROM LOCATION;

-- M3
INSERT INTO LOCATION
	(LOCNO, FACNO, LOCNAME) 
    VALUES 
    ('L108', 'F105', 'Locker Name');
    
SELECT * FROM LOCATION;

-- M4
UPDATE LOCATION
	SET LOCNAME = 'Gate'
    WHERE LOCNO = 'L107';
    
SELECT * FROM LOCATION;

-- M5
DELETE FROM LOCATION
	WHERE LOCNO = 'L108';

SELECT * FROM LOCATION;