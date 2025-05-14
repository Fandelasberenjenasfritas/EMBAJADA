DELIMITER //

CREATE PROCEDURE insertarCiudadano (
    IN p_nombre VARCHAR(100),
    IN p_dni VARCHAR(20),
    IN p_nacionalidad VARCHAR(50),
    IN p_fechaNacimiento DATE,
    IN p_pasaporte VARCHAR(20),
    IN p_profesion VARCHAR(50),
    IN p_domicilio VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(100),
    IN p_antecedentes TEXT,
    IN p_edad INT,
    IN p_representante VARCHAR(100)
)
BEGIN
    INSERT INTO ciudadanos (
        nombre, dni, nacionalidad, fechaNacimiento, pasaporte,
        profesion, domicilio, telefono, correo, antecedentes, edad, representante
    ) VALUES (
        p_nombre, p_dni, p_nacionalidad, p_fechaNacimiento, p_pasaporte,
        p_profesion, p_domicilio, p_telefono, p_correo, p_antecedentes, p_edad, p_representante
    );
END //

DELIMITER ;