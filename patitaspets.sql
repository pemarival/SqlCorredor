--Patitas pets Kevin Andrey Culma
CREATE DATABASE patitaspets;
USE patitaspets;

CREATE TABLE Propietario (
id_Propietario INT PRIMARY KEY,
nombrePropietario VARCHAR (50),
telefono VARCHAR (50)
);

CREATE TABLE Mascota (
id_Mascota INT PRIMARY KEY,
nombreMascota VARCHAR(100),
especie VARCHAR(50),
id_Propietario INT,
FOREIGN KEY (id_Propietario) REFERENCES Propietario (id_Propietario)
);

CREATE TABLE Cita (
id_Cita INT PRIMARY KEY,
fechaCita DATE,
id_Mascota INT,
FOREIGN KEY (id_Mascota) REFERENCES Mascota (id_Mascota)
);

INSERT INTO Propietario VALUES
(1,'Daniel', '301156990'),
(2,'Ana','3124811273'),
(3,'Mariana','3202790200'),
(4,'Andres','318480298');

INSERT INTO Mascota VALUES
(1,'Max', 'perro',1),
(2, 'Miska','gato',2),
(3,'paco', 'loro',3),
(4,'mota','serpiente',4);

INSERT INTO Cita VALUES
(1,'19-06-25',1),
(2, '20-06-25',2),
(3,'21-06-25',3),
(4,'22-06-25',4);

UPDATE Propietario SET telefono='1112222333' WHERE id_Propietario=1; --Andrey no puso ;
UPDATE Mascota SET nombreMascota='Maxi' WHERE id_Mascota=1; --Andrey no puso ;

SELECT 
    Propietario.nombrePropietario AS nombre_propietario,
    mascota.nombreMascota AS nombre_mascota,
    cita.fechaCita,
  
FROM 
    Propietario
INNER JOIN Mascota ON Propietario.id_propietario = mascota.id_Propietario
INNER JOIN Cita ON Mascota.id_Mascota = Cita.id_mascota;

DELETE FROM Propietario WHERE id_Propietario = 1;
DELETE FROM Mascota WHERE id_Mascota = 1;
DELETE FROM Cita WHERE id_Cita = 1;


ALTER TABLE Cita ADD motivo VARCHAR(100);  
ALTER TABLE Mascota ALTER COLUMN nombreMascota VARCHAR(50);  

TRUNCATE TABLE Cita;
 
DROP TABLE Propietario;
DROP TABLE Mascota;
DROP TABLE Cita ;

