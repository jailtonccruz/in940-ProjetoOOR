-- Empresa Terceirizada
DROP SEQUENCE Sq_EmpresaTerceirizada;
DROP TYPE Tp_EmpresaTerceirizada FORCE;
DROP TABLE Tb_EmpresaTerceirizada;

CREATE SEQUENCE Sq_EmpresaTerceirizada START WITH 0 MINVALUE 0;
SELECT Sq_EmpresaTerceirizada.NEXTVAL FROM DUAL;

CREATE OR REPLACE TYPE Tp_EmpresaTerceirizada AS OBJECT (
    id NUMBER,
    nome VARCHAR2(255)
);
/

CREATE TABLE Tb_EmpresaTerceirizada OF Tp_EmpresaTerceirizada (
     CONSTRAINT Pk_EmpresaTerceirizada PRIMARY KEY (id)
);

-- Departamento
DROP SEQUENCE Sq_Departamento;
DROP TYPE Tp_Departamento FORCE;
DROP TABLE Tb_Departamento;

CREATE SEQUENCE Sq_Departamento START WITH 0 MINVALUE 0;
SELECT Sq_Departamento.NEXTVAL FROM DUAL;

CREATE OR REPLACE TYPE Tp_Departamento AS OBJECT (
     id        NUMBER,
     nome       VARCHAR2(255),
     sigla      VARCHAR2(255)
);
/

CREATE TABLE Tb_Departamento OF Tp_Departamento (
     CONSTRAINT Pk_Departamento PRIMARY KEY (id)
);

-- Pessoa/Funcionário e tipos para compo-los
-- Não criar tabelas pessoa e funcionário, pois são tipos intermediários com herança obrigatória
DROP TYPE Tp_Endereco FORCE;
DROP TYPE Ar_Fone FORCE;
DROP TYPE Tp_Pessoa FORCE;
DROP TYPE Tp_Funcionario FORCE;

CREATE OR REPLACE TYPE Tp_Endereco AS OBJECT (
     Logradouro VARCHAR2(255),
     Bairro     VARCHAR2(255),
     Cidade     VARCHAR2(255),
     Uf         CHAR(2)
);
/

CREATE OR REPLACE TYPE Ar_Fone IS VARRAY(10) OF NUMBER (11);
/

CREATE OR REPLACE TYPE Tp_Pessoa AS OBJECT (
     cpf        NUMBER(11),
     nome       VARCHAR2(255),
     foneNums   Ar_fone,
     endereco Tp_Endereco
) NOT FINAL;
/

CREATE OR REPLACE TYPE Tp_Funcionario UNDER Tp_Pessoa () NOT FINAL;
/

-- Subtipos de Pessoa e Funcionário

---- Cliente
DROP TYPE Tp_Cliente FORCE;
DROP TABLE Tb_Cliente;

CREATE OR REPLACE TYPE Tp_Cliente UNDER Tp_Pessoa ();
/

CREATE TABLE Tb_Cliente of Tp_Cliente (
     CONSTRAINT pk_Cliente PRIMARY KEY (cpf)
);

---- Funcionário Efetivo
DROP TYPE Tp_FuncionarioEfetivo FORCE;
DROP TABLE Tb_FuncionarioEfetivo;

CREATE OR REPLACE TYPE Tp_FuncionarioEfetivo UNDER Tp_Funcionario(
     salario NUMBER
);
/

CREATE TABLE Tb_FuncionarioEfetivo of Tp_FuncionarioEfetivo (
     CONSTRAINT Pk_FuncionarioEfetivo PRIMARY KEY (cpf)
);

---- Funcionário Terceirizado
DROP TYPE Tp_FuncionarioTerceirizado FORCE;
DROP TABLE Tb_FuncionarioTerceirizado;

CREATE OR REPLACE TYPE Tp_FuncionarioTerceirizado UNDER Tp_Funcionario (
     contrato NUMBER
     IdEmpresaTerc NUMBER
);
/

CREATE TABLE Tb_FuncionarioTerceirizado of Tp_FuncionarioTerceirizado (
     CONSTRAINT Pk_FuncionarioTerceirizado PRIMARY KEY (cpf),
     CONSTRAINT Fk_FunTerceirizado_Empresa (IdEmpresaTerc) 
    FOREIGN KEY Tb_EmpresaTerceirizada (Id)
);

