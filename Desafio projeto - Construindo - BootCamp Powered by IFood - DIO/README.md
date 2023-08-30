# Desafio de Projeto DIO

## Construindo seu Primeiro Projeto Lógico de Banco de Dados - BootCamp Powered by IFood

###  Diretrizes

Não há um mínimo de queries a serem realizadas;
Os tópicos supracitados devem estar presentes nas queries;
Elabore perguntas que podem ser respondidas pelas consultas;
As cláusulas podem estar presentes em mais de uma query;

### Objetivos:

 - “Refine o modelo apresentado acrescentando os seguintes pontos”

 - Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
 - Entrega – Possui status e código de rastreio;
Algumas das perguntas que podes fazer para embasar as queries SQL:

 - Quantos pedidos foram feitos por cada cliente?
Algum vendedor também é fornecedor?
Relação de produtos fornecedores e estoques;
Relação de nomes dos fornecedores e nomes dos produtos;

### Descrições das entidades principais e suas relações:

- Clients: Representa os clientes do e-commerce, com informações pessoais e endereço. Cada cliente pode fazer vários pedidos (orders).

- Product: Representa os produtos disponíveis no e-commerce, com informações sobre o produto, classificação, categoria, avaliação, etc. Cada produto pode ser vendido por vários vendedores (productSeller).

- Payment: Representa os pagamentos feitos pelos clientes. Um cliente pode ter vários métodos de pagamento (payment).

- Orders: Representa os pedidos feitos pelos clientes. Cada pedido pertence a um cliente (Clients) e pode conter vários produtos (productOrder).

- Supplier: Representa os fornecedores dos produtos. Um fornecedor pode fornecer vários produtos (productSeller) e também pode ser um vendedor (seller).

- Seller: Representa os vendedores que vendem produtos no e-commerce. Cada vendedor pode vender vários produtos (productSeller), e um vendedor também pode ser um fornecedor (supplier).

- ProductSeller: Relacionamento entre produtos e vendedores, representando os produtos que cada vendedor vende, com informações de qualidade.

- ProductOrder: Relacionamento entre produtos e pedidos, representando os produtos que estão em cada pedido, com informações de quantidade e status.

- ProductStorage: Representa o estoque de produtos do e-commerce, com informações de localização e quantidade.

- StorageLocation: Relacionamento entre produtos e localizações de estoque, indicando onde um produto está armazenado.
