-- TODOS LOS TRIGGERS 

-- Solo se puede ser menor con menos de 18 añitos
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


-- no dejar insertar num telf incorrecto en ciudadanos 

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
CREATE TRIGGER tr_ciudadanos_edad_menor
BEFORE INSERT ON Menores
FOR EACH ROW
BEGIN
    IF NEW.edadMenor >= 18 THEN   -- si no funciona cambiar por 'edad'
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La edad debe ser menor a 18 años. Este usuario no es un menor';
    END IF;
END//
DELIMITER ;


-- dni correcto