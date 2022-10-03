drop table if exists Evento CASCADE;
drop table if exists Pais CASCADE;
drop table if exists Estado CASCADE;
drop table if exists Cidade CASCADE;
drop table if exists Bairro CASCADE;
drop table if exists Cep CASCADE;
drop table if exists TiposTrabalhosAceitosEvento CASCADE;
drop table if exists ComissaoOrganizadora CASCADE;
drop table if exists Comite CASCADE;
DROP TABLE IF EXISTS Pessoa CASCADE;
DROP TABLE IF EXISTS PessoaFiliacao CASCADE;
DROP TABLE IF EXISTS TelefonePessoa CASCADE; 
DROP TABLE IF EXISTS EmailPessoa CASCADE; 
DROP TABLE IF EXISTS Brasileiro CASCADE;
DROP TABLE IF EXISTS Estrangeiro CASCADE; 
DROP TABLE IF EXISTS EstrangeiroNroPassaporte CASCADE; 
DROP TABLE IF EXISTS MembroOrganizacao CASCADE;
DROP TABLE IF EXISTS CompostoPor CASCADE; 
DROP TABLE IF EXISTS MembroComiteConvite CASCADE; 
DROP TABLE IF EXISTS Autor CASCADE;
DROP TABLE IF EXISTS Avaliador CASCADE;
DROP TABLE IF EXISTS FormatosCitacao CASCADE;
DROP TABLE IF EXISTS PrazoRespostaAvaliador CASCADE;
DROP TABLE IF EXISTS Avaliacao CASCADE;
DROP TABLE IF EXISTS PrazoAvaliacao CASCADE;
DROP TABLE IF EXISTS Avalia CASCADE;
DROP TABLE IF EXISTS ArquivosCertificado CASCADE;
DROP TABLE IF EXISTS AreasAptas CASCADE;
DROP TABLE IF EXISTS AreasInaptas CASCADE;
DROP TABLE IF EXISTS CertificadoAvaliador CASCADE;
DROP TABLE IF EXISTS CandidatoAPalestrante CASCADE;
DROP TABLE IF EXISTS DescricaoCandidato CASCADE;
DROP TABLE IF EXISTS LinkTrabalhosCandPalest CASCADE;
DROP TABLE IF EXISTS EmailSecundarioCandPalest CASCADE;
DROP TABLE IF EXISTS TelefoneCandidatoPalest CASCADE;
DROP TABLE IF EXISTS Abordagem CASCADE;
DROP TABLE IF EXISTS CronogramaPalestra CASCADE;
DROP TABLE IF EXISTS Palestras CASCADE;
DROP TABLE IF EXISTS PredioPalestra CASCADE;
DROP TABLE IF EXISTS DataPalestra CASCADE;
DROP TABLE IF EXISTS DocumentosCronogramaPalestra CASCADE;
DROP TABLE IF EXISTS Edital CASCADE;
DROP TABLE IF EXISTS IdiomasAceitos CASCADE;
DROP TABLE IF EXISTS EixosApresentacao CASCADE;
DROP TABLE IF EXISTS SubEixosApresentacao CASCADE;
DROP TABLE IF EXISTS AreasApresentacao CASCADE;
DROP TABLE IF EXISTS SubAreasApresentacao CASCADE;
DROP TABLE IF EXISTS Regras CASCADE;
DROP TABLE IF EXISTS CronogramaEdital CASCADE;
DROP TABLE IF EXISTS PeriodoInscricoesEdital CASCADE;
DROP TABLE IF EXISTS PeriodoSubmissoesEdital CASCADE;
DROP TABLE IF EXISTS Trabalho CASCADE;
DROP TABLE IF EXISTS SubmeteTrabalho CASCADE;
DROP TABLE IF EXISTS OrdemAutoria CASCADE;
DROP TABLE IF EXISTS CriterioAvaliacao CASCADE;
DROP TABLE IF EXISTS Areas CASCADE;

--REM   Script: Endereco
--REM   Endereço

CREATE TABLE IF NOT EXISTS Pais( 
    pais varchar (20) not null, 
    estado varchar(20) not null, 
    CONSTRAINT Pais_pk PRIMARY KEY(estado, pais) -- observe que a PK é composta, portanto, a Fk também precisa ser composta 
);

CREATE TABLE IF NOT EXISTS Estado( 
    pais varchar (20) not null, 
	estado varchar(20) not null, 
    cidade varchar(35) not null, 
    CONSTRAINT Estado_pk PRIMARY KEY (estado, cidade), -- observe que a PK é composta, portanto, a Fk também precisa ser composta 
    CONSTRAINT Estado_fk FOREIGN KEY (estado, pais)  
        REFERENCES Pais(estado, pais) -- corrigindo a FK para EventoPais
);

