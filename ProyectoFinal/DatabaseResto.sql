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
	Imagen varchar(300)
);
go

create table MesasAsignadas(
	IdMesa int foreign key references Mesas(IdMesa),
	IdUsuario int foreign key references Usuario(IdUsuario),
	Fecha date,
	primary key(IdMesa,Fecha)
)
go

create table factura(
	IdFactura int primary key not null identity(1,1),
	IdMesa int foreign key references Mesas(IdMesa),
	Estado varchar(50) not null default('ABIERTA')
)
go

create table DetalleMesa(
	IdDetalle int primary key not null identity(1,1),
	IdPlato int foreign key references Menu(IdPlato),
	IdFactura int foreign key references factura(IdFactura)
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

create or alter procedure sp_BuscarUsuario(
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
	select IdPlato, Nombre, Precio, Stock, Imagen from Menu where Stock > 0
END
go

create or alter procedure sp_ExisteMesaAsignada(
	@IdMesa int
)as
begin
	select IdMesa from MesasAsignadas ma where Fecha = CAST(GETDATE() AS DATE) and IdMesa = @IdMesa
end
go

create or alter procedure sp_ListarDetalle(
	@IdMesa int
)AS 
BEGIN 
	select dm.IdDetalle as IdDetalle, m.Nombre as Nombre, m.Precio as Precio, f.IdMesa as IdMesa from DetalleMesa dm
	inner join factura f on f.IdFactura = dm.IdFactura 
	inner join Menu m on m.IdPlato = dm.IdPlato 
	where f.IdMesa = @IdMesa
END
go

create or alter procedure sp_AsignarPlato(
	@IdPlato int,
	@IdMesa int
)as
begin
	DECLARE @IdFactura int
	select @IdFactura = IdFactura from factura f where @IdMesa = IdMesa and f.Estado = 'ABIERTA'
	insert into DetalleMesa (IdPlato,IdFactura) values (@IdPlato,@IdFactura)
	update Menu
	set stock = stock - 1
	where IdPlato = @IdPlato
end
go

create or alter procedure sp_BuscarFactura(
	@IdMesa int
)as
begin
	select IdFactura FROM factura f where f.Estado = 'ABIERTA' and f.IdMesa  = @IdMesa
end
go

create or alter procedure sp_AgregarFactura(
	@IdMesa int
)AS 
BEGIN 
	insert into factura (IdFactura)
	values(@IdMesa)
END
go

CREATE or alter PROCEDURE sp_CerrarFactura(
	@IdMesa int
)AS 
BEGIN 
	UPDATE factura 
	set Estado = 'CERRADO'
	where IdMesa = @IdMesa
END


