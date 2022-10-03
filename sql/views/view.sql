-- Criação de views

-- R39. Listar artigos com status + avaliadores + avaliações + (artigos aceitos + autores + título) + (artigos rejeitados + autores + títulos)
CREATE OR REPLACE VIEW View_Artigos AS
SELECT a.tipoArtigo, t.status, t.titulo, p.primeiroNome, p.sobrenome, paut.primeiroNome, paut.sobrenome, av.conflito, av.justificativa, av.notaAtribuida 
FROM Trabalho t, Artigo a, Pessoa p, Pessoa paut, Avaliacao av, Avalia avl, Avaliador avldr, SubmeteTrabalho s
WHERE t.idTrabalho = a.idTrabalho AND p.idPessoa = avldr.idAvaliador and paut.idPessoa = s.idAutor and s.idTrabalho = t.idTrabalho and av.idAvalia = avl.idAvalia and avl.idTrabalho = t.idTrabalho;

CREATE OR REPLACE VIEW View_Artigos_Aceitos AS
SELECT a.tipoArtigo, t.status, t.titulo, p.primeiroNome, p.sobrenome, paut.primeiroNome, paut.sobrenome, av.conflito, av.justificativa, av.notaAtribuida 
FROM Trabalho t, Artigo a, Pessoa p, Pessoa paut, Avaliacao av, Avalia avl, Avaliador avldr, SubmeteTrabalho s
WHERE t.idTrabalho = a.idTrabalho AND p.idPessoa = avldr.idAvaliador and paut.idPessoa = s.idAutor and s.idTrabalho = t.idTrabalho and av.idAvalia = avl.idAvalia and avl.idTrabalho = t.idTrabalho AND t.status = 'Aprovado';

CREATE OR REPLACE VIEW View_Artigos_Reprovados AS
SELECT a.tipoArtigo, t.status, t.titulo, p.primeiroNome, p.sobrenome, paut.primeiroNome, paut.sobrenome, av.conflito, av.justificativa, av.notaAtribuida 
FROM Trabalho t, Artigo a, Pessoa p, Pessoa paut, Avaliacao av, Avalia avl, Avaliador avldr, SubmeteTrabalho s
WHERE t.idTrabalho = a.idTrabalho AND p.idPessoa = avldr.idAvaliador and paut.idPessoa = s.idAutor and s.idTrabalho = t.idTrabalho and av.idAvalia = avl.idAvalia and avl.idTrabalho = t.idTrabalho AND t.status = 'Reprovado';

-- R40. Listagem de responsáveis e corresponsáveis dos comitês
-- Não sei se tá certo, mas pelo menos não deu erro (e eu achei melhor separar em duas views)
CREATE OR REPLACE VIEW View_Resp AS
SELECT P.primeiroNome, P.sobrenome
FROM Pessoa P, CompostoPor C
WHERE P.idPessoa = C.idPessoa AND C.ehResponsavel = 'SIM';

CREATE OR REPLACE VIEW View_Corresp AS
SELECT P.primeiroNome, P.sobrenome
FROM Pessoa P, CompostoPor C
WHERE P.idPessoa = C.idPessoa AND C.ehCorresponsavel = 'SIM';

-- R41. Listagem dos membros dos comitês
-- Não sei se tá certo, mas pelo menos não deu erro
CREATE OR REPLACE VIEW View_Membros AS 
SELECT P.primeiroNome, P.sobrenome
FROM Pessoa P, CompostoPor C
WHERE P.idPessoa = C.idPessoa;

--R41.1
CREATE OR REPLACE VIEW eventosPorAno AS
SELECT
    Evento.sigla,
    Evento.nomeExtenso,
    ComissaoOrganizadora.ano
FROM
    Evento,
    ComissaoOrganizadora
WHERE
    Evento.sigla = ComissaoOrganizadora.sigla
ORDER BY
    ComissaoOrganizadora.ano;

