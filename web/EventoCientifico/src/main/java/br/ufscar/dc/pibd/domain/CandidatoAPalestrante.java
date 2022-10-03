package br.ufscar.dc.pibd.domain;

import java.sql.Date;


public class CandidatoAPalestrante {
    
    private String emailPrincipal;
    private String pessoaQueIndicou;
    private String contatoPessoaIndicou;

    private String miniCurriculo;
    private String areaDeAtuacao;
    private String nome;
    private byte[] foto;

    private String titulo;
    private String uniclink;

    private String emails;
    private String telefone;


    public CandidatoAPalestrante(String emailPrincipal, String pessoaQueIndicou, 
        String contatoPessoaIndicou, String miniCurriculo, String areaDeAtuacao, String nome, 
            byte[] foto, String titulo, String uniclink, String emails, String telefone) {
        this.emailPrincipal = emailPrincipal;
        this.pessoaQueIndicou = pessoaQueIndicou;
        this.contatoPessoaIndicou = contatoPessoaIndicou;
        this.miniCurriculo = miniCurriculo;
        this.areaDeAtuacao = areaDeAtuacao;
        this.nome = nome;
        this.foto = foto;
        this.titulo = titulo;
        this.uniclink = uniclink;
        this.emails = emails;
        this.telefone = telefone;
    }

    // Tabela CandidatoAPalestrante
    public CandidatoAPalestrante(String emailPrincipal, String pessoaQueIndicou, String miniCurriculo) {
        this.emailPrincipal = emailPrincipal;
        this.pessoaQueIndicou = pessoaQueIndicou;
        this.miniCurriculo = miniCurriculo;
    }

    // Tabela DescricaoCandidato
    public CandidatoAPalestrante(String emailPrincipal, String miniCurriculo, String areaDeAtuacao, String nome, byte[] foto) {
        this.emailPrincipal = emailPrincipal;
        this.miniCurriculo = miniCurriculo;
        this.areaDeAtuacao = areaDeAtuacao;
        this.nome = nome;
        this.foto = foto;
    }

    // Tabela LinksTrabalhosCandPalest
    public CandidatoAPalestrante(String emailPrincipal, String titulo, String uniclink) {
        this.emailPrincipal = emailPrincipal;
        this.titulo = titulo;
        this.uniclink = uniclink;
    }

    // Tabela EmailsSecundariosCandPalestr
    public CandidatoAPalestrante(String emailPrincipal, String emails) {
        this.emailPrincipal = emailPrincipal;
        this.emails = emails;
    }

    // Tabela TelefonesCandidatoPalest
    public CandidatoAPalestrante(String emailPrincipal, String telefone) {
        this.emailPrincipal = emailPrincipal;
        this.telefone = telefone;
    }

    public String getEmailPrincipal(){
        return this.emailPrincipal;
    }

    public void setEmailPrincipal(String emailPrincipal){
        this.emailPrincipal = emailPrincipal;
    }

    public String getPessoaQueIndicou(){
        return this.pessoaQueIndicou;
    }

    public void setPessoaQueIndicou(String pessoaQueIndicou){
        this.pessoaQueIndicou = pessoaQueIndicou;
    }

    public String getContatoPessoaIndicou(){
        return this.contatoPessoaIndicou;
    }

    public void setContatoPessoaIndicou(){
        this.contatoPessoaIndicou = contatoPessoaIndicou;
    }

    public String getMiniCurriculo(){
        return this.miniCurriculo;
    }

    public void setMiniCurriculo(String = miniCurriculo){
        this.miniCurriculo = miniCurriculo;
    }

    public String getAreaDeAtuacao(){
        return this.areaDeAtuacao;
    }

    public void setAreaDeAtuacao(String areaDeAtuacao){
        this.areaDeAtuacao = areaDeAtuacao;
    }

    public String getNome(){
        return this.nome;
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public byte[] getFoto(){
        return this.foto;
    }

    public void setFoto(byte[] foto){
        this.foto = foto;
    }

    public String getTitulo(){
        return this.titulo;
    }

    public void setTitulo(String titulo){
        this.titulo = titulo
    }

    public String getUniclink(){
        return this.uniclink;
    }

    public void setUniclink(String uniclink){
        this.uniclink = uniclink;
    }

    public String getEmails(){
        return this.emails;
    }

    public void setEmails(String emails){
        this.emails = emails;
    }

    public String getTelefones(){
        return this.telefone;
    }

    public void setTelefones(String telefone){
        this.telefone = telefone;
    }
}