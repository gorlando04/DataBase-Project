-- Tabelas Grupo C
-- A primeira cardinalidade é sempre da tabela que está sendo criada logo abaixo
-- Criação da tabela Autor
-- Relaciona-se com tabela Trabalho, cardinalidade N:, relacionamento Submete
-- Relaciona-se com tabela FormatosCitacao, cardinalidade 1:
CREATE TABLE IF NOT EXISTS Autor(
	idAutor INTEGER NOT NULL,
	CONSTRAINT autor_pk PRIMARY KEY(idAutor),
	CONSTRAINT idPessoa_fk FOREIGN KEY(idAutor)
		REFERENCES Pessoa(idPessoa)
); 

-- Criação da tabela FormatosCitacao 
-- Atributo multivalorado de Autor
-- Relaciona-se com a tabela Autor, cardinalidade N:
CREATE TABLE IF NOT EXISTS FormatosCitacao(
	idAutor INTEGER NOT NULL,
	forma VARCHAR(40),
	CONSTRAINT formatosCitacao_pk PRIMARY KEY (idAutor, forma),
	CONSTRAINT idAutor_fk FOREIGN KEY (idAutor)
		REFERENCES Autor(idAutor)
);

-- Criação da tabela PrazoRespostaAvaliador
CREATE TABLE IF NOT EXISTS PrazoRespostaAvaliador(
	dataEnvioConv TIMESTAMP NOT NULL,
	prazoRespConv INTERVAL,
	CONSTRAINT dataEnvioConv_pk PRIMARY KEY (dataEnvioConv)
);

-- Criação da tabela Avaliador
-- Relaciona-se com a tabela Trabalho, cardinalidade N:N, relacionamento Avalia
-- Relaciona-se com a tabela CertificadoAvaliador, cardinalidade 1:1, relacionamento Recebe
-- Relaciona-se com tabela AreasAptas, cardinalidade 1:N
-- Relaciona-se com tabela AreasInaptas, cardinalidade 1:N
CREATE TABLE IF NOT EXISTS Avaliador(
	idAvaliador INTEGER NOT NULL,
	dataEnvioConv TIMESTAMP NOT NULL,
	dataRespConv DATE,
	CONSTRAINT avaliador_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa),
  CONSTRAINT dataEnvioConv_fk FOREIGN KEY (dataEnvioConv)
    REFERENCES PrazoRespostaAvaliador (dataEnvioConv)
  -- chave estrangeira pro prazo
);



-- Criação da tabela AreasAptas
-- Atributo multivalorado de Avaliador
-- Relaciona-se com tabela Avaliador, cardinalidade N:1
CREATE TABLE IF NOT EXISTS AreasAptas(
	idAvaliador INTEGER NOT NULL,
	areaApta VARCHAR(20),
	CONSTRAINT areasAptas_pk PRIMARY KEY (idAvaliador, areaApta),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Avaliador(idAvaliador)
);

-- Criação da tabela AreasInaptas
-- Atributo multivalorado de Avaliador
-- Relaciona-se com tabela Avaliador, cardinalidade N:1
CREATE TABLE IF NOT EXISTS AreasInaptas(
	idAvaliador INTEGER NOT NULL,
	areaInapta VARCHAR(20),
	CONSTRAINT areasInaptas_pk PRIMARY KEY (idAvaliador, areaInapta),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Avaliador(idAvaliador)
);

-- Criação da tabela CertificadoAvaliador
-- Relaciona-se com a tabela Avaliador, cardinalidade 1:1, relacionamento Recebe
-- Relaciona-se com tabela ArquivosCertificado, cardinalidade 1:N
CREATE TABLE IF NOT EXISTS CertificadoAvaliador(
	idAvaliador INTEGER NOT NULL,
	codCertificado SERIAL NOT NULL,
	CONSTRAINT certificadoAvaliador_pk PRIMARY KEY (idAvaliador, codCertificado),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Avaliador(idAvaliador)
);

