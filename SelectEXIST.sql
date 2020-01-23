--1
/*Obtén los datos de los empleados cuyo salario supera la media
de los salarios de la empresa.*/
SELECT *--HACE FALTA PONER TODAS LAS COLUMNAS
FROM EMPLE
WHERE SALARIO>(SELECT AVG(SALARIO)
                FROM EMPLE);
                
--2
/*Realiza una consulta que muestre el nombre, el salario y el código
del departamento de los empleados cuyo salario supere la media de 
su departamento.*/
SELECT APELLIDO, SALARIO, DEPT_NO
FROM EMPLE E
WHERE SALARIO > (SELECT AVG(SALARIO)
                FROM EMPLE
                WHERE DEPT_NO=E.DEPT_NO);

--3
/*Listar las localidades donde existan departamentos con empleados cuya 
comisión supere el 10% del salario. Realízala de dos formas.*/
SELECT LOC
FROM DEPART
WHERE DEPT_NO IN(SELECT DEPT_NO
               FROM EMPLE
               WHERE COMISION_PCT>SALARIO*0.1);
               
SELECT LOC
FROM DEPART
WHERE EXISTS(SELECT DEPT_NO
            FROM EMPLE
            WHERE COMISION_PCT>(SALARIO*0.1));
               
--4
/*Escribir una consulta para mostrar los apellidos de los empleados que 
tengan uno o más compañeros de trabajo en sus departamentos con fechas 
de contratación posteriores pero salarios más altos. */
SELECT E.APELLIDO
FROM EMPLE E
WHERE EXISTS(SELECT EMP.APELLIDO
            FROM EMPLE EMP
            WHERE E.SALARIO<EMP.SALARIO
            AND
            E.FECHA_ALTA>EMP.FECHA_ALTA);

--5
/*Buscar los departamentos que no tengan empleados. Hazlo de dos formas.*/
SELECT DEPT_NO
FROM DEPART
WHERE EXISTS (SELECT APELLIDO, DEPT_NO
                 FROM  EMPLE);






















