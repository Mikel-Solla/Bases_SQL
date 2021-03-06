REM ******** TABLA DEPART: *********** 

DROP TABLE DEPART CASCADE CONSTRAINTS; 

CREATE TABLE DEPART (
 	DEPT_NO  NUMBER(2),
	DNOMBRE  VARCHAR2(14), 
 	LOC      VARCHAR2(14),
	CONSTRAINT DEP_PK PRIMARY KEY (DEPT_NO)
	);

INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');

COMMIT;

REM /*  ******** TABLA EMPLE: ************* */

DROP TABLE EMPLE CASCADE CONSTRAINTS; 

CREATE TABLE EMPLE (
 	EMP_NO    NUMBER(4),
 	APELLIDO  VARCHAR2(10),
 	OFICIO    VARCHAR2(15),
 	ID_JEFE  NUMBER(4) ,
 	FECHA_ALTA DATE,
 	SALARIO   NUMBER(9) NOT NULL,
 	COMISION_PCT  NUMBER(3),
 	DEPT_NO   NUMBER(2) NOT NULL,
	CONSTRAINT EMPLE_PK PRIMARY KEY (EMP_NO),
	CONSTRAINT EMPLE_DIR_FK FOREIGN KEY (ID_JEFE)
				REFERENCES EMPLE(EMP_NO)  ON DELETE SET NULL,
	CONSTRAINT EMPLE_DEP_FK FOREIGN KEY (DEPT_NO)
				REFERENCES DEPART(DEPT_NO) ON DELETE CASCADE);

INSERT INTO EMPLE VALUES (7839,'REY','PRESIDENTE',NULL,TO_DATE('17/11/1981','DD/MM/YYYY'),6500,NULL,10);
INSERT INTO EMPLE VALUES (7566,'JIMENEZ','GERENTE',7839,TO_DATE('12/04/1981','DD/MM/YYYY'),3867,NULL,20);
INSERT INTO EMPLE VALUES (7698,'NEGRO','GERENTE',7839,TO_DATE('11/05/1981','DD/MM/YYYY'),3705,NULL,30);
INSERT INTO EMPLE VALUES (7782,'CEREZO','GERENTE',7839,TO_DATE('19/06/1981','DD/MM/YYYY'),3185,NULL,10);
INSERT INTO EMPLE VALUES (7788,'GIL','ANALISTA',7566,TO_DATE('19/11/1981','DD/MM/YYYY'),3900,NULL,20);
INSERT INTO EMPLE VALUES (7902,'FERNANDEZ','ANALISTA',7566,TO_DATE('13/12/1981','DD/MM/YYYY'),3900,NULL,20);
INSERT INTO EMPLE VALUES (7499,'ARROYO','COMERCIAL',7698,TO_DATE('20/02/1980','DD/MM/YYYY'),2080,10,30);
INSERT INTO EMPLE VALUES (7521,'SALA','COMERCIAL',7698,TO_DATE('22/02/1981','DD/MM/YYYY'),1625,5,30);
INSERT INTO EMPLE VALUES (7654,'MARTIN','COMERCIAL',7698,TO_DATE('29/09/1981','DD/MM/YYYY'),1625,5,30);
INSERT INTO EMPLE VALUES (7844,'TOVAR','COMERCIAL',7698,TO_DATE('18/09/1981','DD/MM/YYYY'),1950,8,30);
INSERT INTO EMPLE VALUES (7900,'JIMENO','PROGRAMADOR',7566,TO_DATE('13/12/1981','DD/MM/YYYY'),1235,NULL,30);
INSERT INTO EMPLE VALUES (7369,'SANCHEZ','PROGRAMADOR',7566,TO_DATE('17/12/1980','DD/MM/YYYY'),1040,NULL,20);
INSERT INTO EMPLE VALUES (7876,'ALONSO','PROGRAMADOR',7788,TO_DATE('23/09/1981','DD/MM/YYYY'),1430,NULL,20);
INSERT INTO EMPLE VALUES (7934,'SANCHEZ','AUXILIAR',7782,TO_DATE('23/01/1982','DD/MM/YYYY'),1690,NULL,10);

COMMIT;



--05 Ejercicio
/*1:Añadir un nuevo departamento: 'Calidad', con localización Santander y código 11. Añadir un 
empleado vinculado al departamento recién creado sus datos son:  7230, Aguirre, empleado.*/
INSERT INTO DEPART VALUES(11,'CALIDAD','SANTANDER');
INSERT INTO EMPLE VALUES(7230,'AGUIRRE','EMPLEADO',NULL, SYSDATE,1000,NULL,11);

