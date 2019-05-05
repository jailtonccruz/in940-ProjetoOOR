ALTER TYPE Tp_Pessoa
    ADD MAP MEMBER FUNCTION mapNome RETURN VARCHAR2
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Pessoa AS

    -- Map function to order by name
    MAP MEMBER FUNCTION mapNome RETURN VARCHAR2 IS
        BEGIN
            RETURN SELF.nome;
        END;
END;
/
