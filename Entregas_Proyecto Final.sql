CREATE SCHEMA e_commerce;


USE e_commerce;

CREATE TABLE Ventas_tienda (
IdOrden int,
IDCliente int,
IDProducto int,
IDVendedor int,
IDComprador int,
IDventa int NOT NULL AUTO_INCREMENT,
PRIMARY KEY (IDventa)
);

CREATE TABLE Ordenes (
IDOrden int NOT NULL AUTO_INCREMENT,
Fecha_Compra datetime NOT NULL,
Fecha_Envio datetime NOT NULL,
Fecha_Recepcion datetime NOT NULL,
IDMedio_Pago int,
IDDomicilio_Despacho int,
IDDomicilio_Entrega int,
Reseña varchar(250),
primary key (IDOrden)
);

CREATE TABLE Productos (
IDProducto int NOT NULL auto_increment,
Categoria varchar(50),
Subcategoria varchar(50),
Nombre varchar(50),
Marca varchar (50),
Submarca varchar(50),
Descripcion varchar(250),
Stock int,
Vendidos int,
Precio float,
Estado bool	NOT NULL,
Calificacion decimal(2,1),
primary key (IDProducto)
);


CREATE TABLE Vendedores (
IDVendedor int NOT NULL auto_increment,
Nombre varchar(50),
Apellido varchar(50),
Tipo_DNI varchar(20),
DNI varchar(20),
IDDomicilio_Despacho int,
email varchar(50),
telefono varchar(50),
primary key (IDVendedor)
);

CREATE TABLE Domicilio_Vendedores (
IDDomicilio_Despacho int NOT NULL auto_increment,
Pais varchar(50),
Provincia varchar(50),
Municipio varchar(50),
Calle varchar(50),
Numero varchar(10),
Piso varchar(10),
Puerta varchar(10),
Codigo_Postal varchar(10),
primary key (IDDomicilio_Despacho)
);

CREATE TABLE Clientes (
IDCliente int NOT NULL auto_increment,
Nombre varchar(50),
Apellido varchar(50),
Tipo_DNI varchar(20),
DNI varchar(20),
IDDomicilio_Entrega int,
IDMedio_Pago int,
email varchar(50),
telefono varchar(50),
primary key (IDCliente)
);

CREATE TABLE Domicilio_Clientes (
IDDomicilio_Entrega int NOT NULL auto_increment,
Pais varchar(50),
Provincia varchar(50),
Municipio varchar(50),
Calle varchar(50),
Numero varchar(10),
Piso varchar(10),
Puerta varchar(10),
Codigo_Postal varchar(10),
primary key (IDDomicilio_Entrega)
);


CREATE TABLE Medios_Pago (
IDMedio_Pago int NOT NULL auto_increment,
Empresa_Emisora varchar(50),
Banco_Emisor varchar(50),
Numero int,
Vencimiento varchar(50),
primary key (IDMedio_Pago)
);

USE e_commerce;
ALTER TABLE ventas_tienda 
ADD CONSTRAINT fk_idorden FOREIGN KEY (IDOrden) REFERENCES ordenes(IDOrden);

ALTER TABLE ventas_tienda 
ADD CONSTRAINT fk_idcliente FOREIGN KEY (IDCliente) REFERENCES clientes(IDCliente);

ALTER TABLE ventas_tienda
ADD CONSTRAINT fk_idproducto FOREIGN KEY (IDProducto) REFERENCES productos(IDProducto);

ALTER TABLE ventas_tienda
ADD CONSTRAINT fk_idvendedor FOREIGN KEY (IDVendedor) REFERENCES vendedores(IDVendedor);

ALTER TABLE ventas_tienda
ADD CONSTRAINT fk_idcomprador FOREIGN KEY (IDComprador) REFERENCES clientes(IDCliente);

ALTER TABLE ordenes
ADD CONSTRAINT fk_mediodepago FOREIGN KEY (IDMedio_Pago) REFERENCES medios_pago(IDMedio_Pago);

ALTER TABLE ordenes
ADD CONSTRAINT fk_despacho FOREIGN KEY (IDDomicilio_Despacho) REFERENCES domicilio_vendedores(IDDomicilio_Despacho);

ALTER TABLE ordenes
ADD CONSTRAINT fk_entrega FOREIGN KEY (IDDomicilio_Entrega) REFERENCES domicilio_clientes(IDDomicilio_Entrega);

ALTER TABLE vendedores
ADD CONSTRAINT fk_despachos FOREIGN KEY (IDDomicilio_Despacho) REFERENCES domicilio_vendedores(IDDomicilio_Despacho);

ALTER TABLE clientes
ADD CONSTRAINT fk_entregas FOREIGN KEY (IDDomicilio_Entrega) REFERENCES domicilio_clientes(IDDomicilio_Entrega);

ALTER TABLE clientes
ADD constraint fk_pago FOREIGN KEY (IDMedio_Pago) REFERENCES medios_pago(IDMedio_Pago);











