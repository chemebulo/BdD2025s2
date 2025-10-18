CREATE TABLE CARRERA (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE ALUMNO (
	dni CHAR(10) PRIMARY KEY,
	nombre VARCHAR(50),
	id_carrera INT REFERENCES carrera(id)
);

INSERT INTO carrera (nombre) VALUES ('Ingeniería en Sistemas');
INSERT INTO alumno (dni, nombre, id_carrera) VALUES ('99.184.109', 'Juan Lopez', 1);

SELECT a.nombre, c.nombre AS carrera
FROM alumno a
JOIN carrera c ON a.id_carrera = c.id;