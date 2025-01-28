USE RESTO
GO

INSERT INTO Menu (Nombre, Precio, stock)
VALUES 
('Pizza Margherita', 8.99, 20),
('Spaghetti Bolognese', 12.50, 15),
('Ensalada César', 7.00, 25),
('Hamburguesa', 10.00, 30),
('Tacos', 5.00, 50);
go


INSERT INTO TipoUsuario (Tipo)
VALUES (1), (2);
go

INSERT INTO Usuario (Email, Contrasenia, IdTipoUsuario,Nombre,Apellido)
VALUES 
('cliente@ejemplo.com', 'password123', 2,'Gianfri','Panta'),
('mesero@ejemplo.com', 'password123', 2,'n','m'),
('admin@ejemplo.com', 'admin123', 1,'y','u');
go

INSERT INTO Mesas (NumeroMesa)
VALUES (1), (2), (3), (4), (5), (10);
go

insert into MesasAsignadas (IdMesa,IdUsuario,Fecha)
values
(1,1,getdate()),(2,1,getdate()),(3,2,'2025-01-23')