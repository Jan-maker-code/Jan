CREATE TABLE Cliente (
  id_cliente INT PRIMARY KEY,
  tipo_cliente VARCHAR(100) CHECK (tipo_cliente IN ('PF', 'PJ')),
  nome VARCHAR(100),
  email VARCHAR(100),
  telefone VARCHAR(20)
);

CREATE TABLE Pessoa_Fisica (
  id_cliente INT PRIMARY KEY,
  cpf VARCHAR(11) UNIQUE,
  data_nascimento DATE,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pessoa_Juridica (
  id_cliente INT PRIMARY KEY,
  cnpj VARCHAR(14) UNIQUE,
  razao_social VARCHAR(100),
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Fornecedor (
  id_fornecedor INT PRIMARY KEY,
  nome VARCHAR(100),
  contato VARCHAR(100)
);

CREATE TABLE Produto (
  id_produto INT PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  preco DECIMAL(10,2),
  id_fornecedor INT,
  FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

-- Continue com Pedido, Item_Pedido, Pagamento, Entrega, Estoque, Vendedor, Vendedor_Fornecedor...-- Clientes
INSERT INTO Cliente VALUES (1, 'PF', 'João Silva', 'joao@email.com', '99999-0001');
INSERT INTO Pessoa_Fisica VALUES (1, '12345678901', '1990-05-10');

INSERT INTO Cliente VALUES (2, 'PJ', 'Empresa XYZ', 'contato@xyz.com', '99999-0002');
INSERT INTO Pessoa_Juridica VALUES (2, '12345678000199', 'XYZ Comércio Ltda');

-- Fornecedores
INSERT INTO Fornecedor VALUES (1, 'Fornecedor A', 'fornecedorA@email.com');
INSERT INTO Fornecedor VALUES (2, 'Fornecedor B', 'fornecedorB@email.com');

-- Produtos
INSERT INTO Produto VALUES (1, 'Notebook', 'Notebook potente', 3500.00, 1);
INSERT INTO Produto VALUES (2, 'Mouse', 'Mouse sem fio', 150.00, 2);

-- Estoque
INSERT INTO Estoque VALUES (1, 1, 10);
INSERT INTO Estoque VALUES (2, 2, 50);

-- Vendedores
INSERT INTO Vendedor VALUES (1, 'Carlos Vendas', 'carlos@email.com');

-- Vendedor também é fornecedor
INSERT INTO Vendedor_Fornecedor VALUES (1, 1);

-- Pedidos
INSERT INTO Pedido VALUES (1, 1, '2025-10-01');
INSERT INTO Pedido VALUES (2, 2, '2025-10-02');

-- Itens do pedido
INSERT INTO Item_Pedido VALUES (1, 1, 1, 1, 3500.00);
INSERT INTO Item_Pedido VALUES (2, 2, 2, 2, 150.00);

-- Pagamentos
INSERT INTO Pagamento VALUES (1, 1, 'Cartão de Crédito');
INSERT INTO Pagamento VALUES (2, 1, 'Vale Compras');
INSERT INTO Pagamento VALUES (3, 2, 'Boleto');

-- Entregas
INSERT INTO Entrega VALUES (1, 1, 'Enviado', 'BR123456789');
INSERT INTO Entrega VALUES (2, 2, 'Entregue', 'BR987654321');