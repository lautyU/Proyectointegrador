drop table if exists libros
drop table if exists genero
drop table if exists editoriales
drop table if exists autores

create table libros (titulo varchar (50),editoria  varchar(50) , stock int ,id int  primary key )
go
create table genero (nombregenero varchar(50) primary key,)
create table editoriales (nombre_editorial varchar (50) ,cuit int primary key)
create table autores (nombreauto varchar(50),informacion text ,obras varchar (50),id_libro int constraint
fk_idlibro FOREIGN KEy (id_libro) REFERENCES libros(id))


