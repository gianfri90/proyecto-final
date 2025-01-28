create database RESTO
GO
USE RESTO
go

CREATE TABLE TipoUsuario(
	IdTipoUsuario int PRIMARY KEY NOT NULL identity(1,1),
	Tipo int NOT null
);
go

CREATE TABLE Usuario(
	IdUsuario int PRIMARY KEY NOT NULL identity(1,1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Email varchar(50) NOT NULL unique,
	Contrasenia varchar(50) NOT NULL,
	IdTipoUsuario int FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)
);
go

CREATE table Mesas(
	IdMesa int primary key NOT NULL identity(1,1),
	NumeroMesa int unique
);
go

create table Menu(
	IdPlato int primary key NOT NULL identity(1,1),	
	Nombre varchar(50) not null,
	Precio money not null,
	stock int not null,
	Imagen varchar(150)
);
go

create table MesasAsignadas(
	IdMesa int foreign key references Mesas(IdMesa),
	IdUsuario int foreign key references Usuario(IdUsuario),
	Fecha date,
	primary key(IdMesa,Fecha)
)
go

create procedure sp_IniciarSesion(
	@Email varchar(250), 
	@Contraseña varchar(50)
)as
begin
	select IdUsuario, Nombre, Apellido, Email, Contrasenia, IdTipoUsuario from Usuario WHERE Email = @Email and  Contrasenia = @Contraseña
end
go

create procedure sp_RegistarUsuariio(
	@Email varchar(250),
	@contraseña varchar(50),
	@Nombre varchar(50),
	@Apellido varchar(50)
)AS 
BEGIN 
	insert into Usuario (Email, Contrasenia, IdTipoUsuario,Nombre,Apellido)
	values (@Email,@contraseña,2,@Nombre,@Apellido)
END
go

create procedure sp_BuscarUsuario(
	@Email varchar(250)
)AS 
BEGIN 
	select u.IdUsuario from Usuario u where u.Email = @Email
END
GO 

create or alter procedure sp_ListarMesa(
	@IdUsuario int
)as
begin
	SELECT m.IdMesa as IdMesa , m.NumeroMesa, u.Nombre as NumeroMesa from Mesas m
	inner join MesasAsignadas ma on ma.IdMesa = m.IdMesa
	inner join Usuario u on u.IdUsuario = ma.IdUsuario
	where u.IdUsuario = @IdUsuario and ma.Fecha = CAST(GETDATE() AS DATE)
end
GO 

create or alter procedure sp_ListarMesasAsignadas
as
begin
	SELECT  m.NumeroMesa as NumeroMesa,  ma.IdUsuario as IdUsuario, u.Nombre as Nombre, ma.Fecha as fecha, m.IdMesa as IdMesa from Mesas m 
	left join (select * from MesasAsignadas ma2 where ma2.Fecha = CAST(GETDATE() AS DATE)) ma on m.IdMesa  = ma.IdMesa 
	left join Usuario u on u.IdUsuario = ma.IdUsuario
	select * from MesasAsignadas ma
end
GO 

create or alter procedure sp_listarUsuario
as
begin
	SELECT IdUsuario, Nombre from Usuario WHERE IdTipoUsuario = 2
end
go


create or alter procedure sp_AsignarMesero(
	@IdMesa int,
	@IdMesero int
)as
begin
	IF NOT EXISTS (SELECT * FROM MesasAsignadas WHERE IdMesa = @IdMesa AND fecha = CAST(GETDATE() AS DATE))
	BEGIN
	    INSERT INTO MesasAsignadas (IdMesa, IdUsuario, Fecha)
	    VALUES (@IdMesa, @IdMesero, GETDATE())
	END
	ELSE
	BEGIN
	    UPDATE MesasAsignadas
	    SET IdUsuario = @IdMesero
	    WHERE IdMesa = @IdMesa
	END
end
GO 

create or alter procedure sp_ListarMenu
AS
BEGIN 
	select IdPlato, Nombre, Precio, Stock, Imagen from Menu
END