CREATE TABLE IF NOT EXISTS Cidade( 
    estado varchar(20) not null, 
	cidade varchar(35) not null,
	bairro varchar(35) not null,      
    CONSTRAINT Cidade_pk PRIMARY KEY (bairro, cidade),-- observe que a PK é composta, portanto, a Fk também precisa ser composta 
    CONSTRAINT Cidade_fk FOREIGN KEY (estado, cidade) 
        REFERENCES Estado(estado, cidade)  -- corrigindo a FK para EventoCidade 
);

CREATE TABLE IF NOT EXISTS Bairro( 
    cidade varchar(35) not null, 
    bairro varchar(35) not null, 
    cep varchar(10) not null, 
    CONSTRAINT Bairro_pk PRIMARY KEY (bairro, cep), -- observe que a PK é composta, portanto, a Fk também precisa ser composta 
    CONSTRAINT Bairro_fk FOREIGN KEY (bairro, cidade)  
        REFERENCES Cidade(bairro, cidade)-- corrigindo a FK para EventoCidade 
);

CREATE TABLE IF NOT EXISTS Cep( 
    bairro varchar(35) not null, 
	cep varchar(10) not null, 
    numero integer not null, 
    logradouro varchar(25) not null, 
    complemento varchar(25) not null default 'Casa', 
    CONSTRAINT Cep_pk PRIMARY KEY (cep, numero, complemento), 
    CONSTRAINT Cep_fk FOREIGN KEY (bairro, cep)
        REFERENCES Bairro(bairro, cep)  -- corrigindo a FK para EventoBairro 
);

-- Criação da tabela Evento 


CREATE TABLE IF NOT EXISTS Evento( 
    sigla varchar(8), 
    nomeExtenso varchar(50) not null, 
    cep varchar(10) not null, 
    numero integer not null, 
	complemento varchar(25) not null,
    CONSTRAINT Evento_pk PRIMARY KEY(sigla), 
    CONSTRAINT Evento_fk FOREIGN KEY(cep, numero, complemento) 
      REFERENCES Cep(cep, numero, complemento) 
);

-- Criação da tabela TiposTrabalhosAceitosEvento
CREATE TABLE if not exists TiposTrabalhosAceitosEvento(
    tipoTrabalho varchar(20) not null,
    sigla varchar(8) not null,
    foreign key(sigla) references Evento(sigla),
    primary key(tipoTrabalho, sigla)
);

-- Criação da tabela ComissaoOrganizadora
CREATE TABLE if not exists ComissaoOrganizadora(
    edicao varchar(10) not null,
    sigla varchar(8) not null,
    ano integer not null,
    pais varchar(20) not null,
    foreign key(sigla) references Evento(sigla),
    primary key(edicao, sigla)
);

-- Criação da tabela Comite
CREATE TABLE if not exists Comite(
    idComite SERIAL primary key,
    tipo varchar(20) not null,
    sigla varchar(8) not null,
    descricao varchar(50),
    foreign key(sigla) references Evento(sigla),
    CONSTRAINT siglaTipoUnique unique(sigla, tipo),
    CONSTRAINT tipo_check CHECK (tipo IN ('CONVITE', 'EDITAIS'))
);

--criação da tabela Pessoa
CREATE TABLE IF NOT EXISTS Pessoa (
    idPessoa SERIAL,
    primeiroNome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cep varchar(10) not null, 
    numero integer not null, 
	complemento varchar(25) not null,
    CONSTRAINT Pessoa_pk PRIMARY KEY(idPessoa),
    CONSTRAINT Pessoa_fk FOREIGN KEY(cep, numero, complemento) 
      REFERENCES Cep(cep, numero, complemento) 
);

