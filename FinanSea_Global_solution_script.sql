drop table Ong cascade constraints; 
drop table Doador cascade constraints;
drop table Patrocinador cascade constraints;
drop table Projeto cascade constraints;
drop table Doacao cascade constraints;
drop table Saque cascade constraints;
drop table Cupom cascade constraints;
drop table Doador_cupom cascade constraints;
drop table auditoria_alteracoes cascade constraints;



CREATE TABLE Ong (
    cnpj_ong NUMBER(14) PRIMARY KEY,
    nome VARCHAR2(30),
    email VARCHAR2(50),
    senha VARCHAR2(50),
    rua VARCHAR2(30),
    cidade VARCHAR2(30),
    estado VARCHAR2(2),
    telefone VARCHAR2(11),
    foto_perfil BLOB,
    cod_banco NUMBER(4),
    agencia NUMBER(9),
    conta NUMBER(12)
);

CREATE TABLE Doador (
    id_doador NUMBER(14) PRIMARY KEY,
    nome VARCHAR2(30),
    email VARCHAR2(50),
    senha VARCHAR2(50),
    telefone VARCHAR2(11),
    estado VARCHAR2(2),
    cidade VARCHAR2(30),
    cod_banco NUMBER(4),
    agencia NUMBER(9),
    conta NUMBER(12),
    tipo_doador VARCHAR2(1)
);

CREATE TABLE Patrocinador (
    id_patrocinador NUMBER(14) PRIMARY KEY,
    nome VARCHAR2(30),
    email VARCHAR2(50),
    senha VARCHAR2(50),
    telefone VARCHAR2(11),
    foto_perfil BLOB
);

CREATE TABLE Projeto (
    id_projeto VARCHAR2(15) PRIMARY KEY,
    nome VARCHAR2(30),
    descricao VARCHAR2(250),
    foto BLOB,
    rua_projeto VARCHAR2(50),
    numero_endereco VARCHAR2(10),
    cidade VARCHAR2(30),
    estado VARCHAR2(2),
    meta NUMBER(10,2),
    status VARCHAR2(1),
    comprovante VARCHAR2(500),
    acumulado NUMBER(10,2),
    fk_Ong_cnpj_ong NUMBER(14)
);

CREATE TABLE Doacao (
    id_doacao VARCHAR2(15) PRIMARY KEY,
    valor NUMBER(10,2),
    data DATE,
    fk_Doador_id_doador NUMBER(14),
    fk_Projeto_id_projeto VARCHAR2(15)
);

CREATE TABLE Saque (
    id_operacao VARCHAR2(15) PRIMARY KEY,
    valor NUMBER(10,2),
    timestamp TIMESTAMP,
    fk_Ong_cnpj_ong NUMBER(14),
    fk_Projeto_id_projeto VARCHAR2(15)
);

CREATE TABLE Cupom (
    id_cupom VARCHAR2(15) PRIMARY KEY,
    cod_externo VARCHAR2(15),
    quantidade NUMBER(6),
    fk_Patrocinador_id_patrocinador NUMBER(14)
);

CREATE TABLE Doador_cupom (
    fk_Doador_id_doador NUMBER(14),
    fk_Cupom_id_cupom VARCHAR2(15)
);

CREATE TABLE auditoria_alteracoes (
    id_auditoria NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_tabela VARCHAR2(255),
    nome_coluna VARCHAR2(255),
    valor_antigo VARCHAR2(4000),
    valor_novo VARCHAR2(4000),
    usuario_responsavel VARCHAR2(255),
    data_alteracao TIMESTAMP DEFAULT SYSTIMESTAMP
);


ALTER TABLE Projeto ADD CONSTRAINT FK_Projeto_2
    FOREIGN KEY (fk_Ong_cnpj_ong)
    REFERENCES Ong (cnpj_ong);

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_2
    FOREIGN KEY (fk_Doador_id_doador)
    REFERENCES Doador (id_doador);

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_3
    FOREIGN KEY (fk_Projeto_id_projeto)
    REFERENCES Projeto (id_projeto);

ALTER TABLE Saque ADD CONSTRAINT FK_Saque_2
    FOREIGN KEY (fk_Ong_cnpj_ong)
    REFERENCES Ong (cnpj_ong);

ALTER TABLE Saque ADD CONSTRAINT FK_Saque_3
    FOREIGN KEY (fk_Projeto_id_projeto)
    REFERENCES Projeto (id_projeto);

ALTER TABLE Cupom ADD CONSTRAINT FK_Cupom_2
    FOREIGN KEY (fk_Patrocinador_id_patrocinador)
    REFERENCES Patrocinador (id_patrocinador);

ALTER TABLE Doador_cupom ADD CONSTRAINT FK_Consome_1
    FOREIGN KEY (fk_Doador_id_doador)
    REFERENCES Doador (id_doador);

ALTER TABLE Doador_cupom ADD CONSTRAINT FK_Consome_2
    FOREIGN KEY (fk_Cupom_id_cupom)
    REFERENCES Cupom (id_cupom);

    

---------------------------------------------------------------------------------------------------------------
-------------------- INSERT MANUAIS ----------------------------------------------------------------------------

-- Inserindo dados na tabela Ong
INSERT INTO Ong (cnpj_ong, nome, email, senha, rua, cidade, estado, telefone, foto_perfil, cod_banco, agencia, conta)
VALUES (12345678901234, 'Proteção Amazônica', 'contato@protecaoamazonica.org', 'senha123', 'Rua Floresta', 'Manaus', 'AM', '92987654321', NULL, 341, 1234, 123456789);

INSERT INTO Ong (cnpj_ong, nome, email, senha, rua, cidade, estado, telefone, foto_perfil, cod_banco, agencia, conta)
VALUES (23456789012345, 'Coração do Mar', 'contato@coracaodomar.org', 'senha123', 'Avenida Oceano', 'Recife', 'PE', '81987654321', NULL, 341, 5678, 987654321);

INSERT INTO Ong (cnpj_ong, nome, email, senha, rua, cidade, estado, telefone, foto_perfil, cod_banco, agencia, conta)
VALUES (34567890123456, 'SOS Cerrado', 'info@soscerrado.org', 'senha123', 'Rua das Árvores', 'Brasília', 'DF', '61987654321', NULL, 341, 1357, 135791357);

