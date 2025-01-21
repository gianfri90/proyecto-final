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
	NumeroMesa int unique,
	Estado bit not null
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

create table MeseroxMesa(
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
	SELECT m.IdMesa as IdMesa , m.NumeroMesa as NumeroMesa, m.Estado as Estado from Mesas m
end
GO 

create or alter procedure sp_ListarMeseroXmesa
as
begin
	SELECT  m.NumeroMesa as NumeroMesa,  Mm.IdUsuario as IdUsuario, u.Nombre as Nombre, Mm.Fecha as fecha from MeseroXmesa Mm
	inner join Usuario u on Mm.IdUsuario = u.IdUsuario
	inner join Mesas m on Mm.IdMesa = m.IdMesa
end



