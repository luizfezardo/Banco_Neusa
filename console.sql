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

create table produto
(
    id_produto int auto_increment primary key,
    produto_nome varchar(100) not null ,
    valor decimal not null,
    descricao text,
    quantidade int not null,
    tipo ENUM('produto', 'servico') not null,
    data timestamp not null
);


create table agendamento
(
    id_agendamento int auto_increment primary key,
    id_cliente int not null ,
    id_func int not null ,
    id_produto int not null,
    data_servico datetime not null,
    data timestamp not null,

    foreign key(id_cliente) references cliente(id_cliente),
    foreign key(id_func) references  funcionario(id_func),
    foreign key(id_produto) references  produto(id_produto)
)





