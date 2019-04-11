-- #######################################################
--  Feature in construction, not completely ready to use  
--  Compatible with PostgreSQL                            
--  Edson Alves - eas4@cin.ufpe.br - 15/06/2016           
-- #######################################################
CREATE TABLE NotaFiscal( 
    DatNF VARCHAR(255),
    NumNF VARCHAR(255),
    Solicita_Cliente_Id VARCHAR(255),
    Emite_Funcionario_CPF VARCHAR(255),
    PRIMARY KEY (NumNF) 
);
CREATE TABLE Cliente( 
    Nome VARCHAR(255),
    Id VARCHAR(255),
    PRIMARY KEY (Id) 
);
CREATE TABLE Departamento( 
    Nome VARCHAR(255),
    Sigla VARCHAR(255),
    Id VARCHAR(255),
    PRIMARY KEY (Id) 
);
CREATE TABLE Funcionario( 
    Nome VARCHAR(255),
    CPF VARCHAR(255),
    Trabalha_Departamento_Id VARCHAR(255),
    PRIMARY KEY (CPF) 
);
CREATE TABLE FuncionarioTerceirizado( 
    Funcionario_FuncionarioTerceirizado_CPF VARCHAR(255),
    Emprega_EmpresaTerceirizada_Id VARCHAR(255),
    PRIMARY KEY (Funcionario_FuncionarioTerceirizado_CPF) 
);
CREATE TABLE FuncionarioEfetivo( 
    Funcionario_FuncionarioEfetivo_CPF VARCHAR(255),
    PRIMARY KEY (Funcionario_FuncionarioEfetivo_CPF) 
);
CREATE TABLE EmpresaTerceirizada( 
    Nome VARCHAR(255),
    Id VARCHAR(255),
    PRIMARY KEY (Id) 
);
CREATE TABLE Produto( 
    Nome VARCHAR(255),
    ValUnitario VARCHAR(255),
    ValSaldoEstoque VARCHAR(255),
    ValPontoPedido VARCHAR(255),
    ValEstoqueMin VARCHAR(255),
    _Id VARCHAR(255),
    DataMovimento VARCHAR(255),
    TipoMovimento VARCHAR(255),
    QuantMovimento VARCHAR(255),
    Movimenta_FuncionarioEfetivo_CPF VARCHAR(255),
    Quantidade VARCHAR(255),
    ValorUnitario VARCHAR(255),
    ValorTotal VARCHAR(255),
    Contem_NotaFiscal_NumNF VARCHAR(255),
    PRIMARY KEY (_Id) 
);
ALTER TABLE NotaFiscal ADD CONSTRAINT FK_Solicita_Cliente FOREIGN KEY (Solicita_Cliente_Id) REFERENCES Cliente (Id);
ALTER TABLE Funcionario ADD CONSTRAINT FK_Trabalha_Departamento FOREIGN KEY (Trabalha_Departamento_Id) REFERENCES Departamento (Id);
ALTER TABLE NotaFiscal ADD CONSTRAINT FK_Emite_Funcionario FOREIGN KEY (Emite_Funcionario_CPF) REFERENCES Funcionario (CPF);
ALTER TABLE FuncionarioTerceirizado ADD CONSTRAINT FK_Funcionario_FuncionarioTerceirizado FOREIGN KEY (Funcionario_FuncionarioTerceirizado_CPF) REFERENCES Funcionario (CPF);
ALTER TABLE FuncionarioEfetivo ADD CONSTRAINT FK_Funcionario_FuncionarioEfetivo FOREIGN KEY (Funcionario_FuncionarioEfetivo_CPF) REFERENCES Funcionario (CPF);
ALTER TABLE FuncionarioTerceirizado ADD CONSTRAINT FK_Emprega_EmpresaTerceirizada FOREIGN KEY (Emprega_EmpresaTerceirizada_Id) REFERENCES EmpresaTerceirizada (Id);
ALTER TABLE Produto ADD CONSTRAINT FK_Movimenta_FuncionarioEfetivo FOREIGN KEY (Movimenta_FuncionarioEfetivo_CPF) REFERENCES FuncionarioEfetivo (Funcionario_FuncionarioEfetivo_CPF);
ALTER TABLE Produto ADD CONSTRAINT FK_Contem_NotaFiscal FOREIGN KEY (Contem_NotaFiscal_NumNF) REFERENCES NotaFiscal (NumNF);

