--1
/*Crear un listado único con todos los oficios que haya en el departamento 10.
Incluir la localidad del departamento en el resultado.*/
SELECT DISTINCT(E.OFICIO), D.LOC
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=10
AND 
E.DEPT_NO=D.DEPT_NO;

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
SELECT E.DEPT_NO, D.DNOMBRE, COUNT(*) AS "NUM. EMPLEADOS"
FROM EMPLE E, DEPART D 
WHERE D.DEPT_NO=E.DEPT_NO 
GROUP BY E.DEPT_NO, D.DNOMBRE
HAVING COUNT(*)=(SELECT MAX(COUNT(*))
                FROM EMPLE 
                GROUP BY DEPT_NO);


--HAVING QUITA OBJETOS DE GRUPOS, WHERE QUITA FILAS

--4
/*Mostrar el apellido, el nombre del departamento y el salario de cualquier empleado 
cuyo salarioy comisión coincidan con los de cualquier empleado que trabaje en Barcelona, 
incluidos los que no tienen comisión.*/
SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO, NVL(TO_CHAR(E.COMISION_PCT),'SIN COMISION') AS "COMISION"
FROM EMPLE E, DEPART D 
WHERE E.DEPT_NO=D.DEPT_NO 
AND
E.SALARIO IN (SELECT SALARIO
                FROM EMPLE 
                WHERE DEPT_NO=(SELECT DEPT_NO
                                FROM DEPART
                                WHERE UPPER(LOC)='BARCELONA'))
AND
NVL(E.COMISION_PCT,-1) IN(SELECT NVL(COMISION_PCT,-1)
                FROM EMPLE 
                WHERE DEPT_NO=(SELECT DEPT_NO
                                FROM DEPART
                                WHERE UPPER(LOC)='BARCELONA'));



























































