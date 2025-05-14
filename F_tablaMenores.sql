-- Tabla 'Menores' donde asumimos que en 'representante' va a ser el nombre EXACTO de un progenitor' 



DELIMITER //

CREATE FUNCTION crear_tabla_menores() -- Crea la tabla y me devuelve el número de menores actualmente en las tablas
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE result_message VARCHAR(100);
    
    CREATE TABLE IF NOT EXISTS Menores (
        dni VARCHAR(8) PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        fecha_nacimiento DATE NOT NULL,
        representante_dni VARCHAR(8) NOT NULL,
        representante_nombre VARCHAR(50) NOT NULL,
        edad INT NOT NULL,
        FOREIGN KEY (dni) REFERENCES ciudadanos(dni),
        FOREIGN KEY (representante_dni) REFERENCES ciudadanos(dni)
    );
    
    -- Hacemos el join para que se metan todos los resultados
    INSERT INTO Menores (dni, nombre, fecha_nacimiento, edad , representante_dni, representante_nombre)
    SELECT 
        c.dni,
        c.nombre,
        c.fechaNacimiento,
        c.edad AS edadMenor
        r.dni AS representante_dni,
        r.nombre AS representante_nombre
    FROM 
        ciudadanos c
    JOIN 
        ciudadanos r ON c.representante = r.nombre
    WHERE 
        c.representante IS NOT NULL;
    
    -- Get count of inserted records
    SELECT COUNT(*) INTO @menores_count FROM Menores;
    
    SET mensaje_final = CONCAT( @menores_count, ' registros insertados.');
    
    RETURN mensaje_final;
END//

DELIMITER ;