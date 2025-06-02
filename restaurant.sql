--Restaurant
CREATE DATABASE restaurant;
USE restaurant;

CREATE TABLE Mesero ( 
id_Mesero INT PRIMARY KEY,
nombreMesero VARCHAR (50),
telefono varchar(20),
correo  VARCHAR (50),
direccion TEXT, 
sueldo INT
);

CREATE TABLE Plato (
id_Plato INT PRIMARY KEY,
nombrePlato VARCHAR (50),
precio INT,
descripcion TEXT,
imagen BINARY
);

CREATE TABLE Orden (
id_Orden INT PRIMARY KEY,
fechaOrden DATE,
id_Mesero INT,
numeroOrden INT,
FOREIGN KEY (id_Mesero) REFERENCES Mesero (id_Mesero)
); 

CREATE TABLE OrdenDetalles(
id_OrdenDetalles INT PRIMARY KEY,
id_Plato INT,
valor INT,
id_Orden INT,
cantidad INT,
FOREIGN KEY (id_Plato) REFERENCES Plato (id_Plato),
FOREIGN KEY (id_Orden) REFERENCES Orden  (id_Orden)
);

INSERT INTO Mesero VALUES
(1,'Nicolas Alvarez', 3126849324,'nicoalvarez@gmail.com','cll 33 2w-16',50000),
(2,'Laura Perez', 3126849324,'laupe@sena.edu.co','cll 24 5w-55',120000),
(3,'Juan Tovar', 3126849324,'julito@gmail.com','cll 12 22w-20',30000),
(4,'Carlos Penagos', 3126849324,'carpelo@hotmail.com','cll 10 2o-10',45000);

INSERT INTO Plato VALUES
(1,'Arroz con pollo', 20000,'Arroz, pollo, verduras, salsa de tomate y papitas fritas',NULL),
(2,'Pasta', 10000,'Pasta, salsa de tomate, oregano y queso',NULL),
(3,'Bandeja Paisa', 15000,'Arroz, aguacate, frijol, chicharron y chorizo', NULL),
(4,'Casuela', 55000,'Pulpo, verduras, arroz y langosta',NULL);

INSERT INTO Orden VALUES
(1,'05-01-25',1 ,1),
(2,'06-01-25',2 ,2),
(3,'07-01-25',3 ,3),
(4,'08-01-25',4 ,4);

INSERT INTO OrdenDetalles VALUES
(1,1,60000,1,3),
(2,2,20000,2,2),
(3,3,30000,3,2 ),
(4,4,165000,4,3 );

UPDATE Plato SET nombrePlato='salchipapa' WHERE id_Plato = 2;
UPDATE Mesero SET correo ='jutovar@gmail.com' WHERE id_Mesero = 3;

SELECT 
    o.numeroOrden,
    m.nombreMesero AS mesero_nombre,
    o.fechaOrden AS fecha,
    od.cantidad,
    p.nombrePlato AS plato,
    od.costo

FROM OrdenDetalles od
INNER JOIN Orden o ON od.id_orden = o.id_orden
INNER JOIN Mesero m ON o.id_mesero = m.id_mesero
INNER JOIN Plato p ON od.id_plato = p.id_plato;

DELETE FROM Mesero WHERE id_Mesero = 4;
DELETE FROM Orden WHERE id_Orden = 4;
DELETE FROM OrdenDetalles WHERE id_OrdenDetalles = 4;

ALTER TABLE Mesero ALTER COLUMN  correo VARCHAR(30);
ALTER TABLE Plato ADD calificacion VARCHAR(20); 

TRUNCATE TABLE Orden;

DROP TABLE Mesero;
DROP TABLE Plato ;
DROP TABLE Orden;
DROP TABLE OrdenDetalles;







