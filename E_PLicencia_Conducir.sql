##PROCEDIMMIENTO DE VERIFICACION DE LICENCIA DE CONDUCIR (SIN ERROR)
DELIMITER //

CREATE PROCEDURE registrar_licencia_conducir (
    IN p_numLicencia VARCHAR(8),
    IN p_fechaPrimeraExpedicion DATE,
    IN p_fechaVencimiento DATE,
    IN p_fechaRenovacion DATE
)
BEGIN
    INSERT INTO verificarLicenciaConducir (
        numLicencia,
        fechaPrimeraExpedicion,
        fechaVencimiento,
        fechaRenovacion
    ) VALUES (
        p_numLicencia,
        p_fechaPrimeraExpedicion,
        p_fechaVencimiento,
        p_fechaRenovacion
    );
END //

DELIMITER ;

/*Consideraciones importantes:
VARCHAR(8) coincide con lo que definiste para numLicencia.

El campo numLicencia es una clave primaria y clave foránea al mismo tiempo, por lo que:

El valor que insertes debe existir ya en ciudadanos(dni).

Si no existe, recibirás un error por violación de clave foránea.

No se permiten valores NULL en ninguno de los campos (todos son NOT NULL), así que asegúrate de siempre enviar datos válidos.*/