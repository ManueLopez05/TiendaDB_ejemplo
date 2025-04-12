drop database if exists storesales;

create database storesales;
use storesales;

drop table if exists productos;
create table productos (
	Id_producto int auto_increment,
	categoria varchar(100) not null,
    producto varchar(100) default null,
	costo int default null,
	primary key (Id_producto)
);

insert into productos(categoria, producto, costo)
values
('Martillo de acero', 'Herramientas manuales', 120.00),
('Destornillador plano', 'Herramientas manuales', 35.00),
('Juego de llaves Allen', 'Llaves y fijaciones', 90.00),
('Cinta métrica 5m', 'Medición', 55.00),
('Taladro eléctrico', 'Herramientas eléctricas', 950.00),
('Caja de clavos 2”', 'Clavos y tornillos', 40.00),
('Serrucho manual', 'Herramientas manuales', 130.00),
('Brocas para concreto (juego)', 'Herramientas eléctricas', 110.00),
('Nivel de burbuja', 'Medición', 75.00),
('Lija para madera (pack 10)', 'Abrasivos', 25.00),
('Pintura blanca 1L', 'Pinturas y accesorios', 85.00),
('Rodillo para pintura', 'Pinturas y accesorios', 50.00),
('Tubo PVC 1/2" 3m', 'Plomería', 60.00),
('Codo PVC 90° 1/2"', 'Plomería', 12.00),
('Flexómetro 3m', 'Medición', 45.00);


drop table if exists tiendas;
create table tiendas(
	Id_tienda int auto_increment,
	Nombre_tienda varchar(45) default null,
    Pais varchar(20) default null,
    Ciudad varchar(45) default null,
    primary key(Id_tienda)
);

insert into tiendas(Nombre_tienda, Pais, Ciudad)
values
('Argentina','Buenos Aires','Pintuland'),
('Perú','Lima','La casa del pintor'),
('México','Ciudad de México','Pinturama'),
('Colombia','Bogotá','Super Pinturas');

drop table if exists vendedores;
create table vendedores(
	Id_vendedor int auto_increment,
    Nombre varchar(50) not null,
    Apellido varchar(50) not null,
    Tienda int not null,
    Salario int not null,
    foreign key(Tienda) references tiendas(Id_tienda),
    primary key(Id_vendedor)
);

insert into vendedores(Nombre, Apellido, Tienda, Salario)
values
('Lucía', 'Fernández', 1, 58000),
('Carlos', 'Ramírez', 1, 62000),
('María', 'Torres', 2, 60000),
('José', 'Gómez', 2, 57000),
('Ana', 'López', 3, 65000),
('Javier', 'Martínez', 3, 59000),
('Paola', 'Ríos', 4, 61000),
('Andrés', 'Castaño', 4, 63000);

drop table if exists ventas;
create table ventas(
	Id_venta int auto_increment,
    Producto int not null,
    Vendedor int not null,
    Tienda int not null,
    Unidades int not null,
    Venta_total_$ int not null,
    Fecha timestamp not null default now(),
    foreign key(Producto) references productos(Id_producto),
    foreign key(Vendedor) references vendedores(Id_vendedor),
    foreign key(Tienda) references tiendas(Id_tienda),
    primary key(Id_venta)
);

insert into ventas(Producto, Vendedor, Tienda, Unidades, Venta_total_$)
values
(3, 1, 1, 2, 180.00),
(5, 2, 1, 1, 950.00),
(12, 3, 2, 4, 200.00),
(7, 4, 2, 3, 390.00),
(1, 5, 3, 2, 240.00),
(10, 6, 3, 5, 125.00),
(14, 7, 4, 6, 72.00),
(6, 8, 4, 3, 120.00),
(2, 1, 1, 1, 35.00),
(9, 2, 1, 2, 150.00),
(13, 3, 2, 2, 120.00),
(15, 4, 2, 1, 45.00),
(8, 5, 3, 3, 330.00),
(11, 6, 3, 2, 170.00),
(4, 7, 4, 4, 220.00),
(1, 8, 4, 5, 600.00), 
(5, 1, 1, 1, 950.00),
(6, 2, 1, 6, 240.00),
(7, 3, 2, 2, 260.00),
(3, 4, 2, 4, 360.00),
(9, 5, 3, 1, 75.00),
(10, 6, 3, 3, 75.00),
(11, 7, 4, 2, 170.00),
(12, 8, 4, 1, 50.00),
(13, 1, 1, 5, 300.00),
(14, 2, 1, 2, 24.00),
(15, 3, 2, 3, 135.00),
(2, 4, 2, 4, 140.00),
(8, 5, 3, 2, 220.00),
(4, 6, 3, 1, 55.00);
