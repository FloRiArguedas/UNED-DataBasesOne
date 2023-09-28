use biblioteca
/* 1 desarrollo */

select l.codigo, l.titulo, l.editorial,l.edicion,l.ano,l.copias,au.nombre, au.seudonimo
from Libros l, autores au, libros_x_autores la
where la.consecutivo = l.codigo and
la.consecutivo = au.codautor


/* 2 desarrollo*/ 

Select p.codprestamo, p.fec_prestamo, p.fec_vencimiento, p.estado, p.fec_entrega, p.codigo, l.titulo, c.cedula, c.nombre
from Libros l, prestamos p, Clientes c
where p.fec_entrega is null
Order by p.fec_prestamo;



/* 3 desarrollo */

update prestamos
set fec_entrega = '20220502', estado = 'E'
where codigo = '1'and
codprestamo = '1'and
cedula = '222';

Select *
from prestamos

/* 4 desarrollo */

Insert into Clientes ( cedula,nombre,fec_nacimiento,direccion,telefono)
VALUES ( 1234567, 'Ricardo Perez', '19861201', 'San Jose, Costa Rica' ,'2245-5456');

Select *
from Clientes

/* 5 desarrollo */

delete from prestamos
where codprestamo = '1' and 
codigo = '1' and
cedula = 222