--R41.2
CREATE OR REPLACE VIEW eventosPorLocal AS
SELECT
    Evento.sigla,
    Evento.nomeExtenso,
    Cidade.cidade,
    Estado.estado,
    Estado.pais,
    Cep.bairro,
    Cep.numero
FROM
    Evento,
    Cidade,
    Estado,
    Bairro,
    Pais,
    Cep
WHERE
    Evento.cep = Cep.cep
    and Cep.bairro = Bairro.bairro
    and Cep.cep = Bairro.cep
    and Bairro.bairro = Cidade.bairro
    and Bairro. cidade = Cidade.cidade
    and Cidade.estado = Estado.estado
    and Cidade.cidade = Estado.cidade
    and Estado.estado = Pais.estado
    and Estado.pais = Pais.pais
ORDER BY
    Estado.pais,
    Estado.estado,
    Cep.bairro,
    Cep.numero,
    Evento.sigla;

-- R42. O sistema deve permitir que todos os usuários acessem:
-- R42.1. As regras de cada edital (R13);
CREATE OR REPLACE VIEW View_Regras AS 
SELECT R.descricao 
FROM Edital E, Regras R
WHERE E.idEdital=R.idEdital;
-- R42.2. O cronograma de cada edital (R14);
CREATE OR REPLACE VIEW View_Cronograma_Edital AS
SELECT I.inicioPeriodoI, I.fimPeriodoI, S.inicioPeriodoS, S.fimPeriodoS
FROM Edital E, CronogramaEdital C, PeriodoInscricoesEdital I, PeriodoSubmissoesEdital S 
WHERE E.idEdital=C.idEdital AND C.idCronogramaEdital=I.idCronogramaEdital AND C.idCronogramaEdital=S.idCronogramaEdital;
-- R42.3. Os eixos/áreas de apresentação dos trabalhos, e possíveis subeixos/subáreas (R15);
CREATE OR REPLACE VIEW View_Areas_Eixos AS
SELECT A.nomeArea, SA.nomeSubArea, EX.nomeEixo, SE.nomeSubEixo
FROM Edital E, AreasApresentacao A, SubAreasApresentacao SA, EixosApresentacao EX, SubEixosApresentacao SE 
WHERE E.idEdital=A.idEdital AND E.idEdital=EX.idEdital AND A.idArea=SA.idArea AND EX.idEixo=SE.idEixo;
-- R42.4. Os templates (R16).
CREATE OR REPLACE VIEW View_Templates AS 
SELECT R.modelo 
FROM Edital E, Regras R
WHERE E.idEdital=R.idEdital;

-- R43.
CREATE OR REPLACE VIEW View_Candidato_Membro_Responsavel AS
SELECT 
  DC.nome, 
  DC.areaDeAtuacao, 
  TC.titulo, 
  TC.uniclink, 
  CP.pessoaQueIndicou, 
  CP.emailPrincipal, 
  CP.contatoPessoaIndicou
FROM 
  DescricaoCandidato DC, 
  TituloTrabalhosCandPalest TC,
  CandidatoAPalestrante CP, 
  Abordagem A,
  MembroComiteConvite MC
WHERE
  A.emailPrincipal = CP.emailPrincipal AND    A.idCompostoPor = MC.idCompostoPor;

-- Listar responsáveis por uma coordenação em uma dada edição do evento
-- Essa view precisa receber a informação da edicao que o usuario quer consultar
--R.45
CREATE OR REPLACE VIEW viewResponsaveisPorCoordenacaoEdicao AS 
SELECT 
  Evento.sigla, 
  edicao, 
  nomeExtenso, 
  Comite.tipo,
  MembroOrganizacao.idPessoa,
  Pessoa.primeiroNome, 
  Pessoa.sobrenome, 
  ehResponsavel 
FROM 
  CompostoPor, 
  Evento, 
  ComissaoOrganizadora,
  MembroOrganizacao,
  Comite, 
  Pessoa 
