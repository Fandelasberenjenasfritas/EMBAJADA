##PROCEDIMIENTO DE APOSTILLA (SIN ERROR)
DELIMITER //

CREATE PROCEDURE gestionar_apostilla (
    IN p_dniCiudadano VARCHAR(8),
    IN p_paisUso VARCHAR(50),
    IN p_traduccionJurada VARCHAR(1000),
    IN p_tasas INT
)
BEGIN
    INSERT INTO apostilla (
        dniCiudadano,
        paisUso,
        traduccionJurada,
        tasas
    ) 
    VALUES (
        p_dniCiudadano,
        p_paisUso,
        p_traduccionJurada,
        p_tasas
    );
END //

DELIMITER ;

/*Consideraciones importantes:
dniCiudadano es PRIMARY KEY + FOREIGN KEY:

No se pueden insertar dos veces el mismo dniCiudadano (clave primaria).

El valor debe existir en la tabla ciudadanos, o lanzará error por la clave foránea.

tasas es INT, como en la tabla. Si prefieres decimales (como 150.50), deberías usar DECIMAL(10,2) en la tabla también.

Todos los campos excepto traduccionJurada y tasas son NOT NULL.*/