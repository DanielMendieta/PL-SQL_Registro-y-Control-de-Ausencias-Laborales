CREATE OR REPLACE PROCEDURE registrar_ausencia (
    p_empleado_id     IN ausencias.empleado_id%TYPE,
    p_fecha_inicio    IN ausencias.fecha_inicio%TYPE,
    p_fecha_fin       IN ausencias.fecha_fin%TYPE,
    p_tipo_ausencia   IN ausencias.tipo_ausencia%TYPE,
    p_observaciones   IN ausencias.observaciones%TYPE := NULL
) AS
    v_count           NUMBER;
BEGIN
    -- Validar que el empleado exista
    SELECT COUNT(*) INTO v_count
    FROM empleados
    WHERE empleado_id = p_empleado_id;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El empleado no existe.');
    END IF;

    -- Validar que la fecha de inicio no sea mayor que la de fin
    IF p_fecha_inicio > p_fecha_fin THEN
        RAISE_APPLICATION_ERROR(-20002, 'La fecha de inicio no puede ser posterior a la fecha de fin.');
    END IF;

    -- Validar que no exista ya una ausencia para ese empleado y esas fechas exactas
    SELECT COUNT(*) INTO v_count
    FROM ausencias
    WHERE empleado_id = p_empleado_id
      AND fecha_inicio = p_fecha_inicio
      AND fecha_fin = p_fecha_fin;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Ya existe una ausencia registrada para ese empleado en ese período.');
    END IF;

    -- Insertar la ausencia
    INSERT INTO ausencias (
        empleado_id, fecha_inicio, fecha_fin, tipo_ausencia, observaciones
    ) VALUES (
        p_empleado_id, p_fecha_inicio, p_fecha_fin, p_tipo_ausencia, p_observaciones
    );

    COMMIT;
END;
/
