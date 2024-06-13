-- #####################
-- ### DIA # 4 ###
-- #####################
create database dia4;
use dia4;
create table pais(
id_pais int auto_increment primary key,
nombre varchar(20),
continente varchar(50),
poblacion int
);
create table idioma(
id_idioma int auto_increment primary key,
idioma varchar(50)
);
create table ciudad(
id_ciudad int auto_increment primary key,
nombre varchar(20),
id_pais int,
foreign key (id_pais) references pais(id_pais)
);
create table idioma_pais(
id_idioma int not null,
id_pais int not null,
es_oficial tinyint,
primary key (id_idioma,id_pais),
foreign key (id_idioma) references idioma(id_idioma),
foreign key (id_pais) references pais(id_pais)
);
INSERT INTO pais (id_pais, nombre, continente, poblacion) VALUES 
(1, 'España', 'Europa', 47000000),
(2, 'México', 'América', 126000000),
(3, 'Japón', 'Asia', 126300000);

INSERT INTO ciudad (id_ciudad, nombre, id_pais) VALUES 
(1, 'Madrid', 1),
(2, 'Barcelona', 1),
(3, 'Ciudad de México', 2),
(4, 'Guadalajara', 2),
(5, 'Tokio', 3),
(6, 'Osaka', 3);


INSERT INTO idioma (id_idioma, idioma) VALUES 
(1, 'Español'),
(2, 'Catalán'),
(3, 'Inglés'),
(4, 'Japonés');


INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES 
(1, 1, 1), -- Español es oficial en España
(2, 1, 1), -- Catalán es oficial en España
(1, 2, 1), -- Español es oficial en México
(4, 3, 1), -- Japonés es oficial en Japón
(3, 1, 0), -- Inglés no es oficial en España
(3, 2, 0), -- Inglés no es oficial en México
(3, 3, 0); -- Inglés no es oficial en Japón
-- ##### INSERCIONES ADICIONALES ####
INSERT INTO pais (id_pais, nombre, continente, poblacion) VALUES 
(6, 'Italia', 'Europa', 60000000); -- Pais sin ciudades

INSERT INTO ciudad (id_ciudad, nombre, id_pais) VALUES 
(11, 'Ciudad Desconocida', NULL);

-- listar todos los pares de nombres y paises y sus ciudades correspondientes que estan relacionadas en la base de datos
-- INNER JOIN
select pais.nombre as nombrePais, ciudad.nombre as nombreCiudad
from pais
inner join ciudad on pais.id_pais = ciudad.id_pais;

-- Listar todas las ciudad con el nombre del pais y si no tiene un pais asignado lo mostrara como null
-- LEFT JOIN
select pais.nombre as nombrePais, ciudad.nombre as nombreCiudad
from pais
left join ciudad on pais.id_pais = ciudad.id_pais;

-- Listar todas los paises con el nombre del ciudad y si no tiene una ciudad asignado lo mostrara como null
-- LEFT JOIN
select pais.nombre as nombrePais, ciudad.nombre as nombreCiudad
from pais
right join ciudad on pais.id_pais = ciudad.id_pais;


-- Desarrollado por Robinson Mosquera / ID.1095.827.105