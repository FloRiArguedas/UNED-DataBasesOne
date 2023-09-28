create database biblioteca

use biblioteca

Create table Libros
(
codigo int primary key not null,
titulo varchar (45),
editorial varchar(45),
edicion int,
ano int,
copias int
);

create table Clientes
(
cedula int primary key not null,
nombre varchar (45),
fec_nacimiento date,
direccion varchar (100),
telefono varchar (45)
);

Create table prestamos
(
codprestamo int primary key not null,
fec_prestamo date,
fec_vencimiento date,
estado varchar (45),
fec_entrega date,
codigo int,
cedula int,
constraint fk_libros foreign key (codigo)references Libros,
constraint fk_clientes foreign key (cedula)references Clientes
);

Create table autores 
(
codautor int primary key not null,
nombre varchar (45),
nacionalidad varchar (45),
seudonimo varchar (45),
fec_nacimiento date,
);

Create table libros_x_autores
(
consecutivo int primary key not null,
codigo int,
codautor int,
constraint fk_libro foreign key (codigo)references Libros,
constraint fk_autor foreign key (codautor)references autores
);
