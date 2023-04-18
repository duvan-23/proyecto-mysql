
-- Vista para saber todas las caracteristicas de cada producto
create or replace view ecommerce_coder.vw_producto_caracteristicas AS
select pr.nombre as "Nombre producto",CONCAT("$",CONVERT(pr.precio , CHAR))as "Precio producto" 
,ca.nombre as "Categoria producto", pv.nombre as "Proveedor producto" from ecommerce_coder.producto pr 
 inner join ecommerce_coder.categoria ca on ca.id_categoria=pr.id_categoria
 inner join ecommerce_coder.proveedor pv on pv.id_proveedor=pr.id_proveedor;



-- Vista para saber cuantas ventas tiene cada venderdor y el total de ventas de cada uno
create or replace view ecommerce_coder.vw_ventas_vendedores AS
SELECT vd.nombre as "Vendedor",COUNT(*) as ventas,CONCAT("$",CONVERT(SUM(ve.valor), CHAR)) as Total FROM ecommerce_coder.venta ve 
inner join ecommerce_coder.vendedor vd on vd.id_vendedor=ve.id_vendedor
GROUP BY vd.nombre 
ORDER BY Total DESC;


-- Vista para saber cuantas compras tiene cada cliente y el total de compras de cada uno
create or replace view ecommerce_coder.vw_compras_clientes AS
select cl.nombre as "Cliente", COUNT(*) as Compras,CONCAT("$",CONVERT(SUM(ve.valor), CHAR)) as "Total Compras"
from ecommerce_coder.cliente cl 
inner join ecommerce_coder.pedido pe on cl.id_cliente=pe.id_cliente
inner join ecommerce_coder.venta ve on ve.id_venta=pe.id_venta
GROUP BY cl.nombre 
ORDER BY Compras DESC;


-- Vista para reporte de pedidos
create or replace view ecommerce_coder.vw_reporte_pedidos AS
select pe.fecha as "Fecha compra",cl.nombre as "nombre cliente",pr.nombre as "nombre producto",CONCAT("$",CONVERT(pr.precio, CHAR)) as "precio producto" 
,ca.nombre as "categoria producto", pv.nombre as "proveedor producto",
vd.nombre as "nombre vendedor", mp.nombre as "medio de pago", CONCAT(CONVERT(mp.descuento, CHAR),"%") as descuento
from ecommerce_coder.cliente cl 
inner join ecommerce_coder.pedido pe on cl.id_cliente=pe.id_cliente
inner join ecommerce_coder.producto pr on pr.id_producto=pe.id_producto 
inner join ecommerce_coder.categoria ca on ca.id_categoria=pr.id_categoria
inner join ecommerce_coder.proveedor pv on pv.id_proveedor=pr.id_proveedor
inner join ecommerce_coder.venta ve on ve.id_venta=pe.id_venta
inner join ecommerce_coder.vendedor vd on vd.id_vendedor=ve.id_vendedor
inner join ecommerce_coder.medio_pago mp on mp.id_medio_pago=pe.id_medio_pago ORDER BY "nombre cliente" DESC; 
    

-- Vista para validar uso de medios de pago
create or replace view ecommerce_coder.vw_uso_medio_pago AS
select mp.nombre,count(*) as count from  ecommerce_coder.pedido pe
inner join ecommerce_coder.medio_pago mp on mp.id_medio_pago=pe.id_medio_pago
GROUP BY mp.nombre
ORDER BY count DESC;


select * from ecommerce_coder.vw_producto_caracteristicas;
select * from ecommerce_coder.vw_ventas_vendedores;
select * from ecommerce_coder.vw_compras_clientes;
select * from ecommerce_coder.vw_uso_medio_pago;
select * from ecommerce_coder.vw_reporte_pedidos;