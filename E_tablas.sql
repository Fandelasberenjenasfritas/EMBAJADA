CREATE DATABASE IF NOT EXISTS embajada;

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
edad INT,
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
nombre VARCHAR(100) NOT NULL,
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
