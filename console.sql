create table cliente
(
    id_cliente int auto_increment primary key,
    nome varchar(30) not null,
    email varchar(100),
    telefone varchar(20),
    data timestamp not null
);

create table estado
(
    id_estado int auto_increment primary key,
    nome varchar(50),
    data timestamp not null
);

create table cidade
(
    id_cidade int auto_increment primary key,
    nome varchar(50) not null,
    cod_tom varchar(60) not null,
    id_estado int,
    data timestamp not null,

    foreign key(id_estado) references estado(id_estado)
);

create table funcionario
(
    id_func int auto_increment primary key,
    nome varchar(30) not null,
    email varchar(100),
    telefone varchar(20),
    id_cidade int,
    data timestamp not null,

    foreign key(id_cidade) references cidade(id_cidade)

);




