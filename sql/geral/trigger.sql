-- Impedir CPF de receber valores absurdos
CREATE OR REPLACE FUNCTION BeforeInsertCpf()
returns trigger as $$
begin
	if new.cpf < 10000000000 then
		raise 'CPF inválido!';
		return NEW;
	end if;
    if new.cpf > 99999999999 then
        raise 'CPF inválido!';
		return NEW;
	end if;
	return NEW;
end; 
$$
language plpgsql;

CREATE OR REPLACE TRIGGER tr_cpf BEFORE INSERT
ON Brasileiro
FOR EACH row execute function BeforeInsertCpf();

-- Verifica se o número do endereço é um inteiro positivo
CREATE OR REPLACE FUNCTION BeforeInsertNumero()
returns trigger as $$
begin
	if new.numero < 1 then
		raise 'O numero inserido precisa ser maior que 0';
		return NEW;
	end if;
	return NEW;
end; 
$$
language plpgsql;

CREATE OR REPLACE TRIGGER tr_numeroEvento BEFORE INSERT or UPDATE
ON Evento
FOR EACH row execute function BeforeInsertNumero();

CREATE OR REPLACE TRIGGER tr_numeroEventoCep BEFORE INSERT or UPDATE
ON Cep
FOR EACH row execute function BeforeInsertNumero();

-- Verifica se o ano da comissão organizadora é válido (a partir de 1983)
CREATE OR REPLACE FUNCTION BeforeInsertAtributoAnoComissao ()
returns trigger as $$
begin
    if new.ano < 1983 then
        raise 'O evento precede a internet e portanto é inválido.';
        return NEW;
    end if;
    return NEW;
end;
$$
language plpgsql;

CREATE OR REPLACE TRIGGER tr_ano_comissao BEFORE INSERT or UPDATE
ON ComissaoOrganizadora
FOR EACH row execute function BeforeInsertAtributoAnoComissao();