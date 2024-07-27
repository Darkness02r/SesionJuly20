CREATE DATABASE DbResgistro
GO
USE DbResgistro
GO

 --Creamos la tabla Ciudades
CREATE TABLE Ciudades(
	Id INT PRIMARY KEY IDENTITY (1,1)
	, Nombre NVARCHAR (60)NOT NULL
	, Estado BIT DEFAULT 1
);
GO
 
 --Creamos la tabla Personas
CREATE TABLE Personas(
	Id INT PRIMARY KEY IDENTITY (1,1)	
	, Nombres NVARCHAR (40) NOT NULL
	, Apellidos NVARCHAR (40) NOT NULL
	, Ciudad_Id INT FOREIGN KEY REFERENCES Ciudades(Id) NOT NULL
	, Activo BIT DEFAULT 1
);
GO

/* Consultas de insertar*/ 
INSERT INTO Ciudades(Nombre) 
VALUES 
('Masaya'), ('Managua'), ('Chontales'), ('Leon')
GO

INSERT INTO Personas(Nombres, Apellidos, Ciudad_Id) 
VALUES 
('Justin', 'Detrinidad', 2),
('Aby', 'Acuña', 2),
('Erick', 'Martinez', 2),
('Tatiana', 'Càceres', 1)
GO

/*CRULD*/
/*Creamos un visualizador de las tablas*/
SELECT * FROM Ciudades c
GO
SELECT * FROM Personas P
GO

/*Para ocultar los campos y darles otros nombres, hay que preservar la integridsad de los datos*/
SELECT Id AS 'Codigo', Nombre AS 'Ciudad', Estado AS 'Est' FROM Ciudades
GO

SELECT Personas.iD AS 'Codigo', Personas.Nombres + ' '+ Personas.Apellidos AS 'Nombre Completo', Ciudades.Nombre AS Ciudad 
FROM Personas INNER JOIN Ciudades ON Personas.Ciudad_Id = Ciudades.Id
GO
/* Este sirve para borrar los registros creados*/
TRUNCATE TABLE Personas
GO

TRUNCATE TABLE Ciudades
GO

/*Este sirve para dropear o tumbar un campo o tabla*/
DROP TABLE Personas
GO


/*Creamos una variable para rcear una busqueda*/

DECLARE @Nombre NVARCHAR (40)
SET  @Nombre = '%a%'

SELECT Personas.iD AS 'Codigo', Personas.Nombres + ' '+ Personas.Apellidos AS 'Nombre Completo', Ciudades.Nombre AS Ciudad 
FROM Personas INNER JOIN Ciudades ON Personas.Ciudad_Id = Ciudades.Id WHERE Nombres LIKE @Nombre

/***SELECT * FROM Personas WHERE Nombres LIKE @Nombre
GO*/