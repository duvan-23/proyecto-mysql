insert into ecommerce_coder.cliente (nombre, dni, telefono, email, ciudad)
values("Juan","322121",3214123,"juan@hotamil.com","Buenos aires"),
	  ("Pedro","736432",64738173,"pedro@hotamil.com","Bogota"),
      ("Maria","122333",43242332,"maria@hotamil.com","Bogota"),
      ("Rodrigo","100022",42133345,"rodrigo@hotamil.com","Bogota"),
      ("Ema","123412",36564432,"ema@hotamil.com","Bogota"),
      ("Duvan","123568",44234212,"duvan@hotamil.com","Bogota"),
      ("Ana","736482",64738173,"ana@hotamil.com","Bogota"),
      ("Wilmer","736483",42424222,"wilmer@hotamil.com","Bogota"),
      ("Julian","323112",13443234,"julian@hotamil.com","Bogota"),
      ("Fabian","564643",86765744,"fabian@hotamil.com","Bogota"),
      ("Lorena","434543",22344441,"lorena@hotamil.com","Bogota"),
      ("Natalia","874567",64645653,"natalia@hotamil.com","Bogota"),
      ("Adriana","234543",12311133,"adriana@hotamil.com","Bogota"),
      ("Roberto","876886",32324224,"roberto@hotamil.com","Bogota"),
      ("Lucas","8674371",23317482,"lucas@hotamil.com","rosario");
      
insert into ecommerce_coder.categoria (nombre)
values("Hogar"),("Sport"),("Electrodomésticos"),("Juguetes");

insert into ecommerce_coder.proveedor (nombre)
values("Arkea"),("Nike"),("Adidas"),("Puma"),("LG"),("Samsung"),("Toys");

insert into ecommerce_coder.vendedor (nombre)
values("Maria Cardenas"),("Miguel Castaño"),("Lucia Ruiz"),("Rafael Lopez"),("Ximena jizz"),("Vannesa Paez");

insert into ecommerce_coder.medio_pago (nombre,descuento)
values("Efectivo",16),("Pse",10),("Tarjeta Credito",5);

insert into ecommerce_coder.producto (nombre, precio, id_categoria, id_proveedor)
values("TV 30 pulgadas",1000,3,5),("TV 60 pulgadas",1500,3,6),("Zapatos w2",300,2,2),("Zapatos w3",150,2,4),("Mesa",600,1,1),("Cama",800,1,1),("Balon",30,4,7),("Raqueta",50,4,7);

insert into ecommerce_coder.venta (cant_prod, valor, id_vendedor)
values(2,1300,2),(3,1900,1),(2,80,3),(2,450,5),(2,2300,4),(3,600,6),(5,2230,5)
	 ,(8,240,6),(2,850,5),(3,150,2),(1,1500,3),(1,600,6),(2,1650,4),(2,1200,1),(4,160,4);

insert into ecommerce_coder.pedido (id_cliente, id_producto, id_venta, id_medio_pago)
values(1,1,1,1),(1,3,1,1),
	  (15,1,2,3),(15,3,2,3),(15,5,2,3),
      (2,7,3,3),(2,8,3,3),
      (14,3,4,1),(14,4,4,1),
      (3,2,5,2),(3,6,5,2),
      (13,3,6,1),(13,4,6,1),(13,4,6,1),
      (4,1,7,3),(4,5,7,3),(4,3,7,3),(4,3,7,3),(4,7,7,3),
      (12,7,8,2),(12,7,8,2),(12,7,8,2),(12,7,8,2),(12,7,8,2),(12,7,8,2),(12,7,8,2),(12,7,8,2),
      (5,6,9,1),(5,8,9,1),
      (11,8,10,2),(11,8,10,2),(11,8,10,2),
      (6,2,11,1),
      (10,5,12,1),
      (7,2,13,3),(7,4,13,3),
      (9,5,14,2),(9,6,14,2),
      (8,7,15,1),(8,7,15,1),(8,8,15,1),(8,8,15,1);


-- query para validar la conexion entre todas las tablas y validar la informacion

select cl.nombre as "nombre cliente",pe.id_pedido,pe.fecha,pr.nombre as "nombre producto",pr.precio as "precio producto" 
,ca.nombre as "categoria producto", pv.nombre as "proveedor producto", ve.cant_prod, ve.valor as "valor venta",
vd.nombre as "nombre vendedor", mp.nombre as "medio de pago", mp.descuento
from ecommerce_coder.cliente cl 
	inner join ecommerce_coder.pedido pe on cl.id_cliente=pe.id_cliente
    inner join ecommerce_coder.producto pr on pr.id_producto=pe.id_producto 
    inner join ecommerce_coder.categoria ca on ca.id_categoria=pr.id_categoria
    inner join ecommerce_coder.proveedor pv on pv.id_proveedor=pr.id_proveedor
    inner join ecommerce_coder.venta ve on ve.id_venta=pe.id_venta
    inner join ecommerce_coder.vendedor vd on vd.id_vendedor=ve.id_vendedor
    inner join ecommerce_coder.medio_pago mp on mp.id_medio_pago=pe.id_medio_pago; 
