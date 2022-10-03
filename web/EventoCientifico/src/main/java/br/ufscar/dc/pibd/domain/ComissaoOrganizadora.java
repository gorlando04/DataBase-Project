package br.ufscar.dc.pibd.domain;

public class ComissaoOrganizadora{

    private String edicao;
    private String sigla;
    private int ano;
    private String pais;

    public ComissaoOrganizadora(String edicao, String sigla, int ano, String pais) {
        this.edicao = edicao;
        this.sigla = sigla;
        this.ano = ano;
        this.pais = pais;
    }

    public String getEdicao() {
        return edicao;
    }

    public void setEdicao(String edicao) {
        this.edicao = edicao;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    
}