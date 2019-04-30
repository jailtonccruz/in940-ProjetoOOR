ALTER TYPE Tp_Pessoa ADD MEMBER PROCEDURE listaTelefones CASCADE;

CREATE OR REPLACE TYPE BODY Tp_Pessoa AS

    -- lista os telefones de uma pessoa
    MEMBER PROCEDURE listaTelefones IS
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Telefones:');
            IF telefones.COUNT != 0 THEN
                FOR i in 1..telefones.COUNT
                    LOOP
                        DBMS_OUTPUT.PUT_LINE(telefones(i));
                    END LOOP;
            ELSE
                DBMS_OUTPUT.PUT_LINE('nenhum registrado!');
            END IF;
        END;
END;
/
