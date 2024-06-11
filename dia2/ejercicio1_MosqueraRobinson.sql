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
    id_profesor int auto_increment primary key,
    id_departamento int not null,
    foreign key (id_profesor) references personar(id),
    foreign key (id_departamento) references departamento(id)
);
-- crear tabla grado
create table grado(
id int auto_increment primary key,
nombre varchar(100) not null
);
-- crear tabla asignatura
create table asignatura(
id int auto_increment primary key,
nombre varchar(100) not null,
creditos float not null,
tipo enum ('basica','obligatoria','optativa') not null,
curso tinyint(3) not null,
cuatrimestre tinyint(3) not null,
id_profesor int(10),
id_grado int(10) not null,
foreign key (id_profesor) references profesor(id_profesor),
foreign key (id_grado) references grado(id)
);
-- crear tabla curso escolar
create table curso_escolar(
id int(10) auto_increment primary key,
anyo_inicio year(4),
anyo_fin year(4)
);
-- crear tabla alumno se matricula asignatura
create table alunmo_se_matricula_asignatura(
id_alumno int(10) auto_increment primary key,
id_asignatura int(10) not null,
id_curso_escolar int(10) not null,
foreign key (id_alumno) references personar(id),
foreign key (id_asignatura) references asignatura(id),
foreign key (id_curso_escolar) references curso_escolar(id)
);
-- Desarrollado por Robinson Mosquera / ID.1095.827.105