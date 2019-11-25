use master
drop database proyectofinal
go
create database proyectofinal
go
use  proyectofinal;
go
drop table if exists libros
drop table if exists autor
drop table if exists generos
drop table if exists editorial


create table libros
(IDlibros int primary key identity (1,1),ISBN varchar (15) not null unique,Title varchar(200),Descripcion varchar(max))
go
create table autor
(IDautor int primary key identity (1,1),NYAPE varchar (40) not null)
go
create table generos
( IDgeneros int primary key identity (1,1) ,tipogenero varchar (50)
	)
GO	


create table editorial (
ID int primary key identity(1,1),
cuit varchar(50) unique not null,
nombre varchar (50)not null
)
create table impresopor(
ID int primary key identity(1,1),
LibroID int not null,
EditorialID int not null,
constraint uq_libro_editorial unique (LibroID ,EditorialID),
constraint fk_libro foreign key (LibroID)references libros (IDlibros),
constraint fk_editorial foreign key (EditorialID)references editorial (ID))

create table escritopor
(ID int primary key identity(1,1),
LibroID int NOT NULL,
AutorID int not null,
Constraint uq_autor_libro unique (LibroID,AutorID),
constraint fk_autor foreign key  (AutorID) References autor (IDautor),
constraint fk_libros foreign key (LibroID) References libros(IDlibros))

create table distribuidopor
(ID int primary key identity (1,1),
LibroID int not null,
EditorialID int not null,
Constraint fk_distrulibro foreign key (LibroID) references libros (IDlibros),
Constraint fk_creaEditorial foreign key (EditorialID) references editorial (ID))
---------------------------------------------------------------------------

Insert into libros (ISBN , Title , Descripcion)
values	('9789874728838','El Principito','El principito es una narración corta del escritor francés Antoine de Saint-Exupéry, 
						  que cuenta la historia de un pequeño príncipe que parte de su asteroide a una travesía por el universo, en la cual descubre la extraña 
						  forma en que los adultos ven la vida y comprende el valor del amor y la amistad.'),
		('9789877385144','Rayuela','ayuela” se publica en 1963 y significa una revolución de la literatura en lengua castellana.
							Se trata de un libro transgresor, una novela que es protagonista de sí misma, un juego de palabras que puede 
							leerse de diversas maneras, ya sea siguiendo las pautas del autor, o de manera libre.'),
		('9789500755573','El hacedor',' Se trata de un conjunto de 55 poesías, relatos y ensayos, algunos de ellos muy breves, entre los que se encuentran algunos 
										de los textos más recordados del autor, por ejemplo la prosa reflexiva titulada "Borges y yo".'),
		('9789877252514','Fin del Juego.','El cuento es narrado por una niña que vive en una casa con su madre, su tía y sus hermanas, Holanda y Leticia. Leticia tiene un 
																			problema en su espalda (parálisis, al parecer) por el cual no se puede mover mucho.
																		A la hora de la siesta, las niñas salen por la puerta que da a las vías del Ferrocarril Central Argentino.')
		

insert into editorial (cuit,nombre)
		values ('30707766510','Camino al sur'),
				('30539518123','ALFAGUARA'),
				('30712471642','Penguin Random House Grupo Editorial S.A')
insert into autor (nyape)
values (' Jorge Luis Borges'),
('Antoine de Saint-Exupéry'),
('Julio Cortázar')

insert into generos (tipogenero)
values      ('Narrativo'),
		    ('Teatral'),
			('Educativo'),
			('Terror'),
			('Cocina')
			