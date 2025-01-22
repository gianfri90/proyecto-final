use RESTO
go

INSERT INTO Platos (NombrePlato, PrecioPlato, stock)
VALUES 
('Pizza Margherita', 8.99, 20),
('Spaghetti Bolognese', 12.50, 15),
('Ensalada César', 7.00, 25),
('Hamburguesa', 10.00, 30),
('Tacos', 5.00, 50);

INSERT INTO Bebidas (NombreBebida, Stock, Precio)
VALUES 
('Coca Cola', 100, 1.50),
('Agua Mineral', 150, 1.00),
('Cerveza', 80, 2.50),
('Jugo de Naranja', 120, 2.00),
('Vino Tinto', 50, 10.00);

INSERT INTO TipoUsuario (Tipo)
VALUES (1), (2);

INSERT INTO Usuario (Email, Contrasenia, IdTipoUsuario,Nombre,Apellido)
VALUES 
('cliente@ejemplo.com', 'password123', 2,'Gianfri','Panta'),
('mesero@ejemplo.com', 'password123', 2,'n','m'),
('admin@ejemplo.com', 'admin123', 1,'y','u');

INSERT INTO Mesas (NumeroMesa)
VALUES (1), (2), (3), (4), (5);

insert into MesasAsignadas (IdMesa,IdUsuario,Fecha)
values
(1,1,getdate()),(2,1,getdate())