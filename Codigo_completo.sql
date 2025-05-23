CREATE DATABASE IF NOT EXISTS embajada;

USE embajada; 

SET FOREIGN_KEY_CHECKS =0;

DROP TABLE IF EXISTS ciudadanos;
DROP TABLE IF EXISTS usuarios;
DROP TABLE if EXISTS certificadomatrimonio;
DROP TABLE if EXISTS registromatrimonio;
DROP TABLE if EXISTS fedevida;
DROP TABLE IF EXISTS registrodefuncion;
DROP TABLE if EXISTS registronacimiento;
DROP TABLE if EXISTS verificarlicenciaconducir;
DROP TABLE if EXISTS legalizaciones;
DROP TABLE if EXISTS certificadoNacionalidad;
DROP TABLE if EXISTS declaracionesJuradas;
DROP TABLE if EXISTS apostilla;
DROP TABLE if EXISTS documentoviaje;
DROP TABLE if EXISTS certificadoinscripcionconsular;
DROP TABLE if EXISTS tipos_tabla;
DROP TABLE if EXISTS reconocimientoslegales;
DROP TABLE if EXISTS datoshacerunpoder;
DROP TABLE if EXISTS certificadocontinuidadmatrimonio;
DROP TABLE if EXISTS registros;
DROP TABLE IF EXISTS autorizacionviajemenores;

SET FOREIGN_KEY_CHECKS =1;

CREATE TABLE IF NOT EXISTS usuarios(
tipoUsuario VARCHAR(50)  NOT NULL,
dni VARCHAR(8) primary key NOT NULL UNIQUE);


CREATE TABLE IF NOT EXISTS ciudadanos(
nombre VARCHAR(50) NOT NULL,
dni VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
nacionalidad VARCHAR(50),
fechaNacimiento DATE NOT NULL,
pasaporte VARCHAR(9) NOT NULL UNIQUE,
profesion VARCHAR(50),
domicilio VARCHAR(50),
telefono VARCHAR(9) UNIQUE,
correo VARCHAR(50),
antecedentes BOOLEAN,
estadoCivil VARCHAR(50),
sexo VARCHAR(1) NOT null,
representante VARCHAR(50) DEFAULT NULL,
FOREIGN KEY (dni) REFERENCES usuarios (dni));


CREATE TABLE IF NOT EXISTS certificadoMatrimonio(
numRegistro SMALLINT PRIMARY KEY AUTO_INCREMENT,
fecha DATE NOT NULL,
lugar VARCHAR(50) NOT NULL,
motivoSolicitud VARCHAR(200),
numTomo INT NOT NULL,
numPagina INT NOT NULL);

CREATE TABLE if NOT EXISTS registroMatrimonio(
numMatrimonio SMALLINT PRIMARY KEY AUTO_INCREMENT,
dniConyugue1 VARCHAR(8) NOT NULL,
dniConyugue2 VARCHAR(8) NOT NULL,
dniTestigo VARCHAR(8) NOT NULL,
registroEconomico INT,
FOREIGN KEY (dniConyugue1) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniConyugue2) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniTestigo) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS feDeVida(
numRegFe SMALLINT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
dniCiudadano VARCHAR(8) NOT NULL UNIQUE,
FOREIGN KEY (dniCiudadano) REFERENCES ciudadanos (dni));

CREATE TABLE if NOT EXISTS registroDefuncion(
numRegDefuncion SMALLINT primary key NOT NULL AUTO_INCREMENT,
dniFallecido VARCHAR(8) NOT NULL UNIQUE,
dniSolicitante VARCHAR(8) NOT NULL,
parentesco VARCHAR(50),
causaMuerte VARCHAR(50),
FOREIGN KEY (dniFallecido) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniSolicitante) REFERENCES ciudadanos (dni));

CREATE TABLE if NOT EXISTS registroNacimiento(
numRegNac SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombreBebe VARCHAR(50) NOT null,
fecha DATE NOT NULL,
hora TIME NOT NULL,
sexo VARCHAR(1) NOT NULL,
dniTutor1 VARCHAR(8) NOT NULL,
dniTutor2 VARCHAR(8),
numRegNacTutor1 INT,
numRegNacTutor2 INT,
FOREIGN KEY (dniTutor1) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniTutor2) REFERENCES ciudadanos (dni));

