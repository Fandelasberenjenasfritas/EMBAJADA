DELIMITER //

CREATE PROCEDURE registrar_autorizacion_viaje_menor (
    -- Datos del menor
    IN p_dniMenor VARCHAR(20),
    IN p_numRegistroNacimiento INT,
    
    -- Datos de los progenitores/tutores
    IN p_dniProgenitor1 VARCHAR(20),
    IN p_dniProgenitor2 VARCHAR(20),
    IN p_dniTutor VARCHAR(20),
    
    -- Datos de contacto
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(100),
    
    -- Detalles del viaje
    IN p_fechaIda DATE,
    IN p_fechaVuelta DATE,
    IN p_lugarDestino VARCHAR(100),
    IN p_tipoActividad VARCHAR(100),
    IN p_companiaDeViaje VARCHAR(100),
    IN p_motivoDelViaje VARCHAR(255)
)
BEGIN
    INSERT INTO autorizacionViajeMenores (
        dniMenor,
        numRegistroNacimiento,
        dniProgenitor1,
        dniProgenitor2,
        dniTutor,
        telefono,
        correo,
        fechaIda,
        fechaVuelta,
        lugarDestino,
        tipoActividad,
        companiaDeViaje,
        motivoDelViaje
    )
    VALUES (
        p_dniMenor,
        p_numRegistroNacimiento,
        p_dniProgenitor1,
        p_dniProgenitor2,
        p_dniTutor,
        p_telefono,
        p_correo,
        p_fechaIda,
        p_fechaVuelta,
        p_lugarDestino,
        p_tipoActividad,
        p_companiaDeViaje,
        p_motivoDelViaje
    );
END //

DELIMITER ;

/*Si algunos campos como p_dniProgenitor2, p_telefono, p_tipoActividad, etc., pueden ser opcionales, 
debes manejar los valores NULL desde la aplicación que llama al procedimiento, ya que MySQL/MariaDB no permite DEFAULT en parámetros de procedimientos.*/