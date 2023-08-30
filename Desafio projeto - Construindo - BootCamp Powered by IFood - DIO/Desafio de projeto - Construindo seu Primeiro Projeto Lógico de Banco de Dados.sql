-- Criação do Banco de Dados para E-Commerce - DIO
-- drop database ecommerce;
-- create database ecommerce;
-- use ecommerce;

------------------------ Criação Tabelas ----------------------------
            
-- Criar tabela cliente
create table clients (
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    LastName varchar(20),
    CPF char(11) not null,
    Adress varchar(30),
    constraint unique_cpf_client unique (CPF)
);

-- Criar tabela produto
create table product (
    idProduct int auto_increment primary key,
    Pname varchar(100),
    Classification_kids bool default false,
    category enum("Eletronico", "Vestimentos", "Brinquedos") not null,
    avaliacao float default 0,
    size varchar(10)
);

-- Criar tabela pagamento
create table payment (
    idClient int,
    idPayment int auto_increment,
    typePayment enum("boleto", "cartao", "cartao2"),
    limitAvailable float,
    primary key (idClient, idPayment)
);

-- Criar tabela pedido
create table orders (
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum("Cancelado", "confirmado", "em processamento") default "em processamento",
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
    constraint fk_order_client foreign key (idOrderClient) references clients (idClient)
);

-- Criar tabela estoque
create table productStorage (
    idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- Criar tabela fornecedor
create table supplier (
    idSupplier int auto_increment primary key,
    SocialName varchar(255),
    CNPJ varchar(15) default '0',
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- Criar tabela vendedor
create table seller (
    idSeller int auto_increment primary key,
    SocialName varchar(255),
    CNPJ varchar(15) default '0',
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cpf_seller unique (CPF),
    constraint unique_cnpj_seller unique (CNPJ)
);

-- Criar tabela produto_vendedor
create table productSeller (
    idSeller int,
    idProduct int,
    ProdQuality int default 1,
    primary key (idSeller, idProduct),
    constraint fk_product_seller foreign key (idSeller) references seller (idSeller),
    constraint fk_product_product foreign key (idProduct) references product (idProduct)
);

-- Criar tabela venda_produto
create table productOrder (
    idPOproduct int,
    idPOorder int,
    poQuality int default 1,
    poStatus enum("Disponivel", "Sem estoque") default "Disponivel",
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product (idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders (idOrder)
);

-- Criar tabela local_armazenamento
create table storageLocation (
    idProduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idProduct, idLstorage),
    constraint fk_store_location_product foreign key (idProduct) references product (idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idProdStorage)
);

show tables;

-- show databases;
-- use information_schema;
-- show tables;
-- desc table_constraints;
-- desc referential_constraints;
-- select * from referential_constraints where constraint_schema = "ecommerce";

--------------------------- Inserção de Dados ----------------------------------

-- Inserir clientes
insert into Clients(Fname, Minit, LastName, CPF, Adress)
	values("Carlos", "M", "Garcia", 123456789, "Rua jose  01 - São Paulo"),
		("Matheus", "M", "Freitas", 854758965, "Rua jose 02 - Rio de Janeiro"),
		("Jose", "M", "Silva", 123456789, "Rua jose 03 - Minas Gerais");

-- Inserir produtos        
insert into product(Pname, Classification_kids, category, avaliacao, size)
values
    ("Alexa", false, "Eletronico", 5, null),
    ("Carregador", false, "Eletrônico", 2, null);

-- Inserir pagamentos
insert into payment(idClient, typePayment, limitAvailable)
values
    (1, "cartao", 1000),
    (2, "boleto", 500);

-- Inserir pedidos
insert into orders(idOrderClient, orderDescription, sendValue, paymentCash)
values
    (1, "Pedido de João", 150, false),
    (2, "Pedido de Maria", 80, true);

-- Inserir fornecedores
insert into supplier(SocialName, CNPJ, contact)
values
    ("Fornecedor Eletrônicos", "12345678901234", "11223344556"),
    ("Fornecedor Roupas", "98765432109876", "99887766554");

-- Inserir vendedores
insert into seller(SocialName, CNPJ, CPF, location, contact)
values
    ("Vendedor Tech", "11122233344455", "12345678901", "Centro", "11122233344"),
    ("Vendedor Moda", "55566677788899", "98765432102", "Zona Sul", "55566677788");

-- Inserir produtos de vendedores
insert into productSeller(idSeller, idProduct, ProdQuality)
values
    (1, 1, 5),
    (2, 2, 10);

-- Inserir produtos em pedidos
insert into productOrder(idPOproduct, idPOorder, poQuality)
values
    (1, 1, 2),
    (2, 2, 3);

-- Inserir localizações de estoque
insert into productStorage(storageLocation, quantity)
values
    ("Prateleira A", 50),
    ("Prateleira B", 30);

-- Inserir localizações de produtos em estoque
insert into storageLocation(idProduct, idLstorage, location)
values
    (1, 1, "Prateleira A"),
    (2, 2, "Prateleira B");

-------------------------- Consultas -----------------------------------

-- Quantos pedidos foram feitos por cada cliente?
SELECT c.Fname, COUNT(o.idOrder) as TotalPedidos
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient;

-- Algum vendedor também é fornecedor?
SELECT s.SocialName
FROM seller s
JOIN supplier supp ON s.CPF = supp.contact;

-- Relação de produtos fornecedores e estoques
SELECT p.Pname, supp.SocialName, ps.quantity
FROM product p
JOIN productSeller ps ON p.idProduct = ps.idProduct
JOIN seller s ON ps.idSeller = s.idSeller
JOIN supplier supp ON s.CPF = supp.contact;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT p.Pname, supp.SocialName
FROM product p
JOIN productSeller ps ON p.idProduct = ps.idProduct
JOIN seller s ON ps.idSeller = s.idSeller
JOIN supplier supp ON s.CPF = supp.contact;




