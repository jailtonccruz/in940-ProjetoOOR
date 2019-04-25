---- TABLES ----

CREATE TABLE Tb_EmpresaTerceirizada OF Tp_EmpresaTerceirizada (
    id   PRIMARY KEY,
    nome NOT NULL
) NESTED TABLE trabalha STORE AS Nt_Trabalha_EmpresaTerceirizada;

CREATE TABLE Tb_Departamento OF Tp_Departamento (
    id    PRIMARY KEY,
    nome  NOT NULL,
    sigla NOT NULL
) NESTED TABLE pertence STORE AS Nt_Pertence_Tb_Departamento;

CREATE TABLE Tb_Cliente of Tp_Cliente (
    cpf  PRIMARY KEY,
    nome NOT NULL
) NESTED TABLE faz STORE AS Nt_Faz_Tb_Cliente;

CREATE TABLE Tb_FuncionarioEfetivo of Tp_FuncionarioEfetivo (
    cpf       PRIMARY KEY,
    nome      NOT NULL,
    telefones NOT NULL,
    endereco  NOT NULL,
    salario   NOT NULL
) NESTED TABLE emite STORE AS Nt_Emite_Tb_FuncionarioEfetivo;

CREATE TABLE Tb_FuncionarioTerceirizado of Tp_FuncionarioTerceirizado (
    cpf      PRIMARY KEY,
    nome     NOT NULL,
    contrato UNIQUE NOT NULL
) NESTED TABLE emite STORE AS Nt_Emite_Tb_FuncionarioTerceirizado;

CREATE TABLE Tb_Pedido of Tp_Pedido (
    id   PRIMARY KEY,
    data NOT NULL
);

CREATE TABLE Tb_Produto of Tp_Produto (
    id           PRIMARY KEY,
    nome         NOT NULL ,
    valor        NOT NULL,
    estoque      NOT NULL,
    limiarPedido NOT NULL
);

CREATE TABLE Tb_Promocao of Tp_Promocao (
    qtdMin   NOT NULL,
    desconto NOT NULL
    --, produto WITH ROWID REFERENCES Tb_Produto
);

CREATE TABLE Tb_Sessao of Tp_Sessao (
    id PRIMARY KEY
)NESTED TABLE contem STORE AS Nt_Conteme_Tb_Sessao;

---- REL TABLES ----

CREATE TABLE Tb_Rel_Inclui OF Tp_Rel_Inclui (
    pedido     NOT NULL,
    quantidade NOT NULL,
    valor      NOT NULL
);

CREATE TABLE Tb_Rel_Movimenta OF Tp_Rel_Movimenta (
    id         PRIMARY KEY,
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
