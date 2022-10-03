drop table if exists Evento CASCADE;
drop table if exists EventoPais CASCADE;
drop table if exists EventoEstado CASCADE;
drop table if exists EventoCidade CASCADE;
drop table if exists EventoBairro CASCADE;
drop table if exists EventoCep CASCADE;
drop table if exists TiposTrabalhosAceitosEvento CASCADE;
drop table if exists ComissaoOrganizadora CASCADE;
drop table if exists EstadoPais CASCADE;
drop table if exists CidadeEstado CASCADE;
drop table if exists Comite CASCADE;
DROP TABLE IF EXISTS Pessoa CASCADE;
DROP TABLE IF EXISTS PessoaFiliacao CASCADE;
DROP TABLE IF EXISTS PessoaPais CASCADE;
DROP TABLE IF EXISTS PessoaEstado CASCADE;
DROP TABLE IF EXISTS PessoaCidade CASCADE;
DROP TABLE IF EXISTS PessoaBairro CASCADE; 
DROP TABLE IF EXISTS PessoaCodigoPostal CASCADE;
DROP TABLE IF EXISTS TelefonePessoa CASCADE; 
DROP TABLE IF EXISTS EmailPessoa CASCADE; 
DROP TABLE IF EXISTS Brasileiro CASCADE;
DROP TABLE IF EXISTS Estrangeiro CASCADE; 
DROP TABLE IF EXISTS EstrangeiroNroPassaporte CASCADE; 
DROP TABLE IF EXISTS Membro CASCADE;
DROP TABLE IF EXISTS CompostoPor CASCADE; 
DROP TABLE IF EXISTS MembroComite CASCADE; 
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
DROP TABLE IF EXISTS LinksTrabalhosCandPalest CASCADE;
DROP TABLE IF EXISTS EmailsSecundariosCandPalest CASCADE;
DROP TABLE IF EXISTS TelefonesCandidatoPalest CASCADE;
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

-- Criação da tabela Evento
CREATE TABLE if not exists Evento(
    sigla varchar(8) primary key,
    nomeExtenso varchar(50) not null,
    pais varchar(20) not null
);

-- Criação da tabela EventoPais
CREATE TABLE if not exists EventoPais(
    pais varchar (20) not null,
    estado varchar(20) not null,
    primary key(estado)
);

-- Criação da tabela EventoEstado
CREATE TABLE if not exists EventoEstado(
    estado varchar(20) not null,
    cidade varchar(35) not null,
    primary key (estado, cidade)
);

-- Criação da tabela EventoCidade
CREATE TABLE if not exists EventoCidade(
    bairro varchar(35) not null,
    cidade varchar(35) not null,
    primary key (bairro, cidade)
);

-- Criação da tabela EventoBairro
CREATE TABLE if not exists EventoBairro(
    bairro varchar(35) not null,
    cep varchar(10) not null,
    primary key (bairro, cep)
);

