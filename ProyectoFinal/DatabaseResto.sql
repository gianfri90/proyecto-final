create database RESTO
GO
USE RESTO

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

create table Platos(
	IdPlato int primary key NOT NULL identity(1,1),	
	NombrePlato varchar(50) not null,
	PrecioPlato money not null,
	stock int not null
);
go

create table Bebidas(
	IdBebida int primary KEY NOT null identity(1,1),
	NombreBebida varchar(50) unique,
	Stock int not null,
	Precio money not null
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

create or alter procedure sp_ListarMesa
as
begin
	SELECT m.IdMesa as IdMesa , m.NumeroMesa as NumeroMesa from Mesas m
end
GO 

create or alter procedure sp_ListarMesasAsignadas
as
begin
	SELECT  m.NumeroMesa as NumeroMesa,  Mm.IdUsuario as IdUsuario, u.Nombre as Nombre, Mm.Fecha as fecha from MesasAsignadas Mm
	inner join Usuario u on Mm.IdUsuario = u.IdUsuario
	inner join Mesas m on Mm.IdMesa = m.IdMesa
end
GO 

create procedure sp_listarUsuario
as
begin
	SELECT IdUsuario, Nombre from Usuario
end
go

CREATE procedure sp_ListarMesasSinAsignar
as
begin
	SELECT m.IdMesa, m.NumeroMesa FROM Mesas m WHERE m.IdMesa NOT IN (SELECT ma.IdMesa FROM MesasAsignadas ma)
end
go

create procedure spAsignarMesero(
	@IdMesero int,
	@IdMesa int
)
as
begin
	insert into MesasAsignadas (IdMesa,IdUsuario,fecha) values (@IdMesa,@IdMesero,getdate())
end



