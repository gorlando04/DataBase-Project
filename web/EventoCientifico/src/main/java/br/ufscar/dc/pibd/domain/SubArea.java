package br.ufscar.dc.pibd.domain;

public class SubArea {
    public Long idArea;
    public String nomeSubArea;

    public SubArea(Long idArea, String nomeSubArea){
        this.idArea = idArea;
        this.nomeSubArea = nomeSubArea;
    }

    public Long getIdArea(){
        return this.idArea;
    }

    public void setIdArea(Long idArea){
        this.idArea = idArea;
    }

    public String getnomeSubArea(){
        return this.nomeSubArea;
    }

    public void setnomeSubArea(String nomeSubArea){
        this.nomeSubArea = nomeSubArea;
    } 
}
