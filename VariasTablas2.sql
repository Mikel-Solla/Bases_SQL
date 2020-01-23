--1
/*Crear un listado único con todos los oficios que haya en el departamento 10.
Incluir la localidad del departamento en el resultado.*/
SELECT DISTINCT(E.OFICIO), E.DEPT_NO, D.LOC
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=10
ORDER BY LOC;

--2
/*Obtener la siguiente salida:*/
SELECT D.DEPT_NO, D.DNOMBRE, COUNT(EMP_NO)AS "NUM. EMPLEADOS"
FROM EMPLE E, DEPART D 
WHERE D.DEPT_NO=E.DEPT_NO (+)
GROUP BY D.DEPT_NO, D.DNOMBRE
ORDER BY DEPT_NO;



--3
/*Visualizar el número de departamento, el nombre del departamento, 
y la cantidad de empleados del departamento con más empleados.*/
SELECT D.DEPT_NO, D.DNOMBRE, COUNT(*) AS "NUM. EMPLEADOS"
FROM EMPLE E, DEPART D 
WHERE D.DEPT_NO=E.DEPT_NO
--HAVING COUNT(E.EMP_NO)=(SELECT COUNT(*)FROM DEPARTWHERE )
GROUP BY D.DEPT_NO, D.DNOMBRE;

--4
/*Mostrar el apellido, el nombre del departamento y el salario de cualquier empleado 
cuyo salarioy comisión coincidan con los de cualquier empleado que trabaje en Barcelona, 
incluidos los que no tienen comisión.*/
SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO
FROM EMPLE E, DEPART D 
WHERE E.DEPT_NO=D.DEPT_NO 
AND
E.SALARIO IN (SELECT SALARIO
                FROM EMPLE 
                WHERE DEPT_NO=(SELECT DEPT_NO
                                FROM DEPART
                                WHERE UPPER(LOC)='BARCELONA'))
AND
E.COMISION_PCT IN(SELECT COMISION_PCT
                FROM EMPLE 
                WHERE DEPT_NO=(SELECT DEPT_NO
                                FROM DEPART
                                WHERE UPPER(LOC)='BARCELONA'))

;



























































