# Desafio de Projeto da DIO
## Construa um Projeto Lógico de Banco de Dados do Zero

### Descrição do Desafio
Para este cenário você irá utilizar seu esquema conceitual, criado no desafio do módulo de modelagem de BD com modelo ER, para criar o esquema lógico para o contexto de uma oficina. Neste desafio, você definirá todas as etapas. Desde o esquema até a implementação do banco de dados. Sendo assim, neste projeto você será o protagonista. Tenha os mesmos cuidados, apontados no desafio anterior, ao modelar o esquema utilizando o modelo relacional.

### Esquema Lógico:

### Entidades:
Cliente (ClienteID, Nome, CPF/CNPJ)\
Veiculo (VeiculoID, ClienteID, Modelo, Ano)\
Servico (ServicoID, Descricao, Preco)\
Atendimento (AtendimentoID, VeiculoID, ServicoID, Data)

### Chaves Primárias:
Cliente: ClienteID\
Veiculo: VeiculoID\
Servico: ServicoID\
Atendimento: AtendimentoID\

### Chaves Estrangeiras:
Veiculo.ClienteID -> Cliente.ClienteID\
Atendimento.VeiculoID -> Veiculo.VeiculoID\
Atendimento.ServicoID -> Servico.ServicoID\

