package br.ufscar.dc.pibd.domain;

public class Area {
    public Long idArea;
    public Long idEdital;
    public String nomeArea;

    public Area(Long idArea, Long idEdital, String nomeArea){
        this.idArea = idArea;
        this.idEdital = idEdital;
        this.nomeArea = nomeArea;
    }

    public Long getIdArea(){
        return this.idArea;
    }

    public void setIdArea(Long idArea){
        this.idArea = idArea;
    }

    public Long getIdEdital(){
        return this.idEdital;
    }

    public void setIdEdital(Long idEdital){
        this.idEdital = idEdital;
    }

    public String getNomeArea(){
        return this.nomeArea;
    }

    public void setNomeArea(String nomeArea){
        this.nomeArea = nomeArea;
    }
}
