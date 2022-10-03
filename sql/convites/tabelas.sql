-- Tabelas Grupo A
/*Quando um candidato aceitar ser palestrante ele vai ser cadastrado na tabela pessoa? 
Será que vale a pena? Ou só deixamos sem o idPessoa mesmo?*/
----------casar estas duas tabelas----------
-- Criação da tabela CandidatoAPalestrante
CREATE TABLE IF NOT EXISTS CandidatoAPalestrante(
    --idPessoa INTEGER,
    emailPrincipal VARCHAR(50) NOT NULL,
    pessoaQueIndicou VARCHAR(50) NOT NULL,
    contatoPessoaIndicou VARCHAR(50) NOT NULL,
    CONSTRAINT emailPrincipal_pk PRIMARY KEY(emailPrincipal)
   -- CONSTRAINT idPessoaCadidato_fk FOREIGN KEY (idPessoa)
   --   REFERENCES Pessoa(idPessoa)
);

-- Criação da tabela DescricaoCandidato
CREATE TABLE IF NOT EXISTS DescricaoCandidato(
	miniCurriculo VARCHAR(500),
    areaDeAtuacao VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    foto bytea NOT NULL,
    emailPrincipal VARCHAR(50) NOT NULL,
	-- trocando a primary key para ser o email principal
    --CONSTRAINT descricaoCandidato_pk PRIMARY KEY(miniCurriculo),
	CONSTRAINT descricaoCandidato_pk PRIMARY KEY(emailPrincipal),
    CONSTRAINT emailprincipal_fk FOREIGN KEY(emailPrincipal) 
        REFERENCES CandidatoAPalestrante(emailPrincipal)
);
----------casar essas duas tabelas----------

-- Criação da tabela LinksTrabalhosCandPalest
CREATE TABLE IF NOT EXISTS TituloTrabalhosCandPalest(
    emailPrincipal VARCHAR(50),
    titulo VARCHAR (50) NOT NULL,
    uniclink VARCHAR(50) NOT NULL,
    CONSTRAINT emailPrincipalLinkPalestrante_pk PRIMARY KEY(emailPrincipal, titulo),
    CONSTRAINT emailPrincipalLinkPalestrante_fk FOREIGN KEY(emailPrincipal) 
        REFERENCES CandidatoAPalestrante(emailPrincipal)
);

-- Criação da tabela EmailsSecundariosCandPalest
CREATE TABLE IF NOT EXISTS EmailSecundarioCandPalest(
    emailPrincipal VARCHAR(50),
    email VARCHAR(50),
    CONSTRAINT emailPrincipalEmailSecundario_pk PRIMARY KEY(emailPrincipal, email),
    CONSTRAINT emailPrincipalEmailSecundario_fk FOREIGN KEY(emailPrincipal) 
        REFERENCES CandidatoAPalestrante(emailPrincipal)
);

-- Criação da tabela TelefonesCandidatoPalest
CREATE TABLE IF NOT EXISTS TelefoneCandidatoPalest(
    emailPrincipal VARCHAR(50),
    telefone VARCHAR(50),
    CONSTRAINT emailPrincipalTelefonesCandidato_pk PRIMARY KEY(emailPrincipal, telefone),
    CONSTRAINT emailPrincipalTelefonesCandidato_fk FOREIGN KEY(emailPrincipal) 
        REFERENCES CandidatoAPalestrante(emailPrincipal)
);

-- Criação da tabela Abordagem
CREATE TABLE IF NOT EXISTS Abordagem (
    idAbordagem SERIAL,
    idCompostoPor INTEGER,
    emailPrincipal varchar(50),
    dataHoraAbordagem date,
    conteudo varchar(500),
    meioComunicacao1 varchar(50),
    meioComunicacao2 varchar(50),
    meioComunicacao3 varchar(50),
    CONSTRAINT Abordagem_pk PRIMARY KEY (idAbordagem),
    CONSTRAINT Candidato_fk FOREIGN KEY (emailPrincipal)
        REFERENCES CandidatoAPalestrante (emailPrincipal),
    CONSTRAINT MembroComite_pk FOREIGN KEY (idCompostoPor)
        REFERENCES MembroComiteConvite (idCompostoPor),
    CONSTRAINT emailPrincipal_idCompostoPor_unique UNIQUE (emailPrincipal, idCompostoPor, dataHoraAbordagem)
);

-- Criação da tabela Palestras
CREATE TABLE IF NOT EXISTS Palestras (
    tituloDaPalestra varchar(50),
    resumoDaPalestra varchar(500),
    materialDeApoio varchar(500),
    idAbordagem INTEGER,
    idPalestra SERIAL,
    CONSTRAINT Palestras_pk PRIMARY KEY (idPalestra),
    CONSTRAINT Palestras_fk FOREIGN KEY (idAbordagem)
		REFERENCES Abordagem (idAbordagem)
    --    REFERENCES CronogramaPalestra (idAbordagem)
);

-- Criação da tabela CronogramaPalestra
CREATE TABLE IF NOT EXISTS CronogramaPalestra (
    idAbordagem INTEGER,
    tipoEvento varchar(50),
    idPalestra INTEGER,
    dataDaPalestra date,
    horaDaPalestra time,
    duracaoPrevista interval,
    numeroDeSala INTEGER,
    predio varchar(50),
    CONSTRAINT CronogramaPalestra_pk PRIMARY KEY (idAbordagem),
    CONSTRAINT CronogramaPalestra_fk FOREIGN KEY (idAbordagem)
        REFERENCES Abordagem (idAbordagem),
    --CONSTRAINT numeroDeSala_unique UNIQUE (numeroDeSala),
    --CONSTRAINT tituloDaPalestra UNIQUE (tituloDaPalestra),
    -- eh melhor que isso seja modelado por meio de triggers/precedures para nao gerar problemas de uma atualizacao na tabela trancar uma sala pra sempre
    CONSTRAINT tipoEvento_check CHECK (tipoEvento IN ('Mini-curso', 'Mesa redonda', 'Workshop')),
    CONSTRAINT PalestrasCrono_fk FOREIGN KEY (idPalestra)
        REFERENCES Palestras(idPalestra)
);

----------matar tabela (talvez)----------
-- Acho que podemos remover, tudo o que tem aqui tem no cronograma
-- o andar a professra falou que não era tão importante
-- Criação da tabela PredioPalestra
CREATE TABLE IF NOT EXISTS PredioPalestra (
    numeroDeSala INTEGER,
    andar INTEGER,
    predio varchar(50),
    CONSTRAINT PredioPalestra_pk PRIMARY KEY (numeroDeSala),
    CONSTRAINT PredioPalestra_fk FOREIGN KEY (numeroDeSala)
        REFERENCES CronogramaPalestra
);
----------matar tabela (talvez)----------

-- Criação da tabela DocumentosCronogramaPalestra
CREATE TABLE IF NOT EXISTS DocumentosCronogramaPalestra (
    idAbordagem INTEGER,
    dataEntrega timestamp,
    documento bytea,
    tituloDocumento varchar(20),
    tipo varchar(5),
    statusAtendimentoEnvio varchar (20),
    --a natureza do envio: o que seria?
    CONSTRAINT DocumentosCronogramaPalestra_pk PRIMARY KEY (idAbordagem, dataEntrega, tituloDocumento),
    CONSTRAINT DocumentosCronogramaPalestra_fk FOREIGN KEY (idAbordagem)
        REFERENCES Abordagem (idAbordagem)
);