WHERE
  CompostoPor.ehResponsavel = 'SIM' 
  and CompostoPor.idPessoa = MembroOrganizacao.idPessoa 
  and MembroOrganizacao.idPessoa = Pessoa.idPessoa 
  and CompostoPor.idComite = Comite.idComite 
  and Comite.sigla = Evento.sigla 
  and Evento.sigla = ComissaoOrganizadora.sigla;

CREATE OR REPLACE FUNCTION viewResponsaveisFn(
  edicaoPassada VARCHAR(10)
) RETURNS viewResponsaveisPorCoordenacaoEdicao
language plpgsql as $$
declare
	res viewResponsaveisPorCoordenacaoEdicao;
begin
  SELECT * FROM viewResponsaveisPorCoordenacaoEdicao
  WHERE edicao = edicaoPassada
  INTO res;
  RETURN res;
end;$$;

-- Listar participantes de uma coordenação do evento (3 listagens diferentes, 3 views)
--R46
CREATE OR REPLACE VIEW viewParticipantesCoordenacaoConvite AS 
SELECT 
  Evento.sigla,
  edicao, 
  nomeExtenso, 
  Comite.tipo,
  MembroOrganizacao.idPessoa, 
  Pessoa.primeiroNome, 
  Pessoa.sobrenome 
FROM 
  CompostoPor, 
  Evento,
  ComissaoOrganizadora, 
  MembroOrganizacao, 
  Comite, 
  Pessoa
WHERE
  Comite.tipo = 'CONVITE'
  and Pessoa.idPessoa = MembroOrganizacao.idPessoa 
  and MembroOrganizacao.idPessoa = CompostoPor.idPessoa 
  and CompostoPor.idComite = Comite.idComite 
  and Comite.sigla = Evento.sigla;


CREATE OR REPLACE VIEW viewParticipantesCoordenacaoEditais AS 
SELECT 
  Evento.sigla, 
  edicao, 
  nomeExtenso,
  Comite.tipo,
  MembroOrganizacao.idPessoa, 
  Pessoa.primeiroNome,
  Pessoa.sobrenome 
FROM 
  CompostoPor, 
  Evento, 
  ComissaoOrganizadora, 
  MembroOrganizacao,
  Comite, 
  Pessoa
WHERE
  Comite.tipo = 'EDITAIS' 
  and Pessoa.idPessoa = MembroOrganizacao.idPessoa 
  and MembroOrganizacao.idPessoa = CompostoPor.idPessoa
  and CompostoPor.idComite = Comite.idComite 
  and Comite.sigla = Evento.sigla;

--select * from viewParticipantesCoordenacaoEditais;
-- Essa view mostra todos os participantes da coordenação, de todos os comites
CREATE OR REPLACE VIEW viewParticipantesCoordenacaoGeral AS 
SELECT
  Evento.sigla,
  edicao,
  nomeExtenso,
  Comite.tipo,
  MembroOrganizacao.idPessoa, 
  Pessoa.primeiroNome, 
  Pessoa.sobrenome 
FROM 
  CompostoPor,
  Evento,
  ComissaoOrganizadora,
  MembroOrganizacao, 
  Comite,
  Pessoa 
WHERE
  MembroOrganizacao.idPessoa = Pessoa.idPessoa
  and MembroOrganizacao.idPessoa = CompostoPor.idPessoa
  and CompostoPor.idComite = Comite.idComite
  and Comite.sigla = Evento.sigla;

--select * from viewParticipantesCoordenacaoGeral;

-- Listar todas tentativas de contato contendo nomes dos candidatos + nomes dos responsáveis + meios de comunicação + datas de contato
--R47
CREATE OR REPLACE VIEW  viewTentativasContato AS 
SELECT 
  DescricaoCandidato.nome, 
  Pessoa.primeiroNome, 
  Pessoa.sobrenome, 
  CandidatoAPalestrante.emailPrincipal, 
  EmailSecundarioCandPalest.email, 
  TelefoneCandidatoPalest.telefone, 
  Abordagem.dataHoraAbordagem 
