CREATE TABLE CAMION(
    matricula varchar(7),
    fecha_alta date,
    peso_maximo float(7,2) NOT NULL,
CONSTRAINT cp_matricula PRIMARY KEY(matricula),
CONSTRAINT ch_matri CHECK (matricula REGEXP '[0-9]{4}[A-Z][A-Z][A-Z]'),
CONSTRAINT ch_fechalta CHECK (TO_CHAR(fecha_alta,'YYYY-MM-DD') <= '2020-01-01')
);
CREATE TABLE CAMION_CONDUCTOR(
    matricula_camion varchar(7),
    codigo_conductor int(5),
    fecha date,
CONSTRAINT ca_matricami FOREIGN KEY (matricula_camion) references CAMION(matricula),
CONSTRAINT ca_codicondu FOREIGN KEY (codigo_conductor) references CONDUCTOR(codigo)
);
CREATE TABLE CONDUCTOR(
    codigo int(5),
    nombre varchar(20),
    apellido1 varchar(20),
    apellido2 varchar(20),
    DNI varchar(9) NOT NULL,
    calle varchar(20),
    nº_calle int(5),
    provincia varchar(10),
    poblacion varchar(10),
    telefono varchar(9) NOT NULL,
CONSTRAINT cp_codi PRIMARY KEY (codigo),
CONSTRAINT un_dni UNIQUE (DNI),
CONSTRAINT ch_dni CHECK (DNI REGEXP '[0-9]{8}[A-Z]'),
CONSTRAINT ch_tele check (telefono REGEXP '^[679][0-9]{8}'),
CONSTRAINT ch_nom check (binary nombre = UPPER (nombre))
);