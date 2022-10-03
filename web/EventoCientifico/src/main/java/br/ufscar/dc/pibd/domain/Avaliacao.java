package br.ufscar.dc.pibd.domain;

import java.sql.Date;

public class Avaliacao {

    private String idAvalia;
    private String idTrabalho;
    private String idAvaliador;

    private String idEdital;
    private String criterioAvaliado;
    private String descricaoCriterio;

    private String dataAtribuicao; //timestamp
    private String prazo;

    private String idCriterioAvaliado;
    // dataAtribuicao
    private Bool conflito;
    private String dataResposta;
    private String justificativa;
    private String notaAtribuida;

    public Avaliacao(String idAvalia){
    this.idAvalia = idAvalia;
    }

    public Avaliacao(String idAvalia, String idTrabalho, String idAvaliador){
    this.idAvalia = idAvalia;
    this.idTrabalho = idTrabalho;
    this.idAvaliador = idAvaliador;
    }

    public Avaliacao(String idEdital, String criterioAvaliado, String descricaoCriterio){
    this.idEdital = idEdital;
    this.criterioAvaliado = criterioAvaliado;
    this.descricaoCriterio = descricaoCriterio;
    }

    public Avaliacao(String dataAtribuicao, String prazo){
    this.dataAtribuicao = dataAtribuicao;
    this.prazo = prazo;
    }

    public Avaliacao(String idCriterioAvaliado, String dataAtribuicao, Bool conflito,
    String dataResposta, String justificativa, String notaAtribuida){
    this.idCriterioAvaliado = idCriterioAvaliado;
    this.dataAtribuicao = dataAtribuicao;
    this.conflito = conflito;
    this.dataResposta = dataResposta;
    this.justificativa = justificativa;
    this.notaAtribuida = notaAtribuida;
    }

    public String getIdAvalia(){
        return this.idAvalia;
    }

    public void set(String idAvalia){
        this.idAvalia = idAvalia;
    }

    public String getIdTrabalho(){
        return this.idTrabalho;
    }

    public void set(String idTrabalho){
        this.idTrabalho = idTrabalho;
    }

    public String getIdAvaliador(){
        return this.idAvaliador;
    }

    public void set(String idAvaliador){
        this.idAvaliador = idAvaliador;
    }

    public String getIdEdital(){
        return this.idEdital;
    }

    public void set(String IdEdital){
        this.IdEdital = IdEdital;
    }

    public String getCriterioAvaliado(){
        return this.criterioAvaliado;
    }

    public void set(String criterioAvaliado){
        this.criterioAvaliado = criterioAvaliado;
    }

    public String getDescricaoCriterio(){
        return this.descricaoCriterio;
    }

    public void set(String descricaoCriterio){
        this.descricaoCriterio = descricaoCriterio;
    }

    public String getDataAtribuicao(){
        return this.dataAtribuicao;
    }

    public void setDataAtribuicao(String dataAtribuicao){
        this.dataAtribuicao = dataAtribuicao;
    }

    public String getPrazo(){
        return this.prazo;
    }

    public void setPrazo(String prazo){
        this.prazo = prazo;
    }

    public String getIdCriterioAvaliado(){
        return this.idCriterioAvaliado;
    }

    public void setCriterioAvaliado(String criterioAvaliado){
        this.criterioAvaliado = criterioAvaliad;
    }

    public String getConflito(){
        return this.conflito;
    }

    public void setConflito(String conflito){
        this.conflito = conflito;
    }

    public String getDataResposta(){
        return this.dataResposta;
    }

    public void setDataResposta(String dataResposta){
        this.dataResposta = dataResposta;
    }

    public String getJustificativa(){
        return this.justificativa;
    }

    public void setJustificativa(String justificativa){
        this.justificativa = justificativa;
    }

    public String getNotaAtribuida(){
        return this.notaAtribuida;
    }

    public void setNotaAtribuida(String notaAtribuida){
        this.notaAtribuida = notaAtribuida;
    }
}