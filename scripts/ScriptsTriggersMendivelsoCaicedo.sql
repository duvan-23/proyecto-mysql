-- trigger para cuando eliminan un cliente
DROP TRIGGER IF EXISTS ecommerce_coder.trg_log_cliente_delete;
DELIMITER //
CREATE TRIGGER ecommerce_coder.trg_log_cliente_delete AFTER delete ON ecommerce_coder.cliente
FOR EACH ROW 
BEGIN

INSERT INTO ecommerce_coder.log_cliente (accion , usuario, nombre_cliente, dni, dni_nuevo, fecha)
VALUES ( 'Delete' , CURRENT_USER() , old.nombre, old.dni,"N/A", NOW());

END//
DELIMITER ;

-- trigger para cuando actualicen nombre o dni de un cliente
DROP TRIGGER IF EXISTS ecommerce_coder.trg_log_cliente_update;
DELIMITER //
CREATE TRIGGER ecommerce_coder.trg_log_cliente_update BEFORE update ON ecommerce_coder.cliente
FOR EACH ROW 
BEGIN

INSERT INTO ecommerce_coder.log_cliente (accion , usuario, nombre_cliente, dni, dni_nuevo,fecha)
VALUES ( 'Update' , CURRENT_USER() , old.nombre, old.dni, new.dni, NOW());

END//
DELIMITER ;

-- trigger para cuando inserten un pedido
DROP TRIGGER IF EXISTS ecommerce_coder.trg_log_pedido_insert;
DELIMITER //
CREATE TRIGGER ecommerce_coder.trg_log_pedido_insert AFTER insert ON ecommerce_coder.pedido
FOR EACH ROW 
BEGIN

INSERT INTO ecommerce_coder.log_pedido (accion , usuario, id_pedido, fecha)
VALUES ( 'Insert' , CURRENT_USER() , new.id_pedido,  NOW());

END//
DELIMITER ;

-- trigger para cuando eliminen un pedido
DROP TRIGGER IF EXISTS ecommerce_coder.trg_pedido_delete;
DELIMITER //
CREATE TRIGGER ecommerce_coder.trg_log_pedido_delete BEFORE delete ON ecommerce_coder.pedido
FOR EACH ROW 
BEGIN

INSERT INTO ecommerce_coder.log_pedido (accion , usuario, id_pedido, fecha)
VALUES ( 'delete' , CURRENT_USER() , old.id_pedido,  NOW());

END//
DELIMITER ;

-- probar trigger 1 delete
insert into ecommerce_coder.cliente (nombre, dni, telefono, email, ciudad)values("Rocio","2347437",323131312,"rocio@hotamil.com","bogota");
select * from ecommerce_coder.cliente;
delete from ecommerce_coder.cliente where id_cliente = (select id_cliente from ecommerce_coder.cliente where nombre = "Rocio");
select * from ecommerce_coder.log_cliente;

-- probar trigger 2 update
insert into ecommerce_coder.cliente (nombre, dni, telefono, email, ciudad)values("Milan","2949999",864531312,"milan@hotamil.com","bogota");
update ecommerce_coder.cliente set nombre = "Militao", dni = "9999999" where id_cliente =(select id_cliente from ecommerce_coder.cliente where dni = "2949999");
select * from ecommerce_coder.log_cliente;

-- probar trigger 3 insert
insert into ecommerce_coder.pedido (id_cliente, id_producto, id_venta, id_medio_pago)values(1,1,1,1),(1,3,1,1);
select * from ecommerce_coder.log_pedido;

-- probar trigger 4 delete
delete from ecommerce_coder.pedido where id_pedido = (select id_pedido from ecommerce_coder.pedido order by id_pedido desc limit 1);
select * from ecommerce_coder.log_pedido;