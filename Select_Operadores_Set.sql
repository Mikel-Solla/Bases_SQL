--3
/*Añade a la tabla EMPLEADOS una restricción
de integridad referencial para el departamento.*/
ALTER TABLE EMPLEADOS ADD CONSTRAINT;

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






























