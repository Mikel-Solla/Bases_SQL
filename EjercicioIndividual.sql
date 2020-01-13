--EJERCICIO_INDIVIDUAL

--1.
/*Seleccionar de la tabla EMPLE aquellos empleados del departamento 20
y cuyo oficio sea ‘ANALISTA’. La consulta se ha de ordenar de modo 
descendente por APELLIDO y también de manera descendente 
por número de empleado.*/
SELECT APELLIDO,OFICIO, DEPT_NO, EMP_NO 
FROM EMPLE
WHERE DEPT_NO = 20
AND
UPPER(OFICIO) ='ANALISTA'
ORDER BY APELLIDO DESC, EMP_NO DESC;


--2.
/*Mostrar el apellido, oficio y fecha de alta de los empleados
contratados entre los meses de mayo y setiembre del año 1981.
Obtener la salida ordenada por fecha de alta.*/
SELECT DEPT_NO,APELLIDO, OFICIO,FECHA_ALTA 
FROM EMPLE
WHERE FECHA_ALTA BETWEEN TO_DATE('01/05/1981','DD/MM/YYYY')AND TO_DATE('30/09/1981','DD/MM/YYYY')
ORDER BY FECHA_ALTA;

--3
/*Mostrar los apellidos de los empleados concatenados con el oficio, separados por una coma y 
un espacio en blanco y ordenados por el apellido. Llamar a la columna 'EMPLE y OFI'.*/
SELECT APELLIDO ||', '|| OFICIO AS "EMPLE Y OFI"
FROM EMPLE
WHERE UPPER(APELLIDO) LIKE '%R%'
ORDER BY APELLIDO;

--4
/*Sacar los diferentes oficios que tienen los empleados.
Cada oficio saldrá una sola vez.*/

SELECT DISTINCT OFICIO AS "OFICIOS DIFERENTES"
FROM EMPLE;

--5
/*A partir de la tabla EMPLE, listar el apellido y el salario de los empleados cuyo salario anual NO
esté comprendido entre 9000 y 20000. */
SELECT APELLIDO, SALARIO AS "SALARIO MENSUAL",SALARIO*12 AS "SALARIO ANUAL"
FROM EMPLE
WHERE (SALARIO*12)NOT BETWEEN 9000 AND 20000;


--6
/*Obtener la relación de empleados que tienen comisión.*/
SELECT *
FROM EMPLE
WHERE COMISION_PCT IS NOT NULL;

--7
/*Obtener la relación de empleados que no tienen comisión.
Junto el apellido aparecera "no tiene comision"*/
SELECT APELLIDO ||' NO TIENE COMISION' 
FROM EMPLE
WHERE COMISION_PCT IS NULL;

--8
/*OBTENER APELLIDO, SALARIO COMISION DE TODOS. 
AQUELLOS QUE NO TENGAN COMISION QUE APAREZCA "NO TIENE COMISION"*/
--PASAR COMISION_PCT A TO_CHAR PARA PDER INTRODUCIR 'NO TIENE COMISION'
SELECT APELLIDO, SALARIO, NVL(TO_CHAR(COMISION_PCT),'NO TIENE COMISION')
FROM EMPLE;




SELECT USER_CONSTRAINTS.TABLE_NAME,USER_CONSTRAINTS.CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONS_COLUMNS, USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME) IN('EMPLE','DEPART')
AND
USER_CONSTRAINTS.CONSTRAINT_NAME=USER_CONS_COLUMNS.CONSTRAINT_NAME;