-- Pedido
DROP SEQUENCE Sq_Pedido;
DROP TYPE Tp_Pedido FORCE;
DROP TABLE Tb_Pedido;

CREATE SEQUENCE Sq_Pedido START WITH 0 MINVALUE 0;
SELECT Sq_Pedido.NEXTVAL FROM DUAL;

CREATE OR REPLACE TYPE Tp_Pedido AS OBJECT (
     id NUMBER,
     data DATE
);
/

CREATE TABLE Tb_pedido of Tp_pedido (
     CONSTRAINT Pk_Pedido PRIMARY KEY(id)
);

-- Promoção
DROP TYPE Tp_Promocao FORCE;
DROP TABLE Tb_Promocao;

CREATE OR REPLACE TYPE Tp_Promocao AS OBJECT (
     qtdMin NUMBER,
     desconto NUMBER(1, 2)
);
/

CREATE TABLE Tb_Promocao of Tp_Promocao ();

-- Produto
DROP SEQUENCE Sq_Produto;
DROP TYPE Tp_Produto FORCE;
DROP TABLE Tb_Produto;

CREATE SEQUENCE Sq_Produto START WITH 0 MINVALUE 0;
SELECT Sq_Produto.NEXTVAL FROM DUAL;

CREATE OR REPLACE TYPE Tp_Produto AS OBJECT (
    id NUMBER,
    nome VARCHAR2(255)
    valor NUMBER,
    estoque NUMBER,
    PontoPedido NUMBER
);
/

CREATE TABLE Tb_Produto of Tp_Produto (
     CONSTRAINT pk_Produto PRIMARY KEY(id)
);

-- Sessão
DROP SEQUENCE Sq_Sessao;
DROP TYPE Tp_Sessao FORCE;
DROP TABLE Tb_Sessao;

CREATE SEQUENCE Sq_Sessao START WITH 0 MINVALUE 0;
SELECT Sq_Sessao.NEXTVAL FROM DUAL;

CREATE OR REPLACE TYPE Tp_Sessao AS OBJECT (
    id NUMBER,
    nome VARCHAR2(255)
);
/

CREATE TABLE Tb_Sessao of Tp_Sessao (
     CONSTRAINT pk_sessao PRIMARY KEY(id)
);

CREATE SEQUENCE Sq_Movimento START WITH 0 MINVALUE 0;
SELECT Sq_Movimento.NEXTVAL FROM DUAL;

CREATE OR REPLACE TYPE Tp_Movimento AS OBJECT (
    id NUMBER,
    data  DATE,
    quantidade NUMBER(9,2)
);
/

CREATE TABLE Tb_Movimento of Tp_Movimento (
     CONSTRAINT pk_Movimento PRIMARY KEY(id)
);






/*
-- Acho que esses comment on table são desnecessários

COMMENT ON TABLE Tb_EmpresaTerceirizada 
     IS 'Tabela de empresas terceirizadas';

COMMENT ON COLUMN Tb_EmpresaTerceirizada.id
     IS 'Código identifcador da empresa terceirizada (PK)';

COMMENT ON COLUMN Tb_EmpresaTerceirizada.nome
     IS 'Nome da empresa terceirizada';

COMMENT ON TABLE Tb_Departamento
     IS 'Tabela de Departamentos';

COMMENT ON COLUMN Tb_Departamento.Cod
     IS 'Código identifcador do departamento (PK)';

COMMENT ON COLUMN Tb_Departamento.Nome
     IS 'Nome do Departamento';

COMMENT ON COLUMN Tb_Departamento.Sigla
     IS 'Sigla do Departamento';

COMMENT ON TABLE Tb_Pessoa
     IS 'Tabela de Pessoas (cliente ou funcionário) ';

COMMENT ON COLUMN Tb_Pessoa.Cpf
     IS 'Número do CPF da pessoa (PK)';

COMMENT ON COLUMN Tb_Pessoa.Nome
     IS 'Nome da pessoa';

COMMENT ON COLUMN Tb_Pessoa.FoneNums
     IS 'Números de telefone da pessoa';

COMMENT ON TABLE Tb_Cliente
     IS 'Tabela de Clientes (Subtipo da tabela pessoa) ';

COMMENT ON COLUMN Tb_Cliente.endereco
     IS 'Endereço atual do cliente';
   Criando Objeto Subtipo PessoaFuncTerc
*/
