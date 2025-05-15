DELIMITER //
CREATE TRIGGER tr_longitudDNI
BEFORE INSERT ON ciudadanos
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.dni) != 8 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El DNI debe tener exactamente 8 caracteres';
    END IF;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tr_longitudtelf
BEFORE INSERT ON ciudadanos
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.telefono) != 9 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El teléfono debe tener exactamente 9 caracteres';
    END IF;
END//
DELIMITER ;


DELIMITER //

CREATE TRIGGER tr_validar_menores_ciudadanos
BEFORE INSERT ON ciudadanos
FOR EACH ROW
BEGIN
    -- Verificar si es menor de edad (menos de 18 años)
    IF TIMESTAMPDIFF(YEAR, NEW.fechaNacimiento, CURDATE()) < 18 AND NEW.representante IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ciudadanos menores de edad deben tener un representante asignado';
    END IF;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER establecerRepresentante
AFTER INSERT ON reconocimientosLegales
FOR EACH ROW
BEGIN
    UPDATE ciudadanos
    SET representante = NEW.dniProgenitor1
    WHERE dni = NEW.dniHijo;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER cambiarEstadoCivil
AFTER INSERT ON registromatrimonio
FOR EACH ROW
BEGIN
    UPDATE ciudadanos
    SET estadoCivil = 'Casado'
    WHERE dni = NEW.dniConyugue1;
    UPDATE ciudadanos
    SET representante = 'Casado'
    WHERE dni = NEW.dniConyugue2;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER estadosCivilesInvalidos
BEFORE INSERT ON ciudadanos
FOR EACH ROW 
BEGIN 
    IF NEW.estadoCivil NOT IN ('Soltero', 'Viudo', 'Casado', 'Divorciado') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: No es un estado civil válido. Los valores permitidos son: Soltero, Viudo, Casado, Divorciado'; 
    END IF; 
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER nacionalidad_venezolana
BEFORE INSERT ON documentoviaje
FOR EACH ROW
BEGIN
    DECLARE nacionalidad_ciudadano VARCHAR(50);
    
    -- Obtener la nacionalidad del ciudadano específico
    SELECT nacionalidad INTO nacionalidad_ciudadano
    FROM ciudadanos
    WHERE dni = NEW.dniCiudadano
    LIMIT 1;
    
    -- Verificar si es venezolano (comparación exacta)
    IF nacionalidad_ciudadano != 'venezolano' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ciudadanos no venezolanos no pueden pedir documentos de viaje';
    END IF;
END//

DELIMITER ;