FROM
  CandidatoAPalestrante,
  EmailSecundarioCandPalest,
  TelefoneCandidatoPalest,
  DescricaoCandidato,
  Abordagem,
  CompostoPor,
  MembroOrganizacao,
  Pessoa
WHERE 
  CandidatoAPalestrante.emailPrincipal = EmailSecundarioCandPalest.emailPrincipal and
  CandidatoAPalestrante.emailPrincipal =TelefoneCandidatoPalest.emailPrincipal and
  CandidatoAPalestrante.emailPrincipal = DescricaoCandidato.emailPrincipal and
  Abordagem.emailPrincipal = CandidatoAPalestrante.emailPrincipal and
  Abordagem.idCompostoPor = CompostoPor.idCompostoPor and
  CompostoPor.idPessoa = MembroOrganizacao.idPessoa and
  MembroOrganizacao.idPessoa = Pessoa.idPessoa;

-- View auxiluar para o R48 e R49.
-- Seleciona todos os cronogramas que vão ocorrer.
CREATE OR REPLACE VIEW ViewCronogramasValidos AS
SELECT CronogramaPalestra.* FROM
    Abordagem,
    CronogramaPalestra,
    (
        SELECT emailPrincipal, MAX(dataHoraAbordagem) AS maxDataHora
        FROM Abordagem
        GROUP BY emailPrincipal
    ) AS AbordagemFiltrado
WHERE
    AbordagemFiltrado.emailPrincipal = Abordagem.emailPrincipal AND
    AbordagemFiltrado.maxDataHora = Abordagem.dataHoraAbordagem AND
    CronogramaPalestra.idAbordagem = Abordagem.idAbordagem;

-- R48: O sistema deve permitir a impressão do cronograma do evento em forma de uma agenda.
CREATE OR REPLACE VIEW View_Cronograma AS
SELECT
  C.dataDaPalestra, 
  C.horaDaPalestra,
  C.tipoEvento, 
  P.tituloDaPalestra,
  C.duracaoPrevista, 
  C.numeroDeSala, 
  C.predio
FROM
  ViewCronogramasValidos C,
  Palestras P
WHERE
  P.idPalestra = C.idPalestra
ORDER BY
  C.horaDaPalestra,
  C.dataDaPalestra;

-- problema: nao pode usar função dentro de WHERE e precisamos garantir que seja um cronograma gerado pela ultima abordagem do bagulho [RESOLVIDO]
-- e ainda falta arrumar o rolê da view de artigos

------

CREATE OR REPLACE VIEW ViewCandidatoAPalestrante AS
SELECT
	DC.nome AS nome_do_candidato,
	DC.areaDeAtuacao AS area_de_atuacao,
	TTCP.uniclink AS link_do_trabalho,
	TTCP.titulo AS titulo_do_trabalho,
	CP.pessoaQueIndicou AS nome_do_indicador,
	CP.emailPrincipal AS email_principal,
	ESCP.email AS email_secundario,
	TCP.telefone AS telefone
FROM	
	CandidatoAPalestrante CP
	INNER JOIN DescricaoCandidato DC ON CP.emailPrincipal = DC.emailPrincipal
	INNER JOIN TituloTrabalhosCandPalest TTCP ON CP.emailPrincipal = TTCP.emailPrincipal
	INNER JOIN EmailSecundarioCandPalest ESCP ON CP.emailPrincipal = ESCP.emailPrincipal
	INNER JOIN TelefoneCandidatoPalest TCP ON CP.emailPrincipal = TCP.emailPrincipal;

-- R49. Cronograma de cada palestrante com data e documentos.
CREATE OR REPLACE VIEW View_Cronograma_Documentos AS
SELECT
  C.dataDaPalestra,
  D.documento,
  D.tituloDocumento,
  D.tipo,
  D.statusAtendimentoEnvio
FROM
  ViewCronogramasValidos C,
  DocumentosCronogramaPalestra D
WHERE
  D.idAbordagem = C.idAbordagem;
