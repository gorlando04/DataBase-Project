package br.ufscar.dc.pibd.domain;

public class VersaoSintese {
    private Long idTrabalho;
    private String idioma;
    private String texto;
    private boolean ehPrimario;

    public VersaoSintese(Long idTrabalho, String idioma, String texto, boolean ehPrimario) {
        this.idTrabalho = idTrabalho;
        this.idioma = idioma;
        this.texto = texto;
        this.ehPrimario = ehPrimario;
    }

    public Long getIdTrabalho() {
        return idTrabalho;
    }

    public void setIdTrabalho(Long idTrabalho) {
        this.idTrabalho = idTrabalho;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public boolean getEhPrimario() {
        return ehPrimario;
    }

    public void setEhPrimario(boolean ehPrimario) {
        this.ehPrimario = ehPrimario;
    }
    

    

}