ROLLBACK;
/*2-Aplicar un recorte presupuestario del 10% a todos los sueldos.*/
UPDATE EMPLE
SET
SALARIO=SALARIO*0.9;

SELECT SALARIO FROM EMPLE;

ROLLBACK;
/*3-Reasignar a los empleados del departamento de contabilidad 
(código 10) al departamento de producción  (código 40).*/
SELECT EMP_NO,APELLIDO,DEPT_NO FROM EMPLE
WHERE DEPT_NO=40;
SELECT EMP_NO,APELLIDO,DEPT_NO FROM EMPLE
WHERE DEPT_NO=10;

UPDATE EMPLE
SET
DEPT_NO =40
WHERE DEPT_NO=10;
/*
UPDATE EMPLE
SET
DEPT_NO =(SELECT DEPT_NO FROM DEPART
                    WHERE UPPER(DNOMBRE)='PRODUCCION')
WHERE DEPT_NO=(SELECT DEPT_NO FROM DEPART
                    WHERE UPPER(DNOMBRE)='CONTABILIDAD');
*/


SELECT EMP_NO,APELLIDO,DEPT_NO FROM EMPLE
WHERE DEPT_NO=40;

ROLLBACK;





/*4-Modificar a todos los empleados cuyo director es el  7566,
pasan a ser subordinados del jefe de tovar.*/
SELECT EMP_NO, APELLIDO FROM EMPLE
WHERE ID_JEFE=7566;
SELECT ID_JEFE FROM EMPLE
WHERE APELLIDO='TOVAR';
/*
SELECT EMP_NO,APELLIDO, ID_JEFE FROM EMPLE
WHERE ID_JEFE IN (7566, (SELECT ID_JEFE FROM EMPLE
                                            WHERE UPPER(APELLIDO)='TOVAR'))
ORDER BY ID_JEFE;
*/


UPDATE EMPLE 
SET
ID_JEFE=(SELECT ID_JEFE FROM EMPLE
                WHERE APELLIDO='TOVAR')
WHERE ID_JEFE=7566
;

SELECT * FROM EMPLE
WHERE ID_JEFE=(SELECT ID_JEFE FROM EMPLE
                WHERE APELLIDO='TOVAR');

ROLLBACK;







/*5-A los trabajadores cuyo oficio sea empleado
se les adjudicara el mismo sueldo que tiene MUÑOZ.*/
SELECT EMP_NO,APELLIDO,OFICIO,SALARIO FROM EMPLE
WHERE UPPER(OFICIO)='EMPLEADO'
OR
UPPER(APELLIDO)='MUÑOZ';


UPDATE EMPLE SET
SALARIO=NVL((SELECT SALARIO FROM EMPLE
                        WHERE UPPER(APELLIDO)='MUÑOZ'),0)
WHERE OFICIO='EMPLEADO'
;

SELECT *FROM EMPLE
WHERE OFICIO='EMPLEADO';

ROLLBACK;







/*6-Todos los trabajadores cuyo departamento
este localizado en Santander tendrán una comisión de 300€.*/
SELECT EMP_NO,COMISION_PCT, DEPT_NO FROM EMPLE
WHERE DEPT_NO=(SELECT DEPT_NO 
                                FROM DEPART
                                WHERE LOC='SANTANDER');

UPDATE EMPLE SET
COMISION_PCT=300
WHERE DEPT_NO=(SELECT DEPT_NO FROM DEPART
                                WHERE UPPER(LOC)='SANTANDER');

SELECT * FROM EMPLE
WHERE DEPT_NO=(SELECT DEPT_NO FROM DEPART
                                WHERE LOC='SANTANDER');

ROLLBACK;              









/*7-Despedir a todos los empleados que trabajan
para el departamento de ventas (código 30).*/
SELECT DEPT_NO,EMP_NO,APELLIDO FROM EMPLE
WHERE DEPT_NO=(SELECT DEPT_NO FROM DEPART
                                WHERE DNOMBRE='VENTAS');
                                
DELETE FROM EMPLE 
WHERE DEPT_NO=(SELECT DEPT_NO FROM DEPART
                               WHERE DNOMBRE='VENTAS');
ROLLBACK;








