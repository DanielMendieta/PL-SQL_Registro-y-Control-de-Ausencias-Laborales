Este proyecto simula un sistema interno de recursos humanos para registrar y controlar las ausencias laborales de los empleados en una empresa. Fue desarrollado completamente con PL/SQL, utilizando procedimientos almacenados, funciones, cursores, manejo de errores y paquetes.

##  Funcionalidades
- Registrar ausencias por fecha, tipo (justificada/injustificada), cantidad de días.
- Consultar ausencias totales por empleado, por mes o por tipo.
- Validar que no se ingresen ausencias en fechas futuras.
- Prevenir ausencias injustificadas excesivas (más de X días consecutivos).
- Generar advertencias automáticas (opcional con trigger).
- Automatizar chequeos mensuales con DBMS_SCHEDULER (opcional).

## Tecnologías y herramientas
- Oracle Database 19c
- PL/SQL (paquetes, funciones, procedimientos, excepciones)
- SQL Developer (para pruebas)
- GitHub (repositorio de código)

## Estructura del proyecto

/ausencias-laborales/
│
├── README.md
├── scripts/
│ ├── 01_create_tables.sql
│ ├── 02_insert_sample_data.sql
│ ├── 03_create_package.sql
│ ├── 04_triggers.sql
│ └── 05_scheduler_jobs.sql
└── ejemplos/
├── registrar_ausencia.sql
└── consultar_ausencias.sql


## Cómo ejecutar el proyecto
1. Crear las tablas base con `01_create_tables.sql`.
2. Insertar datos de ejemplo.
3. Crear el paquete `control_ausencias_pkg`.
4. Probar los procedimientos y funciones con los scripts de ejemplo


##  Casos de uso real
- Control de asistencia en empresas medianas.
- Sistemas internos para departamentos de RRHH.
- Automatización de alertas ante ausencias injustificadas.

## Autor
Daniel Mendieta – Desarrollador PL/SQL | Dba Oracle













