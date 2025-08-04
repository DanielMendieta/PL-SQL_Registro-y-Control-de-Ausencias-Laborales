CREATE OR REPLACE FUNCTION fn_total_ausencias(p_empleado_id IN NUMBER)
RETURN NUMBER
IS
  v_total NUMBER := 0;
BEGIN
  SELECT COUNT(*)
  INTO v_total
  FROM ausencias
  WHERE empleado_id = p_empleado_id;

  RETURN v_total;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    -- En producción convendría loguear el error
    RETURN -1; -- Código de error genérico
END;
/
