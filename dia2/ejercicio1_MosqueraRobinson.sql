-- #####################
-- ### DIA # 2 ###
-- #####################
-- comando general para revision de base de datos creadas
show databases;
-- crear una base de datos
create database dia2;
-- utilizar BBDD dia2
use dia2;
-- crear tabla departamento
create table departamento(
id int auto_increment primary key,
nombre varchar(50) not null
);
-- crear tabla persona
create table personar (
id int auto_increment primary key,
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50),
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar (10),
fecha_nacimiento date not null,
sexo enum ('H','M') not null,
tipo enum ('profesor','alumno')
);
-- crear tabla profesor
create table profesor(
    id_profesor int primary key,
    id_departamento int not null,
    foreign key (id_profesor) references personar(id),
    foreign key (id_departamento) references departamento(id)
);
-- Desarrollado por Robinson Mosquera / ID.1095.827.105