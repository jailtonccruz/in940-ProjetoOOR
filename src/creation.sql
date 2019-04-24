-- TYPES

-- Empresa Terceirizada
DROP TYPE Tp_EmpresaTerceirizada FORCE;
CREATE OR REPLACE TYPE Tp_EmpresaTerceirizada AS OBJECT
(
    id  NUMBER,
    nome VARCHAR2(255)
);
/

-- Departamento
DROP TYPE Tp_Departamento FORCE;
CREATE OR REPLACE TYPE Tp_Departamento AS OBJECT
(
    id   NUMBER,
    nome  VARCHAR2(255),
    sigla VARCHAR2(255)
);
/

-- Pessoa
DROP TYPE Tp_Endereco FORCE;
CREATE OR REPLACE TYPE Tp_Endereco AS OBJECT
(
    Logradouro VARCHAR2(255),
    Bairro     VARCHAR2(255),
    Cidade     VARCHAR2(255),
    Uf         CHAR(2)
);
/

DROP TYPE Ar_Fone FORCE;
CREATE OR REPLACE TYPE Ar_Fone IS VARRAY (10) OF NUMBER(11);
/

DROP TYPE Tp_Pessoa FORCE;
CREATE OR REPLACE TYPE Tp_Pessoa AS OBJECT
(
    cpf      NUMBER(11),
    nome     VARCHAR2(255),
    foneNums Ar_fone,
    endereco Tp_Endereco
) NOT FINAL;
/

-- Funcionário
DROP TYPE Tp_Funcionario FORCE;
CREATE OR REPLACE TYPE Tp_Funcionario UNDER Tp_Pessoa
(
) NOT FINAL;
/

-- Subtipos de Pessoa e Funcionário

---- Cliente
DROP TYPE Tp_Cliente FORCE;
CREATE OR REPLACE TYPE Tp_Cliente UNDER Tp_Pessoa
(
);
/

---- Funcionário Efetivo
DROP TYPE Tp_FuncionarioEfetivo FORCE;
CREATE OR REPLACE TYPE Tp_FuncionarioEfetivo UNDER Tp_Funcionario
(
    salario NUMBER(9, 2)
);
/

---- Funcionário Terceirizado
DROP TYPE Tp_FuncionarioTerceirizado FORCE;
CREATE OR REPLACE TYPE Tp_FuncionarioTerceirizado UNDER Tp_Funcionario
(
    contrato NUMBER
);
/

-- Pedido
DROP TYPE Tp_Pedido FORCE;
CREATE OR REPLACE TYPE Tp_Pedido AS OBJECT
(
    id   NUMBER,
    data DATE
);
/

-- Promoção
DROP TYPE Tp_Promocao FORCE;
CREATE OR REPLACE TYPE Tp_Promocao AS OBJECT
(
    qtdMin   NUMBER,
    desconto NUMBER
);
/

-- Produto
DROP TYPE Tp_Produto FORCE;
CREATE OR REPLACE TYPE Tp_Produto AS OBJECT
(
    id           NUMBER,
    nome         VARCHAR2(255),
    valor        NUMBER,
    estoque      NUMBER,
    limiarPedido NUMBER
);
/

-- Sessão
DROP TYPE Tp_Sessao FORCE;
CREATE OR REPLACE TYPE Tp_Sessao AS OBJECT
(
    id   NUMBER,
    nome VARCHAR2(255)
);
/


-- mover sequencias para o arquivo de criaçã de tabelas
DROP SEQUENCE Sq_Departamento;
DROP SEQUENCE Sq_EmpresaTerceirizada;
CREATE SEQUENCE Sq_EmpresaTerceirizada START WITH 0 MINVALUE 0;
SELECT Sq_EmpresaTerceirizada.NEXTVAL
FROM DUAL;

CREATE SEQUENCE Sq_Departamento START WITH 0 MINVALUE 0;
SELECT Sq_Departamento.NEXTVAL
FROM DUAL;
DROP SEQUENCE Sq_Pedido;
CREATE SEQUENCE Sq_Pedido START WITH 0 MINVALUE 0;
SELECT Sq_Pedido.NEXTVAL
FROM DUAL;
DROP SEQUENCE Sq_Produto;
CREATE SEQUENCE Sq_Produto START WITH 0 MINVALUE 0;
SELECT Sq_Produto.NEXTVAL
FROM DUAL;
DROP SEQUENCE Sq_Sessao;
CREATE SEQUENCE Sq_Sessao START WITH 0 MINVALUE 0;
SELECT Sq_Sessao.NEXTVAL
FROM DUAL;
CREATE SEQUENCE Sq_Movimento START WITH 0 MINVALUE 0;
SELECT Sq_Movimento.NEXTVAL
FROM DUAL;

