CREATE TABLE protector (
	pasaporte VARCHAR(24) PRIMARY KEY,
	altura INT,
	peso INT
);

CREATE TABLE herramienta (
	nombre VARCHAR(16) PRIMARY KEY,
	poder INT,
	origen VARCHAR(16),
	pasaporte VARCHAR(24),
	FOREIGN KEY (pasaporte) REFERENCES protector(pasaporte)
);

CREATE TABLE ciudad (
	nombre VARCHAR(16) PRIMARY KEY,
	ubicacion VARCHAR(16),
	poblacion INT
);

CREATE TABLE protege (
	nombre VARCHAR(16),
	pasaporte VARCHAR(24),
	fecha DATE,
	fue_exitoso BOOLEAN,
	PRIMARY KEY (nombre, pasaporte),
	FOREIGN KEY (nombre) REFERENCES ciudad(nombre),
	FOREIGN KEY (pasaporte) REFERENCES protector(pasaporte)
);

-- ################################################################################################################## --

INSERT INTO protector (pasaporte, altura, peso) VALUES
('AR1234567890', 185, 82),
('US9988776655', 172, 74),
('BR5566778899', 190, 95),
('JP1122334455', 168, 60),
('MX6677889900', 178, 85);

INSERT INTO herramienta (nombre, poder, origen, pasaporte) VALUES
('Martillo Solar', 90, 'Asgard', 'AR1234567890'),
('Lanza Lunar', 70, 'Selene', 'US9988776655'),
('Escudo Andino', 60, 'Qosqo', 'BR5566778899'),
('Katana Viento', 85, 'Kyoto', 'JP1122334455'),
('Guante Meteoro', 95, 'Toltek', 'MX6677889900');

INSERT INTO ciudad (nombre, ubicacion, poblacion) VALUES
('Nova', 'Norte', 1200000),
('Lunaris', 'Oeste', 450000),
('Solaris', 'Este', 780000),
('Altamar', 'Sur', 300000),
('Origen', 'Centro', 950000);

INSERT INTO protege (nombre, pasaporte, fecha, fue_exitoso) VALUES
('Nova', 'AR1234567890', '2024-05-10', TRUE),
('Lunaris', 'US9988776655', '2023-11-22', FALSE),
('Solaris', 'BR5566778899', '2024-01-15', TRUE),
('Altamar', 'JP1122334455', '2024-03-05', TRUE),
('Origen', 'MX6677889900', '2023-09-18', FALSE),
('Nova', 'US9988776655', '2024-02-14', TRUE),
('Solaris', 'JP1122334455', '2024-04-01', FALSE),
('Origen', 'AR1234567890', '2024-01-27', TRUE);

-- ################################################################################################################## --