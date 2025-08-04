CREATE OR REPLACE PROCEDURE pr_mostrar_reporte_ausencias (
    p_fecha_inicio IN DATE,
    p_fecha_fin IN DATE
) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('REPORTE DE AUSENCIAS');
    DBMS_OUTPUT.PUT_LINE('Desde: ' || TO_CHAR(p_fecha_inicio, 'DD-MM-YYYY') || 
                         ' Hasta: ' || TO_CHAR(p_fecha_fin, 'DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');

    FOR r IN (
        SELECT 
            a.employee_id,
            e.employee_name,
            COUNT(*) AS total_ausencias
        FROM 
            employee_absences a
            JOIN employees e ON a.employee_id = e.employee_id
        WHERE 
            a.absence_date BETWEEN p_fecha_inicio AND p_fecha_fin
        GROUP BY 
            a.employee_id, e.employee_name
        ORDER BY 
            total_ausencias DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Empleado: ' || r.employee_id || 
            ' - Nombre: ' || r.employee_name || 
            ' - Total Ausencias: ' || r.total_ausencias
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
END;
/
