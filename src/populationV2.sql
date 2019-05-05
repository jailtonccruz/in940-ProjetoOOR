DECLARE
    departamentos             Ar_Departamento            := NULL;
    empresas                  Ar_EmpresaTerceirizada     := NULL;
    clientes                  Ar_Cliente                 := NULL;
    funcionariosEfetivos      Ar_FuncionarioEfetivo      := NULL;
    funcionariosTerceirizados Ar_FuncionarioTerceirizado := NULL;
    funcionarios              Ar_Funcionario             := NULL;
    produtos                  Ar_Produto                 := NULL;
    sessoes                   Ar_Sessao                  := NULL;
BEGIN
    departamentos := Ar_Departamento(
            Tp_Departamento.cadastra('Vendas', 'V'),
            Tp_Departamento.cadastra('Estoque', 'E'),
            Tp_Departamento.cadastra('Limpeza', 'L')
        );

    empresas := Ar_EmpresaTerceirizada(
            Tp_EmpresaTerceirizada.cadastra('VERIC'),
            Tp_EmpresaTerceirizada.cadastra('YONBU')
        );

    clientes := Ar_Cliente(
            Tp_Cliente.cadastra(10000000000, 'Grady Hampton', Tp_Telefone(81, 999990001), NULL),
            Tp_Cliente.cadastra(20000000000, 'Asa Fleming', Tp_Telefone(81, 999990002), NULL),
            Tp_Cliente.cadastra(30000000000, 'Dashawn Li', Tp_Telefone(81, 999990003), NULL),
            Tp_Cliente.cadastra(40000000000, 'Madale Shaw', Tp_Telefone(81, 999990004), NULL),
            Tp_Cliente.cadastra(50000000000, 'Luke Vang', Tp_Telefone(81, 999990005), NULL),
            Tp_Cliente.cadastra(60000000000, 'Blaze Franco', Tp_Telefone(81, 999990006), NULL),
            Tp_Cliente.cadastra(70000000000, 'Edgar Bauer', Tp_Telefone(81, 999990007), NULL),
            Tp_Cliente.cadastra(80000000000, 'Kaylie Hood', Tp_Telefone(81, 999990008), NULL),
            Tp_Cliente.cadastra(90000000000, 'Anne Warren', Tp_Telefone(81, 999990009), NULL),
            Tp_Cliente.cadastra(11000000000, 'Haylee Chung', Tp_Telefone(81, 999990010), NULL)
        );

    funcionariosEfetivos := Ar_FuncionarioEfetivo(
            Tp_FuncionarioEfetivo.cadastra(10000000001, 'Ian Dodson', Tp_Telefone(81, 999991001),
                                           Tp_Endereco('Rua 0', 'Cidade 0'), 2000),
            Tp_FuncionarioEfetivo.cadastra(20000000001, 'Brendan Knox', Tp_Telefone(81, 999991002),
                                           Tp_Endereco('Rua 1', 'Cidade 1'), 2500),
            Tp_FuncionarioEfetivo.cadastra(30000000001, 'Ishaan Shelton', Tp_Telefone(81, 999991003),
                                           Tp_Endereco('Rua 2', 'Cidade 0'), 2000),
            Tp_FuncionarioEfetivo.cadastra(40000000001, 'Catalina Rasmussen', Tp_Telefone(81, 999991004),
                                           Tp_Endereco('Rua 3', 'Cidade 1'), 3000)
        );

    funcionariosTerceirizados := Ar_FuncionarioTerceirizado(
            Tp_FuncionarioTerceirizado.cadastra(10000000100, 'Kasey Aguirre', Tp_Telefone(81, 999992001), NULL,
                                                empresas(1)),
            Tp_FuncionarioTerceirizado.cadastra(20000000100, 'Rolando Duffy', Tp_Telefone(81, 999992002), NULL,
                                                empresas(2)),
            Tp_FuncionarioTerceirizado.cadastra(30000000100, 'Janae Harrison', Tp_Telefone(81, 999992003), NULL,
                                                empresas(1)),
            Tp_FuncionarioTerceirizado.cadastra(40000000100, 'Carmelo Simpson', Tp_Telefone(81, 999992004), NULL,
                                                empresas(2))
        );

    funcionarios := Ar_Funcionario();
    FOR i IN 1..funcionariosEfetivos.COUNT
        LOOP
            funcionarios.extend;
            funcionarios(funcionarios.COUNT) := funcionariosEfetivos(i);
        END LOOP;
    FOR i IN 1..funcionariosTerceirizados.COUNT
        LOOP
            funcionarios.extend;
            funcionarios(funcionarios.COUNT) := funcionariosTerceirizados(i);
        END LOOP;

    departamentos(1).registraFuncionario(funcionarios(1));
    departamentos(1).registraFuncionario(funcionarios(3));
    departamentos(1).registraFuncionario(funcionarios(5));
    departamentos(1).registraFuncionario(funcionarios(7));
    departamentos(2).registraFuncionario(funcionarios(2));
    departamentos(2).registraFuncionario(funcionarios(6));
    departamentos(3).registraFuncionario(funcionarios(4));
    departamentos(3).registraFuncionario(funcionarios(8));

    produtos := Ar_Produto(
            Tp_Produto.cadastra('Hufles', 1, 0, 200),
            Tp_Produto.cadastra('Pringles', 2, 0, 200),
            Tp_Produto.cadastra('Doritos', 3, 0, 200),
            Tp_Produto.cadastra('Lays', 4, 0, 200),
            Tp_Produto.cadastra('McCain', 5, 0, 200),
            Tp_Produto.cadastra('Oreo', 6, 0, 200),
            Tp_Produto.cadastra('Passatempo', 7, 0, 200),
            Tp_Produto.cadastra('Treloso', 8, 0, 200),
            Tp_Produto.cadastra('Bono', 9, 0, 200),
            Tp_Produto.cadastra('Bauduco', 10, 0, 200)
        );

    sessoes := Ar_Sessao(
            Tp_Sessao.cadastra('Salgadinhos'),
            Tp_Sessao.cadastra('Biscoitos')
        );

    sessoes(1).registraProduto(produtos(1));
    sessoes(1).registraProduto(produtos(2));
    sessoes(1).registraProduto(produtos(3));
    sessoes(1).registraProduto(produtos(4));
    sessoes(1).registraProduto(produtos(5));
    sessoes(2).registraProduto(produtos(6));
    sessoes(2).registraProduto(produtos(7));
    sessoes(2).registraProduto(produtos(8));
    sessoes(2).registraProduto(produtos(9));
    sessoes(2).registraProduto(produtos(10));

    funcionariosEfetivos(2).movimentaProduto(produtos(1), 'E', 1000, TO_DATE('01/01/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(1), 'S', 100, TO_DATE('01/01/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(2), 'E', 1000, TO_DATE('01/02/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(2), 'S', 100, TO_DATE('01/02/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(3), 'E', 1000, TO_DATE('01/03/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(3), 'S', 200, TO_DATE('01/03/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(4), 'E', 1000, TO_DATE('01/04/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(4), 'S', 200, TO_DATE('01/04/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(5), 'E', 1000, TO_DATE('01/05/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(2).movimentaProduto(produtos(5), 'S', 300, TO_DATE('01/05/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(6), 'E', 1000, TO_DATE('01/06/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(6), 'S', 300, TO_DATE('01/06/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(7), 'E', 1000, TO_DATE('01/07/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(7), 'S', 400, TO_DATE('01/07/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(8), 'E', 1000, TO_DATE('01/08/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(8), 'S', 400, TO_DATE('01/08/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(9), 'E', 1000, TO_DATE('01/09/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(9), 'S', 500, TO_DATE('01/09/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(10), 'E', 1000, TO_DATE('01/10/2018', 'dd/mm/yyyy'));
    funcionariosEfetivos(4).movimentaProduto(produtos(10), 'S', 500, TO_DATE('01/10/2018', 'dd/mm/yyyy'));

    funcionarios(1).vende(clientes(1), Ar_Produto(produtos(1)), Ar_Number(1));
    funcionarios(3).vende(clientes(2), Ar_Produto(produtos(2), produtos(7)), Ar_Number(1, 2));
    funcionarios(5).vende(clientes(3), Ar_Produto(produtos(3), produtos(8), produtos(9)), Ar_Number(1, 2, 3));
    funcionarios(7).vende(clientes(4), Ar_Produto(produtos(4), produtos(9)), Ar_Number(1, 2));
    funcionarios(1).vende(clientes(5), Ar_Produto(produtos(5)), Ar_Number(1));
    funcionarios(3).vende(clientes(6), Ar_Produto(produtos(6), produtos(10)), Ar_Number(1, 2));
    funcionarios(5).vende(clientes(7), Ar_Produto(produtos(7), produtos(1), produtos(10)), Ar_Number(1, 2, 3));
    funcionarios(7).vende(clientes(8), Ar_Produto(produtos(8), produtos(2)), Ar_Number(1, 2));
    funcionarios(1).vende(clientes(9), Ar_Produto(produtos(9)), Ar_Number(1));
    funcionarios(3).vende(clientes(10), Ar_Produto(produtos(10), produtos(3)), Ar_Number(1, 2));
    funcionarios(5).vende(clientes(1), Ar_Produto(produtos(1), produtos(4), produtos(2)), Ar_Number(1, 2, 3));
    funcionarios(7).vende(clientes(2), Ar_Produto(produtos(2), produtos(5)), Ar_Number(1, 2));
    funcionarios(1).vende(clientes(3), Ar_Produto(produtos(3)), Ar_Number(1));
    funcionarios(3).vende(clientes(4), Ar_Produto(produtos(4), produtos(6)), Ar_Number(1, 2));
    funcionarios(5).vende(clientes(5), Ar_Produto(produtos(5), produtos(7), produtos(3)), Ar_Number(1, 2, 3));
    funcionarios(7).vende(clientes(6), Ar_Produto(produtos(6), produtos(8)), Ar_Number(1, 2));

END;
/
