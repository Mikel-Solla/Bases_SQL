--1
/*Obtener el apellido de los empleados que tienen el mismo oficio que ‘GIL’.*/
SELECT APELLIDO
FROM EMPLE 
WHERE OFICIO IN(SELECT DISTINCT(OFICIO)
                FROM EMPLE
                WHERE UPPER(APELLIDO)='GIL')
AND
UPPER(APELLIDO)!='GIL';

--'!=' ES LO MISMO QUE '<>'

--2
/*Queremos consultar los datos de los empleados que trabajan en las 
localidades de ‘MADRID’ o ‘BARCELONA’.*/
SELECT EMP_NO, APELLIDO, OFICIO, ID_JEFE, FECHA_ALTA, SALARIO, COMISION_PCT, DEPT_NO
FROM EMPLE 
WHERE DEPT_NO IN(SELECT DEPT_NO
                FROM DEPART
                WHERE UPPER(LOC) = 'BARCELONA'
                OR
                UPPER(LOC)='MADRID');

--3
/*Obtener el apellido de los empleados con el mismo oficio y salario que ‘GIL’.*/
SELECT APELLIDO,OFICIO, SALARIO
FROM EMPLE
WHERE OFICIO IN(SELECT OFICIO
                FROM EMPLE
                WHERE UPPER(APELLIDO)='GIL')
AND
SALARIO=(SELECT SALARIO
        FROM EMPLE
        WHERE UPPER(APELLIDO)='GIL')
AND
UPPER(APELLIDO)!='GIL';

--4
/*Mostrar los empleados (nombre, oficio, salario y fecha de alta) que desempeñen 
el mismo oficio que "JIMENEZ" o que tengan un salario mayor o igual que "FERNANDEZ".
Nota: se supone que puede haber mas que un fernandez y un jimenez en la empresa*/
INSERT INTO EMPLE VALUES(2222,'FERNANDEZ', 'PROGRAMADOR', 7566, SYSDATE, 3900, NULL, 20);
COMMIT;


SELECT APELLIDO, OFICIO, SALARIO, FECHA_ALTA
FROM EMPLE
WHERE (OFICIO =ANY (SELECT OFICIO
            FROM EMPLE
            WHERE UPPER(APELLIDO)='JIMENEZ')
OR
SALARIO >ALL(SELECT SALARIO
        FROM EMPLE
        WHERE UPPER(APELLIDO)='FERNANDEZ'))
AND
UPPER(APELLIDO) NOT IN ('FERNANDEZ','JIMENEZ');

--5
/*Visualizar el número de departamento y la cantidad de empleados del departamento con más empleados.*/
SELECT E.DEPT_NO, COUNT(*) AS "NUM. EMPLEADOS"
FROM EMPLE E
GROUP BY E.DEPT_NO
HAVING COUNT(*)=(SELECT MAX(COUNT(*))
                FROM EMPLE 
                GROUP BY DEPT_NO);

--6
/*Buscar el oficio con el salario medio más bajo.*/
SELECT OFICIO, AVG(SALARIO)
FROM EMPLE 
GROUP BY OFICIO
HAVING AVG(SALARIO) IN (SELECT MIN(AVG(SALARIO))
                        FROM EMPLE
                        GROUP BY OFICIO);

--7
/*    7. ¿Qué es incorrecto en esta sentencia?
SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE SALARIO = ( SELECT MIN(SALARIO))
				FROM EMPLE
				GROUP BY DEPT_NO);*/


--8
/*     ¿Qué ocurre con la siguiente sentencia?
SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = ( SELECT OFICIO
			FROM EMPLE
			WHERE APELLIDO = 'PEREZ');
       ¿Qué ocurriría si existiera un oficio con valor nulo?*/


--9
/*Mostrar los apellidos de los empleados que no tienen subordinados.*/


--10
/*Mostrar los apellidos de los empleados que tienen subordinados.*/


--11
/*Escribir una consulta para mostrar los códigos de empleado y los apellidos de todos los
empleados que trabajen en un departamento con cualquier empleado cuyo apellido contenga una 'U'.*/


--12
/*Modificar la consulta anterior para mostrar los códigos de empleado y los apellidos 
de todos los empleados que ganan más del salario medio y que trabajen en un departamento
con un empleado que tenga una 'U' en su apellido.*/


--13
/*Escribir una consulta para mostrar el apellido, número de departamento 
y el salario de cualquier empleado cuyo número de departamento  y salario 
coincidan con el número de departamento y salario de cualquier empleado que ganen comisión.*/


--14
/*Escribir una consulta para encontrar todos los empleados que ganan más que el salario 
medio de sus departamentos. Mostrar el apellido, el salario y el código del departamento .*/



--15
/*Modificar el ejercicio anterior para visualizar el apellido,
el salario, el código del departamento y el salario medio de los sueldos de ese departamento.
Ordenar por salario medio.*/


        