CREATE FUNCTION FUNCTION_TRG_Trabalha_Funcionario()
RETURNS TRIGGER AS $BODY$
    DECLARE countDepartamento INTEGER;
    BEGIN
        SELECT COUNT(*) INTO countDepartamento 
        FROM Funcionario
        WHERE Funcionario.Trabalha_Departamento_Id = OLD.Trabalha_Departamento_Id;

        IF countDepartamento = 0 THEN 
            RAISE EXCEPTION 'TRG_Trabalha_Funcionario';
        END IF;

        IF (TG_OP = 'DELETE') THEN 
            RETURN OLD; 
        ELSIF (TG_OP = 'UPDATE') THEN 
            RETURN NEW;
        END IF;

    END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE CONSTRAINT TRIGGER TRG_Trabalha_Funcionario AFTER DELETE OR UPDATE OF Trabalha_Departamento_Id ON Funcionario INITIALLY DEFERRED 
FOR EACH ROW EXECUTE PROCEDURE FUNCTION_TRG_Trabalha_Funcionario();

CREATE FUNCTION FUNCTION_TRG_Trabalha_Departamento()
RETURNS TRIGGER AS $BODY$
    DECLARE countDepartamento INTEGER;
    BEGIN
        SELECT COUNT(*) INTO countDepartamento 
        FROM Funcionario
        WHERE Funcionario.Trabalha_Departamento_Id = NEW.Id;

        IF countDepartamento = 0 THEN 
            RAISE EXCEPTION 'TRG_Trabalha_Departamento';
        END IF;

        RETURN NEW;
    END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE CONSTRAINT TRIGGER TRG_Trabalha_Departamento AFTER INSERT ON Departamento INITIALLY DEFERRED
FOR EACH ROW EXECUTE PROCEDURE FUNCTION_TRG_Trabalha_Departamento();

CREATE FUNCTION FUNCTION_TRG_Funcionario_FuncionarioEfetivo()
RETURNS TRIGGER AS $BODY$
    DECLARE countFuncionarioTerceirizado INTEGER;
    BEGIN
        SELECT COUNT(*) INTO countFuncionarioTerceirizado 
        FROM FuncionarioTerceirizado
        WHERE FuncionarioTerceirizado.Funcionario_FuncionarioTerceirizado_CPF = NEW.Funcionario_FuncionarioEfetivo_CPF;

        IF countFuncionarioTerceirizado <> 0 THEN 
            RAISE EXCEPTION 'TRG_Funcionario_FuncionarioEfetivo';
        END IF;

        RETURN NEW;
    END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE CONSTRAINT TRIGGER TRG_Funcionario_FuncionarioEfetivo  
 AFTER INSERT OR UPDATE OF Funcionario_FuncionarioEfetivo_CPF ON FuncionarioEfetivo INITIALLY DEFERRED 
FOR EACH ROW EXECUTE PROCEDURE FUNCTION_TRG_Funcionario_FuncionarioEfetivo();

CREATE FUNCTION FUNCTION_TRG_Funcionario_FuncionarioTerceirizado()
RETURNS TRIGGER AS $BODY$
    DECLARE countFuncionarioEfetivo INTEGER;
    BEGIN
        SELECT COUNT(*) INTO countFuncionarioEfetivo 
        FROM FuncionarioEfetivo
        WHERE FuncionarioEfetivo.Funcionario_FuncionarioEfetivo_CPF = NEW.Funcionario_FuncionarioTerceirizado_CPF;

        IF countFuncionarioEfetivo <> 0 THEN 
            RAISE EXCEPTION 'TRG_Funcionario_FuncionarioTerceirizado';
        END IF;

        RETURN NEW;
    END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE CONSTRAINT TRIGGER TRG_Funcionario_FuncionarioTerceirizado  
 AFTER INSERT OR UPDATE OF Funcionario_FuncionarioTerceirizado_CPF ON FuncionarioTerceirizado INITIALLY DEFERRED 
FOR EACH ROW EXECUTE PROCEDURE FUNCTION_TRG_Funcionario_FuncionarioTerceirizado();
