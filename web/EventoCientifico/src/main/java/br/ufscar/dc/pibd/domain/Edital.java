package br.ufscar.dc.pibd.domain;

import java.sql.Date;


public class Edital {
    
    private Long id;
    private String sigla;
    private String url;
    private Date dataUltimaEdicao;
    private Date dataPublicacaoOriginal;

    public Edital(Long id){
        this.id = id;
    }

    public Edital(String sigla, String url, Date dataUltimaEdicao, Date dataPublicacaoOriginal){
        this.sigla = sigla;
        this.url = url;
        this.dataUltimaEdicao = dataUltimaEdicao;
        this.dataPublicacaoOriginal = dataPublicacaoOriginal;
    }

    public Edital(Long id, String sigla, String url, Date dataUltimaEdicao, Date dataPublicacaoOriginal){
        this.id = id;
        this.sigla = sigla;
        this.url = url;
        this.dataUltimaEdicao = dataUltimaEdicao;
        this.dataPublicacaoOriginal = dataPublicacaoOriginal;
    }

    public Long getId(){
        return this.id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public String getSigla(){
        return this.sigla;
    }

    public void setSigla(String sigla){
        this.sigla = sigla;
    }

    public String getUrl(){
        return this.url;
    }

    public void setUrl(String url){
        this.url = url;
    }

    public Date getDataUltimaEdicao(){
        return this.dataUltimaEdicao;
    }

    public void setDataUltimaEdicao(Date dataUltimaEdicao){
        this.dataUltimaEdicao = dataUltimaEdicao;
    }

    public Date getDataPublicacaoOriginal(){
        return this.dataPublicacaoOriginal;
    }

    public void setDataPublicacaoOriginal(Date dataPublicacaoOriginal){
        this.dataPublicacaoOriginal = dataPublicacaoOriginal;
    }

}
