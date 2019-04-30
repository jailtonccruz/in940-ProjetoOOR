-- Function para checar se o cliente tem direito a frete grátis (UF = PE)

ALTER TYPE TP_CLIENTE ADD MEMBER FUNCTION checaFreteGratis RETURN BOOLEAN CASCADE ;

CREATE OR REPLACE TYPE BODY TP_CLIENTE AS
    MEMBER FUNCTION checaFreteGratis RETURN BOOLEAN IS
        BEGIN

            RETURN ENDERECO.UF = 'PE';
        END;
END;
/