--criação da tabela PessoaFiliacao
CREATE TABLE IF NOT EXISTS PessoaFiliacao (
    idPessoa INTEGER NOT NULL,
    filiacao VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaFiliacao_pk PRIMARY KEY(idPessoa, filiacao),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela TelefonePessoa
CREATE TABLE IF NOT EXISTS TelefonePessoa (
    idPessoa INTEGER,
    ddi INTEGER NOT NULL,
    ddd INTEGER NOT NULL,
    prefixo INTEGER NOT NULL,
    numeroTelefone INTEGER NOT NULL,
    CONSTRAINT TelefonePessoa_pk PRIMARY KEY(idPessoa, numeroTelefone, ddi, ddd, prefixo),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela EmailPessoa
CREATE TABLE IF NOT EXISTS EmailPessoa (
    idPessoa INTEGER,
    login VARCHAR(50) NOT NULL,
    dominio VARCHAR(50) NOT NULL,
    CONSTRAINT EmailPessoa_pk PRIMARY KEY(idPessoa, dominio, login),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela Brasileiro
CREATE TABLE IF NOT EXISTS Brasileiro (
    cpf BIGINT NOT NULL,
    idPessoa INTEGER,
    CONSTRAINT Brasileiro_pk PRIMARY KEY(cpf),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela Estrangeiro
CREATE TABLE IF NOT EXISTS Estrangeiro (
    idPessoa INTEGER,
    nroPassaporte VARCHAR(20) NOT NULL,
    CONSTRAINT Estrangeiro_pk PRIMARY KEY(nroPassaporte),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela EstrangeiroNroPassaporte
CREATE TABLE IF NOT EXISTS EstrangeiroNroPassaporte (
    nroPassaporte VARCHAR(20),
    dataEmissao DATE NOT NULL,
    dataExpiracao DATE NOT NULL,
    govEmissor VARCHAR(50) NOT NULL,
    CONSTRAINT EstrangeiroNroPassaporte_pk PRIMARY KEY(nroPassaporte),
    CONSTRAINT EstrangeiroNroPassaporte_fk FOREIGN KEY (nroPassaporte)
    REFERENCES Estrangeiro(nroPassaporte)
);

--criação da tabela MembroOrganizacao
CREATE TABLE IF NOT EXISTS MembroOrganizacao (
    idPessoa INTEGER,
    CONSTRAINT Membro_pk PRIMARY KEY(idPessoa),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela CompostoPor
CREATE TABLE IF NOT EXISTS CompostoPor (
    idCompostoPor SERIAL,
    idPessoa INTEGER,
    idComite INTEGER NOT NULL,
    ehResponsavel CHAR(3) NOT NULL,
    ehCorresponsavel CHAR(3) NOT NULL,
    CONSTRAINT CompostoPor_pk PRIMARY KEY(idCompostoPor),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES MembroOrganizacao(idPessoa),
    CONSTRAINT tipo_fk FOREIGN KEY (idComite) 
        REFERENCES Comite(idComite),
    CONSTRAINT ehResponsavel_check CHECK (ehResponsavel IN ('SIM', 'NÃO')),
    CONSTRAINT ehCorresponsavel_check CHECK (ehCorresponsavel IN ('SIM', 'NÃO')),
    CONSTRAINT idPessoa_tipo_unique UNIQUE(idPessoa, idComite)
);

--criação da tabela MembroComite
CREATE TABLE IF NOT EXISTS MembroComiteConvite (
    idCompostoPor INTEGER,
    CONSTRAINT MembroComite_pk PRIMARY KEY(idCompostoPor),
    CONSTRAINT idCompostoPor_fk FOREIGN KEY (idCompostoPor) 
        REFERENCES CompostoPor(idCompostoPor)
);

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
    meioComunicacao3 varchar(50), -- o que são esses meios?
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
-- 1:1 com abordagem
-- 1:1 com palestra (é isso?)
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

    CONSTRAINT areas_pk PRIMARY KEY (idArea),
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

-- Criação da tabela Areas para ser usada por areas inaptas ou aptas
-- Só será chamada para criar uma lista de areas possíveis
CREATE TABLE IF NOT EXISTS Areas(
    area VARCHAR(20),
    CONSTRAINT area_pk PRIMARY KEY(area)
);

-- Criação da tabela AreasAptas
-- Atributo multivalorado de Avaliador
-- Relaciona-se com tabela Avaliador, cardinalidade N:1
CREATE TABLE IF NOT EXISTS AreasAptas(
	idAvaliador INTEGER NOT NULL,
	areaApta VARCHAR(20),
	CONSTRAINT areasAptas_pk PRIMARY KEY (idAvaliador, areaApta),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Avaliador(idAvaliador),
	CONSTRAINT areaApta_fk FOREIGN KEY (areaApta)
	    REFERENCES Areas(area)
);

-- Criação da tabela AreasInaptas
-- Atributo multivalorado de Avaliador
-- Relaciona-se com tabela Avaliador, cardinalidade N:1
CREATE TABLE IF NOT EXISTS AreasInaptas(
	idAvaliador INTEGER NOT NULL,
	areaInapta VARCHAR(20),
	CONSTRAINT areasInaptas_pk PRIMARY KEY (idAvaliador, areaInapta),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Avaliador(idAvaliador),
	CONSTRAINT areaInapta_fk FOREIGN KEY (areaInapta)
	    REFERENCES Areas(area)
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
  criterioAvaliado varchar(100),
  descricaoCriterio varchar(500),
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
-- Uma avaliacao tem varios criterios
CREATE TABLE IF NOT EXISTS Avaliacao(
    idAvalia INTEGER NOT NULL,
    idCriterioAvaliado INTEGER NOT NULL,
    dataAtribuicao  TIMESTAMP NOT NULL,
    conflito boolean NOT NULL,
    dataResposta DATE NOT NULL DEFAULT CURRENT_DATE,
    justificativa VARCHAR(500),
    notaAtribuida real,

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

-- Um Autor submete varios trabalhos
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


