-- Criação do Banco de Dados para E-Commerce - DIO
-- drop database ecommerce;
-- create database ecommerce;
-- use ecommerce;

insert into Clients(Fname, Minit, LastName, CPF, Adress)
	values("Carlos", "M", "Garcia", 123456789, "Rua jose  01 - São Paulo"),
		("Matheus", "M", "Freitas", 854758965, "Rua jose 02 - Rio de Janeiro"),
		("Jose", "M", "Silva", 123456789, "Rua jose 03 - Minas Gerais");
        
insert into product(Pname, classification_kids, category, avaliação, size) values
		("Alexa", false, "Eletronico", 5, null),
        ("Carregador", false, "Eletrônico", 2, null); 
            
-- Criar tabalea cliente
create table clients(
	idClient int auto_increment primary key,
	Fname varchar(10),
    Minit char(3),
    LastName varchar(20),
    CPF char(11) not null,
    Adress varchar(30),
    constraint unique_cpf_client unique(CPF)
);
-- Criar tabela Produto
create table product(
	idProduct int auto_increment primary key,
	Fname varchar(10),
    Classification_kids bool default false,
    category enum("Eletronico", "Vestiemntos", "Brinquedos") not null,
    avaliação float default 0,
    size varchar(10)
);
-- Criar pagamento
create table payment(
	idClient int, 
    idPayment int, 
    typePayment enum("boleto", "cartão", "cartão2"),
    limitAvaitable float, 
    primary key(idClient, idPayment)
);

-- Criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int, 
    orderStatus enum("Cancelado", "confirmado", "em processamento") default "Em Processamento",
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false, 
    constraint fk_order_client foreign key (idOrderClient) references clients(idClient)
    );    
    
-- Criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key, 
    storageLocation varchar(255),
    quantity int default 0
);

-- Criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key, 
    SocialName varchar(255),
    CNPJ varchar (15) default 0,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
); 

-- Criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key, 
    SocialName varchar(255),
    CNPJ varchar (15) default 0,
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cpf_seller unique (CPF),
    constraint unique_cnpj_seller unique (CNPJ)
); 

-- Criar tabela produto
create table productSeller(
	idSeller int,
    idProduct int,
    ProdQuality int default 1, 
    primary key(idSeller, idProduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idseller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- Criar tabela Venda Produto
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuality int default 1, 
    poStatus enum("Disponivel", "Sem estoque") default "Disponivel",
    primary key(idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
	idProduct int, 
    idLstorage int, 
    location varchar(255) not null, 
    primary key(idProduct, idLstorage),
    constraint fk_store_location_product foreign key(idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProductStorage)
);

show tables;

show databases;
use information_schema;
show tables;
desc table_constraints;
desc referential_constraints;
select * from referential_constraints where constraint_schema = "ecommerce";

