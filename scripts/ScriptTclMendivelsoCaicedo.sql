use ecommerce_coder;
SET @@autocommit = 0;
SET @@SQL_SAFE_UPDATES = 0;
SET @@foreign_key_checks = 0;


--                       primera TRANSACTION
select * from ecommerce_coder.vendedor;
START TRANSACTION;
delete from ecommerce_coder.vendedor where id_vendedor in (5,6);
-- ROLLBACK;
COMMIT;
select * from ecommerce_coder.vendedor;
-- Para insertar de nuevo los datos eliminados
-- insert into ecommerce_coder.vendedor(id_vendedor,nombre) values(5,'Ximena jizz'),(6,'Vannesa Paez');


--                       segunda TRANSACTION
select * from ecommerce_coder.proveedor;
START TRANSACTION;
insert into ecommerce_coder.proveedor(nombre) values("proveedor1");
insert into ecommerce_coder.proveedor(nombre) values("proveedor2");
insert into ecommerce_coder.proveedor(nombre) values("proveedor3");
insert into ecommerce_coder.proveedor(nombre) values("proveedor4");
SAVEPOINT sp1;
insert into ecommerce_coder.proveedor(nombre) values("proveedor5");
insert into ecommerce_coder.proveedor(nombre) values("proveedor6");
insert into ecommerce_coder.proveedor(nombre) values("proveedor7");
insert into ecommerce_coder.proveedor(nombre) values("proveedor8");
SAVEPOINT sp2;
ROLLBACK TO sp1;
COMMIT;
select * from ecommerce_coder.proveedor;