INSERT INTO Ong (cnpj_ong, nome, email, senha, rua, cidade, estado, telefone, foto_perfil, cod_banco, agencia, conta)
VALUES (45678901234567, 'Vozes Urbanas', 'contato@vozesurbanas.org', 'senha123', 'Rua da Paz', 'São Paulo', 'SP', '11987654321', NULL, 341, 2468, 246824682);

INSERT INTO Ong (cnpj_ong, nome, email, senha, rua, cidade, estado, telefone, foto_perfil, cod_banco, agencia, conta)
VALUES (56789012345678, 'Mata Atlântica Vivo', 'contato@mataatlanticavivo.org', 'senha123', 'Avenida das Árvores', 'Rio de Janeiro', 'RJ', '21987654321', NULL, 341, 9753, 975397539);


-- Inserindo dados na tabela Doador
INSERT INTO Doador (id_doador, nome, email, senha, telefone, estado, cidade, cod_banco, agencia, conta, tipo_doador)
VALUES (1, 'Carlos Silva', 'carlos.silva@example.com', 'senha123', '11987654321', 'SP', 'São Paulo', 341, 1234, 123456789, 'P');

INSERT INTO Doador (id_doador, nome, email, senha, telefone, estado, cidade, cod_banco, agencia, conta, tipo_doador)
VALUES (2, 'Mariana Costa', 'mariana.costa@example.com', 'senha123', '21987654321', 'RJ', 'Rio de Janeiro', 341, 5678, 987654321, 'P');

INSERT INTO Doador (id_doador, nome, email, senha, telefone, estado, cidade, cod_banco, agencia, conta, tipo_doador)
VALUES (3, 'João Pedro', 'joao.pedro@example.com', 'senha123', '31987654321', 'MG', 'Belo Horizonte', 341, 1357, 135791357, 'P');

INSERT INTO Doador (id_doador, nome, email, senha, telefone, estado, cidade, cod_banco, agencia, conta, tipo_doador)
VALUES (4, 'Ana Clara', 'ana.clara@example.com', 'senha123', '41987654321', 'PR', 'Curitiba', 341, 2468, 246824682, 'P');

INSERT INTO Doador (id_doador, nome, email, senha, telefone, estado, cidade, cod_banco, agencia, conta, tipo_doador)
VALUES (5, 'Lucas Martins', 'lucas.martins@example.com', 'senha123', '51987654321', 'RS', 'Porto Alegre', 341, 9753, 975397539, 'P');


-- Inserindo dados na tabela Patrocinador
INSERT INTO Patrocinador (id_patrocinador, nome, email, senha, telefone, foto_perfil)
VALUES (1, 'Mercado Livre', 'patrocinio@mercadolivre.com.br', 'senha123', '1133224455', NULL);

INSERT INTO Patrocinador (id_patrocinador, nome, email, senha, telefone, foto_perfil)
VALUES (2, 'Americanas', 'patrocinio@americanas.com', 'senha123', '2133445566', NULL);

INSERT INTO Patrocinador (id_patrocinador, nome, email, senha, telefone, foto_perfil)
VALUES (3, 'Magazine Luiza', 'patrocinio@magazineluiza.com.br', 'senha123', '3134556677', NULL);

INSERT INTO Patrocinador (id_patrocinador, nome, email, senha, telefone, foto_perfil)
VALUES (4, 'Submarino', 'patrocinio@submarino.com', 'senha123', '4135667788', NULL);

INSERT INTO Patrocinador (id_patrocinador, nome, email, senha, telefone, foto_perfil)
VALUES (5, 'Shopee', 'patrocinio@shopee.com', 'senha123', '5136778899', NULL);


-- Inserindo dados na tabela Projeto
INSERT INTO Projeto (id_projeto, nome, descricao, foto, rua_projeto, numero_endereco, cidade, estado, meta, status, comprovante, acumulado, fk_Ong_cnpj_ong)
VALUES ('P1', 'Projeto Tamar', 'Conservação de tartarugas marinhas.', NULL, 'Praia do Forte', '100', 'Mata de São João', 'BA', 50000, 'A', 'comprovante1.pdf', 25000, 12345678901234);

INSERT INTO Projeto (id_projeto, nome, descricao, foto, rua_projeto, numero_endereco, cidade, estado, meta, status, comprovante, acumulado, fk_Ong_cnpj_ong)
VALUES ('P2', 'Água Limpa', 'Tratamento de águas de rios urbanos.', NULL, 'Margem do Rio', '200', 'São Paulo', 'SP', 100000, 'A', 'comprovante2.pdf', 50000, 23456789012345);

INSERT INTO Projeto (id_projeto, nome, descricao, foto, rua_projeto, numero_endereco, cidade, estado, meta, status, comprovante, acumulado, fk_Ong_cnpj_ong)
VALUES ('P3', 'Escola Sustentável', 'Educação ambiental em escolas públicas.', NULL, 'Rua da Educação', '300', 'Belo Horizonte', 'MG', 75000, 'A', 'comprovante3.pdf', 37500, 34567890123456);

INSERT INTO Projeto (id_projeto, nome, descricao, foto, rua_projeto, numero_endereco, cidade, estado, meta, status, comprovante, acumulado, fk_Ong_cnpj_ong)
VALUES ('P4', 'Recicla Cidade', 'Promoção da reciclagem de resíduos.', NULL, 'Avenida Reciclar', '400', 'Curitiba', 'PR', 250000, 'A', 'comprovante4.pdf', 12500, 45678901234567);

INSERT INTO Projeto (id_projeto, nome, descricao, foto, rua_projeto, numero_endereco, cidade, estado, meta, status, comprovante, acumulado, fk_Ong_cnpj_ong)
VALUES ('P5', 'Horta Comunitária', 'Criação de hortas comunitárias urbanas.', NULL, 'Rua das Hortas', '500', 'Porto Alegre', 'RS', 20000, 'A', 'comprovante5.pdf', 10000, 56789012345678);

-- Inserindo dados na tabela Doacao
INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D1', 500, CURRENT_DATE, 1, 'P1');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D2', 750, CURRENT_DATE, 2, 'P2');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D3', 1000, CURRENT_DATE, 3, 'P3');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D4', 1250, CURRENT_DATE, 4, 'P4');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D5', 1500, CURRENT_DATE, 5, 'P5');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D21', 350, CURRENT_DATE, 1, 'P3');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D22', 275, CURRENT_DATE, 2, 'P5');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D23', 450, CURRENT_DATE, 3, 'P2');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D24', 620, CURRENT_DATE, 4, 'P4');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D25', 780, CURRENT_DATE, 5, 'P1');

INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
VALUES ('D26', 290, CURRENT_DATE, 1, 'P2');



-- Inserindo dados na tabela Saque
INSERT INTO Saque (id_operacao, valor, timestamp, fk_Ong_cnpj_ong, fk_Projeto_id_projeto)
VALUES ('S1', 1000, CURRENT_TIMESTAMP, 12345678901234, 'P1');

INSERT INTO Saque (id_operacao, valor, timestamp, fk_Ong_cnpj_ong, fk_Projeto_id_projeto)
VALUES ('S2', 1500, CURRENT_TIMESTAMP, 23456789012345, 'P2');

INSERT INTO Saque (id_operacao, valor, timestamp, fk_Ong_cnpj_ong, fk_Projeto_id_projeto)
VALUES ('S3', 2000, CURRENT_TIMESTAMP, 34567890123456, 'P3');

INSERT INTO Saque (id_operacao, valor, timestamp, fk_Ong_cnpj_ong, fk_Projeto_id_projeto)
VALUES ('S4', 2500, CURRENT_TIMESTAMP, 45678901234567, 'P4');

INSERT INTO Saque (id_operacao, valor, timestamp, fk_Ong_cnpj_ong, fk_Projeto_id_projeto)
VALUES ('S5', 3000, CURRENT_TIMESTAMP, 56789012345678, 'P5');


-- Inserindo dados na tabela Cupom
INSERT INTO Cupom (id_cupom, cod_externo, quantidade, fk_Patrocinador_id_patrocinador)
VALUES ('C1', 'DESC10', 100, 1);

INSERT INTO Cupom (id_cupom, cod_externo, quantidade, fk_Patrocinador_id_patrocinador)
VALUES ('C2', 'FRETEFREE', 50, 2);

INSERT INTO Cupom (id_cupom, cod_externo, quantidade, fk_Patrocinador_id_patrocinador)
VALUES ('C3', 'DESC20', 75, 3);

INSERT INTO Cupom (id_cupom, cod_externo, quantidade, fk_Patrocinador_id_patrocinador)
VALUES ('C4', 'NOVOCUPOM', 50, 4);

INSERT INTO Cupom (id_cupom, cod_externo, quantidade, fk_Patrocinador_id_patrocinador)
VALUES ('C5', 'DESC30', 25, 5);


-- Inserindo dados na tabela Doador_cupom
INSERT INTO Doador_cupom (fk_Doador_id_doador, fk_Cupom_id_cupom)
VALUES (4, 'C1');

INSERT INTO Doador_cupom (fk_Doador_id_doador, fk_Cupom_id_cupom)
VALUES (5, 'C2');

INSERT INTO Doador_cupom (fk_Doador_id_doador, fk_Cupom_id_cupom)
VALUES (3, 'C3');

INSERT INTO Doador_cupom (fk_Doador_id_doador, fk_Cupom_id_cupom)
VALUES (4, 'C4');

INSERT INTO Doador_cupom (fk_Doador_id_doador, fk_Cupom_id_cupom)
VALUES (5, 'C5');


------------------------------------------------------------------------------------------------------------------
----------------------- PACKAGE ----------------------------------------------------------------------------------

SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE ONG_MANAGEMENT AS
    -- Procedures para Ong
    PROCEDURE inserir_ong(
        p_cnpj_ong IN NUMBER,
        p_nome IN VARCHAR2,
        p_email IN VARCHAR2,
        p_senha IN VARCHAR2,
        p_rua IN VARCHAR2,
        p_cidade IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_telefone IN VARCHAR2,
        p_foto_perfil IN BLOB,
        p_cod_banco IN NUMBER,
        p_agencia IN NUMBER,
        p_conta IN NUMBER
    );

    PROCEDURE atualizar_ong(
        p_cnpj_ong IN NUMBER,
        p_novo_nome IN VARCHAR2,
        p_novo_email IN VARCHAR2,
        p_nova_senha IN VARCHAR2,
        p_nova_rua IN VARCHAR2,
        p_nova_cidade IN VARCHAR2,
        p_novo_estado IN VARCHAR2,
        p_novo_telefone IN VARCHAR2,
        p_nova_foto_perfil IN BLOB,
        p_novo_cod_banco IN NUMBER,
        p_nova_agencia IN NUMBER,
        p_nova_conta IN NUMBER
    );

    PROCEDURE excluir_ong(p_cnpj_ong IN NUMBER);

    -- Procedures para Doador
    PROCEDURE inserir_doador(
        p_id_doador IN NUMBER,
        p_nome IN VARCHAR2,
        p_email IN VARCHAR2,
        p_senha IN VARCHAR2,
        p_telefone IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_cidade IN VARCHAR2,
        p_cod_banco IN NUMBER,
        p_agencia IN NUMBER,
        p_conta IN NUMBER,
        p_tipo_doador IN VARCHAR2
    );

    PROCEDURE atualizar_doador(
        p_id_doador IN NUMBER,
        p_novo_nome IN VARCHAR2,
        p_novo_email IN VARCHAR2,
        p_nova_senha IN VARCHAR2,
        p_novo_telefone IN VARCHAR2,
        p_novo_estado IN VARCHAR2,
        p_nova_cidade IN VARCHAR2,
        p_novo_cod_banco IN NUMBER,
        p_nova_agencia IN NUMBER,
        p_nova_conta IN NUMBER,
        p_novo_tipo_doador IN VARCHAR2
    );

    PROCEDURE excluir_doador(p_id_doador IN NUMBER);

    -- Procedures para Patrocinador
    PROCEDURE inserir_patrocinador(
        p_id_patrocinador IN NUMBER,
        p_nome IN VARCHAR2,
        p_email IN VARCHAR2,
        p_senha IN VARCHAR2,
        p_telefone IN VARCHAR2,
        p_foto_perfil IN BLOB
    );

    PROCEDURE atualizar_patrocinador(
        p_id_patrocinador IN NUMBER,
        p_novo_nome IN VARCHAR2,
        p_novo_email IN VARCHAR2,
        p_nova_senha IN VARCHAR2,
        p_novo_telefone IN VARCHAR2,
        p_nova_foto_perfil IN BLOB
    );

    PROCEDURE excluir_patrocinador(p_id_patrocinador IN NUMBER);

    -- Procedures para Projeto
    PROCEDURE inserir_projeto(
        p_id_projeto IN VARCHAR2,
        p_nome IN VARCHAR2,
        p_descricao IN VARCHAR2,
        p_foto IN BLOB,
        p_rua_projeto IN VARCHAR2,
        p_numero_endereco IN VARCHAR2,
        p_cidade IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_meta IN NUMBER,
        p_status IN VARCHAR2,
        p_comprovante IN VARCHAR2,
        p_acumulado IN NUMBER,
        p_fk_Ong_cnpj_ong IN NUMBER
    );

    PROCEDURE atualizar_projeto(
        p_id_projeto IN VARCHAR2,
        p_novo_nome IN VARCHAR2,
        p_nova_descricao IN VARCHAR2,
        p_nova_foto IN BLOB,
        p_nova_rua_projeto IN VARCHAR2,
        p_novo_numero_endereco IN VARCHAR2,
        p_nova_cidade IN VARCHAR2,
        p_novo_estado IN VARCHAR2,
        p_nova_meta IN NUMBER,
        p_novo_status IN VARCHAR2,
        p_novo_comprovante IN VARCHAR2,
        p_novo_acumulado IN NUMBER,
        p_novo_fk_Ong_cnpj_ong IN NUMBER
    );

    PROCEDURE excluir_projeto(p_id_projeto IN VARCHAR2);

    -- Procedures para Doacao
    PROCEDURE inserir_doacao(
        p_id_doacao IN VARCHAR2,
        p_valor IN NUMBER,
        p_data IN DATE,
        p_fk_Doador_id_doador IN NUMBER,
        p_fk_Projeto_id_projeto IN VARCHAR2
    );

    PROCEDURE atualizar_doacao(
        p_id_doacao IN VARCHAR2,
        p_novo_valor IN NUMBER,
        p_nova_data IN DATE,
        p_novo_fk_Doador_id_doador IN NUMBER,
        p_novo_fk_Projeto_id_projeto IN VARCHAR2
    );

    PROCEDURE excluir_doacao(p_id_doacao IN VARCHAR2);

    -- Procedures para Saque
    PROCEDURE inserir_saque(
        p_id_operacao IN VARCHAR2,
        p_valor IN NUMBER,
        p_timestamp IN TIMESTAMP,
        p_fk_Ong_cnpj_ong IN NUMBER,
        p_fk_Projeto_id_projeto IN VARCHAR2
    );

    PROCEDURE atualizar_saque(
        p_id_operacao IN VARCHAR2,
        p_novo_valor IN NUMBER,
        p_novo_timestamp IN TIMESTAMP,
        p_novo_fk_Ong_cnpj_ong IN NUMBER,
        p_novo_fk_Projeto_id_projeto IN VARCHAR2
    );

    PROCEDURE excluir_saque(p_id_operacao IN VARCHAR2);

    -- Procedures para Cupom
    PROCEDURE inserir_cupom(
        p_id_cupom IN VARCHAR2,
        p_cod_externo IN VARCHAR2,
        p_quantidade IN NUMBER,
        p_fk_Patrocinador_id_patrocinador IN NUMBER
    );

    PROCEDURE atualizar_cupom(
        p_id_cupom IN VARCHAR2,
        p_novo_cod_externo IN VARCHAR2,
        p_nova_quantidade IN NUMBER,
        p_novo_fk_Patrocinador_id_patrocinador IN NUMBER
    );

    PROCEDURE excluir_cupom(p_id_cupom IN VARCHAR2);

    -- Procedures para Doador_Cupom
    PROCEDURE inserir_doador_cupom(
        p_fk_Doador_id_doador IN NUMBER,
        p_fk_Cupom_id_cupom IN VARCHAR2
    );

    PROCEDURE atualizar_doador_cupom(
        p_fk_Doador_id_doador_antigo IN NUMBER,
        p_fk_Cupom_id_cupom_antigo IN VARCHAR2,
        p_fk_Doador_id_doador_novo IN NUMBER,
        p_fk_Cupom_id_cupom_novo IN VARCHAR2
    );

    PROCEDURE excluir_doador_cupom(
        p_fk_Doador_id_doador IN NUMBER,
        p_fk_Cupom_id_cupom IN VARCHAR2
    );

    -- Procedures de Relatório
    PROCEDURE relatorio_doacoes_ong;

    PROCEDURE relatorio_doacoes_estado;

END ONG_MANAGEMENT;
/


