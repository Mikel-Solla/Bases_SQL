SET SERVEROUTPUT ON;


BEGIN
    DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
END;

DECLARE
    NOMBRE VARCHAR2(10):='PACO';
BEGIN 
    DBMS_OUTPUT.PUT_LINE('HOLA '|| NOMBRE);
END;