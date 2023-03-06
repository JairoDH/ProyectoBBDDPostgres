CREATE TABLE CAMION(
    matricula varchar(7),
    fecha_alta date,
    peso_maximo decimal(7,2) NOT NULL
);
ADD CONSTRAINT cp_matricula PRIMARY KEY(matricula),
ADD CONSTRAINT ch_matri CHECK (REGEXP_LIKE(matricula, '[0-9]{4}[A-Z][A-Z][A-Z]')),
ADD CONSTRAINT ch_fecha CHECK (fecha_alta BETWEEN to_date ('01/01/2020', 'dd/mm/yyyy') AND to_date ('31/12/2050', 'dd/mm/yyyy'));

CREATE TABLE CAMION_CONDUCTOR(
    matricula_camion varchar(7),
    codigo_conductor decimal(5),
    fecha date
);
ADD CONSTRAINT ca_matricami FOREIGN KEY (matricula_camion) references CAMION(matricula),
ADD CONSTRAINT ca_codicondu FOREIGN KEY (codigo_conductor) references CONDUCTOR(codigo);

CREATE TABLE CONDUCTOR(
    codigo decimal(5),
    nombre varchar(20),
    apellido1 varchar(20),
    apellido2 varchar(20),
    DNI varchar(9) NOT NULL,
    calle varchar(20),
    nº_calle decimal(5),
    provincia varchar(10),
    poblacion varchar(10),
    telefono varchar(9) NOT NULL
);

ADD CONSTRAINT cp_codi PRIMARY KEY (codigo),
ADD CONSTRAINT un_dni UNIQUE (DNI),
ADD CONSTRAINT ch_dni CHECK (REGEXP_LIKE (DNI, '[0-9]{8}[A-Z]')),
ADD CONSTRAINT ch_tele check (REGEXP_LIKE (telefono, '^[679][0-9]{8}')),
ADD CONSTRAINT ch_nom check (nombre = UPPER (nombre));