CREATE OR REPLACE PACKAGE BODY ONG_MANAGEMENT AS

    -- Procedures para Ong
    PROCEDURE inserir_ong(
        p_cnpj_ong IN NUMBER,
        p_nome IN VARCHAR2,
        p_email IN VARCHAR2,
        p_senha IN VARCHAR2,
        p_rua IN VARCHAR2,
        p_cidade IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_telefone IN VARCHAR2,
        p_foto_perfil IN BLOB,
        p_cod_banco IN NUMBER,
        p_agencia IN NUMBER,
        p_conta IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Ong (cnpj_ong, nome, email, senha, rua, cidade, estado, telefone, foto_perfil, cod_banco, agencia, conta)
        VALUES (p_cnpj_ong, p_nome, p_email, p_senha, p_rua, p_cidade, p_estado, p_telefone, p_foto_perfil, p_cod_banco, p_agencia, p_conta);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Ong inserida com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir a Ong: ' || SQLERRM);
    END inserir_ong;

    PROCEDURE atualizar_ong(
        p_cnpj_ong IN NUMBER,
        p_novo_nome IN VARCHAR2,
        p_novo_email IN VARCHAR2,
        p_nova_senha IN VARCHAR2,
        p_nova_rua IN VARCHAR2,
        p_nova_cidade IN VARCHAR2,
        p_novo_estado IN VARCHAR2,
        p_novo_telefone IN VARCHAR2,
        p_nova_foto_perfil IN BLOB,
        p_novo_cod_banco IN NUMBER,
        p_nova_agencia IN NUMBER,
        p_nova_conta IN NUMBER
    ) IS
    BEGIN
        UPDATE Ong
        SET nome = p_novo_nome,
            email = p_novo_email,
            senha = p_nova_senha,
            rua = p_nova_rua,
            cidade = p_nova_cidade,
            estado = p_novo_estado,
            telefone = p_novo_telefone,
            foto_perfil = p_nova_foto_perfil,
            cod_banco = p_novo_cod_banco,
            agencia = p_nova_agencia,
            conta = p_nova_conta
        WHERE cnpj_ong = p_cnpj_ong;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Ong atualizada com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Ong não encontrada para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar a Ong: ' || SQLERRM);
    END atualizar_ong;

    PROCEDURE excluir_ong(p_cnpj_ong IN NUMBER) IS
    BEGIN
        DELETE FROM Ong
        WHERE cnpj_ong = p_cnpj_ong;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Ong excluída com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Ong não encontrada para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir a Ong: ' || SQLERRM);
    END excluir_ong;

    -- Procedures para Doador
    PROCEDURE inserir_doador(
        p_id_doador IN NUMBER,
        p_nome IN VARCHAR2,
        p_email IN VARCHAR2,
        p_senha IN VARCHAR2,
        p_telefone IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_cidade IN VARCHAR2,
        p_cod_banco IN NUMBER,
        p_agencia IN NUMBER,
        p_conta IN NUMBER,
        p_tipo_doador IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Doador (id_doador, nome, email, senha, telefone, estado, cidade, cod_banco, agencia, conta, tipo_doador)
        VALUES (p_id_doador, p_nome, p_email, p_senha, p_telefone, p_estado, p_cidade, p_cod_banco, p_agencia, p_conta, p_tipo_doador);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doador inserido com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o doador: ' || SQLERRM);
    END inserir_doador;

    PROCEDURE atualizar_doador(
        p_id_doador IN NUMBER,
        p_novo_nome IN VARCHAR2,
        p_novo_email IN VARCHAR2,
        p_nova_senha IN VARCHAR2,
        p_novo_telefone IN VARCHAR2,
        p_novo_estado IN VARCHAR2,
        p_nova_cidade IN VARCHAR2,
        p_novo_cod_banco IN NUMBER,
        p_nova_agencia IN NUMBER,
        p_nova_conta IN NUMBER,
        p_novo_tipo_doador IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Doador
        SET nome = p_novo_nome,
            email = p_novo_email,
            senha = p_nova_senha,
            telefone = p_novo_telefone,
            estado = p_novo_estado,
            cidade = p_nova_cidade,
            cod_banco = p_novo_cod_banco,
            agencia = p_nova_agencia,
            conta = p_nova_conta,
            tipo_doador = p_novo_tipo_doador
        WHERE id_doador = p_id_doador;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doador atualizado com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Doador não encontrado para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o doador: ' || SQLERRM);
    END atualizar_doador;

    PROCEDURE excluir_doador(p_id_doador IN NUMBER) IS
    BEGIN
        DELETE FROM Doador
        WHERE id_doador = p_id_doador;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doador excluído com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Doador não encontrado para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir o doador: ' || SQLERRM);
    END excluir_doador;

    -- Procedures para Patrocinador
    PROCEDURE inserir_patrocinador(
        p_id_patrocinador IN NUMBER,
        p_nome IN VARCHAR2,
        p_email IN VARCHAR2,
        p_senha IN VARCHAR2,
        p_telefone IN VARCHAR2,
        p_foto_perfil IN BLOB
    ) IS
    BEGIN
        INSERT INTO Patrocinador (id_patrocinador, nome, email, senha, telefone, foto_perfil)
        VALUES (p_id_patrocinador, p_nome, p_email, p_senha, p_telefone, p_foto_perfil);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Patrocinador inserido com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o patrocinador: ' || SQLERRM);
    END inserir_patrocinador;

    PROCEDURE atualizar_patrocinador(
        p_id_patrocinador IN NUMBER,
        p_novo_nome IN VARCHAR2,
        p_novo_email IN VARCHAR2,
        p_nova_senha IN VARCHAR2,
        p_novo_telefone IN VARCHAR2,
        p_nova_foto_perfil IN BLOB
    ) IS
    BEGIN
        UPDATE Patrocinador
        SET nome = p_novo_nome,
            email = p_novo_email,
            senha = p_nova_senha,
            telefone = p_novo_telefone,
            foto_perfil = p_nova_foto_perfil
        WHERE id_patrocinador = p_id_patrocinador;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Patrocinador atualizado com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Patrocinador não encontrado para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o patrocinador: ' || SQLERRM);
    END atualizar_patrocinador;

    PROCEDURE excluir_patrocinador(p_id_patrocinador IN NUMBER) IS
    BEGIN
        DELETE FROM Patrocinador
        WHERE id_patrocinador = p_id_patrocinador;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Patrocinador excluído com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Patrocinador não encontrado para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir o patrocinador: ' || SQLERRM);
    END excluir_patrocinador;

    -- Procedures para Projeto
    PROCEDURE inserir_projeto(
        p_id_projeto IN VARCHAR2,
        p_nome IN VARCHAR2,
        p_descricao IN VARCHAR2,
        p_foto IN BLOB,
        p_rua_projeto IN VARCHAR2,
        p_numero_endereco IN VARCHAR2,
        p_cidade IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_meta IN NUMBER,
        p_status IN VARCHAR2,
        p_comprovante IN VARCHAR2,
        p_acumulado IN NUMBER,
        p_fk_Ong_cnpj_ong IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Projeto (id_projeto, nome, descricao, foto, rua_projeto, numero_endereco, cidade, estado, meta, status, comprovante, acumulado, fk_Ong_cnpj_ong)
        VALUES (p_id_projeto, p_nome, p_descricao, p_foto, p_rua_projeto, p_numero_endereco, p_cidade, p_estado, p_meta, p_status, p_comprovante, p_acumulado, p_fk_Ong_cnpj_ong);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Projeto inserido com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o projeto: ' || SQLERRM);
    END inserir_projeto;

    PROCEDURE atualizar_projeto(
        p_id_projeto IN VARCHAR2,
        p_novo_nome IN VARCHAR2,
        p_nova_descricao IN VARCHAR2,
        p_nova_foto IN BLOB,
        p_nova_rua_projeto IN VARCHAR2,
        p_novo_numero_endereco IN VARCHAR2,
        p_nova_cidade IN VARCHAR2,
        p_novo_estado IN VARCHAR2,
        p_nova_meta IN NUMBER,
        p_novo_status IN VARCHAR2,
        p_novo_comprovante IN VARCHAR2,
        p_novo_acumulado IN NUMBER,
        p_novo_fk_Ong_cnpj_ong IN NUMBER
    ) IS
    BEGIN
        UPDATE Projeto
        SET nome = p_novo_nome,
            descricao = p_nova_descricao,
            foto = p_nova_foto,
            rua_projeto = p_nova_rua_projeto,
            numero_endereco = p_novo_numero_endereco,
            cidade = p_nova_cidade,
            estado = p_novo_estado,
            meta = p_nova_meta,
            status = p_novo_status,
            comprovante = p_novo_comprovante,
            acumulado = p_novo_acumulado,
            fk_Ong_cnpj_ong = p_novo_fk_Ong_cnpj_ong
        WHERE id_projeto = p_id_projeto;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Projeto atualizado com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Projeto não encontrado para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o projeto: ' || SQLERRM);
    END atualizar_projeto;

    PROCEDURE excluir_projeto(p_id_projeto IN VARCHAR2) IS
    BEGIN
        DELETE FROM Projeto
        WHERE id_projeto = p_id_projeto;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Projeto excluído com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Projeto não encontrado para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir o projeto: ' || SQLERRM);
    END excluir_projeto;

    -- Procedures para Doacao
    PROCEDURE inserir_doacao(
        p_id_doacao IN VARCHAR2,
        p_valor IN NUMBER,
        p_data IN DATE,
        p_fk_Doador_id_doador IN NUMBER,
        p_fk_Projeto_id_projeto IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Doacao (id_doacao, valor, data, fk_Doador_id_doador, fk_Projeto_id_projeto)
        VALUES (p_id_doacao, p_valor, p_data, p_fk_Doador_id_doador, p_fk_Projeto_id_projeto);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doação inserida com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir a doação: ' || SQLERRM);
    END inserir_doacao;

    PROCEDURE atualizar_doacao(
        p_id_doacao IN VARCHAR2,
        p_novo_valor IN NUMBER,
        p_nova_data IN DATE,
        p_novo_fk_Doador_id_doador IN NUMBER,
        p_novo_fk_Projeto_id_projeto IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Doacao
        SET valor = p_novo_valor,
            data = p_nova_data,
            fk_Doador_id_doador = p_novo_fk_Doador_id_doador,
            fk_Projeto_id_projeto = p_novo_fk_Projeto_id_projeto
        WHERE id_doacao = p_id_doacao;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doação atualizada com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Doação não encontrada para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar a doação: ' || SQLERRM);
    END atualizar_doacao;

    PROCEDURE excluir_doacao(p_id_doacao IN VARCHAR2) IS
    BEGIN
        DELETE FROM Doacao
        WHERE id_doacao = p_id_doacao;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doação excluída com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Doação não encontrada para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir a doação: ' || SQLERRM);
    END excluir_doacao;

    -- Procedures para Saque
    PROCEDURE inserir_saque(
        p_id_operacao IN VARCHAR2,
        p_valor IN NUMBER,
        p_timestamp IN TIMESTAMP,
        p_fk_Ong_cnpj_ong IN NUMBER,
        p_fk_Projeto_id_projeto IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Saque (id_operacao, valor, timestamp, fk_Ong_cnpj_ong, fk_Projeto_id_projeto)
        VALUES (p_id_operacao, p_valor, p_timestamp, p_fk_Ong_cnpj_ong, p_fk_Projeto_id_projeto);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Saque inserido com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o saque: ' || SQLERRM);
    END inserir_saque;

    PROCEDURE atualizar_saque(
        p_id_operacao IN VARCHAR2,
        p_novo_valor IN NUMBER,
        p_novo_timestamp IN TIMESTAMP,
        p_novo_fk_Ong_cnpj_ong IN NUMBER,
        p_novo_fk_Projeto_id_projeto IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Saque
        SET valor = p_novo_valor,
            timestamp = p_novo_timestamp,
            fk_Ong_cnpj_ong = p_novo_fk_Ong_cnpj_ong,
            fk_Projeto_id_projeto = p_novo_fk_Projeto_id_projeto
        WHERE id_operacao = p_id_operacao;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Saque atualizado com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Saque não encontrado para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o saque: ' || SQLERRM);
    END atualizar_saque;

    PROCEDURE excluir_saque(p_id_operacao IN VARCHAR2) IS
    BEGIN
        DELETE FROM Saque
        WHERE id_operacao = p_id_operacao;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Saque excluído com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Saque não encontrado para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir o saque: ' || SQLERRM);
    END excluir_saque;

    -- Procedures para Cupom
    PROCEDURE inserir_cupom(
        p_id_cupom IN VARCHAR2,
        p_cod_externo IN VARCHAR2,
        p_quantidade IN NUMBER,
        p_fk_Patrocinador_id_patrocinador IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Cupom (id_cupom, cod_externo, quantidade, fk_Patrocinador_id_patrocinador)
        VALUES (p_id_cupom, p_cod_externo, p_quantidade, p_fk_Patrocinador_id_patrocinador);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Cupom inserido com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o cupom: ' || SQLERRM);
    END inserir_cupom;

    PROCEDURE atualizar_cupom(
        p_id_cupom IN VARCHAR2,
        p_novo_cod_externo IN VARCHAR2,
        p_nova_quantidade IN NUMBER,
        p_novo_fk_Patrocinador_id_patrocinador IN NUMBER
    ) IS
    BEGIN
        UPDATE Cupom
        SET cod_externo = p_novo_cod_externo,
            quantidade = p_nova_quantidade,
            fk_Patrocinador_id_patrocinador = p_novo_fk_Patrocinador_id_patrocinador
        WHERE id_cupom = p_id_cupom;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Cupom atualizado com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Cupom não encontrado para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o cupom: ' || SQLERRM);
    END atualizar_cupom;

    PROCEDURE excluir_cupom(p_id_cupom IN VARCHAR2) IS
    BEGIN
        DELETE FROM Cupom
        WHERE id_cupom = p_id_cupom;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Cupom excluído com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Cupom não encontrado para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir o cupom: ' || SQLERRM);
    END excluir_cupom;

    -- Procedures para Doador_Cupom
    PROCEDURE inserir_doador_cupom(
        p_fk_Doador_id_doador IN NUMBER,
        p_fk_Cupom_id_cupom IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Doador_cupom (fk_Doador_id_doador, fk_Cupom_id_cupom)
        VALUES (p_fk_Doador_id_doador, p_fk_Cupom_id_cupom);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doador-Cupom inserido com sucesso!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o doador-cupom: ' || SQLERRM);
    END inserir_doador_cupom;

    PROCEDURE atualizar_doador_cupom(
        p_fk_Doador_id_doador_antigo IN NUMBER,
        p_fk_Cupom_id_cupom_antigo IN VARCHAR2,
        p_fk_Doador_id_doador_novo IN NUMBER,
        p_fk_Cupom_id_cupom_novo IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Doador_cupom
        SET fk_Doador_id_doador = p_fk_Doador_id_doador_novo,
            fk_Cupom_id_cupom = p_fk_Cupom_id_cupom_novo
        WHERE fk_Doador_id_doador = p_fk_Doador_id_doador_antigo
            AND fk_Cupom_id_cupom = p_fk_Cupom_id_cupom_antigo;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doador-Cupom atualizado com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Doador-Cupom não encontrado para atualização.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o Doador-Cupom: ' || SQLERRM);
    END atualizar_doador_cupom;

    PROCEDURE excluir_doador_cupom(
        p_fk_Doador_id_doador IN NUMBER,
        p_fk_Cupom_id_cupom IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM Doador_cupom
        WHERE fk_Doador_id_doador = p_fk_Doador_id_doador
          AND fk_Cupom_id_cupom = p_fk_Cupom_id_cupom;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Doador-Cupom excluído com sucesso!');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Doador-Cupom não encontrado para exclusão.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao excluir o Doador-Cupom: ' || SQLERRM);
    END excluir_doador_cupom;

    -- Procedures de Relatório
    PROCEDURE relatorio_doacoes_ong AS
      CURSOR c_ong_doacoes IS
        SELECT o.nome AS ong_nome,
               COUNT(d.id_doacao) AS num_doacoes,
               SUM(d.valor) AS total_doado,
               AVG(d.valor) AS media_doacao
        FROM Ong o
        JOIN Projeto p ON o.cnpj_ong = p.fk_Ong_cnpj_ong
        JOIN Doacao d ON p.id_projeto = d.fk_Projeto_id_projeto
        GROUP BY o.nome
        ORDER BY total_doado DESC;

      r_ong_doacoes c_ong_doacoes%ROWTYPE;
    BEGIN
      OPEN c_ong_doacoes;
      DBMS_OUTPUT.PUT_LINE('Relatório de Doações por ONG');
      DBMS_OUTPUT.PUT_LINE('ONG Nome | Número de Doações | Total Doado | Média por Doação');
      LOOP
        FETCH c_ong_doacoes INTO r_ong_doacoes;
        EXIT WHEN c_ong_doacoes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(r_ong_doacoes.ong_nome || ' | ' || r_ong_doacoes.num_doacoes || ' | ' ||
                             r_ong_doacoes.total_doado || ' | ' || r_ong_doacoes.media_doacao);
      END LOOP;
      CLOSE c_ong_doacoes;
    END relatorio_doacoes_ong;

    PROCEDURE relatorio_doacoes_estado AS
      CURSOR c_estado_doacoes IS
        SELECT o.estado AS estado,
               COUNT(d.id_doacao) AS num_doacoes,
               SUM(d.valor) AS total_doado
        FROM Ong o
        JOIN Projeto p ON o.cnpj_ong = p.fk_Ong_cnpj_ong
        JOIN Doacao d ON p.id_projeto = d.fk_Projeto_id_projeto
        GROUP BY o.estado
        ORDER BY o.estado;

      r_estado_doacoes c_estado_doacoes%ROWTYPE;
    BEGIN
      OPEN c_estado_doacoes;
      DBMS_OUTPUT.PUT_LINE('Relatório de Doações por Estado');
      DBMS_OUTPUT.PUT_LINE('Estado | Número de Doações | Total Doado');
      LOOP
        FETCH c_estado_doacoes INTO r_estado_doacoes;
        EXIT WHEN c_estado_doacoes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(r_estado_doacoes.estado || ' | ' || r_estado_doacoes.num_doacoes || ' | ' ||
                             r_estado_doacoes.total_doado);
      END LOOP;
      CLOSE c_estado_doacoes;
    END relatorio_doacoes_estado;

END ONG_MANAGEMENT;
/


---- TESTES -----------------------------------------------------------------------
SET SERVEROUTPUT ON;
-- ONG
BEGIN
   ONG_MANAGEMENT.inserir_ong(12345678901236, 'Ong Exemplo', 'email@ong.com', 'senha123', 'Rua Exemplo', 'Cidade Exemplo', 'SP', '11977699648', NULL, 1234, 119569, 08312);
END;
/
SELECT * FROM Ong;

BEGIN
   ONG_MANAGEMENT.atualizar_ong(12345678901236, 'Ong Exemplo Alterado', 'email_novo@ong.com', 'senha_nova123', 'Rua Nova Exemplo', 'Cidade Nova Exemplo', 'RJ', '21987654321', NULL, 2345, 120678, 09234);
END;
/

SELECT * FROM Ong;

BEGIN
   ONG_MANAGEMENT.excluir_ong(12345678901236);
END;
/

SELECT * FROM Ong;

-- DOADOR


BEGIN
   ONG_MANAGEMENT.inserir_doador(6, 'João Silva', 'joao@example.com', 'senha123', '11977699648', 'SP', 'São Paulo', 1234, 119569, 08312, 'P');
END;
/
SELECT * FROM DOADOR;
BEGIN
   ONG_MANAGEMENT.atualizar_doador(6, 'João Silva Atualizado', 'joao_novo@example.com', 'nova_senha123', '21987654321', 'RJ', 'Rio de Janeiro', 2345, 120678, 09234, 'P');
END;
/
SELECT * FROM DOADOR;

BEGIN
   ONG_MANAGEMENT.excluir_doador(6);
END;
/
SELECT * FROM DOADOR;


-- PATROCINADOR
BEGIN
   ONG_MANAGEMENT.inserir_patrocinador(6, 'Eco Patrocinador', 'patrocinador@eco.com', 'senha123', '1122334455', NULL);
END;
/
SELECT * FROM PATROCINADOR;

BEGIN
  ONG_MANAGEMENT.atualizar_patrocinador(6, 'Eco Patrocinador Atualizado', 'patrocinador_novo@eco.com', 'nova_senha123', '2233445566', NULL);
END;
/
SELECT * FROM PATROCINADOR;

BEGIN
   ONG_MANAGEMENT.excluir_patrocinador(6);
END;
/
SELECT * FROM PATROCINADOR;

-- Projeto

-- será incluido novamente uma ong para garantir a integridade da chave estrangeira
BEGIN
   ONG_MANAGEMENT.inserir_ong(12345678901236, 'Ong Exemplo', 'email@ong.com', 'senha123', 'Rua Exemplo', 'Cidade Exemplo', 'SP', '11977699648', NULL, 1234, 119569, 08312);
   ONG_MANAGEMENT.inserir_projeto('P6', 'Projeto Verde', 'Plantar árvores em áreas urbanas', NULL, 'Rua das Árvores', '100', 'São Paulo', 'SP', 20000, 'A', 'comprovante_projeto.pdf', 0, 12345678901236);
END;
/
SELECT * FROM PROJETO;

BEGIN
   ONG_MANAGEMENT.atualizar_projeto('P6', 'Projeto Verde Renovado', 'Expandir plantio para novas áreas', NULL, 'Avenida Nova Floresta', '200', 'São Paulo', 'SP', 3000000, 'A', 'comprovante_novo.pdf', 5000, 12345678901236);
END;
/
SELECT * FROM PROJETO;

BEGIN
   ONG_MANAGEMENT.excluir_projeto('P6');
END;
/
SELECT * FROM PROJETO;

-- Doacao
--Para garantir a integridade das chaves estrangeiras vamos inserir novamente o projeto excluido e o doador excluido
BEGIN
   ONG_MANAGEMENT.inserir_projeto('P6', 'Projeto Verde', 'Plantar árvores em áreas urbanas', NULL, 'Rua das Árvores', '100', 'São Paulo', 'SP', 20000, 'A', 'comprovante_projeto.pdf', 0, 12345678901236);
   ONG_MANAGEMENT.inserir_doador(6, 'João Silva', 'joao@example.com', 'senha123', '11977699648', 'SP', 'São Paulo', 1234, 119569, 08312, 'P');
   ONG_MANAGEMENT.inserir_doacao('D6', 1000, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 6, 'P6');
END;
/
SELECT * FROM DOACAO;

BEGIN
   ONG_MANAGEMENT.atualizar_doacao('D6', 1500, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 6, 'P6');
END;
/
SELECT * FROM DOACAO;

BEGIN
   ONG_MANAGEMENT.excluir_doacao('D6');
END;
/
SELECT * FROM DOACAO;

-- SAQUE
BEGIN
   ONG_MANAGEMENT.inserir_saque('S6', 500, TO_TIMESTAMP('2024-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12345678901236, 'P6');
END;
/
SELECT * FROM SAQUE;

BEGIN
   ONG_MANAGEMENT.atualizar_saque('S6', 1000, TO_TIMESTAMP('2024-02-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 12345678901236, 'P6');
END;
/
SELECT * FROM SAQUE;

BEGIN
   ONG_MANAGEMENT.excluir_saque('S6');
END;
/
SELECT * FROM SAQUE;

--- CUPOM
-- Para garantir a integridade da chave estrangeira vamos inserir novamente o patrocinador excluido

BEGIN
   ONG_MANAGEMENT.inserir_patrocinador(6, 'Eco Patrocinador', 'patrocinador@eco.com', 'senha123', '1122334455', NULL);
   ONG_MANAGEMENT.inserir_cupom('C6', 'COD123', 50, 6);
END;
/
SELECT * FROM CUPOM;

BEGIN
   ONG_MANAGEMENT.atualizar_cupom('C6', 'COD456', 100, 6);
END;
/
SELECT * FROM CUPOM;

BEGIN
   ONG_MANAGEMENT.excluir_cupom('C6');
END;
/
SELECT * FROM CUPOM;

--- DOADOR__CUPOM
-- VAMOS INSERIR NOVAMENTE O DOADOR E O CUPOM EXCLUIDOS PARA GARANTIR A INTEGRIDADE DA CHAVE ESTRANGEIRA
BEGIN
   ONG_MANAGEMENT.inserir_doador(6, 'João Silva', 'joao@example.com', 'senha123', '11977699648', 'SP', 'São Paulo', 1234, 119569, 08312, 'P');
   ONG_MANAGEMENT.inserir_doador(7, 'Marcel', 'marcel@example.com', 'senha123', '11977699644', 'SP', 'São Paulo', 1234, 119569, 01111, 'P');
   ONG_MANAGEMENT.inserir_cupom('C6', 'COD123', 50, 6);
   ONG_MANAGEMENT.inserir_cupom('C7', 'COD124', 100, 1);
   ONG_MANAGEMENT.inserir_doador_cupom(6, 'C6');
END;
/
SELECT * FROM DOADOR_CUPOM;

BEGIN
   ONG_MANAGEMENT.atualizar_doador_cupom(6, 'C6', 7, 'C7');
END;
/
SELECT * FROM DOADOR_CUPOM;

BEGIN
   ONG_MANAGEMENT.excluir_doador_cupom(7, 'C7');
END;
/
SELECT * FROM DOADOR_CUPOM;


---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
------------------------------- TESTE RELÁTORIOS --------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
BEGIN
  ONG_MANAGEMENT.relatorio_doacoes_ong;
END;
/

BEGIN
  ONG_MANAGEMENT.relatorio_doacoes_estado;
END;
/

--------------------------------------- TRIGGERS -----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER monitorar_alteracoes_projeto
AFTER UPDATE ON Projeto
FOR EACH ROW
DECLARE
    v_usuario VARCHAR(255) := USER; 
BEGIN
    IF :OLD.nome <> :NEW.nome THEN
        INSERT INTO auditoria_alteracoes (nome_tabela, nome_coluna, valor_antigo, valor_novo, usuario_responsavel)
        VALUES ('Projeto', 'nome', :OLD.nome, :NEW.nome, v_usuario);
    END IF;

    IF :OLD.descricao <> :NEW.descricao THEN
        INSERT INTO auditoria_alteracoes (nome_tabela, nome_coluna, valor_antigo, valor_novo, usuario_responsavel)
        VALUES ('Projeto', 'descricao', :OLD.descricao, :NEW.descricao, v_usuario);
    END IF;

    IF :OLD.meta <> :NEW.meta THEN
        INSERT INTO auditoria_alteracoes (nome_tabela, nome_coluna, valor_antigo, valor_novo, usuario_responsavel)
        VALUES ('Projeto', 'meta', TO_CHAR(:OLD.meta), TO_CHAR(:NEW.meta), v_usuario);
    END IF;
END;
/

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------- TESTE TRIGGERS ----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------


SELECT * FROM auditoria_alteracoes;
BEGIN
   ONG_MANAGEMENT.atualizar_projeto('P2', 'Água Limpa Atualizado', 'Tratamento de águas de rios urbanos.', NULL, 'Margem do Rio', '200', 'São Paulo', 'SP', 200000, 'A', 'comprovante2.pdf', 55000, 23456789012345);
END;
/
SELECT * FROM auditoria_alteracoes;






