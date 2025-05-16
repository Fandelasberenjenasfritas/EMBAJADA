-- 1. Insertar datos en la tabla usuarios (debe ser primero por las FK)
INSERT INTO usuarios (tipoUsuario, dni) VALUES 
('Administrador', '12345678'),
('Registrador Civil', '23456789'),
('Notario', '34567890'),
('Funcionario Consular', '45678901'),
('Ciudadano', '56789012'),
('Ciudadano', '67890123'),
('Ciudadano', '78901234'),
('Ciudadano', '89012345'),
('Ciudadano', '90123456'),
('Ciudadano', '01234567'),
('Ciudadano', '11223344'),
('Ciudadano', '22334455'),
('Ciudadano', '33445566'),
('Ciudadano', '44556677'),
('Ciudadano', '55667788'),
('Ciudadano', '66778899'),
('Ciudadano', '77889900'),
('Ciudadano', '88990011'),
('Ciudadano', '99001122'),
('Ciudadano', '00112233');

-- 2. Insertar datos en la tabla ciudadanos (compatible con todos los triggers)
INSERT INTO ciudadanos (nombre, dni, nacionalidad, fechaNacimiento, pasaporte, profesion, domicilio, telefono, correo, antecedentes, estadoCivil, sexo, representante) VALUES
('Juan Pérez', '12345678', 'peruano', '1980-05-15', 'P12345678', 'ingeniero', 'Av. Lima 123', '987654321', 'juan@email.com', FALSE, 'Soltero', 'M', NULL),
('María López', '23456789', 'peruano', '1985-08-20', 'P23456789', 'médico', 'Jr. Tacna 456', '987654322', 'maria@email.com', FALSE, 'Soltero', 'F', NULL),
('Carlos Gómez', '34567890', 'venezolano', '1990-11-10', 'P34567890', 'abogado', 'Av. Arequipa 789', '987654323', 'carlos@email.com', false, 'Divorciado', 'M', NULL),
('Laura Torres', '45678901', 'peruano', '1995-02-25', 'P45678901', 'arquitecta', 'Calle Trujillo 101', '987654324', 'laura@email.com', FALSE, 'Soltero', 'F', NULL),
('Pedro Sánchez', '56789012', 'venezolano', '2000-07-30', 'P56789012', 'estudiante', 'Av. Brasil 202', '987654325', 'pedro@email.com', FALSE, 'Soltero', 'M', '23456789'),
('Ana Mendoza', '67890123', 'peruano', '1975-04-12', 'P67890123', 'contadora', 'Jr. Cusco 303', '987654326', 'ana@email.com', FALSE, 'Viudo', 'F', NULL),
('Luis Ramírez', '78901234', 'peruano', '1988-09-18', 'P78901234', 'ingeniero', 'Av. Argentina 404', '987654327', 'luis@email.com', False, 'Soltero', 'M', NULL),
('Sofía Castro', '89012345', 'peruano', '1992-12-05', 'P89012345', 'diseñadora', 'Calle Ica 505', '987654328', 'sofia@email.com', FALSE, 'Soltero', 'F', NULL),
('Miguel Ruiz', '90123456', 'venezolano', '1983-03-22', 'P90123456', 'profesor', 'Av. Bolivia 606', '987654329', 'miguel@email.com', FALSE, 'Casado', 'M', NULL),
('Elena Vargas', '01234567', 'peruano', '1970-06-15', 'P01234567', 'enfermera', 'Jr. Piura 707', '987654310', 'elena@email.com', FALSE, 'Divorciado', 'F', NULL),
('Jorge Medina', '11223344', 'peruano', '2010-01-10', 'P11223344', 'estudiante', 'Av. Colombia 808', '987654311', 'jorge@email.com', FALSE, 'Soltero', 'M', '23456789'),
('Lucía Herrera', '22334455', 'peruano', '2015-04-20', 'P22334455', 'estudiante', 'Calle Ayacucho 909', '987654312', 'lucia@email.com', FALSE, 'Soltero', 'F', '34567890'),
('Ricardo Paredes', '33445566', 'peruano', '1998-08-30', 'P33445566', 'programador', 'Av. Venezuela 1010', '987654313', 'ricardo@email.com', FALSE, 'Soltero', 'M', NULL),
('Carmen Ríos', '44556677', 'peruano', '1987-10-12', 'P44556677', 'psicóloga', 'Jr. Huancayo 1111', '987654314', 'carmen@email.com', FALSE, 'Soltero', 'F', NULL),
('Fernando León', '55667788', 'peruano', '1978-07-25', 'P55667788', 'comerciante', 'Av. México 1212', '987654315', 'fernando@email.com', false, 'Casado', 'M', NULL),
('Patricia Silva', '66778899', 'peruano', '1993-02-18', 'P66778899', 'odontóloga', 'Calle Huaraz 1313', '987654316', 'patricia@email.com', FALSE, 'Soltero', 'F', NULL),
('Roberto Núñez', '77889900', 'peruano', '1982-11-08', 'P77889900', 'economista', 'Av. Paraguay 1414', '987654317', 'roberto@email.com', FALSE, 'Soltero', 'M', NULL),
('Daniela Ortiz', '88990011', 'peruano', '1996-05-30', 'P88990011', 'bióloga', 'Jr. Chiclayo 1515', '987654318', 'daniela@email.com', FALSE, 'Soltero', 'F', NULL),
('Hugo Morales', '99001122', 'peruano', '1973-09-22', 'P99001122', 'abogado', 'Av. Ecuador 1616', '987654319', 'hugo@email.com', false, 'Casado', 'M', NULL),
('Gabriela Flores', '00112233', 'peruano', '2012-12-15', 'P00112233', 'estudiante', 'Calle Cajamarca 1717', '987654320', 'gabriela@email.com', FALSE, 'Soltero', 'F', '45678901');

