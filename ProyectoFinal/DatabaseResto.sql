create database RESTO
GO
USE RESTO

CREATE table Mesas(
	IdMesa int primary key NOT NULL identity(1,1),
	NumeroMesa int unique
);

create table Platos(
	IdPlato int primary key NOT NULL identity(1,1),	
	NombrePlato varchar(50) not null,
	PrecioPlato money not null,
	stock int not null
);

create table Bebidas(
	IdBebida int primary KEY NOT null identity(1,1),
	NombreBebida varchar(50) unique,
	Stock int not null,
	Precio money not null
);

CREATE TABLE TipoUsuario(
	IdTipoUsuario int PRIMARY KEY NOT NULL identity(1,1),
	Tipo int NOT null
);

CREATE TABLE Usuario(
	IdUsuario int PRIMARY KEY NOT NULL identity(1,1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Email varchar(50) NOT NULL unique,
	Contrasenia varchar(50) NOT NULL,
	IdTipoUsuario int FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)
);

create or alter procedure sp_IniciarSesion(
	@Email varchar(250), 
	@Contraseña varchar(50)
)as
begin
	select IdUsuario, Nombre, Apellido, Email, Contrasenia, IdTipoUsuario from Usuario WHERE Email = @Email and  Contrasenia = @Contraseña
end

