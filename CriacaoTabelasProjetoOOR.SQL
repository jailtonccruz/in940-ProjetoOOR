/* ---------------------------------
   EXCLUINDO AS TABELAS
   --------------------------------- */

-- Conectar com o usuário VENDAS

DROP TABLE ItemNotaFiscal;
DROP TABLE NotaFiscal;
DROP TABLE Cliente;


-- Conectar com o usuário ESTOQUE

DROP TABLE MovimentoPriduto;
DROP TABLE Produto;
DROP TABLE UnidadeMedida;
DROP TABLE GrupoProduto;

-- Conectar com o usuário FOLHA

DROP TABLE Funcionario;
DROP TABLE Departamento;

/* ---------------------------------
   CRIANDO AS TABELAS
   --------------------------------- */

-- Conectar com o usuário FOLHA
CREATE TABLE Departamento
(Id              NUMBER(2),
 Nome            VARCHAR2(30),
 Sigla           VARCHAR2(5),
 CONSTRAINT PK_Departamento PRIMARY KEY (Id)
);

COMMENT ON TABLE  Departamento           IS 'Tabela de Departamentos';
COMMENT ON COLUMN Departamento.Id        IS 'Codigo do Departamentos (PK)';
COMMENT ON COLUMN Departamento.Nome      IS 'Nome do Departamentos';
COMMENT ON COLUMN Departamento.Sigla     IS 'Sigla do Departamentos';

CREATE TABLE Funcionario
(CPF                NUMBER(05),
 Nome               VARCHAR2(30),
 DataAdmissao       DATE,
 IdDepartamento NUMBER(2),
 CONSTRAINT PK_Funcionario PRIMARY KEY (CPF),
 CONSTRAINT FK_FUNCionarioDDepartamento FOREIGN KEY (IdDepartamento)
            REFERENCES Departamento (Id)
);

COMMENT ON TABLE  Funcionario                  IS 'Tabela de Funcionarios';
COMMENT ON COLUMN Funcionario.CPF              IS 'Número do CPF do Funcionario (PK)';
COMMENT ON COLUMN Funcionario.Nome             IS 'Nome do Funcionario';
COMMENT ON COLUMN Funcionario.DataAdmissao     IS 'Data de admissão do funcionario';

GRANT REFERENCES, SELECT ON Funcionario   TO ESTOQUE;
GRANT REFERENCES, SELECT ON Funcionario   TO VENDAS;

-- Conectar com usuário ESTOQUE

CREATE  TABLE UnidadeMedida
(Id                     VARCHAR2(03),
 Descricao              VARCHAR2(20),
 CONSTRAINT PK_UUnidadeMedida PRIMARY KEY (Id)
);

COMMENT ON TABLE  UnidadeMedida           IS 'Tabela de unidade de medida';
COMMENT ON COLUMN UnidadeMedida.Id        IS 'Codigo da unidadede medida (PK)';
COMMENT ON COLUMN UnidadeMedida.Descricao IS 'Descricao da unidade de medida';

CREATE  TABLE GrupoProduto
(Id                   NUMBER(02),
 Descricao            VARCHAR2(30),
 CONSTRAINT PK_GrupoProduto PRIMARY KEY (Id)
);

COMMENT ON TABLE  GrupoProduto               IS 'TABELA DE GRUPOS DE PRODUTO.PEX. LATICINIOS, PAPELARIA';
COMMENT ON COLUMN GrupoProduto.CD_GRUPO_PROD IS 'CODIGO DO GRUPO DE PRODUTOS (PK)';
COMMENT ON COLUMN GrupoProduto.CD_GRUPO_PROD IS 'DESCRICAO DO GRUPO DE PRODUTOS';

CREATE TABLE Produto
(Id                        NUMBER(05),
 Nome                      VARCHAR2(30),
 IdGrupo_produto           NUMBER(02),
 IdUnidadeMedida          VARCHAR2(03),
 ValorUnitario             NUMBER(07,2),
 ValorSaldoEstoque         NUMBER(07,2),
 ValorQuantEstoqueMinimo   NUMBER(07,2),
 ValorQuantPontoPedido     NUMBER(07,2),
 CONSTRAINT PK_Produto  PRIMARY KEY (Id),
 CONSTRAINT FK_Produto_Grupo_produto FOREIGN KEY (IdGrupo_produto)
            REFERENCES GrupoProduto (Id),
 CONSTRAINT FK_Produto_UnidadeMedida FOREIGN KEY (IdUnidadeMedida)
            REFERENCES UnidadeMedida (Id)
);

