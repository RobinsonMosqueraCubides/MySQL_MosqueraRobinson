-- #####################
-- ### DIA # 5 ###
-- #####################
create database dia5;
use dia5;
-- Restriccion generated
create table traingle(
sideA double,
sideB double,
sideC double as  (sqrt(sideA*sideA+sideB*sideB)) comment 'Calcula la raiz cuadrada del lado C'
);
insert into traingle (sideA,sideB) values (1,2),(2,3),(4,5);
select * from traingle;

-- Repaso JOIN dia 3
use dia3;
-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 
from cliente c inner join empleado e
on e.codigo_empleado = c.codigo_empleado_rep_ventas;
-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 
from cliente c inner join pago p
on c.codigo_cliente = p.codigo_cliente
inner join empleado e
on e.codigo_empleado = c.codigo_empleado_rep_ventas;
-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad 
from cliente c inner join pago p
on c.codigo_cliente = p.codigo_cliente
inner join empleado e
on e.codigo_empleado = c.codigo_empleado_rep_ventas
inner join oficina o
on e.codigo_oficina = o.codigo_oficina;
-- listar las direccion de las oficinas que tengan clientes en fuenlabradas
select distinct o.linea_direccion1, o.linea_direccion2
from cliente c
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join oficina o on e.codigo_oficina = o.codigo_oficina
where c.ciudad = 'Fuenlabrada';
-- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
select empleado.nombre as nombreEmpleado, jefe.nombre as nombreJefe, jefe2.nombre as nombreJefe2
from empleado
left join empleado jefe on empleado.codigo_jefe = jefe.codigo_empleado
left join empleado jefe2 on jefe.codigo_jefe = jefe2.codigo_empleado;
-- Devuelve un listado con los datos de los empleado que no tienen clientes asociados y el nombre de sus jefes
select concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'Empleado', e.email, e.puesto, concat(j.nombre,' ',j.apellido1,' ',j.apellido2) as jefe
from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
inner join empleado j on e.codigo_empleado = j.codigo_empleado
where c.codigo_empleado_rep_ventas is null;
-- Desarrollado por Robinson Mosquera / ID.1095.827.105