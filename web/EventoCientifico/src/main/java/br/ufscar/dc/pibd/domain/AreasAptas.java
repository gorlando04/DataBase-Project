package br.ufscar.dc.pibd.domain;

public class AreasAptas {

    private Long idAvaliador;
    private String areaApta;
    
    public AreasAptas(Long idAvaliador, String areaApta) {
        this.idAvaliador = idAvaliador;
        this.areaApta = areaApta;
    }

    public Long getIdAvaliador() {
        return idAvaliador;
    }

    public void setIdAvaliador(Long idAvaliador) {
        this.idAvaliador = idAvaliador;
    }

    public String getAreaApta() {
        return areaApta;
    }

    public void setAreaApta(String areaApta) {
        this.areaApta = areaApta;
    }

    
    
}
