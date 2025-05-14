##PROCEDIMIENTO DE DEFUNCION (SIN ERROR)
DELIMITER //

CREATE PROCEDURE registrar_defuncion (
    IN p_dniFallecido VARCHAR(8),
    IN p_dniSolicitante VARCHAR(8),
    IN p_parentesco VARCHAR(50),
    IN p_causaMuerte VARCHAR(50)
)
BEGIN  
    INSERT INTO registroDefuncion (
        dniFallecido,
        dniSolicitante,
        parentesco,
        causaMuerte
    ) VALUES (
        p_dniFallecido,
        p_dniSolicitante,
        p_parentesco,
        p_causaMuerte
    );
END //

DELIMITER ;

/*Explicaciones clave:
No necesitas pasar numRegDefuncion porque es AUTO_INCREMENT. El valor se genera automáticamente.

IN debe ir al inicio del parámetro (MySQL/MariaDB).

Se eliminó DEFAULT NULL, ya que MySQL no lo permite en parámetros de procedimientos. Puedes pasar NULL desde la llamada si es necesario.

Los tamaños de los VARCHAR están adaptados a lo definido en tu tabla (8 y 50 caracteres).

Se respeta la restricción de dniFallecido como UNIQUE y clave foránea, por lo que no debes insertar el mismo DNI del fallecido más de una vez, o lanzará un error.*/