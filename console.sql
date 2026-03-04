
drop database if exists salao_neusa;

create database salao_neusa;


use salao_neusa;
create table cliente
(
    id_cliente int auto_increment primary key,
    nome varchar(50) not null,
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
);


INSERT INTO estado (nome, data) VALUES
('Santa Catarina', NOW()),
('Paraná', NOW());

INSERT INTO cidade (nome, cod_tom, id_estado, data) VALUES
('Videira', '4209601', 1, NOW()),
('Caçador', '4203000', 1, NOW()),
('Curitiba', '4106902', 2, NOW());

INSERT INTO cliente (nome, email, telefone, data) VALUES
('João Silva', 'joao@email.com', '4999991111', NOW()),
('Maria Souza', 'maria@email.com', '4999992222', NOW()),
('Carlos Pereira', 'carlos@email.com', '4999993333', NOW()),
('Daniel Wellinton Bortolini Bortolossi', 'danielwll@gmail.com', '4935338800', NOW());

INSERT INTO funcionario (nome, email, telefone, id_cidade, data) VALUES
('Ana Costa', 'ana@salon.com', '4998881111', 1, NOW()),
('Pedro Lima', 'pedro@salon.com', '4998882222', 2, NOW());

INSERT INTO produto (produto_nome, valor, descricao, quantidade, tipo, data) VALUES
('Shampoo Profissional', 35.00, 'Shampoo para cabelos secos', 50, 'produto', NOW()),
('Condicionador', 40.00, 'Condicionador hidratante', 30, 'produto', NOW()),
('Corte Masculino', 45.00, 'Corte de cabelo masculino', 0, 'servico', NOW()),
('Manicure', 30.00, 'Serviço de manicure', 0, 'servico', NOW());

INSERT INTO agendamento (id_cliente, id_func, id_produto, data_servico, data) VALUES
(1, 1, 3, '2026-03-10 14:00:00', NOW()),
(2, 2, 4, '2026-03-10 15:00:00', NOW()),
(3, 1, 3, '2026-03-11 10:00:00', NOW());


select *
