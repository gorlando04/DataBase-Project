package br.ufscar.dc.pibd.domain;

public class MembroComiteConvite {
    
    private Long idCompostoPor;

    public MembroComiteConvite(Long idCompostoPor) {
        this.idCompostoPor = idCompostoPor;
    }

    public Long getIdCompostoPor() {
        return idCompostoPor;
    }

    public void setIdCompostoPor(Long idCompostoPor) {
        this.idCompostoPor = idCompostoPor;
    }

}
