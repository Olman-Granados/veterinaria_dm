CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion TEXT,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Mascota (
    mascota_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(100),
    fecha_nacimiento DATE,
    sexo CHAR(1) CHECK (sexo IN ('M','H')),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Atencion (
    atencion_id SERIAL PRIMARY KEY,
    mascota_id INT NOT NULL,
    fecha_atencion DATE NOT NULL,
    observaciones TEXT,
    total NUMERIC(10,2) DEFAULT 0,
    FOREIGN KEY (mascota_id) REFERENCES Mascota(mascota_id)
);

CREATE TABLE Servicio (
    servicio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio_base NUMERIC(10,2) NOT NULL CHECK (precio_base > 0),
    categoria VARCHAR(50)
);

CREATE TABLE DetalleAtencion (
    detalle_id SERIAL PRIMARY KEY,
    atencion_id INT NOT NULL,
    servicio_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL CHECK (precio_unitario > 0),
    subtotal NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (atencion_id) REFERENCES Atencion(atencion_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicio(servicio_id)
);

INSERT INTO Cliente (nombre, telefono, email, direccion) VALUES
('Carlos Ramirez','8888-1111','carlos@email.com','San Jose'),
('Ana Lopez','8888-2222','ana@email.com','Heredia'),
('Luis Mora','8888-3333','luis@email.com','Cartago'),
('Sofia Vega','8888-4444','sofia@email.com','Alajuela'),
('Mario Rojas','8888-5555','mario@email.com','Escazu'),
('Laura Castro','8888-6666','laura@email.com','Curridabat'),
('Daniel Herrera','8888-7777','daniel@email.com','Moravia'),
('Elena Solis','8888-8888','elena@email.com','Tibas');

INSERT INTO Servicio (nombre, precio_base, categoria) VALUES
('Consulta General',15000,'Consulta'),
('Vacuna Rabia',12000,'Vacuna'),
('Vacuna Triple',18000,'Vacuna'),
('Desparasitacion',8000,'Tratamiento'),
('Baño',10000,'Estetica'),
('Corte de Uñas',5000,'Estetica'),
('Cirugia Menor',75000,'Procedimiento'),
('Examen de Sangre',20000,'Laboratorio');

INSERT INTO Mascota (cliente_id,nombre,especie,raza,fecha_nacimiento,sexo) VALUES
(1,'Max','Perro','Labrador','2020-05-10','M'),
(1,'Luna','Gato','Siames','2021-03-15','H'),
(2,'Rocky','Perro','Bulldog','2019-07-20','M'),
(3,'Mia','Gato','Persa','2022-01-10','H'),
(4,'Toby','Perro','Poodle','2018-09-12','M'),
(5,'Nala','Gato','Criollo','2021-11-02','H'),
(6,'Simba','Perro','Golden','2020-04-18','M'),
(6,'Coco','Perro','Chihuahua','2022-06-05','H'),
(7,'Lola','Gato','Angora','2019-12-22','H'),
(8,'Bruno','Perro','Boxer','2017-08-30','M'),
(2,'Kiara','Gato','Siames','2023-02-14','H'),
(3,'Thor','Perro','Husky','2021-10-09','M');

INSERT INTO Atencion (mascota_id,fecha_atencion,observaciones) VALUES
(1,'2025-01-10','Chequeo general'),
(2,'2025-01-15','Vacunacion'),
(3,'2025-01-20','Baño y corte'),
(4,'2025-02-05','Desparasitacion'),
(5,'2025-02-10','Chequeo general'),
(6,'2025-02-15','Vacunacion'),
(7,'2025-03-01','Examen sangre'),
(8,'2025-03-05','Cirugia menor'),
(9,'2025-03-10','Baño'),
(10,'2025-03-15','Consulta'),
(11,'2025-01-25','Vacuna'),
(12,'2025-02-20','Chequeo'),
(1,'2025-03-18','Control'),
(2,'2025-03-22','Desparasitacion'),
(3,'2025-02-28','Consulta'),
(4,'2025-03-30','Vacuna'),
(5,'2025-01-18','Baño'),
(6,'2025-02-12','Examen'),
(7,'2025-03-25','Consulta'),
(8,'2025-01-08','Chequeo'),
(9,'2025-02-14','Vacuna'),
(10,'2025-03-02','Desparasitacion'),
(11,'2025-01-12','Consulta'),
(12,'2025-02-18','Baño'),
(1,'2025-03-28','Vacuna');

INSERT INTO DetalleAtencion (atencion_id, servicio_id, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 15000, 15000),
(1, 8, 1, 20000, 20000),
(2, 2, 1, 12000, 12000),
(2, 3, 1, 18000, 18000),
(3, 5, 1, 10000, 10000),
(3, 6, 1,  5000,  5000),
(3, 1, 1, 15000, 15000),
(4, 4, 1,  8000,  8000),
(4, 1, 1, 15000, 15000),
(5, 1, 1, 15000, 15000),
(5, 8, 1, 20000, 20000),
(6, 2, 1, 12000, 12000),
(6, 4, 1,  8000,  8000),
(7, 8, 1, 20000, 20000),
(7, 1, 1, 15000, 15000),
(8, 7, 1, 75000, 75000),
(8, 1, 1, 15000, 15000),
(8, 8, 1, 20000, 20000),
(9, 5, 1, 10000, 10000),
(9, 6, 1,  5000,  5000),
(10, 1, 1, 15000, 15000),
(10, 4, 1,  8000,  8000),
(11, 3, 1, 18000, 18000),
(11, 2, 1, 12000, 12000),
(12, 1, 1, 15000, 15000),
(12, 8, 1, 20000, 20000),
(12, 4, 1,  8000,  8000),
(13, 1, 1, 15000, 15000),
(13, 2, 1, 12000, 12000),
(14, 4, 1,  8000,  8000),
(14, 1, 1, 15000, 15000),
(15, 1, 1, 15000, 15000),
(15, 6, 1,  5000,  5000),
(16, 3, 1, 18000, 18000),
(16, 4, 1,  8000,  8000),
(17, 5, 1, 10000, 10000),
(17, 6, 1,  5000,  5000),
(17, 1, 1, 15000, 15000),
(18, 8, 1, 20000, 20000),
(18, 1, 1, 15000, 15000),
(19, 1, 1, 15000, 15000),
(19, 2, 1, 12000, 12000),
(20, 1, 1, 15000, 15000),
(20, 8, 1, 20000, 20000),
(21, 2, 1, 12000, 12000),
(21, 3, 1, 18000, 18000),
(22, 4, 1,  8000,  8000),
(22, 5, 1, 10000, 10000),
(23, 1, 1, 15000, 15000),
(23, 8, 1, 20000, 20000),
(23, 6, 1,  5000,  5000),
(24, 5, 1, 10000, 10000),
(24, 6, 1,  5000,  5000),
(25, 3, 1, 18000, 18000),
(25, 2, 1, 12000, 12000),
(25, 4, 1,  8000,  8000);

UPDATE Atencion a
SET total = (
    SELECT COALESCE(SUM(d.subtotal), 0)
    FROM DetalleAtencion d
    WHERE d.atencion_id = a.atencion_id
);