-- 3. Insertar datos en registroNacimiento (necesario para otras tablas)
INSERT INTO registroNacimiento (nombreBebe, fecha, hora, sexo, dniTutor1, dniTutor2) VALUES
('Martín Pérez López', '2020-01-15', '08:30:00', 'M', '12345678', '23456789'),
('Valeria Gómez Torres', '2019-05-20', '14:45:00', 'F', '34567890', '45678901'),
('Diego Sánchez Castro', '2021-03-10', '10:15:00', 'M', '56789012', '67890123'),
('Camila Ruiz Herrera', '2018-11-25', '19:20:00', 'F', '90123456', '01234567'),
('Oscar Medina Flores', '2022-07-05', '06:50:00', 'M', '11223344', '22334455');

-- 4. Insertar datos en feDeVida
INSERT INTO feDeVida (dniCiudadano) VALUES
('12345678'),
('23456789'),
('34567890'),
('45678901'),
('56789012'),
('67890123'),
('78901234'),
('89012345'),
('90123456'),
('01234567'),
('11223344'),
('22334455'),
('33445566'),
('44556677'),
('55667788'),
('66778899'),
('77889900'),
('88990011'),
('99001122'),
('00112233');

-- 5. Insertar datos en certificadoMatrimonio
INSERT INTO certificadoMatrimonio (fecha, lugar, motivoSolicitud, numTomo, numPagina) VALUES
('2020-06-15', 'Lima', 'Unión matrimonial', 125, 45),
('2021-11-20', 'Arequipa', 'Matrimonio civil', 98, 32),
('2022-03-10', 'Trujillo', 'Unión conyugal', 76, 18);

-- 6. Insertar datos en registroMatrimonio (activará trigger cambiarEstadoCivil)
INSERT INTO registroMatrimonio (dniConyugue1, dniConyugue2, dniTestigo, registroEconomico) VALUES
('12345678', '23456789', '34567890', 1500),  -- Juan y María
('34567890', '45678901', '56789012', 1800),  -- Carlos y Laura
('78901234', '89012345', '90123456', 2000);  -- Luis y Sofía

-- 7. Insertar datos en reconocimientosLegales (activará trigger establecerRepresentante)
INSERT INTO reconocimientosLegales (actaNacimiento, dniHijo, dniProgenitor1, dniProgenitor2) VALUES
(1, '00112233', '12345678', '23456789'),  -- Gabriela Flores, hija de Juan y María
(2, '11223344', '34567890', '45678901'),  -- Jorge Medina, hijo de Carlos y Laura
(3, '22334455', '56789012', '67890123');  -- Lucía Herrera, hija de Pedro y Ana

-- 8. Insertar datos en documentoViaje (solo para venezolanos por trigger nacionalidad_venezolana)
INSERT INTO documentoViaje (dniCiudadano, itinerarioViaje) VALUES
('34567890', 'Lima - Caracas - Margarita (15 días)'),  -- Carlos (venezolano)
('56789012', 'Lima - Valencia - Mérida (20 días)'),    -- Pedro (venezolano)
('90123456', 'Lima - Maracaibo - Canaima (30 días)');  -- Miguel (venezolano)

