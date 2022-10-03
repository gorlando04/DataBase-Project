--criação da tabela Pessoa
CREATE TABLE IF NOT EXISTS Pessoa (
    idPessoa SERIAL,
    primeiroNome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cep varchar(10) not null, 
    numero integer not null, 
    CONSTRAINT Pessoa_pk PRIMARY KEY(idPessoa) ,
    CONSTRAINT Pessoa_fk FOREIGN KEY(cep, numero) 
      REFERENCES Cep(cep, numero) 
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
    numeroTelefone INTEGER NOT NULL,
    ddi INTEGER NOT NULL,
    ddd INTEGER NOT NULL,
    prefixo INTEGER NOT NULL,
    CONSTRAINT TelefonePessoa_pk PRIMARY KEY(idPessoa, numeroTelefone, ddi, ddd, prefixo),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela EmailPessoa
CREATE TABLE IF NOT EXISTS EmailPessoa (
    idPessoa INTEGER,
    dominio VARCHAR(50) NOT NULL,
    login VARCHAR(50) NOT NULL,
    CONSTRAINT EmailPessoa_pk PRIMARY KEY(idPessoa, dominio, login),
    CONSTRAINT idPessoa_fk FOREIGN KEY (idPessoa) 
        REFERENCES Pessoa(idPessoa)
);

--criação da tabela Brasileiro
CREATE TABLE IF NOT EXISTS Brasileiro (
    cpf INTEGER NOT NULL,
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
