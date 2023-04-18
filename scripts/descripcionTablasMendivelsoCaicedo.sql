-- crear esquema
create schema if not exists ecommerce_coder ;
use ecommerce_coder;

-- tabla cliente
-- en esta tabla se tiene la información del cliente
CREATE TABLE ecommerce_coder.cliente (
    id_cliente int NOT NULL  AUTO_INCREMENT,
    nombre varchar(100) NOT NULL,
    dni varchar(100) NOT NULL UNIQUE,
    telefono int  NOT NULL,
    email varchar(30) NOT NULL,
    ciudad varchar(30) NOT NULL,
    CONSTRAINT PK_cliente PRIMARY KEY (id_cliente)
);

-- tabla pedido
--  en esta tabla se tiene la información del pedido, saber que cliente, producto, venta, medio de pago y fecha esta ligado a ese pedido
CREATE TABLE ecommerce_coder.pedido (
    id_pedido int NOT NULL  AUTO_INCREMENT,
    id_cliente int NOT NULL,
    id_producto int NOT NULL,
    id_venta int NOT NULL,
    id_medio_pago int NOT NULL,
    fecha datetime NOT NULL default current_timestamp,
    CONSTRAINT PK_pedido PRIMARY KEY (id_pedido)
);

-- tabla productos
--  en esta tabla esta el nombre del producto, el precio y adicional para saber a que categoria  y proveedor corresponde ese producto
CREATE TABLE ecommerce_coder.producto (
    id_producto int NOT NULL  AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
    precio int  NOT NULL,
    id_categoria int NOT NULL,
    id_proveedor int NOT NULL,
    CONSTRAINT PK_producto PRIMARY KEY (id_producto)
);

-- tabla venta
-- en esta tabla esta la información de la venta, cantidad de productos, valor total de la venta y el vendedor que realizo la venta
CREATE TABLE ecommerce_coder.venta (
    id_venta int NOT NULL  AUTO_INCREMENT,
	cant_prod int  NOT NULL,
    valor int  NOT NULL,
    id_vendedor int NOT NULL,
    CONSTRAINT PK_venta PRIMARY KEY (id_venta)
);

-- tabla medio de pago
--  en esta tabla esta el nombre y descuento de cada medio de pago
CREATE TABLE ecommerce_coder.medio_pago (
    id_medio_pago int NOT NULL  AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
    descuento int  NOT NULL,
    CONSTRAINT PK_medio_pago PRIMARY KEY (id_medio_pago)
);

-- tabla categoria
-- en esta tabla esta el nombre de cada categoria de los productos
CREATE TABLE ecommerce_coder.categoria (
    id_categoria int NOT NULL  AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
    CONSTRAINT PK_categoria PRIMARY KEY (id_categoria)
);

-- tabla proveedor
-- en esta tabla esta el nombre de cada proveedor de productos que se tenga
CREATE TABLE ecommerce_coder.proveedor (
    id_proveedor int NOT NULL  AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
    CONSTRAINT PK_proveedor PRIMARY KEY (id_proveedor)
);

-- tabla vendedor
-- en esta tabla se tiene el nombre de los vendedores 
CREATE TABLE ecommerce_coder.vendedor (
    id_vendedor int NOT NULL  AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
    CONSTRAINT PK_vendedor PRIMARY KEY (id_vendedor)
);

-- tabla log_clientes
--  en esta tabla esta log de eliminacion de clientes
CREATE TABLE ecommerce_coder.log_cliente (
    id_log_cliente int NOT NULL  AUTO_INCREMENT,
	accion VARCHAR(10) NOT NULL,
	usuario VARCHAR(100) NOT NULL, 
    nombre_cliente varchar(100) NOT NULL,
    dni varchar(100) NOT NULL ,
    dni_nuevo varchar(100) NOT NULL ,
	fecha datetime NOT NULL default current_timestamp , 
    CONSTRAINT PK_log_cliente PRIMARY KEY (id_log_cliente)
);

-- tabla log_pedidos
--  en esta tabla esta log de eliminacion de clientes
CREATE TABLE ecommerce_coder.log_pedido(
    id_log_pedido int NOT NULL  AUTO_INCREMENT,
	accion VARCHAR(10) NOT NULL,
	usuario VARCHAR(100) NOT NULL, 
	id_pedido int NOT NULL,
	fecha datetime NOT NULL default current_timestamp , 
    CONSTRAINT PK_log_cliente PRIMARY KEY (id_log_pedido)
);


-- foreign keys pedido

-- Reference: FK_pedido_cliente (table: pedido)
ALTER TABLE  ecommerce_coder.pedido ADD CONSTRAINT FK_pedido_cliente FOREIGN KEY FK_pedido_cliente (id_cliente)
    REFERENCES ecommerce_coder.cliente (id_cliente);

-- Reference: FK_pedido_producto (table: pedido)
ALTER TABLE  ecommerce_coder.pedido ADD CONSTRAINT FK_pedido_producto FOREIGN KEY FK_pedido_producto (id_producto)
    REFERENCES ecommerce_coder.producto (id_producto);

-- Reference: FK_pedido_venta (table: pedido)
ALTER TABLE  ecommerce_coder.pedido ADD CONSTRAINT FK_pedido_venta FOREIGN KEY FK_pedido_venta (id_venta)
    REFERENCES ecommerce_coder.venta (id_venta);
    
-- Reference: FK_pedido_medio_pago (table: pedido)
ALTER TABLE  ecommerce_coder.pedido ADD CONSTRAINT FK_pedido_medio_pago FOREIGN KEY FK_pedido_medio_pago (id_medio_pago)
    REFERENCES ecommerce_coder.medio_pago (id_medio_pago);
    



-- foreign keys productos
-- Reference: FK_producto_categoria (table: producto)
ALTER TABLE  ecommerce_coder.producto ADD CONSTRAINT FK_producto_categoria FOREIGN KEY FK_producto_categoria (id_categoria)
    REFERENCES ecommerce_coder.categoria (id_categoria);

-- Reference: FK_producto_proveedor (table: producto)
ALTER TABLE  ecommerce_coder.producto ADD CONSTRAINT FK_producto_proveedor FOREIGN KEY FK_producto_proveedor (id_proveedor)
    REFERENCES ecommerce_coder.proveedor (id_proveedor);
    
    
    

-- foreign keys ventas
-- Reference: FK_venta_vendedor (table: venta)
ALTER TABLE  ecommerce_coder.venta ADD CONSTRAINT FK_venta_vendedor FOREIGN KEY FK_venta_vendedor (id_vendedor)
    REFERENCES ecommerce_coder.vendedor (id_vendedor);
    



