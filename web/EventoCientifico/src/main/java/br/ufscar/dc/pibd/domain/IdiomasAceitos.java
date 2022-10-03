package br.ufscar.dc.pibd.domain;

public class IdiomasAceitos {
    private String idioma;
    private Long idEdital;
    public IdiomasAceitos(String idioma, Long idEdital){
        this.idioma = idioma;
        this.idEdital = idEdital;
    }   

    public String getIdioma(){
        return this.idioma;
    }

    public void setIdioma(String idioma){
        this.idioma = idioma;
    }
    
    public Long getIdEdital(){
        return this.idEdital;
    }

    public void setIdEdital(Long idEdital){
        this.idEdital = idEdital;
    }
}
