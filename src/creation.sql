
/* ----------------------------------------------------
   Empresa Terceirizada
   ---------------------------------------------------- */ 
DROP SEQUENCE Sq_EmpresaTerceirizada;
DROP TYPE Tp_EmpresaTerceirizada FORCE;
DROP TABLE Tb_EmpresaTerceirizada;

CREATE SEQUENCE Sq_EmpresaTerceirizada START WITH 0 MINVALUE 0;
SELECT Sq_EmpresaTerceirizada.NEXTVAL FROM DUAL;
CREATE TYPE Tp_EmpresaTerceirizada AS OBJECT(
    id NUMBER,
    nome VARCHAR2(255)
);
/
CREATE TABLE Tb_EmpresaTerceirizada OF Tp_EmpresaTerceirizada
( CONSTRAINT Pk_EmpresaTerceirizada PRIMARY KEY (id)
);

/* ----------------------------------------------------
   Departamento
   ---------------------------------------------------- */ 
DROP SEQUENCE Sq_Departamento;
DROP TYPE Tp_Departamento;
DROP TABLE Tb_Departamento;
CREATE SEQUENCE Sq_Departamento
     START WITH 0
       MINVALUE 0;
SELECT Sq_Departamento.NEXTVAL 
  FROM DUAL;
  CREATE OR REPLACE TYPE Tp_Departamento
  AS OBJECT
(id        NUMBER(03),
 nome       VARCHAR2(30),
 sigla      VARCHAR2(05)
);
CREATE TABLE Tb_Departamento
          OF Tp_Departamento
( CONSTRAINT Pk_Departamento
 PRIMARY KEY (id)
);

/* ----------------------------------------------------
   Pessoa - não criar tabela pessoa nem funcionário, pois são nós intermediários na herança
   ---------------------------------------------------- */ 
CREATE OR REPLACE TYPE Tp_Endereco
  AS OBJECT
(Logradouro VARCHAR2(80),
 Bairro     VARCHAR2(30),
 Cidade     VARCHAR2(30),
 Uf         CHAR(02)
);
/
CREATE OR REPLACE TYPE Ar_Fone 
       IS VARRAY(10)
       OF NUMBER (11);
drop type Tp_pessoa force;
/
CREATE OR REPLACE TYPE Tp_Pessoa
  AS OBJECT
(cpf        NUMBER(11),
 nome       VARCHAR2(30),
 foneNums   Ar_fone,
 endereco Tp_Endereco
) NOT FINAL;
/
/* ----------------------------------------------------
Criando Tabela Subtipo Pessoa - Cliente
---------------------------------------------------- */  

DROP TYPE Tp_Cliente FORCE;
CREATE OR REPLACE TYPE Tp_Cliente UNDER Tp_Pessoa();
/
  
DROP TABLE Tb_Cliente;
CREATE TABLE Tb_Cliente of Tp_Cliente 
(CONSTRAINT pk_Cliente PRIMARY KEY (cpf));


DROP TYPE Tp_Funcionario FORCE;
CREATE OR REPLACE TYPE Tp_Funcionario UNDER Tp_Pessoa()
NOT FINAL;
/

DROP TYPE Tp_FuncionarioEfetivo FORCE;
CREATE OR REPLACE TYPE Tp_FuncionarioEfetivo UNDER Tp_Funcionario(
     salario NUMBER
);
/

DROP TYPE Tp_FuncionarioTerceirizado FORCE;
CREATE OR REPLACE TYPE Tp_FuncionarioTerceirizado UNDER Tp_Funcionario(
     contrato NUMBER
);
/

DROP TABLE Tb_FuncionarioTerceirizado;
CREATE TABLE Tb_FuncionarioTerceirizado of Tp_FuncionarioTerceirizado
(CONSTRAINT pk_FuncionarioTerceirizado PRIMARY KEY (cpf));

DROP TABLE Tb_FuncionarioEfetivo;
CREATE TABLE Tb_FuncionarioEfetivo of Tp_FuncionarioEfetivo
(CONSTRAINT pk_FuncionarioEfetivo PRIMARY KEY (cpf));


