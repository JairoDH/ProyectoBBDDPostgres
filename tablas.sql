CREATE TABLE CAMION(
    matricula varchar(7),
    fecha_alta date,
    peso_maximo decimal(7,2) NOT NULL,
CONSTRAINT cp_matricula PRIMARY KEY(matricula),
CONSTRAINT ch_matri CHECK (REGEXP_LIKE (matricula,'[0-9]{4}[A-Z][A-Z][A-Z]')),
CONSTRAINT ch_fecha CHECK (fecha_alta BETWEEN to_date ('01/01/2020', 'dd/mm/yyyy') AND to_date ('31/12/2050', 'dd/mm/yyyy')
));
CREATE TABLE CAMION_CONDUCTOR(
    matricula_camion varchar(7),
    codigo_conductor number(5),
    fecha date,
CONSTRAINT ca_matricami FOREIGN KEY (matricula_camion) references CAMION(matricula),
CONSTRAINT ca_codicondu FOREIGN KEY (codigo_conductor) references CONDUCTOR(codigo)
);
CREATE TABLE CONDUCTOR(
    codigo number(5),
    nombre varchar(20),
    apellido1 varchar(20),
    apellido2 varchar(20),
    DNI varchar(9) NOT NULL,
    calle varchar(20),
    n_calle number(5),
    provincia varchar(10),
    poblacion varchar(10),
    telefono varchar(9) NOT NULL,
CONSTRAINT cp_codi PRIMARY KEY (codigo),
CONSTRAINT un_dni UNIQUE (DNI),
CONSTRAINT ch_dni CHECK (REGEXP_LIKE(DNI '[0-9]{8}[A-Z]'),
CONSTRAINT ch_tele check (REGEXP_LIKE(telefono '^[679][0-9]{8}'),
CONSTRAINT ch_nom check (nombre = UPPER (nombre))
);
