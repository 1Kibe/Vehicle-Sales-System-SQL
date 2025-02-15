create database ProjetoIntegrado;
use ProjetoIntegrado;



create table gerentes (
id_gerente int not null auto_increment,
primary key (id_gerente),

nome varchar (30) not null

);



create table funcionarios (
id_funcionario int not null auto_increment,
primary key (id_funcionario),

gerente_responsavel int not null,
foreign key (gerente_responsavel) references gerentes (id_gerente),

nome varchar (30)

);



create table veiculos (
id_veiculos int not null auto_increment,
primary key (id_veiculos),

nome varchar (30) not null,
marca varchar (30) not null,
ano year not null,
placa varchar (7) not null,
kilometragem int default 0
);



create table vendas (
id_venda int not null auto_increment,
primary key (id_venda),

gerente_v int not null,
foreign key (gerente_v) references gerentes ( id_gerente ),
funcionario_vendedor int not null,
foreign key (funcionario_vendedor) references funcionarios (id_funcionario),
carro_vendido int not null,
foreign key (carro_vendido) references veiculos (id_veiculos),

valor_venda float not null,
data_venda date not null

);



create view relatorio as (

select g.gerente, f.funcionario, c.veiculos, v.valor_venda , v.data_venda from gerentes g
join vendas v
on g.id_gerente = v.gerente_v
join funcionarios f
on f.id_funcionario = v.funcionario_vendedor
join veiculos c
on c.id_veiculos = v.carro_vendido
order by g.gerente,f.funcionario,c.veiculos,v.valor_venda,v.data_venda

);


select * from relatorio;