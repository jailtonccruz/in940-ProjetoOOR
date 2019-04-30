---- TABLES ----

CREATE TABLE Tb_EmpresaTerceirizada OF Tp_EmpresaTerceirizada (
    cod  CONSTRAINT Pk_EmpresaTerc PRIMARY KEY,
    nome CONSTRAINT Nn_EmpresaTercNome CHECK (nome IS NOT NULL)
) NESTED TABLE trabalha STORE AS Nt_Trabalha_EmpresaTerceirizada;

CREATE TABLE Tb_Departamento OF Tp_Departamento (
    cod   CONSTRAINT Pk_Departamento PRIMARY KEY,
    nome  CONSTRAINT Nn_DepartamentoNome CHECK (nome IS NOT NULL),
    sigla CONSTRAINT Nn_DepartamentoSigla CHECK (sigla IS NOT NULL)
) NESTED TABLE pertence STORE AS Nt_Pertence_Tb_Departamento;

CREATE TABLE Tb_Cliente of Tp_Cliente (
    cpf  CONSTRAINT Pk_Cliente PRIMARY KEY,
    nome CONSTRAINT Nn_ClienteNome CHECK (nome IS NOT NULL)
) NESTED TABLE faz STORE AS Nt_Faz_Tb_Cliente;

CREATE TABLE Tb_FuncionarioEfetivo of Tp_FuncionarioEfetivo (
    cpf       CONSTRAINT Pk_FuncionarioEfetivo PRIMARY KEY,
    nome      CONSTRAINT Nn_FuncionarioEfetivoNome CHECK (nome IS NOT NULL),
    telefones CONSTRAINT Nn_FuncionarioEfetivoTels CHECK (telefones IS NOT NULL),
    endereco  CONSTRAINT Nn_FuncionarioEfetivoEndereco CHECK (endereco IS NOT NULL),
    salario   CONSTRAINT Nn_FuncionarioEfetivoSalario CHECK (salario IS NOT NULL)
) NESTED TABLE emite STORE AS Nt_Emite_Tb_FuncionarioEfetivo;

CREATE TABLE Tb_FuncionarioTerceirizado of Tp_FuncionarioTerceirizado (
    cpf      CONSTRAINT Pk_FuncionarioTerceirizado PRIMARY KEY,
    nome     CONSTRAINT Nn_FuncTerceirizadoNome CHECK (nome IS  NOT NULL),
    contrato CONSTRAINT Un_FuncTerceirizadoContrato UNIQUE
) NESTED TABLE emite STORE AS Nt_Emite_Tb_FuncTerceirizado;

CREATE TABLE Tb_Pedido of Tp_Pedido (
    cod  CONSTRAINT Pk_Pedido PRIMARY KEY,
    data CONSTRAINT Nn_PedidoData CHECK (data IS  NOT NULL)
);

CREATE TABLE Tb_Produto of Tp_Produto (
    cod          CONSTRAINT Pk_Produto PRIMARY KEY,
    nome         CONSTRAINT Nn_ProdutoNome CHECK (nome IS  NOT NULL),
    valor        CONSTRAINT Nn_ProdutoValor CHECK (valor IS  NOT NULL),
    estoque      CONSTRAINT Nn_ProdutoEstoque CHECK (estoque IS  NOT NULL),
    limiarPedido CONSTRAINT Nn_ProdutoLimiarPedido CHECK (LimiarPedido IS  NOT NULL)
);

CREATE TABLE Tb_Promocao of Tp_Promocao (
    qtdMin   NOT NULL,
    desconto NOT NULL
);

CREATE TABLE Tb_Sessao of Tp_Sessao (
    cod PRIMARY KEY
)NESTED TABLE contem STORE AS Nt_Conteme_Tb_Sessao;

---- REL TABLES ----

CREATE TABLE Tb_Rel_Inclui OF Tp_Rel_Inclui (
    pedido     NOT NULL,
    quantidade NOT NULL,
    valor      NOT NULL
);

CREATE TABLE Tb_Rel_Movimenta OF Tp_Rel_Movimenta (
    cod        PRIMARY KEY,
    data       NOT NULL,
    quantidade NOT NULL
);

---- DROPS ----

DROP TABLE Tb_EmpresaTerceirizada;
DROP TABLE Tb_Departamento;
DROP TABLE Tb_Cliente;
DROP TABLE Tb_FuncionarioEfetivo;
DROP TABLE Tb_FuncionarioTerceirizado;
DROP TABLE Tb_Pedido;
DROP TABLE Tb_Produto;
DROP TABLE Tb_Promocao;
DROP TABLE Tb_Sessao;
DROP TABLE Tb_Rel_Inclui;
DROP TABLE Tb_Rel_Movimenta;
