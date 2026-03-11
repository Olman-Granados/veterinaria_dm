CREATE TABLE Dim_Tiempo (
    tiempo_key SERIAL PRIMARY KEY,
    fecha DATE,
    anio INT,
    mes INT,
    nombre_mes VARCHAR(20),
    trimestre INT
);

CREATE TABLE Dim_Cliente (
    cliente_key SERIAL PRIMARY KEY,
    cliente_id INT,
    nombre VARCHAR(100),
    provincia VARCHAR(100)
);

CREATE TABLE Dim_Mascota (
    mascota_key SERIAL PRIMARY KEY,
    mascota_id INT,
    especie VARCHAR(50),
    raza VARCHAR(100),
    sexo CHAR(1)
);

CREATE TABLE Dim_Servicio (
    servicio_key SERIAL PRIMARY KEY,
    servicio_id INT,
    nombre VARCHAR(100),
    categoria VARCHAR(50)
);

CREATE TABLE Fact_Atencion (
    fact_id SERIAL PRIMARY KEY,
    tiempo_key INT,
    cliente_key INT,
    mascota_key INT,
    servicio_key INT,
    cantidad INT,
    subtotal NUMERIC(10,2),
    total_atencion NUMERIC(10,2),
    FOREIGN KEY (tiempo_key) REFERENCES Dim_Tiempo(tiempo_key),
    FOREIGN KEY (cliente_key) REFERENCES Dim_Cliente(cliente_key),
    FOREIGN KEY (mascota_key) REFERENCES Dim_Mascota(mascota_key),
    FOREIGN KEY (servicio_key) REFERENCES Dim_Servicio(servicio_key)
);