-- 9. Insertar datos en autorizacionViajeMenores
INSERT INTO autorizacionViajeMenores (dniMenor, dniProgenitor1, dniProgenitor2, dniTutor, numRegistroNacimiento, telefono, correo, fechaIda, fechaVuelta, lugarDestino, tipoActividad, companiaDeViaje, motivoDelViaje) VALUES
('00112233', '12345678', '23456789', '34567890', 5, '987654320', 'gabriela@email.com', '2023-12-15', '2024-01-15', 'España', 'Intercambio estudiantil', '45678901', 'Estudios'),
('11223344', '34567890', '45678901', '56789012', 1, '987654311', 'jorge@email.com', '2023-11-10', '2023-12-10', 'Estados Unidos', 'Competencia deportiva', '67890123', 'Deportes'),
('22334455', '56789012', '67890123', '78901234', 2, '987654312', 'lucia@email.com', '2024-01-20', '2024-02-20', 'Italia', 'Vacaciones familiares', '89012345', 'Turismo');

-- 10. Insertar datos en registroDefuncion
INSERT INTO registroDefuncion (dniFallecido, dniSolicitante, parentesco, causaMuerte) VALUES
('99001122', '00112233', 'hija', 'Infarto cardíaco'),
('88990011', '77889900', 'hermano', 'Accidente de tránsito');

-- 11. Insertar datos en verificarLicenciaConducir
INSERT INTO verificarLicenciaConducir (numLicencia, fechaPrimeraExpedicion, fechaVencimiento, fechaRenovacion) VALUES
('12345678', '2010-05-15', '2025-05-15', '2020-05-15'),
('23456789', '2012-08-20', '2027-08-20', '2022-08-20');

-- 12. Insertar datos en certificadoContinuidadMatrimonio
INSERT INTO certificadoContinuidadMatrimonio (dniConyugue1, dniConyugue2, fechaMatrimonio, lugar, certificadoNacimiento1, certificadoNacimiento2) VALUES
('12345678', '23456789', '2020-06-15', 'Lima', 1, 2),
('34567890', '45678901', '2021-11-20', 'Arequipa', 3, 4);

-- 13. Insertar datos en legalizaciones
INSERT INTO legalizaciones (dniSolicitante, tipoDocumento, fechaEmision, relacionSolicitanteDocumento, tasas) VALUES
('67890123', 'Diploma', '2023-01-10', 'Titular del documento', 50),
('78901234', 'Acta', '2023-02-15', 'Titular del documento', 30),
('89012345', 'Certificado', '2023-03-20', 'Titular del documento', 40);

-- 14. Insertar datos en certificadoNacionalidad
INSERT INTO certificadoNacionalidad (dniCiudadano) VALUES
('12345678'),
('23456789'),
('34567890');

-- 15. Insertar datos en declaracionesJuradas
INSERT INTO declaracionesJuradas (dniDeclarante, fecha, nombreJurada, traduccionJurada) VALUES
('67890123', '2023-06-10', 'Declaración de soltería', 'Certifico que soy soltero/a y no tengo impedimento para contraer matrimonio'),
('78901234', '2023-07-15', 'Declaración de ingresos', 'Certifico que mis ingresos provienen de actividades lícitas'),
('89012345', '2023-08-20', 'Declaración de residencia', 'Certifico que resido en el domicilio indicado');

-- 16. Insertar datos en apostilla
INSERT INTO apostilla (dniCiudadano, paisUso, traduccionJurada, tasas) VALUES
('11223344', 'España', 'Traducción jurada al español del certificado de nacimiento', 100),
('22334455', 'Estados Unidos', 'Traducción jurada al inglés del título universitario', 120),
('33445566', 'Italia', 'Traducción jurada al italiano del acta de matrimonio', 90);

-- 17. Insertar datos en certificadoInscripcionConsular
INSERT INTO certificadoInscripcionConsular (dniCiudadano, motivoViaje, actaNacimiento, tramites) VALUES
('12345678', 'Estudios universitarios', 1, 'Renovación de pasaporte'),
('23456789', 'Trabajo temporal', 2, 'Legalización de documentos'),
('34567890', 'Reunión familiar', 3, 'Registro consular');

-- 18. Insertar datos en datosHacerUnPoder
INSERT INTO datosHacerUnPoder (dniApoderante, dniApoderado, tipoDePoder, duracion, dniTestigo) VALUES
('12345678', '23456789', 'Poder general', '10:00:00', '34567890'),
('45678901', '56789012', 'Poder especial', '05:00:00', '67890123'),
('78901234', '89012345', 'Poder notarial', '03:00:00', '90123456');
