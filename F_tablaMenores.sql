DELIMITER //

CREATE FUNCTION contar_menores() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_menores INT;
    
    SELECT COUNT(*) INTO total_menores 
    FROM ciudadanos 
    WHERE TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) < 18;
    
    RETURN total_menores;
END//

DELIMITER ;

-- Uso:
SELECT contar_menores() AS total_menores;
