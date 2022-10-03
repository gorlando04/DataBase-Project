-- Abordagem - ano > 1000
CREATE OR REPLACE FUNCTION tfn_ano_Abordagem()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
begin
    if new.dataHoraAbordagem < '1000-01-01' then
        raise 'O ano inserido é inválido!';
    end if;
    return NEW;
end; $$;

CREATE TRIGGER t_ano_Abordagem
BEFORE INSERT OR UPDATE ON Abordagem
FOR EACH ROW
EXECUTE FUNCTION tfn_ano_Abordagem();

-- CronogramaPalestra - ano > 1000
CREATE OR REPLACE FUNCTION tfn_ano_CronogramaPalestra()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
begin
    if new.dataDaPalestra < '1000-01-01' then
        raise 'O ano inserido é inválido!';
    end if;
    return NEW;
end; $$;

CREATE TRIGGER t_ano_CronogramaPalestra
BEFORE INSERT OR UPDATE ON CronogramaPalestra
FOR EACH ROW
EXECUTE FUNCTION tfn_ano_CronogramaPalestra();

-- Função auxiliar para o meio de comunicação.
CREATE OR REPLACE FUNCTION tfn_meioComunicacaoValido(mc varchar(50))
RETURNS VOID
LANGUAGE plpgsql AS $$
begin
    case mc
        when NULL then NULL;
        when 'e-mail' then NULL;
        when 'telefonema' then NULL;
        when 'rede social' then NULL;
    else
        raise 'Meio de comunicação inválido (tipos aceitos: e-mail, telefonema ou rede social)';
    end case;
end; $$;

-- Abordagem - meioComunicacao1/2/3 (e-mail, telefonema, rede social)
-- Extra: Meios precisam ser em ordem ("e-mail", NULL, NULL)
-- Inválido: (NULL, "e-mail", NULL)
CREATE OR REPLACE FUNCTION tfn_meioComunicacaoSerial()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
begin
    if new.meioComunicacao1 = NULL and new.meioComunicacao2 != NULL then
        raise 'Tabela de meios de comunicação não é contígua';
    end if;
    if new.meioComunicacao2 = NULL and new.meioComunicacao2 != NULL then
        raise 'Tabela de meios de comunicação não é contígua';
    end if;
    call tfn_meioComunicacaoValido(new.meioComunicacao1);
    call tfn_meioComunicacaoValido(new.meioComunicacao2);
    call tfn_meioComunicacaoValido(new.meioComunicacao3);
    return NEW;
end; $$;

CREATE TRIGGER t_meioComunicacaoSerial
BEFORE INSERT OR UPDATE ON Abordagem
FOR EACH ROW
EXECUTE FUNCTION tfn_meioComunicacaoSerial();

-- PredioPalestra - andar ≤ 200
CREATE OR REPLACE FUNCTION tfn_torreDeBabel()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
begin
    if new.andar > 200 then
        raise 'Não existe prédio tão alto assim';
    end if;
    return NEW;
end; $$;

CREATE TRIGGER t_torreDeBabel
BEFORE INSERT OR UPDATE ON PredioPalestra
FOR EACH ROW
EXECUTE FUNCTION tfn_torreDeBabel();

-- Verificar status atendimento envio
create or replace function BeforeInsertDocumentosCronogramaPalestra_status()
returns trigger language plpgsql as $$
begin
    if new.statusAtendimentoEnvio != 'atrasado' or new.statusAtendimentoEnvio != 'OK'
  then
        raise 'Status do atendimento do envio inválido (status aceitos: OK, atrasado)';
        return NEW;
    end if;
end; $$;

create trigger t_before_ins_row_statusAtendimentoEnvioInvalido_DocumentosCronogramaPalestra
before insert or update
on DocumentosCronogramaPalestra
for each row execute function BeforeInsertDocumentosCronogramaPalestra_status();

-- Verificar tipo do documento do cronograma 
create or replace function BeforeInsertDocumentosCronogramaPalestra_tipo()
returns trigger language plpgsql as $$
begin
    if new.tipo != 'pptx' or new.tipo != 'pdf' or new.tipo = 'mpeg' then
        raise 'Tipo de documento inválido (tipos aceitos: pptx, pdf ou mpeg)';
        return NEW;
    end if;
end; $$;

create trigger t_before_ins_row_tipoInvalido_DocumentosCronogramaPalestra
before insert or update
on DocumentosCronogramaPalestra
for each row execute function BeforeInsertDocumentosCronogramaPalestra_tipo();
