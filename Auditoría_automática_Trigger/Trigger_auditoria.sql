CREATE OR REPLACE TRIGGER trg_auditoria_ausencia
AFTER INSERT ON ausencias
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_ausencias (
        id_empleado,
        fecha_ausencia,
        motivo,
        usuario_creador
    ) VALUES (
        :NEW.id_empleado,
        :NEW.fecha_ausencia,
        :NEW.motivo,
        USER
    );
END;
/

