package br.ufscar.dc.pibd.domain;

public class Eixo {
    public Long idEixo;
    public Long idEdital;
    public String nomeEixo;

    public Eixo(Long idEixo, Long idEdital, String nomeEixo){
        this.idEixo = idEixo;
        this.idEdital = idEdital;
        this.nomeEixo = nomeEixo;
    }

    public Long getIdEixo(){
        return this.idEixo;
    }

    public void setIdEixo(Long idEixo){
        this.idEixo = idEixo;
    }

    public Long getIdEdital(){
        return this.idEdital;
    }

    public void setIdEdital(Long idEdital){
        this.idEdital = idEdital;
    }

    public String getNomeEixo(){
        return this.nomeEixo;
    }

    public void setNomeEixo(String nomeEixo){
        this.nomeEixo = nomeEixo;
    }
}