CREATE SEQUENCE Sq_Pedido START WITH 0 MINVALUE 0;
SELECT Sq_Pedido.NEXTVAL FROM DUAL;

CREATE TYPE Tp_Pedido AS OBJECT(
    id NUMBER,
    data DATE
);
/
DROP TABLE Tb_pedido;
CREATE TABLE Tb_pedido of Tp_pedido(
     CONSTRAINT pk_pedido PRIMARY KEY(id)
);

--
CREATE TYPE Tp_Promocao AS OBJECT(
    qtd_min NUMBER,
    desconto NUMBER(1, 2)
);
/

DROP TABLE Tb_Promocao;
CREATE TABLE Tb_Promocao of Tp_Promocao();

--
CREATE SEQUENCE Sq_Sessao START WITH 0 MINVALUE 0;
SELECT Sq_Sessao.NEXTVAL FROM DUAL;
CREATE TYPE Tp_Sessao AS OBJECT(
    id NUMBER,
    nome VARCHAR2(255)
);

DROP TABLE Tb_Sessao;
CREATE TABLE Tb_Sessao of Tp_Sessao(
     CONSTRAINT pk_sessao PRIMARY KEY(id)
);






/* ----------------------------------------------------
   Criando a tabela Empresa Terceirizada
   ---------------------------------------------------- */

COMMENT ON TABLE Tb_EmpresaTerceirizada 
     IS 'Tabela de empresas terceirizadas';
COMMENT ON COLUMN Tb_EmpresaTerceirizada.id
     IS 'Código identifcador da empresa terceirizada (PK)';
COMMENT ON COLUMN Tb_EmpresaTerceirizada.nome
     IS 'Nome da empresa terceirizada';
/* ----------------------------------------------------
   Criando Tipo de Objeto Departamento
   ---------------------------------------------------- */

/* ----------------------------------------------------
   Criando a tabela Departamento
   ---------------------------------------------------- */

COMMENT ON TABLE Tb_Departamento
     IS 'Tabela de Departamentos';
COMMENT ON COLUMN Tb_Departamento.Cod
     IS 'Código identifcador do departamento (PK)';
COMMENT ON COLUMN Tb_Departamento.Nome
     IS 'Nome do Departamento';
COMMENT ON COLUMN Tb_Departamento.Sigla
     IS 'Sigla do Departamento';
/* ----------------------------------------------------
   Criando Tipo Array Fone
   ---------------------------------------------------- */  ,
/* ----------------------------------------------------
   Criando Tipo de Objeto Endereço
   ---------------------------------------------------- */
/* ----------------------------------------------------
   Criando a tabela Pessoa
   ---------------------------------------------------- */



COMMENT ON TABLE Tb_Pessoa
     IS 'Tabela de Pessoas (cliente ou funcionário) ';
COMMENT ON COLUMN Tb_Pessoa.Cpf
     IS 'Número do CPF da pessoa (PK)';
COMMENT ON COLUMN Tb_Pessoa.Nome
     IS 'Nome da pessoa';
COMMENT ON COLUMN Tb_Pessoa.FoneNums
     IS 'Números de telefone da pessoa';
/* ----------------------------------------------------
    Criando Objeto Subtipo PessoaCliente
   ---------------------------------------------------- */  
COMMENT ON TABLE Tb_Cliente
     IS 'Tabela de Clientes (Subtipo da tabela pessoa) ';
COMMENT ON COLUMN Tb_Cliente.endereco
     IS 'Endereço atual do cliente';
/* ----------------------------------------------------
   Criando Objeto Subtipo PessoaFuncionario

   ---------------------------------------------------- */  
/* ----------------------------------------------------
   Criando Objeto Subtipo PessoaFuncEfetivo
   ---------------------------------------------------- */ 
/* ----------------------------------------------------
   Criando Objeto Subtipo PessoaFuncTerc
   ---------------------------------------------------- */