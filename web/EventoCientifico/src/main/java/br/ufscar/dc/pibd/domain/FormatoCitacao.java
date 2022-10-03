package br.ufscar.dc.pibd.domain;

public class FormatoCitacao {
    Long idAutor;
    String forma;
    

    public FormatoCitacao(Long idAutor, String forma) {
        this.idAutor = idAutor;
        this.forma = forma;
    }

    public Long getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(Long idAutor) {
        this.idAutor = idAutor;
    }

    
    public String getForma() {
        return forma;
    }

    public void setForma(String forma) {
        this.forma = forma;
    }
}
