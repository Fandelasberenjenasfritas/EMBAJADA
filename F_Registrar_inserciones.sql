
CREATE TABLE IF NOT EXISTS tipos_tabla (
    idtabla TINYINT PRIMARY KEY AUTO_INCREMENT,
    table_name VARCHAR(50) NOT NULL UNIQUE
);


INSERT IGNORE INTO tipos_tabla (table_name) VALUES   -- estoy asociando un idtabla (un numero que se incrementa solo), a las tablas que me interesa asociar a un número
('certificadoMatrimonio'),
('registroMatrimonio'),
('feDeVida'),
('registroDefuncion'),
('registroNacimiento'),
('verificarLicenciaConducir'),
('legalizaciones'),
('certificadoNacionalidad'),
('declaracionesJuradas'),
('apostilla'),
('documentoViaje'),
('certificadoInscripcionConsular'),
('autorizacionViajeMenores'),
('reconocimientosLegales'),
('datosHacerUnPoder'),
('certificadoContinuidadMatrimonio');

CREATE TABLE IF NOT EXISTS registros (
    idregistro TINYINT PRIMARY KEY AUTO_INCREMENT, -- numero de procedimiento registrado ese dia
    numtabla TINYINT NOT NULL ,                    -- el num que va asociado a la tabla según la tabla anterior
    fechahora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- fechahora del sistema
    FOREIGN KEY (numtabla) REFERENCES tipos_tabla(idtabla)  
);

DELIMITER //
CREATE FUNCTION FIDtabla(nombre_tabla VARCHAR(50)) 
RETURNS INT
DETERMINISTIC                                             -- para que no se repita
BEGIN
    DECLARE aux INT;                                       -- creo una variable auxiliar donde el id coincide con el que tengo asociado a ese nombre
    SELECT tipos_tabla.idtabla INTO aux FROM tipos_tabla WHERE table_name = nombre_tabla;
    RETURN aux;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER certificadoMatrimonio_id
AFTER INSERT ON certificadoMatrimonio
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('certificadoMatrimonio'));
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER apostilla_id
AFTER INSERT ON apostilla
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('apostilla'));
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER certificadocontinuidadmatrimonio_id
AFTER INSERT ON certificadocontinuidadmatrimonio
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('certificadocontinuidadmatrimonio'));
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER certificadoinscripcionconsular_id
AFTER INSERT ON certificadoinscripcionconsular
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('certificadoinscripcionconsular')); -- llamo a la función para la única variable de la tabla registros que no se rellena sola 
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER certificadonacionalidad_id
AFTER INSERT ON certificadonacionalidad
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('certificadonacionalidad'));
    CALL verificar_antecedentes_ciudadano(NEW.dniCiudadano);
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER datoshacerunpoder_id
AFTER INSERT ON datoshacerunpoder
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('datoshacerunpoder'));
    CALL verificar_antecedentes_ciudadano(NEW.dniApoderante);
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER declaracionesjuradas_id
AFTER INSERT ON declaracionesjuradas
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('declaracionesjuradas'));
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER documentoviaje_id
AFTER INSERT ON documentoviaje
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('documentoviaje'));
    CALL verificar_antecedentes_ciudadano(NEW.dniCiudadano);
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER fedevida_id
AFTER INSERT ON fedevida
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('fedevida'));
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER legalizaciones_id
AFTER INSERT ON legalizaciones
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('legalizaciones'));
    CALL verificar_antecedentes_ciudadano(NEW.dniSolicitante);
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER reconocimientoslegales_id
AFTER INSERT ON reconocimientoslegales
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('reconocimientoslegales'));
END//
DELIMITER;


DELIMITER //

CREATE TRIGGER registrodefuncion_id
AFTER INSERT ON registrodefuncion
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('registrodefuncion'));
END//
DELIMITER;



DELIMITER //

CREATE TRIGGER registromatrimonio_id
AFTER INSERT ON registromatrimonio
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('registromatrimonio'));
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER registronacimiento_id
AFTER INSERT ON registronacimiento
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('registronacimiento'));
END//
DELIMITER;

DELIMITER //

CREATE TRIGGER verificarlicenciaconducir_id
AFTER INSERT ON verificarlicenciaconducir
FOR EACH ROW
BEGIN
    INSERT INTO registros (numtabla)
    VALUES (FIDtabla('verificarlicenciaconducir'));
END//
DELIMITER;

