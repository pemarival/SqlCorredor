--Samurai aerolínea Kevin Andrey Culma
CREATE DATABASE samuraiAerolinea;
USE samuraiAerolinea;

CREATE TABLE Pasajero (
id_Pasajero INT PRIMARY KEY,
nombre VARCHAR (50)
);

CREATE TABLE Vuelo (
id_Vuelo INT PRIMARY KEY,
origen VARCHAR (100),
destino VARCHAR (100),
fecha DATE
);

CREATE TABLE Avion (
id_Avion INT PRIMARY KEY,
modelo VARCHAR (50),
capacidad INT,
);

CREATE TABLE Reserva (
id_Reserva INT PRIMARY KEY,
id_Pasajero INT,
id_Vuelo INT,
id_Avion INT,
asiento INT,
FOREIGN KEY (id_Pasajero) REFERENCES Pasajero (id_Pasajero),
FOREIGN KEY (id_Vuelo) REFERENCES Vuelo (id_Vuelo),
FOREIGN KEY (id_Avion) REFERENCES Avion (id_Avion)
);

INSERT INTO Pasajero VALUES  --No insertó datos, los agregué yo
(1,'Lucas'),
(2,'Kevin'),
(3,'Santiago'),
(4,'Steven'); 

INSERT INTO Vuelo VALUES
(1,'Colombia','Egipto', '19-06-25'),
(2,'Chile','Francia', '20-06-25'),
(3,'Venezuela','India', '21-06-25'),
(4,'Argentina','Panama', '22-06-25'); 

INSERT INTO Avion VALUES
(1,'AIRBUS 320',220),
(2,'BOEING 777',550),
(3,'ANTONOY',550),
(4,'AIRBUS 340',419); 

INSERT INTO Reserva VALUES
(1,1,1,1,15),
(2,2,2,2,20),
(3,3,3,3,25),
(4,4,4,4,30); 

SELECT 
    Pasajero.nombre AS nombre_pasajero, --Solo hizo el select y el from, faltó el delete, alter, truncate y drop
    Vuelo.destino,
    Avion.modelo AS modelo_avion,
    reserva.asiento
FROM 
    Reserva
INNER JOIN Pasajero ON Reserva.id_Pasajero = Pasajero.id_Pasajero
INNER JOIN Vuelo ON Reserva.id_Vuelo = Vuelo.id_Vuelo
INNER JOIN Avion ON Vuelo.id_Avion = Avion.id_Avion;

DELETE FROM Pasajero WHERE id_Propietario = 3;
DELETE FROM Vuelo WHERE id_Mascota = 3;
DELETE FROM Avion WHERE id_Cita = 3;
DELETE FROM Reserva WHERE id_Reserva = 3;


ALTER TABLE Avion ADD conductor VARCHAR(50);  
ALTER TABLE Vuelo ALTER COLUMN origen VARCHAR(50);  

TRUNCATE TABLE Reserva;
 
DROP TABLE Pasajero;
DROP TABLE Vuelo;
DROP TABLE Avion;
DROP TABLE Reserva;



























 