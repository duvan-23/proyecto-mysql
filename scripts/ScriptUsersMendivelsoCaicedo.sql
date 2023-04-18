use mysql;

-- creación de los dos usuarios
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY '123';
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY '123';

-- permiso para el usuario1 de solo lectura para todas las tablas de ecommerce_coder
GRANT SELECT ON ecommerce_coder.* TO 'usuario1'@'localhost';

-- permiso para el usuario2 de lectura, insert y update para todas las tablas de ecommerce_coder
GRANT SELECT, INSERT, UPDATE ON ecommerce_coder.* TO 'usuario2'@'localhost';
-- MOSTAR PERMISOS DE USUARIO
SHOW GRANTS FOR 'usuario1'@'localhost';
SHOW GRANTS FOR 'usuario2'@'localhost';