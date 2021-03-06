--3
SELECT MIN(APELLIDO) AS"PRIMERO",
        MAX(APELLIDO) AS "ULTIMO"
FROM EMPLE;


--4
SELECT COUNT(EMP_NO) AS "CANT EMPLE DEPT_40"
FROM EMPLE
WHERE DEPT_NO=40;

--5
SELECT COUNT(EMP_NO) AS "CANT EMPLE DEPT_30"
FROM EMPLE
WHERE DEPT_NO=30
AND
COMISION_PCT IS NOT NULL;

SELECT COUNT(COMISION_PCT) AS "CAN EMPLE DEPT_30"
FROM EMPLE
WHERE DEPT=30
AND
COMISION_PCT IS NOT NULL;

--6
SELECT COUNT(DISTINCT DEPT_NO) AS "CANT.  DEPARTAMENTOS"
FROM EMPLE;

--7
SELECT DEPT_NO, COUNT(*) AS "EMPLE POR DEPART"
FROM EMPLE
GROUP BY DEPT_NO;

--8
SELECT DEPT_NO, COUNT(*) AS "EMPLE POR DEPART"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(*)>4;