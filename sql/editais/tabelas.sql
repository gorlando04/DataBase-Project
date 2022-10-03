-- Tabelas Grupo B
-- Criação da tabela Edital
/* Tabelas relacionadas: 
   - IdiomasAceitos (1, n)
   - EixosApresentacao (1, n)
   - AreasApresentacao (1, n)
   - Regras (1, n)
   - CronogramaEdital (1, n)
*/
CREATE TABLE IF NOT EXISTS Edital (
    idEdital SERIAL,
    sigla VARCHAR(8) NOT NULL,
    url VARCHAR(64) NOT NULL,
    dataUltimaEdicao DATE,
    dataPublicacaoOriginal DATE,
    
    CONSTRAINT edital_pk PRIMARY KEY (idEdital),
    CONSTRAINT edital_fk FOREIGN KEY (sigla)
        REFERENCES Evento(sigla),
    CONSTRAINT edital_unique UNIQUE (sigla, url)
);

-- Criação da tabela IdiomasAceitos
CREATE TABLE IF NOT EXISTS IdiomasAceitos (
    idioma CHAR NOT NULL,
    idEdital INTEGER NOT NULL, 

    CONSTRAINT idiomas_pk PRIMARY KEY (idioma, idEdital),
    CONSTRAINT idiomas_fk FOREIGN KEY (idEdital)
        REFERENCES Edital(idEdital),
    CONSTRAINT idiomas_check CHECK(idioma IN('P', 'I', 'E'))
    -- portugues, ingles, espanhol
);

-- Criação da tabela EixosApresentacao 
/* Tabelas relacionadas:
   - SubEixosApresentacao (0, n)
*/
CREATE TABLE IF NOT EXISTS EixosApresentacao (
    idEixo SERIAL,
    idEdital INTEGER NOT NULL,
    nomeEixo VARCHAR(20) NOT NULL,
        
    CONSTRAINT eixos_pk PRIMARY KEY (idEixo),
    CONSTRAINT eixos_fk FOREIGN KEY (idEdital)
        REFERENCES Edital(idEdital),
    CONSTRAINT eixos_unique UNIQUE (idEdital, nomeEixo)
);

-- Criação da tabela SubEixosApresentacao
CREATE TABLE IF NOT EXISTS SubEixosApresentacao (
    idEixo INTEGER NOT NULL,
    nomeSubEixo VARCHAR(20) NOT NULL,

    CONSTRAINT subEixos_pk PRIMARY KEY(nomeSubEixo, idEixo),
    CONSTRAINT subEixos_fk FOREIGN KEY(idEixo)
        REFERENCES EixosApresentacao(idEixo)
);

-- Criação da tabela AreasApresentacao
/* Tabelas relacionadas:
   - SubAreasApresentacao (0, n)
*/
CREATE TABLE IF NOT EXISTS AreasApresentacao (
    idArea SERIAL,
    idEdital INTEGER NOT NULL,
    nomeArea VARCHAR(20) NOT NULL,

    CONSTRAINT areasapresentacao_pk PRIMARY KEY (idArea),
    CONSTRAINT areas_fk FOREIGN KEY (idEdital)
        REFERENCES Edital(idEdital),
    CONSTRAINT areas_unique UNIQUE (idEdital, nomeArea)
);

-- Criação da tabela SubAreasApresentacao
CREATE TABLE IF NOT EXISTS SubAreasApresentacao (
    idArea INTEGER NOT NULL,
    nomeSubArea VARCHAR(20) NOT NULL,
    
    CONSTRAINT subAreas_pk PRIMARY KEY(nomeSubArea, idArea),
    CONSTRAINT subAreas_fk FOREIGN KEY(idArea)
        REFERENCES AreasApresentacao(idArea)
);

-- Criação da tabela Regras
CREATE TABLE IF NOT EXISTS Regras (
    idEdital INTEGER NOT NULL,
    descricao VARCHAR(200),
    modelo BYTEA,

    CONSTRAINT regras_pk PRIMARY KEY(idEdital),
    CONSTRAINT regras_fk FOREIGN KEY(idEdital)
        REFERENCES Edital(idEdital)
);

-- Criação da tabela CronogramaEdital
/* Tabelas relacionadas:
   - PeriodoInscricoesEdital (1, n)
   - PeriodoSubmissoesEdital (1, n)
*/
CREATE TABLE IF NOT EXISTS CronogramaEdital (
    idCronogramaEdital SERIAL,
    idEdital INTEGER NOT NULL,
    dataPublicacaoOriginal DATE NOT NULL,
    intervaloRealizacao INTERVAL,
    dataDivulgacaoListaAprovados DATE,
    
    CONSTRAINT cronograma_pk PRIMARY KEY(idCronogramaEdital),
    CONSTRAINT cronograma_fk FOREIGN KEY(idEdital) 
        REFERENCES Edital(idEdital),
    CONSTRAINT cronograma_unique UNIQUE(idEdital, dataPublicacaoOriginal)
);

