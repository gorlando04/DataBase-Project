package br.ufscar.dc.pibd.domain;

public class SubEixo {
    public Long idEixo;
    public String nomeSubEixo;

    public SubEixo(Long idEixo, String nomeSubEixo){
        this.idEixo = idEixo;
        this.nomeSubEixo = nomeSubEixo;
    }

    public Long getIdEixo(){
        return this.idEixo;
    }

    public void setIdEixo(Long idEixo){
        this.idEixo = idEixo;
    }

    public String getnomeSubEixo(){
        return this.nomeSubEixo;
    }

    public void setnomeSubEixo(String nomeSubEixo){
        this.nomeSubEixo = nomeSubEixo;
    } 
}
