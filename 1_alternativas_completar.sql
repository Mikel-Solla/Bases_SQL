set SERVEROUTPUT ON;
-- EJERCICIO 1
/* 
 Autor: mikel
 Fecha: 20-02-2020
 Descripcion: Averiguar si hace el 50, 75 u otro aniversario
*/
-- IF

DECLARE
   a number(3) := 75;
BEGIN
     IF ( a = 50 ) THEN
        dbms_output.put_line('El valor exacto de a es: 10' );
     ELSIF ( a = 75 ) THEN
        dbms_output.put_line('El valor exacto de a es: 20' );
     ELSE
        dbms_output.put_line('Ninguno de los valores coincide');
    END IF;
    --- Sacar por pantalla el valor de la variable a
    dbms_output.put_line ('El valor exacto de a es: '|| a ); 
END;

-- EJERCICIO 2
/* 
 Autor: mikel
 Fecha: 20-02-2020
 Descripcion: xxxxx
*/
--CASE
Declare
    LN$Num pls_integer := 0 ;
Begin
    Loop
        LN$Num := LN$Num + 1 ;
        CASE LN$Num
            WHEN 1 THEN dbms_output.put_line('1') ;
            WHEN 2 THEN dbms_output.put_line('2') ;
            WHEN 3 THEN dbms_output.put_line('3') ;
         ELSE
            dbms_output.put_line('no es ni 1, 2, 3');
     --evitar salir asi EXIT ;
         END CASE ;
     End loop ;
End ;
  
--Otra forma de escribirlo
Declare
     LN$Num pls_integer := 0 ;
Begin
      Loop
          LN$Num := LN$Num + 1 ;
          CASE 
            WHEN LN$Num=1 THEN DBMS_OUTPUT.PUT_LINE ( '1' ) ;
            WHEN LN$Num=2 THEN DBMS_OUTPUT.PUT_LINE ( '2' ) ;
            WHEN LN$Num=3 THEN DBMS_OUTPUT.PUT_LINE ( '3' ) ;
           ELSE      
              EXIT ;
         END CASE;
       End loop ;
End ;

-- EJERCICIO 3
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
-- CASE MULTIPLES
Declare
     LN$Num pls_integer := 0 ;
Begin
      Loop
          LN$Num := LN$Num + 1 ;
          CASE
            WHEN LN$Num between  1 AND 3 
                 THEN dbms_output.put_line( To_char( LN$Num ) || ' -> 1-3' ) ;
            WHEN LN$Num < 5 
                 THEN dbms_output.put_line( To_char( LN$Num ) || ' < 5' ) ;
            ELSE 
                 dbms_output.put_line( To_char( LN$Num ) || ' >= 5' ) ;
          END CASE ;
         -- Condición de salida LN$Num = 5
         EXIT WHEN  LN$Num = 50;
       End loop ;
End ;


DESC EMPLE;