-- Criação da tabela PeriodoInscricoesEdital
CREATE TABLE IF NOT EXISTS PeriodoInscricoesEdital (
    idCronogramaEdital INTEGER NOT NULL,
    inicioPeriodoI DATE NOT NULL,
    fimPeriodoI DATE NOT NULL,    

    CONSTRAINT periodoIns_pk PRIMARY KEY(inicioPeriodoI, fimPeriodoI, idCronogramaEdital),
    CONSTRAINT periodoIns_fk FOREIGN KEY(idCronogramaEdital) 
        REFERENCES CronogramaEdital(idCronogramaEdital)
);

-- Criação da tabela PeriodoSubmissoesEdital
CREATE TABLE IF NOT EXISTS PeriodoSubmissoesEdital (
    idCronogramaEdital INTEGER NOT NULL,
    inicioPeriodoS DATE NOT NULL,
    fimPeriodoS DATE NOT NULL,
    
    CONSTRAINT periodoSub_pk PRIMARY KEY(inicioPeriodoS, fimPeriodoS, idCronogramaEdital),
    CONSTRAINT periodoSub_fk FOREIGN KEY(idCronogramaEdital) 
        REFERENCES CronogramaEdital(idCronogramaEdital)
);

-- Criação da tabela Trabalho
/* Tabelas relacionadas:
   - Artigo (1, n)
   - VersaoSintese (1, n)
*/
CREATE TABLE IF NOT EXISTS Trabalho (
    idEdital INTEGER NOT NULL,
    idTrabalho SERIAL NOT NULL,
    titulo VARCHAR(64) NOT NULL,
    palavraChave1 VARCHAR(16) NOT NULL,
    palavraChave2 VARCHAR(16) NOT NULL,
    palavraChave3 VARCHAR(16) NOT NULL,
    palavraChave4 VARCHAR(16),
    palavraChave5 VARCHAR(16),
    idiomaPrincipal CHAR NOT NULL,
    idioma2 CHAR,
    idioma3 CHAR,
    descricao VARCHAR(200),
    status VARCHAR(16),
    tipoTrabalho VARCHAR(32) NOT NULL,
    areaTrabalho integer,

    CONSTRAINT idiomaPTrabalho_check CHECK(idiomaPrincipal IN('P', 'I', 'E')),
    CONSTRAINT idioma2Trabalho_check CHECK(idioma2 IN('P', 'I', 'E')),
    CONSTRAINT idioma3Trabalho_check CHECK(idioma3 IN('P', 'I', 'E')),

    -- checagem: se o idioma principal eh x, os secundarios nao podem ser x

    CONSTRAINT status_check CHECK (status IN ('Aprovado', 'Pendente', 'Reprovado')),
  
    CONSTRAINT trabalho_pk PRIMARY KEY(idTrabalho),
    CONSTRAINT trabalho_fk FOREIGN KEY(idEdital) 
        REFERENCES Edital(idEdital),
    CONSTRAINT tipoTrabalho_check CHECK (tipoTrabalho IN ('Oficina', 'Minicurso','Artigo')),
    CONSTRAINT trabalho_unique UNIQUE(titulo), -- checar o overhead gerado, pois isso eh uma regra de negocio (uniques geram indices, isso pode ser util mas eh caro)
    CONSTRAINT areaTrabalho_fk FOREIGN KEY (areaTrabalho)
        REFERENCES AreasApresentacao(idArea)
    -- usar a tablea de idiomasAceitos
	-- se usar ela será que precisa manter os checks aqui? 
);

-- Criação da tabela Artigo
CREATE TABLE IF NOT EXISTS Artigo (
    idTrabalho INTEGER,
    tipoArtigo VARCHAR(32) NOT NULL,
    
    CONSTRAINT artigo_pk PRIMARY KEY(idTrabalho),
    CONSTRAINT artigo_fk FOREIGN KEY(idTrabalho) 
        REFERENCES Trabalho(idTrabalho),
    CONSTRAINT tipoArtigo_check CHECK (tipoArtigo IN ('Resumo', 'ResumoEstendido', 'ArtigoCompleto'))
);

-- Criação da tabela VersaoAbstract
-- foi trocado de VersaoSintese
-- esclarecer essa tabela e verificar a utilização
-- essa tabela não é o resumo e as informações do artigo?
/*
 informações sejam destacadas nos artigos submetidos: título, autoria, resumo
no idioma principal do evento, opcionalmente resumos em outros idiomas secundários do
evento, no mínimo 3 e no máximo 5 palavras-chaves, o status do artigo (aprovado, reprovado,
pendente)
*/
CREATE TABLE IF NOT EXISTS VersaoAbstract (
    idTrabalho INTEGER,
    idioma CHAR NOT NULL,
    texto TEXT NOT NULL,
    ehPrimario BOOLEAN NOT NULL,
    
    CONSTRAINT sintese_pk PRIMARY KEY(idTrabalho),
    CONSTRAINT sintese_fk FOREIGN KEY(idTrabalho) 
        REFERENCES Artigo(idTrabalho),
    CONSTRAINT idiomaSinteseCheck CHECK(idioma IN('P', 'I', 'E'))
);
