CREATE TABLE manada (
	region VARCHAR(255) NOT NULL,
	origen VARCHAR(255) NOT NULL,
	temperatura DECIMAL(10, 2),
	poblacion INT CHECK (poblacion >= 0),
	CONSTRAINT pk_manada PRIMARY KEY (region, origen)
);

CREATE TABLE lobo (
	nombre VARCHAR(255) NOT NULL,
	region VARCHAR(255) NOT NULL,
	origen VARCHAR(255) NOT NULL,
	peso INT CHECK (peso >= 0),
	edad INT CHECK (edad >= 0),
	CONSTRAINT pk_lobo PRIMARY KEY (nombre, region, origen),
	CONSTRAINT fk_lobo FOREIGN KEY (region, origen) REFERENCES manada(region, origen)
);

CREATE TABLE rastreador (
	id INT PRIMARY KEY,
	porcentaje_bateria DECIMAL(10, 2)
);

CREATE TABLE encuentra (
	nombre VARCHAR(255) NOT NULL,
	region VARCHAR(255) NOT NULL,
	origen VARCHAR (255) NOT NULL,
	id INT NOT NULL,
	fecha DATE NOT NULL,
	CONSTRAINT encuentra_pk PRIMARY KEY (nombre, region, origen, id, fecha),
	CONSTRAINT encuentra_fk_lobo FOREIGN KEY (nombre, region, origen) REFERENCES lobo(nombre, region, origen),
	CONSTRAINT encuentra_fk_rastrador FOREIGN KEY (id) REFERENCES rastreador(id)
);

-- Manadas existentes
INSERT INTO manada VALUES ('Patagonia', 'Sur', -5.3, 12);
INSERT INTO manada VALUES ('Cuyo', 'Norte', 14.5, 8);

-- Lobos asociados a esas manadas
INSERT INTO lobo VALUES ('Akela', 'Patagonia', 'Sur', 45, 7);
INSERT INTO lobo VALUES ('Balto', 'Cuyo', 'Norte', 39, 5);

-- Rastreadores disponibles
INSERT INTO rastreador VALUES (101, 87.25);
INSERT INTO rastreador VALUES (102, 56.75);

-- Encuentros válidos (lobo + rastreador existen)
INSERT INTO encuentra VALUES ('Akela', 'Patagonia', 'Sur', 101, '2025-10-20');
INSERT INTO encuentra VALUES ('Balto', 'Cuyo', 'Norte', 102, '2025-10-19');

-- Ver todas las manadas que existen
SELECT region, origen, poblacion FROM manada;

-- Todos los lobos existentes ordenados por region
SELECT nombre, region, origen, peso, edad
FROM lobo
ORDER BY region;

