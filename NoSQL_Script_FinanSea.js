use('GlobalSolution');

db.ongs.insertMany([
    {
        cnpj: "11111111000199",
        nome: "ONG Oceano Azul",
        email: "contato@oceanoazul.org",
        senha: "senha123",
        endereco: {
            rua: "Rua das Marés",
            cidade: "Rio de Janeiro",
            estado: "RJ"
        },
        telefone: "21987654321",
        cod_banco: 1234,
        agencia: 123456,
        conta: 111122223333
    },
    {
        cnpj: "22222222000199",
        nome: "ONG Protetores do Mar",
        email: "contato@protetoresdomar.org",
        senha: "senha456",
        endereco: {
            rua: "Avenida Atlântica",
            cidade: "Salvador",
            estado: "BA"
        },
        telefone: "71987654321",
        cod_banco: 5678,
        agencia: 654321,
        conta: 444455556666
    },
    {
        cnpj: "33333333000199",
        nome: "ONG Guardiões dos Oceanos",
        email: "contato@guardioesdosoceanos.org",
        senha: "senha789",
        endereco: {
            rua: "Rua das Ondas",
            cidade: "Fortaleza",
            estado: "CE"
        },
        telefone: "85987654321",
        cod_banco: 9101,
        agencia: 789012,
        conta: 777788889999
    },
    {
        cnpj: "44444444000199",
        nome: "ONG Vida Marinha",
        email: "contato@vidamarinha.org",
        senha: "senha012",
        endereco: {
            rua: "Avenida Oceânica",
            cidade: "Florianópolis",
            estado: "SC"
        },
        telefone: "48987654321",
        cod_banco: 3456,
        agencia: 345678,
        conta: 101112131415
    },
    {
        cnpj: "55555555000199",
        nome: "ONG Salvando os Mares",
        email: "contato@salvandoosmares.org",
        senha: "senha345",
        endereco: {
            rua: "Rua dos Corais",
            cidade: "Recife",
            estado: "PE"
        },
        telefone: "81987654321",
        cod_banco: 7890,
        agencia: 123987,
        conta: 161718192021
    }
]);

db.projetos.insertMany([
    {
        id_projeto: "P006",
        nome: "Projeto Limpeza Costeira",
        descricao: "Iniciativa para a limpeza de praias e áreas costeiras.",
        foto: null,
        endereco: {
            rua: "Praia de Copacabana",
            numero: "100",
            cidade: "Rio de Janeiro",
            estado: "RJ"
        },
        meta: 50000.00,
        status: "A",
        comprovante: null,
        acumulado: 20000.00,
        fk_Ong_cnpj: "11111111000199"
    },
    {
        id_projeto: "P007",
        nome: "Projeto Proteção dos Corais",
        descricao: "Conservação dos recifes de corais na Bahia.",
        foto: null,
        endereco: {
            rua: "Praia do Forte",
            numero: "200",
            cidade: "Salvador",
            estado: "BA"
        },
        meta: 80000.00,
        status: "A",
        comprovante: null,
        acumulado: 30000.00,
        fk_Ong_cnpj: "22222222000199"
    },
    {
        id_projeto: "P008",
        nome: "Projeto Vida Marinha",
        descricao: "Proteção das espécies marinhas ameaçadas.",
        foto: null,
        endereco: {
            rua: "Avenida Beira Mar",
            numero: "300",
            cidade: "Fortaleza",
            estado: "CE"
        },
        meta: 100000.00,
        status: "A",
        comprovante: null,
        acumulado: 50000.00,
        fk_Ong_cnpj: "33333333000199"
    },
    {
        id_projeto: "P009",
        nome: "Projeto Monitoramento Oceânico",
        descricao: "Monitoramento da qualidade da água do mar.",
        foto: null,
        endereco: {
            rua: "Avenida das Rendeiras",
            numero: "400",
            cidade: "Florianópolis",
            estado: "SC"
        },
        meta: 60000.00,
        status: "A",
        comprovante: null,
        acumulado: 25000.00,
        fk_Ong_cnpj: "44444444000199"
    },
    {
        id_projeto: "P010",
        nome: "Projeto Educação Ambiental",
        descricao: "Programas educativos sobre a importância da preservação dos oceanos.",
        foto: null,
        endereco: {
            rua: "Praia de Boa Viagem",
            numero: "500",
            cidade: "Recife",
            estado: "PE"
        },
        meta: 70000.00,
        status: "A",
        comprovante: null,
        acumulado: 35000.00,
        fk_Ong_cnpj: "55555555000199"
    }
]);

