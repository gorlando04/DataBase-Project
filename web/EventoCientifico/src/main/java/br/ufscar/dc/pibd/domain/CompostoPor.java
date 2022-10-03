package br.ufscar.dc.pibd.domain;

public class CompostoPor {
    
    private Long idCompostoPor;
    private Long idPessoa;
    private Long idComite;
    private String ehResponsavel;
    private String ehCorresponsavel;
    
    public CompostoPor(Long idCompostoPor, Long idPessoa, Long idComite, String ehResponsavel,
            String ehCorresponsavel) {
        this.idCompostoPor = idCompostoPor;
        this.idPessoa = idPessoa;
        this.idComite = idComite;
        this.ehResponsavel = ehResponsavel;
        this.ehCorresponsavel = ehCorresponsavel;
    }

    public CompostoPor(Long idPessoa, Long idComite, String ehResponsavel, String ehCorresponsavel) {
        this.idPessoa = idPessoa;
        this.idComite = idComite;
        this.ehResponsavel = ehResponsavel;
        this.ehCorresponsavel = ehCorresponsavel;
    }

    public Long getIdCompostoPor() {
        return idCompostoPor;
    }

    public void setIdCompostoPor(Long idCompostoPor) {
        this.idCompostoPor = idCompostoPor;
    }

    public Long getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Long idPessoa) {
        this.idPessoa = idPessoa;
    }

    public Long getIdComite() {
        return idComite;
    }

    public void setIdComite(Long idComite) {
        this.idComite = idComite;
    }

    public String getEhResponsavel() {
        return ehResponsavel;
    }

    public void setEhResponsavel(String ehResponsavel) {
        this.ehResponsavel = ehResponsavel;
    }

    public String getEhCorresponsavel() {
        return ehCorresponsavel;
    }

    public void setEhCorresponsavel(String ehCorresponsavel) {
        this.ehCorresponsavel = ehCorresponsavel;
    }
    
    
}
