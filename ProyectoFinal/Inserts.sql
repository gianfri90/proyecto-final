USE RESTO
GO

INSERT INTO Menu (Nombre, Precio, stock,imagen,estado)
VALUES 
('Pizza Margherita', 8.99, 20,'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/f33d5e96-f960-486f-94ac-cbabe3074ead/Derivates/0454bd7c-c1e3-4010-9a74-39aa130417ba.jpg',1),
('Spaghetti Bolognese', 12.50, 15,null,1),
('Ensalada César', 7.00, 25,'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/f33d5e96-f960-486f-94ac-cbabe3074ead/Derivates/0454bd7c-c1e3-4010-9a74-39aa130417ba.jpg',1),
('Hamburguesa', 10.00, 30,null,1),
('Tacos', 5.00, 50,null,1);
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

select * from factura
select * from DetalleMesa dm 