DELIMITER //


CREATE PROCEDURE verificar_antecedentes_ciudadano(IN p_dni VARCHAR(8))
BEGIN
    DECLARE tiene_antecedentes BOOLEAN;
    
    -- Verificar antecedentes
    SELECT antecedentes INTO tiene_antecedentes
    FROM ciudadanos
    WHERE dni = p_dni;
    
    IF tiene_antecedentes THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'RN-004: No se conceden trámites a ciudadanos con antecedentes penales';
    END IF;
END//

DELIMITER;
