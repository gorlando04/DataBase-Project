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
    complemento varchar(25), 
    CONSTRAINT Cep_pk PRIMARY KEY (cep, numero), 
    CONSTRAINT Cep_fk FOREIGN KEY (bairro, cep)
        REFERENCES Bairro(bairro, cep)  -- corrigindo a FK para EventoBairro 
);
