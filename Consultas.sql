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
