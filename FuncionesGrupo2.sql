--1
/*Visualizar ( nº departamento y nº de empleados) sólo los departamentos con más 
de 4 empleados, pero ordenar la salida en descendente por número de empleados.*/
SELECT DEPT_NO, COUNT(*) AS "EMPLE POR DEPART"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(*)>4
ORDER BY COUNT(*) DESC;

--2
/*Partiendo de la tabla EMPLE, obtener la suma de salarios, el salario máximo 
y el salario mínimo por cada departamento (nº departamento).*/
SELECT DEPT_NO, SUM(SALARIO) AS "SUMA DE SALARIOS",MAX(SALARIO) AS "SALARIO MAX", MIN(SALARIO) AS "SALARIO MIN"
FROM EMPLE
GROUP BY DEPT_NO
ORDER BY DEPT_NO ASC;

--3
/*Calcular el número de empleados que realizan cada oficio por departamento.
Los datos que se visualizan son: departamento, oficio y número de empleados.*/
SELECT DEPT_NO, OFICIO, COUNT(EMP_NO) AS "NUM EMPLEADO"
FROM EMPLE
GROUP BY OFICIO, DEPT_NO;

--4
/*Visualizar el valor numérico que nos indique el número de empleados que
hay en el departamento que más empleados hay.*/
--SACAR CANT. EMPLEADOS EN CADA DEPART.
SELECT COUNT(EMP_NO),DEPT_NO
FROM EMPLE
GROUP BY DEPT_NO; 


SELECT MAX(COUNT(EMP_NO)) AS "CANT. MAX. DE EMPLEADOS"
FROM EMPLE
GROUP BY DEPT_NO;

--4.1
/*SACAR EL CODIGO Y EL NOMBRE DEL DEPARTAMENTO CON EL NUMERO
MAXIMO DE EMPLEADOS(NO SACAR NUMERO DE EMPLEADOS)*/





--5
/*Mostrar los números de departamento y el salario medio para los 
departamentos cuyos salarios máximos sean mayores de 250000.*/
SELECT DEPT_NO, ROUND(AVG(SALARIO)) AS "SALARIO MEDIO"
FROM EMPLE
GROUP BY DEPT_NO
HAVING MAX(SALARIO*12)>25000
ORDER BY DEPT_NO;

--6
/*Visualizar el salario medio máximo por  departamento.*/
SELECT ROUND(AVG(MAX(SALARIO))) AS "SALARIO MEDIO MAX"
FROM EMPLE
GROUP BY DEPT_NO;

--7
/*Escribir una consulta para mostrar el
número de personas con el mismo oficio.*/
SELECT COUNT(EMP_NO) AS "CANT. DE EMPLEADOS", OFICIO
FROM EMPLE
GROUP BY OFICIO
ORDER BY OFICIO;

--8
/*Mostrar el número de director y el salario del empleado peor pagado
para ese director. Excluir los empleados de los que se desconozca 
el director. Excluir los grupos en los que el salario mínimo sea 200000 
o menos. Ordenar el resultado por salario de forma descendente.*/
SELECT ID_JEFE, MIN(SALARIO*12)
FROM EMPLE
WHERE ID_JEFE IS NOT NULL
GROUP BY ID_JEFE
HAVING MIN(SALARIO*12)<200000
ORDER BY MIN(SALARIO*12) DESC;















