CREATE TABLE if NOT EXISTS verificarLicenciaConducir(
numLicencia VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
fechaPrimeraExpedicion DATE NOT NULL,
fechaVencimiento DATE NOT NULL,
fechaRenovacion DATE NOT NULL,
FOREIGN KEY (numLicencia) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS legalizaciones(
documento SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
dniSolicitante VARCHAR(8) NOT NULL UNIQUE,
tipoDocumento VARCHAR(20) NOT NULL,
fechaEmision DATE NOT NULL,
relacionSolicitanteDocumento VARCHAR(100),
tasas INT,
FOREIGN KEY (dniSolicitante) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS certificadoNacionalidad(
dniCiudadano VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
FOREIGN KEY (dniCiudadano) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS declaracionesJuradas(
dniDeclarante VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
fecha DATE NOT NULL,
nombreJurada VARCHAR(100) NOT NULL,
traduccionJurada VARCHAR(1000),
FOREIGN KEY (dniDeclarante) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS apostilla( 
dniCiudadano VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
paisUso VARCHAR(50) NOT NULL,
traduccionJurada VARCHAR(1000),
tasas INT,
FOREIGN KEY (dniCiudadano) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS documentoViaje(
dniCiudadano VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
itinerarioViaje VARCHAR(1000),
FOREIGN KEY (dniCiudadano) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS certificadoInscripcionConsular(
dniCiudadano VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
motivoViaje VARCHAR(200) NOT NULL,
actaNacimiento smallINT,
tramites VARCHAR(50),
FOREIGN KEY (dniCiudadano) REFERENCES ciudadanos (dni),
FOREIGN KEY (actaNacimiento) REFERENCES registroNacimiento (numRegNac)
);

create TABLE if NOT EXISTS autorizacionViajeMenores(
dniMenor VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
dniProgenitor1 VARCHAR(8) NOT NULL,
dniProgenitor2 VARCHAR(8),
dniTutor VARCHAR(8) NOT NULL,
numRegistroNacimiento SMALLINT NOT NULL UNIQUE,
telefono VARCHAR(9),
correo varchar(50),
fechaIda DATE NOT NULL,
fechaVuelta DATE NOT NULL,
lugarDestino VARCHAR(100) NOT NULL,
tipoActividad VARCHAR(100),
companiaDeViaje varchar(8) NOT NULL,
motivoDelViaje VARCHAR(50),
FOREIGN KEY (dniMenor) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniProgenitor1) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniProgenitor2) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniTutor) REFERENCES ciudadanos (dni),
FOREIGN KEY (numRegistroNacimiento) REFERENCES registroNacimiento (numRegNac),
FOREIGN KEY (companiaDeViaje) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS reconocimientosLegales(
actaNacimiento SMALLINT UNIQUE NOT NULL,
dniHijo VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
dniProgenitor1 VARCHAR(8) NOT NULL,
dniProgenitor2 VARCHAR(8) NOT NULL,
FOREIGN KEY (actaNacimiento) REFERENCES registroNacimiento (numRegNac),
FOREIGN KEY (dniHijo) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniProgenitor1) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniProgenitor2) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS datosHacerUnPoder(
dniApoderante VARCHAR(8) NOT NULL PRIMARY KEY,
dniApoderado VARCHAR(8) NOT NULL,
tipoDePoder VARCHAR(50) NOT NULL,
duracion TIME NOT NULL,
dniTestigo VARCHAR(8) NOT NULL,
FOREIGN KEY (dniApoderante) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniApoderado) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniTestigo) REFERENCES ciudadanos (dni)
);

CREATE TABLE if NOT EXISTS certificadoContinuidadMatrimonio(
numRegistroMatrimonio SMALLINT PRIMARY KEY AUTO_INCREMENT,
dniConyugue1 VARCHAR(8) NOT NULL,
dniConyugue2 VARCHAR(8) NOT NULL,
fechaMatrimonio DATE NOT NULL,
lugar VARCHAR(50),
certificadoNacimiento1 SMALLINT NOT NULL,
certificadoNacimiento2 SMALLINT NOT NULL,
FOREIGN KEY (dniConyugue1) REFERENCES ciudadanos (dni),
FOREIGN KEY (dniConyugue2) REFERENCES ciudadanos (dni),
FOREIGN KEY (certificadoNacimiento1) REFERENCES registroNacimiento (numRegNac),
FOREIGN KEY (certificadoNacimiento2) REFERENCES registroNacimiento (numRegNac)
);




## -------------------------------------------------------------------------------------------------------------------------------------------------------------------

##PROCEDIMIENTO PARA REGISTRAR UN USUARIO

DELIMITER //

CREATE PROCEDURE insertarCiudadano (
    IN p_nombre VARCHAR(100),
    IN p_dni VARCHAR(20),
    IN p_nacionalidad VARCHAR(50),
    IN p_fechaNacimiento DATE,
    IN p_pasaporte VARCHAR(20),
    IN p_profesion VARCHAR(50),
    IN p_domicilio VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(100),
    IN p_antecedentes TEXT,
    IN p_edad INT,
    IN p_representante VARCHAR(100)
)
BEGIN
    INSERT INTO ciudadanos (
        nombre, dni, nacionalidad, fechaNacimiento, pasaporte,
        profesion, domicilio, telefono, correo, antecedentes, edad, representante
    ) VALUES (
        p_nombre, p_dni, p_nacionalidad, p_fechaNacimiento, p_pasaporte,
        p_profesion, p_domicilio, p_telefono, p_correo, p_antecedentes, p_edad, p_representante
    );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE registrar_autorizacion_viaje_menor (
    -- Datos del menor
    IN p_dniMenor VARCHAR(8),
    IN p_numRegistroNacimiento INT,
    
    -- Datos de los progenitores/tutores
    IN p_dniProgenitor1 VARCHAR(8),
    IN p_dniProgenitor2 VARCHAR(8),
    IN p_dniTutor VARCHAR(8),
    
    -- Datos de contacto
    IN p_telefono VARCHAR(9),
    IN p_correo VARCHAR(50),
    
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


DELIMITER //

CREATE PROCEDURE gestionar_apostilla (
    IN p_dniCiudadano VARCHAR(8),
    IN p_paisUso VARCHAR(50),
    IN p_traduccionJurada VARCHAR(1000),
    IN p_tasas INT
)
BEGIN
    INSERT INTO apostilla (
        dniCiudadano,
        paisUso,
        traduccionJurada,
        tasas
    ) 
    VALUES (
        p_dniCiudadano,
        p_paisUso,
        p_traduccionJurada,
        p_tasas
    );
END //

DELIMITER ;

DELIMITER //

-- 1. Primero creamos un procedimiento almacenado para la verificación común
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


##---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
##-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



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


-- TODOS LOS CIUDADANOS QUE HAN HECHO UN VIAJE CASADOS 

DROP VIEW IF EXISTS ViajesLunaMiel;
DROP VIEW IF EXISTS noCertificado;
DROP VIEW if EXISTS ciudadanosGeneral_djuradas ;
DROP VIEW if EXISTS ciudadanosMuertos;

CREATE VIEW ViajesLunaMiel AS 
	SELECT * FROM registromatrimonio JOIN (SELECT * FROM ciudadanos JOIN documentoviaje WHERE ciudadanos.dni = documentoviaje.dniCiudadano) JOIN1 
	WHERE JOIN1.dniCiudadano = (registromatrimonio.dniConyugue1 OR registromatrimonio.dniConyugue2); 
		-- un join que coincida el DNI del certificado de matrimonio con el del viaje)
		-- joineamos con los ciudadanos que coincida también el DNI 

--  TODOS LOS CIUDADANOS que no tienen aún hecho el certificado de nacionalidad 
CREATE VIEW noCertificado AS 
	SELECT * FROM certificadonacionalidad JOIN ciudadanos WHERE ciudadanos.dni != certificadonacionalidad.dniCiudadano;

--  TODOS las declaraciones juradas que tengan un poder General
CREATE VIEW ciudadanosGeneral_djuradas AS
	SELECT *
	FROM (SELECT * FROM datoshacerunpoder JOIN ciudadanos ON ciudadanos.dni = datoshacerunpoder.dniApoderante 
	WHERE datoshacerunpoder.tipodePoder = 'General') AS JOIN2
	JOIN declaracionesjuradas 
	ON declaracionesjuradas.dniDeclarante = JOIN2.dni
	ORDER BY declaracionesjuradas.fecha;
	


-- TODOS LOS CIUDADANOS que están muertos 
		
CREATE VIEW ciudadanosMuertos AS
SELECT c.*
FROM ciudadanos c
JOIN registrodefuncion r ON c.dni = r.dniFallecido;
