-- función para calcular  el interes de un valor, teniendo en cuenta el id de medio de pago
-- primer parametro es el id_medio_pago y el segundo el valor al que se calculará el procentaje

drop function if exists ecommerce_coder.fn_descuento ;
DELIMITER //

CREATE FUNCTION ecommerce_coder.fn_descuento ( medio_pago INT, valor int )
RETURNS text
deterministic 
BEGIN

   DECLARE valor_final float;
   DECLARE valor_salida text;
   SET valor_final = 0;
   SELECT valor*((mp.descuento/100))  into valor_final FROM ecommerce_coder.medio_pago as mp WHERE mp.id_medio_pago = medio_pago;
   SET valor_salida = CONCAT("$",valor_final);
   RETURN valor_salida;

END; //

DELIMITER ;

-- funcion para contar cuantos pedidos tiene un cliente mediante el dni 
-- se realiza una sub consulta para mediante el dni obtener el id del cliente y encontrar los pedidos conectados a ese id
drop function if exists ecommerce_coder.fn_no_pedidos ;
DELIMITER //

CREATE FUNCTION ecommerce_coder.fn_no_pedidos ( dni_cliente varchar(100) )
RETURNS int
deterministic 
BEGIN

   DECLARE total int;
   SET total = 0;
   select count(*) into total from ecommerce_coder.pedido where id_cliente = (select id_cliente from ecommerce_coder.cliente where dni = dni_cliente);
   RETURN total;

END; //

DELIMITER ;

-- prueba de las dos funciones
select ecommerce_coder.fn_descuento(3,100000);

select ecommerce_coder.fn_no_pedidos("122333");
