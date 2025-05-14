
DELIMITER //

CREATE FUNCTION Registrosdelmes() 
RETURNS TABLE
DETERMINISTIC
BEGIN
    DECLARE registromensual TABLE;
    
    DROP TABLE IF EXISTS registromensual;
    CREATE TABLE registromensual (
        idmensual INT AUTO_INCREMENT PRIMARY KEY,
        table_name VARCHAR(50),
        fecharegistro DATETIME,
    );
     INSERT INTO registromensual (table_name, fecharegistro )
    SELECT 
        tipos_tabla.table_name,
        rg.fechahora,
    FROM 
        registros rg
    JOIN 
        tipos_tabla ON rg.numtabla= tipos_tabla.idtabla
    WHERE 
        MONTH(rg.fechahora = MONTH(CURRENT_DATE())
        AND YEAR(rg.fechahora) = YEAR(CURRENT_DATE())
    ORDER BY 
        rg.fechahora;
    