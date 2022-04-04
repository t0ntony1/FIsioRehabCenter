use master
go
create database proyecto
go
use proyecto
go
create table empleado(
	ID INT identity(1,1) primary key not null,
	cargo_emp char(20) null,
	nom_emp	 char(20) null,
	ape_emp	 char(20) null,
	edad_emp  int null,
	dni_emp		char(8) null,	
	telefono_emp char(9) null,
	correo_emp	char(20) null,
	administrador_id int null,
	constraint fk_empleado foreign key(administrador_id) references empleado(ID)
)
go

create table cliente(
	ID INT identity(1,1) primary key not null,
	nom_cli	 char(20) null,
	ape_cli	 char(20) null,
	edad_cli  int null,
	dni_cli		char(8) null,	
	telefono_cli char(9) null,
)
go
create table fisioterapia(
	ID INT identity(1,1) primary key not null,
	nom_ter char(20) null
)
go
create table masaje(
	ID INT identity(1,1) primary key not null,
	nom_ter char(20) null,
	duracion_ter int null,
	costo_ter float null,
	id_terapia int null,
	constraint fk_terapia foreign key(id_terapia) references fisioterapia(ID)
)

GO
create table boleta(
	ID INT identity(1,1) primary key not null,
	fecha	 DATE not null,
	id_cliente int not null,
	id_empleado int not null,
	constraint fk_cliente foreign key(id_cliente) references cliente(ID),
	constraint fk_empleado_boleta foreign key(id_empleado) references empleado(ID)
)
go
create table detalle_boleta(
	ID INT identity(1,1) primary key not null,
	id_boleta int not null,
	id_masaje int not null
	constraint fk_boleta foreign key(id_boleta) references boleta(ID),
	constraint fk_masajes foreign key(id_masaje) references masaje(ID)
)
set dateformat dmy

create table usuarios(
	ID INT identity(1,1)primary key not null,
	username varchar(50) NOT NULL,
	password varchar(200)NOT NULL,
	enabled tinyint NOT NULL
);

create table roles(
	ID INT identity(1,1)primary key not null,
	use_id int NOT NULL,
	authority varchar(50),
	constraint fk_idusuario foreign key(use_id) references usuarios(ID)
);
