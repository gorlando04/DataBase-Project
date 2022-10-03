package br.ufscar.dc.pibd.domain;

public class Regra {
    public Long idEdital;
    public String descricao;
    public byte[] modelo;

    public Regra(Long idEdital, String descricao, byte[] modelo){
        this.idEdital = idEdital;
        this.descricao = descricao;
        this.modelo = modelo;
    }

    public Long getIdEdital(){
        return this.idEdital;
    }

    public void setIdEdital(Long idEdital){
        this.idEdital = idEdital;
    }

    public String getDescricao(){
        return this.descricao;
    }

    public void setDescricao(String descricao){
        this.descricao = descricao;
    }

    public byte[] getModelo(){
        return this.modelo;
    }

    public void setModelo(byte[] modelo){
        this.modelo = modelo;
    }
}
