package br.ufscar.dc.pibd.domain;

public class CertificadoAvaliador {
    private Long idAvaliador;
    private int codCertificado;
    
    
    public CertificadoAvaliador(Long idAvaliador, int codCertificado) {
        this.idAvaliador = idAvaliador;
        this.codCertificado = codCertificado;
    }

    public Long getIdAvaliador() {
        return idAvaliador;
    }

    public void setIdAvaliador(Long idAvaliador) {
        this.idAvaliador = idAvaliador;
    }

    public int getCodCertificado() {
        return codCertificado;
    }

    public void setCodCertificado(int codCertificado) {
        this.codCertificado = codCertificado;
    }
    
}
