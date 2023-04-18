use ecommerce_coder;

-- procedimiento para buscar un cliente por dni y mostar cuantos productos ha comprado, el mas barato, el mas caro y el valor total de las compras
 DROP PROCEDURE IF EXISTS ecommerce_coder.sp_calcula_compras_cliente;
 delimiter // 
 create procedure ecommerce_coder.sp_calcula_compras_cliente ( in cliente_dni int(11) , 
                                   out cliente_nombre text ,
                                   out  cliente_precio_min text,
                                   out  cliente_precio_max text,
                                   out cliente_cantidad_productos int(11),
                                   out cliente_total_compras text)
begin 
	select cl.nombre as "Cliente",CONCAT("$",min(pr.precio)) as "Precio Minimo", CONCAT("$",max(pr.precio)) as "Precio Maximo",COUNT(*) as productos,
    CONCAT("$",CONVERT(SUM(ve.valor), CHAR)) as "Total Compras" into cliente_nombre, cliente_precio_min, cliente_precio_max, cliente_cantidad_productos, cliente_total_compras
	from ecommerce_coder.cliente cl 
	inner join ecommerce_coder.pedido pe on cl.id_cliente=pe.id_cliente
	inner join ecommerce_coder.producto pr on pr.id_producto=pe.id_producto
	inner join ecommerce_coder.venta ve on ve.id_venta=pe.id_venta
	where cl.dni = cliente_dni
	GROUP BY cl.nombre 
	ORDER BY productos DESC;
end//
delimiter ; 


-- procedimiento para buscar tabla, ordenar por un campo en especifico y si es asc o desc, la primera variable es el campo, es segundo es la tabla y el tercero es para saber si es asc o desc por boolean
 DROP PROCEDURE IF EXISTS ecommerce_coder.sp_busca_tabla;
 delimiter // 
 create procedure ecommerce_coder.sp_busca_tabla ( in campo_orden text ,in tabla text, in tipo_orden boolean)
begin 
		SET @finalQuery = CONCAT('SELECT id_',tabla,', ',campo_orden,' from ',tabla,' order by ',campo_orden,' ',IF(tipo_orden,"asc","desc"));
        PREPARE resultado FROM @finalQuery;
        EXECUTE resultado ;
        DEALLOCATE PREPARE resultado;
end//
delimiter ; 



-- procedimiento para insertar o eliminar un registro en la tabla categoria, primer campo es el nombre de la categoria, el segundo valor es para saber si insertar o eliminar
DROP PROCEDURE IF EXISTS ecommerce_coder.sp_categoria;
 delimiter // 
 create procedure ecommerce_coder.sp_categoria ( in categoria_in text , in operacion TINYINT(2))
begin 
		IF operacion = 1 THEN 
		   insert into ecommerce_coder.categoria (nombre) Values(categoria_in);
		else 
			Delete from ecommerce_coder.categoria where id_categoria= (select id_categoria from categoria where nombre =categoria_in );
		END IF;
        
end//
delimiter ; 


-- prueba procedimiento 1
-- valor dni para buscar el cliente
call ecommerce_coder.sp_calcula_compras_cliente(736483, @nombre, @minimo, @maximo, @cantidad, @total);
select  @nombre as "nombre cliente", @minimo as "Precio minimo", @maximo as "Precio maximo", @cantidad as "Cantidad productos", @total as "Total compras";

-- prueba procedimiento 2
-- primer valor es el campo a ordenar, el segundo es la tabla y el tercero es false o true para ordenar desc o asc
call ecommerce_coder.sp_busca_tabla("precio","producto",true);


-- prueba procedimiento 3
-- primer valor nombre de categoria, segundo valor 1, para insertar,0 para eliminar
call ecommerce_coder.sp_categoria("sports",0);
select * from ecommerce_coder.categoria;