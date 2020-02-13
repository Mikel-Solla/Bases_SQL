--1
/*Seleccionar aquellos departamentos en los que al
menos exista unempleado con comisión.*/
SELECT DEPT_NO, DNOMBRE
FROM DEPART D
WHERE EXISTS (SELECT 'X'
             FROM  EMPLE
             WHERE DEPT_NO=D.DEPT_NO
             AND
             COMISION_PCT IS NOT NULL);


SELECT DEPT_NO, DNOMBRE
FROM DEPART
WHERE DEPT_NO IN(SELECT DEPT_NO
                FROM EMPLE
                WHERE COMISION_PCT IS NOT NULL);

--2
/*Listar aquellos departamentos en los que
todos sus empleados carezcan de información sobre su comisión.*/
SELECT DEPT_NO
FROM DEPART D
WHERE EXISTS (SELECT 'X'
            FROM  EMPLE
         	WHERE DEPT_NO=D.DEPT_NO
            AND
        	COMISION_PCT IS NULL);


--3
/*Visualizar el departamento con más empleados.*/
SELECT DEPT_NO,COUNT(EMP_NO)
FROM  EMPLE 
GROUP BY DEPT_NO
HAVING COUNT(*)=(SELECT MAX(COUNT(*))
                FROM EMPLE 
                GROUP BY EMP_NO);

--4
/*Obtener el número y el nombre del departamento
con más personal de oficio “PROGRAMADOR”.*/
SELECT E.DEPT_NO, D.DNOMBRE
FROM DEPART D, EMPLE E
WHERE D.DEPT_NO=E.DEPT_NO
AND UPPER(E.OFICIO)='PROGRAMADOR'
GROUP BY E.DEPT_NO, D.DNOMBRE
HAVING COUNT(E.EMP_NO)=(SELECT MAX(COUNT(*))
                        FROM EMPLE
                        WHERE UPPER(OFICIO)='PROGRAMADOR'
                        GROUP BY DEPT_NO);



--5
/*Buscar el departamento con más presupuesto asignado
para pagar el salario y la comisión de sus empleados.*/
SELECT E.DEPT_NO,D.DNOMBRE
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=D.DEPT_NO
GROUP BY E.DEPT_NO, D.DNOMBRE
HAVING SUM(E.SALARIO+NVL(E.COMISION_PCT,0))=(SELECT MAX(SUM(S.SALARIO+NVL(S.COMISION_PCT,0)))
                                    FROM EMPLE S
                                    GROUP BY DEPT_NO);









