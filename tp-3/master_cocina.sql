CREATE TABLE restaurante (
	razon_social VARCHAR(50) PRIMARY KEY,
	fundacion TIMESTAMP,
	cant_estrellas INT CHECK(cant_estrellas BETWEEN 0 AND 5)
);

CREATE TABLE maestro (
	nombre VARCHAR(16),
	restaurante VARCHAR(50),
	fecha_nac TIMESTAMP,
	tiempo_profesional INT,
	PRIMARY KEY (nombre, restaurante),
	FOREIGN KEY (restaurante) REFERENCES restaurante(razon_social) 
);

CREATE TABLE participante (
	apodo VARCHAR(10),
	edad INT CHECK(edad >= 0),
	ciudad VARCHAR(26),
	maestro VARCHAR(16),
	restaurante VARCHAR(50),
	PRIMARY KEY (apodo, maestro, restaurante),
	FOREIGN KEY (maestro, restaurante) REFERENCES maestro(nombre, restaurante)
);

CREATE TABLE programa (
	numero INT PRIMARY KEY,
	fecha DATE,
	hora_inicio TIME,
	grabacion INT
);

CREATE TABLE plato (
	plato VARCHAR(20),
	apodo VARCHAR(10),
	nombre VARCHAR(16),
	razon_social VARCHAR(50),
	tipo VARCHAR(10),
	es_vegano BOOLEAN,
	numero INT,
	PRIMARY KEY (plato, apodo, nombre, razon_social),
	FOREIGN KEY (apodo, nombre, razon_social) REFERENCES participante(apodo, maestro, restaurante),
	FOREIGN KEY (numero) REFERENCES programa(numero)
);

-- ################################################################################################################## --

INSERT INTO restaurante (razon_social, fundacion, cant_estrellas)
VALUES
    ('La Buena Mesa', '1998-05-20 00:00:00', 3),
    ('Sabores Andinos', '2005-09-10 00:00:00', 5),
    ('El Faro Gourmet', '2010-01-15 00:00:00', 4),
    ('Casa Italia', '1985-03-02 00:00:00', 2);

	
INSERT INTO maestro (nombre, restaurante, fecha_nac, tiempo_profesional)
VALUES
    ('Martin', 'La Buena Mesa', '1980-04-12 00:00:00', 20),
    ('Lucia', 'Sabores Andinos', '1975-07-22 00:00:00', 25),
    ('Carlos', 'El Faro Gourmet', '1988-11-03 00:00:00', 12),
    ('Sofia', 'Casa Italia', '1990-02-28 00:00:00', 10);


INSERT INTO participante (apodo, edad, ciudad, maestro, restaurante)
VALUES
    ('Tito', 25, 'Córdoba', 'Martin', 'La Buena Mesa'),
    ('Luna', 30, 'Mendoza', 'Martin', 'La Buena Mesa'),
    ('Rafa', 22, 'Salta', 'Lucia', 'Sabores Andinos'),
    ('Mili', 28, 'Rosario', 'Lucia', 'Sabores Andinos'),
    ('Pato', 35, 'Buenos Aires', 'Carlos', 'El Faro Gourmet'),
    ('Gabi', 27, 'La Plata', 'Sofia', 'Casa Italia');


INSERT INTO programa (numero, fecha, hora_inicio, grabacion)
VALUES
    (1, '2024-10-01', '20:00:00', 1001),
    (2, '2024-10-08', '20:00:00', 1002),
    (3, '2024-10-15', '20:00:00', 1003);

	
INSERT INTO plato (plato, apodo, nombre, razon_social, tipo, es_vegano, numero)
VALUES
    ('Pasta Negra', 'Tito', 'Martin', 'La Buena Mesa', 'Pasta', FALSE, 1),
    ('Ensalada Andina', 'Rafa', 'Lucia', 'Sabores Andinos', 'Ensalada', TRUE, 1),
    ('Risotto Mar', 'Pato', 'Carlos', 'El Faro Gourmet', 'Arroz', FALSE, 2),
    ('Tiramisu', 'Gabi', 'Sofia', 'Casa Italia', 'Postre', TRUE, 2),
    ('Locro Veg', 'Mili', 'Lucia', 'Sabores Andinos', 'Guiso', TRUE, 3),
    ('Ñoquis', 'Luna', 'Martin', 'La Buena Mesa', 'Pasta', FALSE, 3);

-- ################################################################################################################## --

SELECT *
FROM restaurante;

SELECT *
FROM maestro;

SELECT *
FROM participante;

SELECT *
FROM programa;

SELECT *
FROM plato;