-- Criação da tabela Avalia
CREATE TABLE IF NOT EXISTS Avalia(

    idAvalia SERIAL PRIMARY KEY,
    idTrabalho INTEGER NOT NULL,
    idAvaliador INTEGER NOT NULL,
    
    FOREIGN KEY (idTrabalho)
        REFERENCES Trabalho (idTrabalho),

    FOREIGN KEY (idAvaliador)
        REFERENCES Avaliador (idAvaliador),
    
    UNIQUE(idTrabalho,idAvaliador)
);

-- Criação tabela CriterioAvaliacao
CREATE TABLE IF NOT EXISTS CriterioAvaliacao (
  idCriterio SERIAL NOT NULL,
  idEdital INTEGER NOT NULL,  
  criterioAvaliado varchar(200),
  descricaoCriterios varchar(500),
  -- Aterei o id porque inseri o criterio avaliado como primary key e inseri a
  -- surrogate idCriterio
  CONSTRAINT Criterio_pk PRIMARY KEY (idCriterio),
  CONSTRAINT Criterio_fk FOREIGN KEY (idEdital)
    REFERENCES Edital (idEdital),
  CONSTRAINT criterioEdital_unique UNIQUE (idEdital, criterioAvaliado)
);

-- Criação da tabela PrazoAvaliacao
CREATE TABLE IF NOT EXISTS PrazoAvaliacao(

    dataAtribuicao TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
    prazo INTERVAL NOT NULL,

    CONSTRAINT prazo_pk PRIMARY KEY (dataAtribuicao)
  
);

-- Criação da tabela Avaliacao
CREATE TABLE IF NOT EXISTS Avaliacao(
    idAvalia INTEGER NOT NULL,
    idCriterioAvaliado INTEGER NOT NULL,
    dataAtribuicao  TIMESTAMP NOT NULL,
    conflito boolean NOT NULL,
    dataResposta DATE NOT NULL DEFAULT CURRENT_DATE,
    justificativa VARCHAR(500),

    CONSTRAINT Avaliacao_pk PRIMARY KEY (idAvalia, dataAtribuicao),

    CONSTRAINT idAvalia_fk FOREIGN KEY (idAvalia)
        REFERENCES Avalia (idAvalia),
    
    CONSTRAINT dataAtribuicao_fk FOREIGN KEY (dataAtribuicao)
        REFERENCES PrazoAvaliacao (dataAtribuicao),

  
    CONSTRAINT idCriterioAvaliado_fk FOREIGN KEY (idCriterioAvaliado)
        REFERENCES CriterioAvaliacao (idCriterio)
);

-- Criação da tabela OrdemAutoria
CREATE TABLE IF NOT EXISTS OrdemAutoria(
    idAutoria SERIAL NOT NULL,
    idAutor INTEGER NOT NULL,
    ordemAutor INTEGER NOT NULL,
    CONSTRAINT autoriaOrdem_pk PRIMARY KEY (idAutoria),
    CONSTRAINT idAutor_fk FOREIGN KEY (idAutor)
      REFERENCES Autor (idAutor),
    CONSTRAINT autoriaOrdem_unique UNIQUE (idAutor, ordemAutor)
    
);

-- Criação da Tabela SubmeteTrabalho
CREATE TABLE IF NOT EXISTS SubmeteTrabalho(
    idAutor INTEGER NOT NULL,
    idTrabalho INTEGER NOT NULL,
    idAutoria INTEGER NOT NULL,
    CONSTRAINT submeteTrabalho_pk PRIMARY KEY (idAutor, idTrabalho),
    CONSTRAINT idAutor_fk FOREIGN KEY (idAutor)
        REFERENCES Autor (idAutor),      
    CONSTRAINT idTrabalho_fk FOREIGN KEY (idTrabalho)
        REFERENCES Trabalho (idTrabalho),
    CONSTRAINT idAutoria_fk FOREIGN KEY (idAutoria)
        REFERENCES OrdemAutoria (idAutoria)
);

-- Criação da tabela Areas para ser usada por areas inaptas ou aptas
-- Só será chamada para criar uma lista de areas possíveis
CREATE TABLE IF NOT EXISTS Areas(
    area VARCHAR(20),
    CONSTRAINT areas_pk PRIMARY KEY(area)
);
