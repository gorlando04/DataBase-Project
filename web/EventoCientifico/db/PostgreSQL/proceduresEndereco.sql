--Procedures endereco
-------------------Usado para pessoas e eventos----------------------

create or replace procedure InsertEndereco(
    cepNovo varchar(10),
    numeroNovo integer,
    paisNovo varchar(20),
    estadoNovo varchar(20),
    cidadeNovo varchar(35),
    bairroNovo varchar(35),  
    logradouroNovo varchar(25),
    complementoNovo varchar(25)
)
language plpgsql as $$
declare 
	registroUm refcursor;
	cursorEndUm refcursor;
begin
	Open cursorEndUm for select * from Pais where 
	Pais.pais = paisNovo and
	Pais.estado = estadoNovo;
	fetch cursorEndUm into registroUm;
	close cursorEndUm;
	if not found registroUm then
		INSERT INTO Pais(pais, estado)
		VALUES (paisNovo, estadoNovo);
	end if;	
	--abrindo cursor
	Open cursorEndUm for select * from Estado where 
	Estado.pais = paisNovo and 
	Estado.estado = estadoNovo and 
	Estado.cidade = cidadeNovo;
	fetch cursorEndUm into registroUm;
	close cursorEndUm;
	if not found registroUm then
    	INSERT INTO Estado(pais, estado, cidade)
    	VALUES (paisNovo, estadoNovo, cidadeNovo);
	end if;
	
	--abrindo cursor para cidade
	Open cursorEndUm for select * from Cidade where 
	Cidade.estado = estadoNovo and 
	Cidade.cidade = cidadeNovo and 
	Cidade.bairro = bairroNovo;
	fetch cursorEndUm into registroUm;	
	close cursorEndUm;
	if not found registroUm then
     	INSERT INTO Cidade(estado, cidade, bairro)
   	 	VALUES (estadoNovo, cidadeNovo, bairroNovo);
	end if;
	
    --abrindo cursor para cidade
	Open cursorEndUm for select * from Bairro where 
	Bairro.cidade = cidadeNovo and 
	Bairro.bairro = bairroNovo and 
	Bairro.cep = cepNovo;
	fetch cursorEndUm into registroUm;
	close cursorEndUm;
	if not found registroUm then
    	INSERT INTO Bairro(cidade, bairro, cep)
    	VALUES (cidadeNovo, bairroNovo, cepNovo);
	end if;
	
	-- Abrindo cursor para cep
    Open cursorEndUm for select * from Cep where 
	Cep.bairro = bairroNovo and 
	Cep.cep = cepNovo and 
	Cep.numero = numeroNovo and 
	Cep.logradouro = logradouroNovo and 
	Cep.complemento = complementoNovo;
	fetch cursorEndUm into registroUm;
	close cursorEndUm;
	if not found registroUm then
	    if complementoNovo is null then
    		INSERT INTO Cep(bairro, cep, numero, logradouro)
    	    VALUES (bairroNovo, cepNovo, numeroNovo, logradouroNovo);
    	else
			INSERT INTO Cep(bairro, cep, numero, logradouro, complemento)
    		VALUES (bairroNovo, cepNovo, numeroNovo, logradouroNovo, complementoNovo);
    	end if;
	end if; 
end $$;