COMMENT ON TABLE  T_Produto                         IS 'Tabela de produtos';
COMMENT ON COLUMN T_Produto.Id                      IS 'Codigo do produto (PK)';
COMMENT ON COLUMN T_Produto.Nome                    IS 'Nome do produto';
COMMENT ON COLUMN T_Produto.IdGrupo_produto         IS 'Codigo do grupo do produto (FK Grupo_produto)';
COMMENT ON COLUMN T_Produto.IdUnidadeMedida         IS 'Codigo da unidade de medida (FK UnidadeMedida)';
COMMENT ON COLUMN T_Produto.ValorUnitario           IS 'Valor unitário do produto';
COMMENT ON COLUMN T_Produto.ValorSaldoEstoque       IS 'Saldo atual em estoque';
COMMENT ON COLUMN T_Produto.ValorQuantEstoqueMinimo IS 'Quantidade de estoque minmo para a venda';
COMMENT ON COLUMN T_Produto.ValorQuantPontoPedido   IS 'Quantidade que, quando atingida dever ser feito um novo pedido';

CREATE TABLE MovimentoProduto
(IdProduto                      NUMBER(05),
 NumeroMovimento                NUMBER(05),
 DataMovimento                  DATE,
 TipoMovimento                  CHAR(01),
 QuantMovimento                 NUMBER(03),
 CPFFuncionarioResponsavel      NUMBER(05),
 CONSTRAINT PK_MovimentoProduto PRIMARY KEY (IdProduto, NumeroMovimento),
 CONSTRAINT FK_MOV_PRODUTO_PRODUTO FOREIGN KEY (IdProduto)
            REFERENCES Produto (Id),
 CONSTRAINT CK_MovimentoProdutoTipoMov CHECK (TipoMovimento IN ('E','S')),
 CONSTRAINT FK_MovimentoProdutoFuncionario FOREIGN KEY (CpfFuncionarioResponsavel)
            REFERENCES FOLHA.Funcionario (cpf) 
);

COMMENT ON TABLE  T_MovimentoProduto                 IS 'Tabela que registra a movimentação do produto. Entradas e saídas';
COMMENT ON COLUMN T_MovimentoProduto.IdProduto       IS 'Codigo do produto FK:Produto';
COMMENT ON COLUMN T_MovimentoProduto.NumeroMovimento IS 'Numero sequencial da movimentação do produto';
COMMENT ON COLUMN T_MovimentoProduto.DataMovimento   IS 'Data da movimentação';
COMMENT ON COLUMN T_MovimentoProduto.TipoMovimento   IS 'Tipo de movimentação E-Entrada, S-Saída';
COMMENT ON COLUMN T_MovimentoProduto.QuantMovimento  IS 'Quantidade movimentada';
COMMENT ON COLUMN T_MovimentoProduto.CPFFuncionarioResponsavel IS 'CPF do funcionário resposnsável pela Movimentação (FK Funciionario)';

GRANT REFERENCES, SELECT ON T_PRODUTO TO VENDAS;

-- Conectar ao usuário VENDAS

CREATE TABLE T_CLIENTE
(COD_CLIENTE      NUMBER(5),
 NOME_CLIENTE     VARCHAR2(30),
 CONSTRAINT PK_CLIENTE PRIMARY KEY (COD_CLIENTE)
);

CREATE TABLE T_NOTA_FISCAL
(NUM_NF      NUMBER(7),
 DATA_NF     DATE,
 COD_CLIENTE NUMBER(5),
 MATR_FUNC_EMI NUMBER(5),
 CONSTRAINT PK_NF PRIMARY KEY (NUM_NF),
 CONSTRAINT FK_NF_CLIENTE FOREIGN KEY (COD_CLIENTE)
            REFERENCES T_CLIENTE (COD_CLIENTE),
 CONSTRAINT FK_NF_FUNC FOREIGN KEY (MATR_FUNC_EMI)
            REFERENCES FOLHA.T_FUNCIONARIO (MATRIC)
);

CREATE TABLE T_ITEM_NF
(NUM_NF      NUMBER(7),
 COD_PRODUTO NUMBER(5),
 QTDE        NUMBER(9,2),
 VL_UNITARIO NUMBER(9,2),
 CONSTRAINT PK_ITEM_NF PRIMARY KEY (NUM_NF, COD_PRODUTO),
 CONSTRAINT FK_ITEM_NF_NF FOREIGN KEY (NUM_NF)
            REFERENCES T_NOTA_FISCAL (NUM_NF),
 CONSTRAINT FK_ITEM_NF_PRODUTO FOREIGN KEY (COD_PRODUTO)
            REFERENCES ESTOQUE.T_PRODUTO (COD_PRODUTO)
);


