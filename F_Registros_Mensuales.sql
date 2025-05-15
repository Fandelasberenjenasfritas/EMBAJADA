
DELIMITER //

CREATE FUNCTION ContarRegistrosDelMes() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM registros rg
    JOIN tipos_tabla ON rg.numtabla = tipos_tabla.idtabla
    WHERE MONTH(rg.fechahora) = MONTH(CURRENT_DATE())
    AND YEAR(rg.fechahora) = YEAR(CURRENT_DATE());
    
    RETURN total;
END//

DELIMITER ;

-- Uso:
SELECT ContarRegistrosDelMes();
        rg.fechahora;
    
