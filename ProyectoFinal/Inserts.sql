USE RESTO
GO

INSERT INTO Menu (Nombre, Precio, stock, Imagen, estado)
VALUES 
('Hamburguesa Clásica', 10.00, 50, 'https://imgs.search.brave.com/90zJSBrtc7B4DghaxLF36Xn_ax0gs2CPtGcPUBF7_pA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMudG1lY29zeXMu/Y29tL2ltYWdlL3Vw/bG9hZC90X3dlYjc2/N3g2MzkvaW1nL3Jl/Y2lwZS9yYXMvQXNz/ZXRzL0ZCQjczRjkx/LTJBNEYtNDc1RS1C/QjI1LUNFMTJENzJD/OUQxOS9EZXJpdmF0/ZXMvZDFlZGRjYmMt/NTYwNC00NTkyLWJi/ODUtMWVmNzBlZTE1/Zjk2LmpwZw', 1),
('Hamburguesa Bacon', 12.50, 30, 'https://imgs.search.brave.com/FifY2QbM7BLA76_pPBMluuPBW2PTMH474F6qaemyaYA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zLWFw/aS5xY2FydC5hcHAv/aW1hZ2VzL2NvbW9x/dWllcm8tdXBsb2Fk/cy9pbWFnZXMvcmVj/aXBlcy9vcmlnaW5h/bHMvNjAyMi5qcGc_/cz03MTZ4NjAwJmZp/dD1jb3ZlciZleHQ9/d2VicA', 1),
('Hamburguesa BBQ', 14.00, 20, 'https://imgs.search.brave.com/gp6ZCjD-MPamGWfThQynT7g7QV97vl1RekXRQ1CvdpI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9iYW1i/dWxlYnVyZ2VyLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/NC8wNS9iYW1idWxl/YnVyZ3Vlci1oYW1i/dXJndWVzYS1iYnFj/aGlja2VuLTItMS5q/cGc', 1),
('Hamburguesa Vegetariana', 11.50, 40, 'https://imgs.search.brave.com/aKHJjNA7OzF0XZkJkgd-MipSOzIoYvJdtzyDYtimQJc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jb250/ZW50LWNvY2luYS5s/ZWN0dXJhcy5jb20v/bWVkaW8vMjAyMy8w/Ni8yMi9oYW1idXJn/dWVzYS1kZS1sZW50/ZWphc19jMjY4ZGI4/Nl82MDB4NjAwLmpw/Zw', 1),
('Hamburguesa Doble', 16.00, 25, 'https://imgs.search.brave.com/j9abQlifCydVWGX-n0roz9wQBlhIHsAg2lF2hEYm-rw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jYWNo/ZS1tY2QtbWlkZGxl/d2FyZS5tY2RvbmFs/ZHNjdXBvbmVzLmNv/bS9tZWRpYS9pbWFn/ZS9wcm9kdWN0JGtz/WGtXWVU1LzIwMC8y/MDAvb3JpZ2luYWw_/Y291bnRyeT1hcg', 1),
('Hamburguesa Picante', 13.00, 35, 'https://imgs.search.brave.com/r3k0E-_4xk4B2iz7BI0D0eP2-LyPowqwr0T1jcflHak/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dW5pbGV2ZXJmb29k/c29sdXRpb25zLmVz/L2RhbS9nbG9iYWwt/dWZzL21jb3MvU1BB/SU4vY2FsY21lbnUv/cmVjaXBlcy9FUy1y/ZWNpcGVzL2dlbmVy/YWwvaGFtYnVyZ3Vl/c2EtZGUtbm90ZXJu/ZXJhLXBpY2FudGUv/bWFpbi1oZWFkZXIu/anBn', 1),
('Hamburguesa con Huevo', 15.00, 45, 'https://imgs.search.brave.com/rTtZ_5nzv_MLD66aLrbNHw4bgGf7_wsl6DGD4osi40I/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zMy5h/YmNzdGF0aWNzLmNv/bS9hYmMvc2V2aWxs/YS9tZWRpYS9ndXJt/ZXNldmlsbGEvMjAx/MC8wOC9oYW1idXJn/dWVzYS1odWV2by5q/cGc', 1),
('Coca-Cola', 2.50, 100, 'https://imgs.search.brave.com/soygyIGDV1N3Rz066a8OCeQW2togFvbWwoXLUpLfBYA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTEz/NTQ3ODY2L3Bob3Rv/L2NsYXNzaWMtYm90/dGxlLW9mLWNvY2Et/Y29sYS5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9ZTBwRHNh/Z2ItdUd0QTZFdnJE/dkktYVVYdGRnV1ZG/cndXNFlIUllXQVpX/cz0', 1),
('Pepsi', 2.50, 90, 'https://imgs.search.brave.com/B4G4_lsrKiUVjOLLgmIDgKbGOV6h_tArqTmhJqBoJMA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzA0LzAxLzAxLzA4/LzM2MF9GXzQwMTAx/MDg2Nl8ydnR5YjUy/UVdCUVZ6ZHdVM1VV/Qklpc1NNeDF0Qk0w/My5qcGc', 1),
('Agua Mineral', 1.50, 120, 'https://imgs.search.brave.com/KquNxXfUX1veiK-eVhE-YUNoVYaaC9hBipN_GOSVSAw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWNzLmRpbm9vbmxp/bmUuY29tLmFyL2lt/YWdlbmVzL2Z1bGxf/NjAweDYwMF9tYS8z/MDQwMzM5X2YuanBn', 1),
('Fanta', 2.00, 80, 'https://imgs.search.brave.com/8-w7-Hds7nGzNTYLlVxnIi99hNY8TELlSQJIWQyzC5s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy8y/LzI0L01leGljYW5f/RmFudGEuanBn', 1)
go


INSERT INTO TipoUsuario (Tipo)
VALUES (1), (2);
go

INSERT INTO Usuario (Email, Contrasenia, IdTipoUsuario,Nombre,Apellido)
VALUES 
('mesero2@ejemplo.com', 'password123', 2,'Mesero1','ejemplo1'),
('mesero@ejemplo.com', 'password123', 2,'Mesero2','ejempl2'),
('admin@ejemplo.com', 'admin123', 1,'Admin','')
go

INSERT INTO Mesas (NumeroMesa)
VALUES (1), (2), (3), (4), (5), (10);
go
