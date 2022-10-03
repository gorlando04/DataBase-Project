package br.ufscar.dc.pibd.domain;

public class AreasInaptas {

    private Long idAvaliador;
    private String areaInapta;
    
    public AreasInaptas(Long idAvaliador, String areaInapta) {
        this.idAvaliador = idAvaliador;
        this.areaInapta = areaInapta;
    }

    public Long getIdAvaliador() {
        return idAvaliador;
    }

    public void setIdAvaliador(Long idAvaliador) {
        this.idAvaliador = idAvaliador;
    }

    public String getAreaInapta() {
        return areaInapta;
    }

    public void setAreaInapta(String areaInapta) {
        this.areaInapta = areaInapta;
    }

    
    
}
