create database RESTO
GO
USE RESTO

CREATE table Mesas(
	IdMesa int primary key identity(1,1),
	NumeroMesa int unique
)

create table Platos(
	IdPlato int primary key identity(1,1),
	NombrePlato varchar(50) not null,
	Descripcion varchar(50),
	PrecioPlato money not null,
	stock int not null
)

create table Bebidas(
	IdBebida int primary key identity(1,1),
	NombreBebida varchar(50) unique,
	Stock int not null,
	Precio money not null
)
