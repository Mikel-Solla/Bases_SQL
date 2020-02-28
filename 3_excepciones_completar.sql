-- EJERCICIO 1
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
--Excepciones Oracle PREDEFINIDAS
Declare
      LC$Cadena varchar2(10) ;
Begin
      LC$Cadena := rpad( ' ', 30) ;
Exception
      -- Nombre de excepción VALUE_ERROR predefinido por Oracle
      WHEN VALUE_ERROR then
          dbms_output.put_line( 'Cadena de caracteres demasiado larga') ;
End ; 


-- EJERCICIO 2
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
--PRAGMA: Excepciones Oracle personalizadas
/*
Puede asociar un código de error de Oracle con sus propias variables de excepción
utilizando la palabra clave PRAGMA EXCEPTION_INIT,
como parte de la sección declarativa de la siguiente manera:
*/

Declare
      LC$Cadena varchar2(10) ;
      LE$mas_long exception ;
      -- Asocio el mi nombre de excepción al código ORA-06502
      XXXXX exception_init( XXXXX, -6502 ) ;
Begin
      LC$Cadena := rpad( ' ', 30) ;
Exception
      when LE$mas_long XXXX
          dbms_output.put_line( 'Cadena de caracteres demasiado larga') ;
End ; 

-- EJERCICIO 3
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/

Declare
       LC$C1    varchar2(20) := 'Frase larguisima';
       LC$Cadena varchar2(10) ;
       LE$mas_long exception ;
       -- Asocio el mi nombre de excepción al código ORA-06502
       pragma XXXXXXXX ;
Begin 
      -- Bloque para comprobar si se excede de la longitud, y si es así recortar
      Begin
          LC$Cadena := LC$C1;
      Exception
        when LE$mas_long then
            LC$Cadena := Substr( LC$C1, 1, 10 ) ;
            -- El control vuelve al programa principal
      End ;
      -- Sacar por pantalla el contenido de la variable LC$Cadena 
      dbms_output.put_line(xxxxx) ;
End ;

-- EJERCICIO 4
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
Declare
       LC$C1    varchar2(20) := 'Frase larguisima';
       LC$Cadena varchar2(10) ;
       LE$mas_long exception ;
       pragma exception_init( LE$mas_long, -6502 ) ;
Begin
      Begin
          LC$Cadena := LC$C1;
       Exception
        when LE$mas_long then
            -- Propagar la excepcion al BLOQUE PRINCIPAL
            RAISE;
      End ;
  
      dbms_output.put_line(LC$Cadena ) ;
      EXCEPTION
      WHEN OTHERS THEN
        --Generamos el código de error personalizado ORA-20000 'CADENA DEMASIADO LARGA'
        XXXXXXXXXX ('-20000', 'CADENA DEMASIADO LARGA');
End ;


-- EJERCICIO 5
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
--EXCEPCIONES PROPIAS
--RAISE
Declare
      LN$I number := 0 ;
      -- Asociar un nombre a mi excepcion
      LE$Fin XXXXXXX;
Begin
      Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
        If LN$I > 2 Then
           -- Provocar mi excepcion LE$Fin
           XXXX XXXXX ;
       End if ;
     End loop ;
Exception
    -- Tratar mi excepcion LE$Fin
     When XXXXXX Then
         Null ;  --No hacer nada
End ;
