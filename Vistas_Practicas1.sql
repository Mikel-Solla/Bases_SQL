--1
/*Crear una vista EMP_30 que contenga de los empleados del departamento 30 la 
siguiente información: código de empleado, apellidos, salario y departamento.
Comprueba que se ha creado correctamente, y su contenido.*/
CREATE OR REPLACE VIEW EMP_30 AS
SELECT EMP_NO, APELLIDO, SALARIO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO = 30;

DESC EMP_30;
SELECT * FROM EMP_30;

SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='EMP_30';

--2
/*Realiza la siguiente inserción
Comprueba el  contenido de la tabla. ¿Qué sucede en la vista?*/
INSERT INTO EMPLE VALUES(9999,'URRUTIA','ANALISTA',7698,NULL,200000,NULL,30); 

SELECT EMP_NO ,APELLIDO ,OFICIO ,ID_JEFE ,FECHA_ALTA ,SALARIO ,COMISION_PCT ,DEPT_NO 
FROM EMPLE;

DESC USER_VIEWS;

SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE UPPER(VIEW_NAME)='EMP_30';

--3
/*Añade ahora un nuevo empleado en la vista, en el departamento 30.
¿Qué ocurre en la tabla base? ¿Y en la vista? ¿Añade otro empleado en la vista, pero en el departamento 10?  
¿Qué ocurre en la tabla base? ¿Y en la vista?*/
INSERT INTO EMP_30 VALUES(8888,'RUIZ',280000,30);
INSERT INTO EMP_30 VALUES(8889,'PACO',280000,10);

SELECT * FROM EMPLE;

--4
CREATE OR REPLACE VIEW EMP_30 AS
SELECT EMP_NO, APELLIDO, SALARIO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO = 30
WITH CHECK OPTION CONSTRAINT EMP_30_CK;

INSERT INTO EMP_30 VALUES (1111, 'LOPEZ', 1200,30);  
INSERT INTO EMP_30(EMP_NO, APELLIDO, SALARIO, DEPT_NO) VALUES (2229, 'RUIZ', 2200,20);  


--5
CREATE OR REPLACE VIEW SAL_20(ID_EMPLE,APE_EMP,SAL_ANUAL) AS
SELECT EMP_NO  , APELLIDO , SALARIO*12 
FROM EMPLE
WHERE DEPT_NO=20
WITH READ ONLY CONSTRAINT SAL_20_NODML;
































