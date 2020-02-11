--3
/*Añade a la tabla EMPLEADOS una restricción
de integridad referencial para el departamento.*/
ALTER TABLE EMPLEADOS ADD 
CONSTRAINT EMP_DEPART_FK FOREIGN KEY (DPTO_COD) REFERENCES DEPARTS(DEPT_NO);

DESC USER_CONSTRAINTS;

--4
/*Añade a la tabla DEPARTS una columna denominada PRESUPUESTO. 
Los presupuestos de los departamentos deben de estar entre 100.000 y 300.000.*/
ALTER TABLE DEPARTS ADD(
    PRESUPUESTO NUMBER(6),
    CONSTRAINT DEP_PRES_CK CHECK(PRESUPUESTO BETWEEN 100000 AND 300000)
);
SELECT * FROM DEPARTS;
/*Inserta valores en la columna PRESUPUESTO que has añadido para los departamentos
ya existentes de tal forma que el departamento de INVESTIGACIÓN 
tenga 300.000 y el resto 150.000. */
UPDATE DEPARTS 
SET presupuesto=150000;

UPDATE DEPARTS
SET PRESUPUESTO=300000
WHERE UPPER(DNOMBRE)='INVESTIGACION';

COMMIT;

--5.1
/*Visualizar el código de empleado y el código de trabajo, esta columna recogerá 
los trabajos actuales y anteriores de todos los empleados. Si un empleado 
ha desarrollado mas de una vez un mismo trabajo, esta información 
aparecerá una sola vez.*/
SELECT DISTINCT TRAB_COD, DPTO_COD
FROM HISTORIAL_LABORAL
UNION
SELECT TRAB_COD, DPTO_COD
FROM EMPLEADOS;

--5.2
/*Visualizar el código de empleado, el código de trabajo (incluirá los trabajos
actuales y anteriores de todos los empleados), el código y el nombre del 
departamento en el que desarrolla y desarrollaba cada trabajo. Si un empleado 
ha desarrollado mas de una vez un mismo trabajo, esta información aparecerá. 
Mostrar la salida ordenada por departamento.*/
SELECT H.TRAB_COD, H.DPTO_COD, D.DNOMBRE
FROM HISTORIAL_LABORAL H, DEPARTS D
WHERE D.DEPT_NO=H.DPTO_COD
UNION ALL
SELECT E.TRAB_COD, E.DPTO_COD, D.DNOMBRE
FROM EMPLEADOS E, DEPARTS D
WHERE E.DPTO_COD=D.DEPT_NO
ORDER BY DNOMBRE;

--5.3
/*Visualizar los códigos de los empleados y de los trabajos de los 
empleados que actualmente tengan un trabajo que ocuparon ya 
anteriormente en la compañía.*/
SELECT TRAB_COD, DPTO_COD
FROM HISTORIAL_LABORAL
INTERSECT
SELECT TRAB_COD, DPTO_COD
FROM EMPLEADOS; 

--5.4
/*Visualizar los códigos de los empleados que no hayan ejercido nunca el 
trabajo que tienen actualmente.*/
SELECT TRAB_COD, DPTO_COD
FROM EMPLEADOS
MINUS
SELECT TRAB_COD, DPTO_COD
FROM HISTORIAL_LABORAL; 

--5.5
SELECT EMP_NO, TRAB_COD, SALARIO
FROM EMPLEADOS
UNION
SELECT EMP_NO, TRAB_COD, 0
FROM HISTORIAL_LABORAL;













































