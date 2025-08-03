-- Insertar empleados
INSERT INTO empleados (nombre, apellido, fecha_ingreso)
VALUES ('María', 'Gómez', TO_DATE('2023-07-10', 'YYYY-MM-DD'));

INSERT INTO empleados (nombre, apellido, fecha_ingreso)
VALUES ('Juan', 'Pérez', TO_DATE('2024-01-15', 'YYYY-MM-DD'));

INSERT INTO empleados (nombre, apellido, fecha_ingreso)
VALUES ('Lucía', 'Martínez', TO_DATE('2022-08-10', 'YYYY-MM-DD'));

-- Insertar ausencias con fechas de julio 2025
INSERT INTO ausencias (id_empleado, fecha_ausencia, dias_ausencia, tipo, motivo)
VALUES (1, TO_DATE('2025-07-26', 'YYYY-MM-DD'), 1, 'Justificada', 'Turno médico');

INSERT INTO ausencias (id_empleado, fecha_ausencia, dias_ausencia, tipo, motivo)
VALUES (2, TO_DATE('2025-07-28', 'YYYY-MM-DD'), 2, 'Injustificada', 'No presentó justificación');

INSERT INTO ausencias (id_empleado, fecha_ausencia, dias_ausencia, tipo, motivo)
VALUES (3, TO_DATE('2025-07-29', 'YYYY-MM-DD'), 1, 'Justificada', 'Asunto familiar');

-- Confirmar los cambios
COMMIT;
