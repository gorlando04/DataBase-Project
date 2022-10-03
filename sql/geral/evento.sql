-- Criação da tabela Evento 
CREATE TABLE IF NOT EXISTS Evento( 
    sigla varchar(8), 
    nomeExtenso varchar(50) not null, 
    cep varchar(10) not null, 
    numero integer not null, 
    CONSTRAINT Evento_pk PRIMARY KEY(sigla), 
    CONSTRAINT Evento_fk FOREIGN KEY(cep, numero) 
      REFERENCES Cep(cep, numero) 
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
    descrição varchar(50),
    foreign key(sigla) references Evento(sigla),
    CONSTRAINT siglaTipoUnique unique(sigla, tipo),
    CONSTRAINT tipo_check CHECK (tipo IN ('CONVITE', 'EDITAIS'))
);
