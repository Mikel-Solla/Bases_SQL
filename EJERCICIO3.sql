/*
    ORDEN DE LAS DROP INCORRECTO
    debe ser el inverso a la creación en las tablas que se referencian entre si
    */

drop table employees cascade constraints;
drop table departments cascade constraints;
drop table articulos cascade constraints;
drop table fabricantes cascade constraints;
drop table tiendas cascade constraints;
drop table pedidos cascade constraints;
drop table ventas cascade constraints;




create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) CONSTRAINT dept_name_nn NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(department_id)
);
/*
Informe de error -
ORA-00904: "DEPARMENT_ID": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause: ESTA MAL ESCRITO EL NOMBRE DE LA COLUMNA EN LA CLAVE PRIMARIA  
*Action: ESCRIBIR CORRECTAMENTE
*/

create table employees
(
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk FOREIGN KEY(department_id)               
      		      REFERENCES departments(department_id)
);
/*
PALABRA RESERVADA FOREING MAL ESCRITA, ESCRIBIR FOREING
FALTABA PARENTESIS DE COMIENZO Y FIN
Informe de error -
ORA-00904: "DEPARTMENTES_ID": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:  EL NOMBRE DE LA COLUMNA DEPARTMENTS EN LA REFERENCES MAL ESCRITA  
*Action: MIRAR EN LA TABLA DEPARTMENST EN EL NOMBRE DE LA COLUMNA Y PONERLO BIEN
*/

CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3),
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CONSTRAINT fab_nombre_ck CHECK (nombre = upper(nombre)),
CONSTRAINT fab_pais_ck CHECK (pais= upper(pais))
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    PALABRA RESERVADA CHEK MAL ESCRITA y SOBRAN LOS NOT NULL EN LAS COLUMNAS QUE FORMAN LA CLAVE PRIMARIA

*Action: ESCRIBIR BIEN LA PALABRA CHECK Y ADEMAS PONER NOMBRE A LAS CONSTRAINTS y QUITAR NOT NULL
*/

CREATE TABLE articulos (
articulo VARCHAR2(20) ,
cod_fabricante VARCHAR2(3) ,
peso NUMBER(3) ,
categoria VARCHAR2(10) ,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT art_preciov_ck  CHECK (precio_venta>0),
CONSTRAINT art_precioc_ck CHECK (precio_costo>0),
CONSTRAINT art_peso_ck CHECK (peso >0),
CONSTRAINT art_cat_ck  CHECK (categoria  IN ('primero','segundo','tercero'))
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause: FALTA PARENTESIS IZQUIERDO EN LA ULTIMA CHECK Y FALTAN LOS NOMBRES DE LAS CONSTRAINTS
SOBRAN LOS NOT NULL EN LAS COLUMNAS QUE FORMAN LA CLAVE PRIMARIA. TIPO DE DATO VARCHAR2 MAL DEFINIDO
*Action: AÑADIR PARENTESIS, AÑADIR NOMBRE CONSTRAINTS, QUITAR RESTRICCION NOT NULL
*/

CREATE TABLE tiendas (
nif VARCHAR2(10) CONSTRAINT tie_nif_pk PRIMARY KEY,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_provincia_ck CHECK (provincia = upper(provincia))
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    PALABRA RESERVADA MAL ESCRITA PRYMARY; 
            NOMBRE DE LA CONSTRAINT NO SIGUE LA  REGLA ORACLE Y FALTA LA PALABRA CHECK
            LA FUNCION uppercase NO EXISTE es upper
*Action:  ESCRIBIR PRIMARY, AÑADIR NOMBRE A LA CONSTRAINT; AÑADIR LA CHECK Y USAR LA FUNCION CORRECTA
*/


CREATE TABLE pedidos (
nif VARCHAR2 (10),
articulo VARCHAR2 (20),
cod_fabricante VARCHAR2 (3),
peso NUMBER(3),
categoria VARCHAR2 (10),
fecha_pedido DATE DEFAULT SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fabricante_fk FOREIGN KEY (cod_fabricante)
         REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT ped_categoria_ck CHECK (categoria  IN ('primero','segundo','tercero')),
CONSTRAINT ped_art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria)
         REFERENCES articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:  SOBRAN LOS NOT NULL EN LAS COLUMNAS QUE FORMAN LA CLAVE PRIMARIA.
        FALTA LA CLAUSULA DEFAULT EN LA COLUMNA fecha_pedido
        PALABRA RESERVADA REFERENCE MAL ESCRITA
        FALTA EL NOMBRE DE LA CONSTRAINT y FALTAN LAS COMILLAS SIMPLES EN LOS VALORES ALFANUMERICOS primero...
        NOMBRES DE CONSTRAINT NO SIGUE LA REGLA ORACLE.
        NO ESTAN LAS COLUMNAS QUE FORMA LA CLAVE PRIMARIA DE ARTICULOS
*Action: QUITAR NOT NULL; AÑADIR CLAUSULA; ESCRIBIR REFERENCES; ESCRIBIR EL NOMBRE ped_categoria_ck,
        AÑADIR COMILLAS SIMPLES, ESCRIBIR LOS NOMBRES SEGÚN LA REGLA

Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:  HAY UNA FOREING A TIENDAS Y LA TABLA NO EXISTE  
*Action: PONER LA CREATE DE PEDIDOS DESPUES DE LA CREATE DE TIENDAS
*/


CREATE TABLE ventas(
nif VARCHAR2(10) ,
articulo VARCHAR2(20) ,
cod_fabricante VARCHAR2(3),
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) ,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) 
        REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ven_unidades_ck CHECK (unidades_vendidas>0),
CONSTRAINT ven_categoria_ck CHECK (categoria IN ('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria)
    REFERENCES articulos(articulo, cod_fabricante, peso, categoria),   
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) 
      REFERENCES tiendas(nif)
);
/*
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:  HAY UNA FOREING A TABLAs que  NO EXISTES  
*Action: PONER LA CREATE DE VENTAS DESPUES DE LAs CREATES 
*/

--3
ALTER TABLE TIENDAS ADD
CONSTRAINT TIE_NOM_CK CHECK (NOMBRE=INITCAP(NOMBRE));

--4
SELECT TABLE_NAME,OWNER, CONSTARINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME) IN ('TIENDAS','FABRICANTE','ARTICULOS','PEDIDIOS','VENTAS');

--5
ALTER TABLE PEDIDOS
MODIFY (UNIDADES_PEDIDAS NUMBER(6));

ALTER TABLE VENTAS
MODIFY(UNIDADES_VENDIDAS NUMBER(6));

/*
ALTER TABLE PEDIDOS
MODIFY(UNIDADES_VENDIDAS NUMBER(4));

Informe de error -
ORA-00904: "UNIDADES_VENDIDAS": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*/

--6
ALTER TABLE TIENDAS ADD
CONSTRAINT TIE_PROV_CK CHECK (UPPER(PROVINCIA) != UPPER('TOLEDO'));

ALTER TABLE TIENDAS DROP CONSTRAINT TIE_PROV_CK;

--7
ALTER TABLE PEDIDOS ADD
PVP NUMBER(4) DEFAULT 0;

ALTER TABLE VENTAS ADD
PVP NUMBER(4) DEFAULT 0;

--8
ALTER TABLE PEDIDOS DROP COLUMN PVP;
ALTER TABLE VENTAS DROP COLUMN PVP;