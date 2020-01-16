--PARTE1
CREATE TABLE EMPLEADOS30 AS SELECT EMP_NO,APELLIDO,OFICIO,ID_JEFE,FECHA_ALTA,SALARIO,COMISION_PCT,DEPT_NO
                            FROM EMPLE
                            WHERE DEPT_NO=30;
                            
SELECT * FROM EMPLEADOS30;
DESC EMPLEADOS30;

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT emple30_empno_pk PRIMARY KEY(EMP_NO);

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT emple30_depart_fk FOREIGN KEY(DEPT_NO) REFERENCES DEPART ON DELETE CASCADE;

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT emple30_jefe_fk FOREIGN KEY(id_jefe)REFERENCES EMPLEADOS30 ON DELETE SET NULL;
--PARTE2
/*Insertar en la tabla EMPLE a un empleado de apellido 'SAAVEDRA' 
con número de empleado 2000. La fecha de alta será la fecha actual, el
SALARIO será el mismo salario que el del empleado de apellido 'SALA'
más el 20 por 100 y el resto de datos serán los mismos que los datos 
del empleado de apellido 'SALA'. Hazlo en un sólo paso.*/
INSERT INTO EMPLE 
SELECT 2000,'SAAVEDRA',OFICIO,ID_JEFE,SYSDATE,SALARIO+SALARIO*0,2,COMISION_PCT,DEPT_NO
FROM EMPLE
WHERE UPPER(APELLIDO)='SALA';

/*Actualiza la tabla EMPLE, cambiando el número de departamento, para
todos los empleados que tenga el mismo oficio que el empleado 7566, por el 
número de departamento actual del empleado 7499.*/
UPDATE EMPLE
SET DEPT_NO=(SELECT DEPT_NO
             FROM EMPLE
             WHERE EMP_NO=7499)
WHERE OFICIO=(SELECT OFICIO
              FROM EMPLE
              WHERE EMP_NO=7566);

/*Borrar todos los departamentos de la tabla DEPART para los cuales
no existan empleados en EMPLE.*/
DELETE FROM DEPART
WHERE DEPT_NO IN (SELECT DISTINCT DEPT_NO 
                  FROM EMPLE);

/*Eliminar a todos los empleados que están en un departamento 
cuyo nombre contiene una 'O'.*/
DELETE FROM EMPLE
WHERE DEPT_NO IN(SELECT DEPT_NO
                 FROM DEPART
                 WHERE UPPER(DNOMBRE) LIKE '%O%'
);

/*Incrementa el salario del empleado de apellido REY.
Su nuevo salario será el que tenía antes más un importe que
corresponde con la comisión que tiene ARROYO.*/
UPDATE EMPLE
SET SALARIO=SALARIO+(SELECT NVL(COMISION,0)
                     FROM EMPLE
                     WHERE UPPER(APELLIDO)='ARROYO')
WHERE UPPER(APELLIDO)='REY';



