-- Criação da tabela EventoCep
CREATE TABLE if not exists EventoCep(
    cep varchar(10) not null,
    numero integer not null,
    logradouro varchar(25) not null,
    complemento varchar(25),
    primary key (cep, numero)
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

-- Criação da tabela EstadoPais
CREATE TABLE if not exists EstadoPais(
    pais varchar(20) not null,
    estado varchar(20) not null,
    primary key(estado)
);

-- Criação da tabela CidadeEstado
CREATE TABLE if not exists CidadeEstado(
    estado varchar(20) not null,
    cidade varchar(35) not null,
    primary key (estado, cidade)
);

-- Criação da tabela Comite
CREATE TABLE if not exists Comite(
    idComite integer GENERATED ALWAYS AS IDENTITY primary key,
    tipo varchar(20) not null,
    sigla varchar(8) not null,
    descrição varchar(50),
    foreign key(sigla) references Evento(sigla),
    unique(sigla, tipo)
);

--criação da tabela Pessoa
CREATE TABLE Pessoa (
    idPessoa SERIAL,
    primeiroNome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    CONSTRAINT Pessoa_pk PRIMARY KEY(idPessoa)
);

--criação da tabela PessoaFiliacao
CREATE TABLE PessoaFiliacao (
    idPessoa INTEGER NOT NULL,
    filiacao VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaFiliacao_pk PRIMARY KEY(idPessoa, filiacao),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela PessoaPais
CREATE TABLE PessoaPais (
    pais VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaPais_pk PRIMARY KEY(estado)
);

--criação da tabela PessoaEstado
CREATE TABLE PessoaEstado (
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaEstado_pk PRIMARY KEY(estado, cidade)
);

--criação da tabela PessoaCidade
CREATE TABLE PessoaCidade (
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    CONSTRAINT PessoaCidade_pk PRIMARY KEY(cidade, bairro)
);

--criação da tabela PessoaBairro
CREATE TABLE PessoaBairro (
    bairro VARCHAR(50) NOT NULL,
    codigoPostal INTEGER NOT NULL,
    CONSTRAINT PessoaBairro_pk PRIMARY KEY(bairro, codigoPostal)
);

--criação da tabela PessoaCodigoPostal
CREATE TABLE PessoaCodigoPostal (
    codigoPostal INTEGER NOT NULL,
    numeroEndereco INTEGER NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    complemento VARCHAR(50),
    CONSTRAINT PessoaCodigoPostal_pk PRIMARY KEY(codigoPostal, numeroEndereco)
);

--criação da tabela TelefonePessoa
CREATE TABLE TelefonePessoa (
    idPessoa INTEGER,
    numeroTelefone INTEGER NOT NULL,
    ddi INTEGER NOT NULL,
    ddd INTEGER NOT NULL,
    prefixo INTEGER NOT NULL,
    CONSTRAINT TelefonePessoa_pk PRIMARY KEY(idPessoa, numeroTelefone, ddi, ddd, prefixo),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela EmailPessoa
CREATE TABLE EmailPessoa (
    idPessoa INTEGER,
    dominio VARCHAR(50) NOT NULL,
    login VARCHAR(50) NOT NULL,
    CONSTRAINT EmailPessoa_pk PRIMARY KEY(idPessoa, dominio, login),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela Brasileiro
CREATE TABLE Brasileiro (
    cpf INTEGER NOT NULL,
    idPessoa INTEGER,
    CONSTRAINT Brasileiro_pk PRIMARY KEY(cpf),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela Estrangeiro
CREATE TABLE Estrangeiro (
    idPessoa INTEGER,
    nroPassaporte VARCHAR(20) NOT NULL,
    CONSTRAINT Estrangeiro_pk PRIMARY KEY(nroPassaporte),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela EstrangeiroNroPassaporte
CREATE TABLE EstrangeiroNroPassaporte (
    nroPassaporte VARCHAR(20),
    dataEmissao DATE NOT NULL,
    dataExpiracao DATE NOT NULL,
    govEmissor VARCHAR(50) NOT NULL,
    CONSTRAINT EstrangeiroNroPassaporte_pk PRIMARY KEY(nroPassaporte),
    CONSTRAINT EstrangeiroNroPassaporte_fk FOREIGN KEY (nroPassaporte)
    REFERENCES Estrangeiro(nroPassaporte)
    ON DELETE CASCADE ON UPDATE CASCADE
);

--criação da tabela Membro
CREATE TABLE Membro (
    idPessoa INTEGER,
    CONSTRAINT Membro_pk PRIMARY KEY(idPessoa),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela CompostoPor
CREATE TABLE CompostoPor (
    idCompostoPor SERIAL,
    idPessoa INTEGER,
    idComite INTEGER NOT NULL,
    ehResponsavel CHAR(3) NOT NULL,
    ehCorresponsavel CHAR(3) NOT NULL,
    CONSTRAINT CompostoPor_pk PRIMARY KEY(idCompostoPor),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa),
    CONSTRAINT tipo_fk FOREIGN KEY (idComite) 
        REFERENCES Comite(idComite),
    CONSTRAINT ehResponsavel_check CHECK (ehResponsavel IN ('SIM', 'NÃO')),
    CONSTRAINT ehCorresponsavel_check CHECK (ehCorresponsavel IN ('SIM', 'NÃO')),
    CONSTRAINT idPessoa_tipo_unique UNIQUE(idPessoa, idComite)
);

--criação da tabela MembroComite
CREATE TABLE MembroComite (
    idCompostoPor INTEGER,
    CONSTRAINT MembroComite_pk PRIMARY KEY(idCompostoPor),
    CONSTRAINT idCompostoPor_fk FOREIGN KEY (idCompostoPor) 
        REFERENCES CompostoPor(idCompostoPor)
);

-- Tabelas Grupo A
-- estas tabelas nao vao funcionar se nao for combinada com o script das tabelas gerais. Todos os scripts de todos os grupos devem ser combinados com as tabelas gerais para que seja gerado o banco de dados


-- Criação da tabela CandidatoAPalestrante
CREATE TABLE CandidatoAPalestrante(
    emailPrincipal VARCHAR(50),
    pessoaQueIndicou VARCHAR(50) NOT NULL,
    miniCurriculo VARCHAR(50) NOT NULL,
    CONSTRAINT emailPrincipal_pk PRIMARY KEY(emailPrincipal),
    UNIQUE(miniCurriculo)
);

-- Criação da tabela DescricaoCandidato
CREATE TABLE DescricaoCandidato(
    miniCurriculo VARCHAR(500),
    areaDeAtuacao VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    foto VARCHAR(500) NOT NULL,
    CONSTRAINT descricaoCandidato_pk PRIMARY KEY(miniCurriculo),
    CONSTRAINT miniCurriculo_fk FOREIGN KEY(miniCurriculo) 
        REFERENCES CandidatoAPalestrante(miniCurriculo)
);

-- Criação da tabela LinksTrabalhosCandPalest
CREATE TABLE LinksTrabalhosCandPalest(
    emailPrincipal VARCHAR(50),
    links VARCHAR(100) NOT NULL,
    CONSTRAINT emailPrincipalLinkPalestrante_pk PRIMARY KEY(emailPrincipal),
    CONSTRAINT emailPrincipalLinkPalestrante_fk FOREIGN KEY(emailPrincipal) 
        REFERENCES CandidatoAPalestrante(emailPrincipal)
);

-- Criação da tabela EmailsSecundariosCandPalest
CREATE TABLE EmailsSecundariosCandPalest(
    emailPrincipal VARCHAR(50),
    emails VARCHAR(50),
    CONSTRAINT emailPrincipalEmailSecundario_pk PRIMARY KEY(emailPrincipal),
    CONSTRAINT emailPrincipalEmailSecundario_fk FOREIGN KEY(emailPrincipal) 
        REFERENCES CandidatoAPalestrante(emailPrincipal)
);

-- Criação da tabela TelefonesCandidatoPalest
CREATE TABLE TelefonesCandidatoPalest(
    emailPrincipal VARCHAR(50),
    telefone VARCHAR(50),
    CONSTRAINT emailPrincipalTelefonesCandidato_pk PRIMARY KEY(emailPrincipal),
    CONSTRAINT emailPrincipalTelefonesCandidato_fk FOREIGN KEY(emailPrincipal) 
        REFERENCES CandidatoAPalestrante(emailPrincipal)
);

-- Criação da tabela Abordagem
CREATE TABLE Abordagem (
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
        REFERENCES MembroComite (idCompostoPor),
    CONSTRAINT emailPrincipal_idCompostoPor_unique UNIQUE (emailPrincipal, idCompostoPor)
);

-- Criação da tabela CronogramaPalestra
CREATE TABLE CronogramaPalestra (
    idAbordagem INTEGER,
    tipoEvento varchar(50), --melhor se forem especificados e checados
    --dataDaPalestra date,
    DataDaPalestra date, -- talvez uma saída seja deixar os dois na tabela do cronograma
    
    -- deixar isso aqui e matar a ultima tabalea de data e hora. Usar timestamp
    HoraDaPalestra time, -- mais comentários na tabela de data da palestra
    duracaoPrevista interval,
    numeroDeSala INTEGER,
    predio varchar(50),
    tituloDaPalestra varchar(50),
    CONSTRAINT CronogramaPalestra_pk PRIMARY KEY (idAbordagem),
    CONSTRAINT CronogramaPalestra_fk FOREIGN KEY (idAbordagem)
        REFERENCES Abordagem (idAbordagem),
    CONSTRAINT idAbordagem_unique UNIQUE (idAbordagem),
    CONSTRAINT numeroDeSala_unique UNIQUE (numeroDeSala),
    CONSTRAINT tituloDaPalestra UNIQUE (tituloDaPalestra),
    CONSTRAINT tipoEvento_check CHECK (tipoEvento IN ('Mini-curso', 'Mesa redonda', 'Workshop')) -- alinhar esses tipos de trampo 
);

-- Criação da tabela Palestras
CREATE TABLE Palestras (
    tituloDaPalestra varchar(50),
    resumoDaPalestra varchar(500),
    materialDeApoio varchar(500),
    CONSTRAINT Palestras_pk PRIMARY KEY (tituloDaPalestra),
    CONSTRAINT Palestras_fk FOREIGN KEY (tituloDaPalestra)
        REFERENCES CronogramaPalestra (tituloDaPalestra)
);

-- Criação da tabela PredioPalestra
CREATE TABLE PredioPalestra (
    numeroDeSala INTEGER,
    andar INTEGER,
    predio varchar(50),
    CONSTRAINT PredioPalestra_pk PRIMARY KEY (numeroDeSala),
    CONSTRAINT PredioPalestra_fk FOREIGN KEY (numeroDeSala)
        REFERENCES CronogramaPalestra
);

-- essa tabela gera um problema: para que um atributo que nao seja uma chave primaria possa ser usado como chave estrangeira (eh dessa forma que estamos "quebrando as tabelas em tabelas mebores" na FNBC ou 4FN) precisamos que seja garantida a unicidade desses atributos. Assim sendo, se a data possuir unicidade uma mesma data apenas podera aparecer em uma tabela CronogramaPalestra. O que fazer?

/* Talvez não precise criar uma tabela pra data e hora. Mas se for
criar, imagino que os dois tenham de ser chave, porque uma data leva
a várias horas e uma hora leva a várias datas, isso se não puder
acontecer mais de um evento em um mesmo dia e horário, se isso acontecer, 
acho que não precisa criar essa tabela.*/

-- Criação da tabela DataPalestra
--CREATE TABLE DataPalestra (
--    dataDaPalestra date,
--    horarioDaPalestra time,
--    CONSTRAINT DataPalestra_pk PRIMARY KEY (dataDaPalestra),
 --   CONSTRAINT DataPalestra_FK FOREIGN KEY (dataDaPalestra)
--);

-- Criação da tabela DocumentosCronogramaPalestra
CREATE TABLE DocumentosCronogramaPalestra (
    idAbordagem INTEGER,
    dataEntrega timestamp,
    tipo varchar(50),
    CONSTRAINT DocumentosCronogramaPalestra_pk PRIMARY KEY (idAbordagem, dataEntrega, tipo),
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

    -- PRIMARY KEY(idEdital),
    -- FOREIGN KEY(sigla) REFERENCES Evento(sigla),
    -- UNIQUE(sigla, url)
    
    CONSTRAINT edital_pk PRIMARY KEY (idEdital),
    CONSTRAINT edital_fk FOREIGN KEY (sigla)
        REFERENCES Evento(sigla),
    CONSTRAINT edital_unique UNIQUE (sigla, url)
);

-- Criação da tabela IdiomasAceitos
CREATE TABLE IF NOT EXISTS IdiomasAceitos (
    idioma CHAR NOT NULL,
    -- idEdital SERIAL NOT NULL, 
    idEdital INTEGER NOT NULL, 
    -- Ainda temos que ver como vai ficar essa questão do tipo SERIAL nas chaves estrangeiras
    
    -- PRIMARY KEY(idioma, idEdital),
    -- FOREIGN KEY(idEdital) REFERENCES Edital(idEdital)
    
    CONSTRAINT idiomas_pk PRIMARY KEY (idioma, idEdital),
    CONSTRAINT idiomas_fk FOREIGN KEY (idEdital)
        REFERENCES Edital(idEdital),
    CONSTRAINT idiomas_check CHECK(idioma IN('P', 'I', 'E', 'A', 'J'))
);

-- Criação da tabela EixosApresentacao 
/* Tabelas relacionadas:
   - SubEixosApresentacao (0, n)
*/
CREATE TABLE IF NOT EXISTS EixosApresentacao (
    idEixo SERIAL,
    -- idEdital SERIAL NOT NULL,
    idEdital INTEGER NOT NULL,
    nomeEixo VARCHAR(20) NOT NULL,
    
    -- PRIMARY KEY(idEixo),
    -- FOREIGN KEY(idEdital) REFERENCES Edital(idEdital),
    -- UNIQUE(idEdital, nomeEixo)
    
    CONSTRAINT eixos_pk PRIMARY KEY (idEixo),
    CONSTRAINT eixos_fk FOREIGN KEY (idEdital)
        REFERENCES Edital(idEdital),
    CONSTRAINT eixos_unique UNIQUE (idEdital, nomeEixo)
);

-- Criação da tabela SubEixosApresentacao
CREATE TABLE IF NOT EXISTS SubEixosApresentacao (
    -- idEixo SERIAL NOT NULL,
    idEixo INTEGER NOT NULL,
    nomeSubEixo VARCHAR(20) NOT NULL,
    
    -- PRIMARY KEY(nomeSubEixo, idEixo),
    -- FOREIGN KEY(idEixo) REFERENCES EixosApresentacao(idEixo)

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
    -- idEdital SERIAL NOT NULL,
    idEdital INTEGER NOT NULL,
    nomeArea VARCHAR(20) NOT NULL,
    
    -- PRIMARY KEY(idArea),
    -- FOREIGN KEY(idEdital) REFERENCES Edital(idEdital),
    -- UNIQUE(idEdital, nomeArea)

    CONSTRAINT areas_pk PRIMARY KEY (idArea),
    CONSTRAINT areas_fk FOREIGN KEY (idEdital)
        REFERENCES Edital(idEdital),
    CONSTRAINT areas_unique UNIQUE (idEdital, nomeArea)
);

-- Criação da tabela SubAreasApresentacao
CREATE TABLE IF NOT EXISTS SubAreasApresentacao (
    -- idArea SERIAL NOT NULL,
    idArea INTEGER NOT NULL,
    nomeSubArea VARCHAR(20) NOT NULL,
    
    -- PRIMARY KEY(nomeSubArea, idArea),
    -- FOREIGN KEY(idArea) REFERENCES AreasApresentacao(idArea)
    
    CONSTRAINT subAreas_pk PRIMARY KEY(nomeSubArea, idArea),
    CONSTRAINT subAreas_fk FOREIGN KEY(idArea)
        REFERENCES AreasApresentacao(idArea)
);

-- Criação da tabela Regras
CREATE TABLE IF NOT EXISTS Regras (
    -- idEdital SERIAL NOT NULL,
    idEdital INTEGER NOT NULL,
    descricao VARCHAR(200),
    modelo BYTEA,
    
    -- PRIMARY KEY(idEdital),
    -- FOREIGN KEY(idEdital) REFERENCES Edital(idEdital)

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
    -- idEdital SERIAL NOT NULL,
    idEdital INTEGER NOT NULL,
    dataPublicacaoOriginal DATE NOT NULL,
    dataRealizacao DATE,
    dataDivulgacaoListaAprovados DATE,
    
    -- PRIMARY KEY(idCronogramaEdital),
    -- FOREIGN KEY(idEdital) REFERENCES Edital(idEdital),
    -- UNIQUE(idEdital, dataPublicacaoOriginal)

    CONSTRAINT cronograma_pk PRIMARY KEY(idCronogramaEdital),
    CONSTRAINT cronograma_fk FOREIGN KEY(idEdital) 
        REFERENCES Edital(idEdital),
    CONSTRAINT cronograma_unique UNIQUE(idEdital, dataPublicacaoOriginal)
);

-- Criação da tabela PeriodoInscricoesEdital
CREATE TABLE IF NOT EXISTS PeriodoInscricoesEdital (
    -- idCronogramaEdital SERIAL NOT NULL,
    idCronogramaEdital INTEGER NOT NULL,
    inicioPeriodoI DATE NOT NULL,
    fimPeriodoI DATE NOT NULL,
    
    -- PRIMARY KEY(inicioPeriodoI, fimPeriodoI, idCronogramaEdital),
    -- FOREIGN KEY(idCronogramaEdital) REFERENCES CronogramaEdital(idCronogramaEdital)

    CONSTRAINT periodoIns_pk PRIMARY KEY(inicioPeriodoI, fimPeriodoI, idCronogramaEdital),
    CONSTRAINT periodoIns_fk FOREIGN KEY(idCronogramaEdital) 
        REFERENCES CronogramaEdital(idCronogramaEdital)
);

-- Criação da tabela PeriodoSubmissoesEdital
CREATE TABLE IF NOT EXISTS PeriodoSubmissoesEdital (
    -- idCronogramaEdital SERIAL NOT NULL,
    idCronogramaEdital INTEGER NOT NULL,
    inicioPeriodoS DATE NOT NULL,
    fimPeriodoS DATE NOT NULL,
    
    -- PRIMARY KEY(inicioPeriodoS, fimPeriodoS, idCronogramaEdital),
    -- FOREIGN KEY(idCronogramaEdital) REFERENCES CronogramaEdital(idCronogramaEdital)

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
    -- idEdital SERIAL NOT NULL,
    idEdital INTEGER NOT NULL,
    idTrabalho SERIAL NOT NULL,
    titulo VARCHAR(64) NOT NULL,
    palavraChave1 VARCHAR(16) NOT NULL,
    palavraChave2 VARCHAR(16) NOT NULL,
    palavraChave3 VARCHAR(16) NOT NULL,
    idiomaPrincipal CHAR NOT NULL,
    status VARCHAR(16),
    idioma2 CHAR,
    idioma3 CHAR,
    descricao VARCHAR(200),
    palavraChave4 VARCHAR(16),
    palavraChave5 VARCHAR(16),
    tipoTrabalho VARCHAR(32) NOT NULL,

    -- PRIMARY KEY(idTrabalho),
    -- FOREIGN KEY(idEdital) REFERENCES Edital(idEdital),

    -- Tentei rodar assim e deu erro
    -- CONSTRAINT idiomaTrabalhoCheck CHECK(idiomaPrincipal, idioma2, idioma3 IN('P', 'I', 'E', 'A', 'J')),

    
    -- CHECK (tipoTrabalho IN ('Oficina', 'Minicurso','Artigo')),
    -- UNIQUE(titulo, palavraChave1, palavraChave2, palavraChave3, idiomaPrincipal)

    CONSTRAINT idiomaPTrabalho_check CHECK(idiomaPrincipal IN('P', 'I', 'E', 'A', 'J')),
    CONSTRAINT idioma2Trabalho_check CHECK(idioma2 IN('P', 'I', 'E', 'A', 'J')),
    CONSTRAINT idioma3Trabalho_check CHECK(idioma3 IN('P', 'I', 'E', 'A', 'J')),

    CONSTRAINT trabalho_pk PRIMARY KEY(idTrabalho),
    CONSTRAINT trabalho_fk FOREIGN KEY(idEdital) 
        REFERENCES Edital(idEdital),
    CONSTRAINT tipoTrabalho_check CHECK (tipoTrabalho IN ('Oficina', 'Minicurso','Artigo')),
    CONSTRAINT trabalho_unique UNIQUE(titulo, palavraChave1, palavraChave2, palavraChave3, idiomaPrincipal)
);

-- Criação da tabela Artigo
CREATE TABLE IF NOT EXISTS Artigo (
    -- idTrabalho SERIAL NOT NULL,
    idTrabalho INTEGER,
    tipoArtigo VARCHAR(32) NOT NULL,
    
    -- PRIMARY KEY(idTrabalho),
    -- FOREIGN KEY(idTrabalho) REFERENCES Trabalho(idTrabalho),
    -- CHECK (tipoArtigo IN ('Resumo', 'ResumoEstendido', 'ArtigoCompleto'))

    CONSTRAINT artigo_pk PRIMARY KEY(idTrabalho),
    CONSTRAINT artigo_fk FOREIGN KEY(idTrabalho) 
        REFERENCES Trabalho(idTrabalho),
    CONSTRAINT tipoArtigo_check CHECK (tipoArtigo IN ('Resumo', 'ResumoEstendido', 'ArtigoCompleto'))
);

-- Criação da tabela VersaoSintese
CREATE TABLE IF NOT EXISTS VersaoSintese (
    idTrabalho INTEGER,
    idioma CHAR NOT NULL,
    texto TEXT NOT NULL,
    ehPrimario BOOLEAN NOT NULL,
    
    -- PRIMARY KEY(idTrabalho),
    -- FOREIGN KEY(idTrabalho) REFERENCES Artigo(idTrabalho),

    CONSTRAINT sintese_pk PRIMARY KEY(idTrabalho),
    CONSTRAINT sintese_fk FOREIGN KEY(idTrabalho) 
        REFERENCES Artigo(idTrabalho),
    CONSTRAINT idiomaSinteseCheck CHECK(idioma IN('P', 'I', 'E', 'A', 'J'))
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


-- Criação da tabela Avaliador
-- Relaciona-se com a tabela Trabalho, cardinalidade N:N, relacionamento Avalia
-- Relaciona-se com a tabela CertificadoAvaliador, cardinalidade 1:1, relacionamento Recebe
-- Relaciona-se com tabela AreasAptas, cardinalidade 1:N
-- Relaciona-se com tabela AreasInaptas, cardinalidade 1:N
CREATE TABLE IF NOT EXISTS Avaliador(
	idAvaliador INTEGER NOT NULL,
	dataEnvioConv DATE NOT NULL,
	dataRespConv DATE,
	CONSTRAINT avaliador_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
);

-- Criação da tabela PrazoRespostaAvaliador
CREATE TABLE IF NOT EXISTS PrazoRespostaAvaliador(
	dataEnvioConv DATE NOT NULL,
	prazoRespConv DATE,
	CONSTRAINT prazoResp PRIMARY KEY (dataEnvioConv)
);

-- Criação da tabela AreasAptas
-- Atributo multivalorado de Avaliador
-- Relaciona-se com tabela Avaliador, cardinalidade N:1
CREATE TABLE IF NOT EXISTS AreasAptas(
	idAvaliador INTEGER NOT NULL,
	areaApta VARCHAR(20),
	CONSTRAINT areasAptas_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
);

-- Criação da tabela AreasInaptas
-- Atributo multivalorado de Avaliador
-- Relaciona-se com tabela Avaliador, cardinalidade N:1
CREATE TABLE IF NOT EXISTS AreasInaptas(
	idAvaliador INTEGER NOT NULL,
	areaInapta VARCHAR(20),
	CONSTRAINT areasInaptas_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
);

-- Criação da tabela CertificadoAvaliador
-- Relaciona-se com a tabela Avaliador, cardinalidade 1:1, relacionamento Recebe
-- Relaciona-se com tabela ArquivosCertificado, cardinalidade 1:N
CREATE TABLE IF NOT EXISTS CertificadoAvaliador(
	idAvaliador INTEGER NOT NULL,
	codCertificado BIGSERIAL NOT NULL,
	CONSTRAINT certificadoAvaliador_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador)
		REFERENCES Pessoa(idPessoa)
);

-- Criação da tabela ArquivosCertificado
-- Relaciona-se com tabela CertificadoAvaliador, cardinalidade N:1
CREATE TABLE IF NOT EXISTS ArquivosCertificado (

	idAvaliador INTEGER NOT NULL,
	documento varchar(150),           	

	CONSTRAINT arquivosCertificado_pk PRIMARY KEY (idAvaliador),
	CONSTRAINT idAvaliador_fk FOREIGN KEY (idAvaliador) REFERENCES Avaliador(idAvaliador)


);

-- Criação da tabela Avalia
CREATE TABLE IF NOT EXISTS Avalia(

    idAvalia BIGSERIAL PRIMARY KEY,
    idTrabalho INTEGER NOT NULL,
    idAvaliador INTEGER NOT NULL,
    
    FOREIGN KEY (idTrabalho)
        REFERENCES Trabalho (idTrabalho),

    FOREIGN KEY (idAvaliador)
        REFERENCES Avaliador (idAvaliador),
    
    UNIQUE(idTrabalho,idAvaliador)
);

-- Criação da tabela PrazoAvaliacao
CREATE TABLE IF NOT EXISTS PrazoAvaliacao(

    dataAtribuicao DATE NOT NULL DEFAULT CURRENT_DATE,
    prazo TIMESTAMP NOT NULL,

    CONSTRAINT prazo_pk PRIMARY KEY (dataAtribuicao)
);

-- Criação da tabela Avaliacao
CREATE TABLE IF NOT EXISTS Avaliacao(

    idAvalia INTEGER NOT NULL,
    dataAtribuicao  DATE NOT NULL,
    conflito boolean NOT NULL,
    dataResposta DATE NOT NULL DEFAULT CURRENT_DATE,
    justificativa VARCHAR(500),

    CONSTRAINT Avaliacao_pk PRIMARY KEY (idAvalia, dataAtribuicao),

    CONSTRAINT idAvalia_fk FOREIGN KEY (idAvalia)
        REFERENCES Avalia (idAvalia),
    
    CONSTRAINT dataAtribuicao_fk FOREIGN KEY (dataAtribuicao)
        REFERENCES PrazoAvaliacao (dataAtribuicao)

);

-- Criação da Tabela SubmeteTrabalho
CREATE TABLE IF NOT EXISTS SubmeteTrabalho(
    idAutor INTEGER NOT NULL,
    idTrabalho INTEGER NOT NULL,
    ordemAutoria VARCHAR(200),
    CONSTRAINT submeteTrabalho_pk PRIMARY KEY (idAutor, idTrabalho),
    CONSTRAINT idAutor_fk FOREIGN KEY (idAutor)
        REFERENCES Autor (idAutor),
        
    CONSTRAINT idTrabalho_fk FOREIGN KEY (idTrabalho)
        REFERENCES Trabalho (idTrabalho)
    
);
