package br.ufscar.dc.pibd.domain;

public class Artigo {
    private Long idTrabalho;
    private String tipoArtigo;

    public Long getIdTrabalho() {
        return idTrabalho;
    }

    public void setIdTrabalho(Long idTrabalho) {
        this.idTrabalho = idTrabalho;
    }

    public String getTipoArtigo() {
        return tipoArtigo;
    }

    public void setTipoArtigo(String tipoArtigo) {
        this.tipoArtigo = tipoArtigo;
    }
    
    public Artigo(Long idTrabalho, String tipoArtigo) {
        this.idTrabalho = idTrabalho;
        this.tipoArtigo = tipoArtigo;
    }
    
}
