package br.ufscar.dc.pibd.domain;

import java.sql.Time;

public class DocumentoCronogramaPalestra {
    private Long idAbordagem;
    private Time dataEntrega;
    private byte[] documento;
    private String titulo;
    private String tipo;
    private String statusAtendimentoEnvio;

    public DocumentoCronogramaPalestra(Long idAbordagem, Time dataEntrega, byte[] documento, String titulo, String tipo,
            String statusAtendimentoEnvio) {
        this.idAbordagem = idAbordagem;
        this.dataEntrega = dataEntrega;
        this.documento = documento;
        this.titulo = titulo;
        this.tipo = tipo;
        this.statusAtendimentoEnvio = statusAtendimentoEnvio;
    }

    public Long getIdAbordagem() {
        return idAbordagem;
    }

    public void setIdAbordagem(Long idAbordagem) {
        this.idAbordagem = idAbordagem;
    }

    public Time getDataEntrega() {
        return dataEntrega;
    }

    public void setDataEntrega(Time dataEntrega) {
        this.dataEntrega = dataEntrega;
    }

    public byte[] getDocumento() {
        return documento;
    }

    public void setDocumento(byte[] documento) {
        this.documento = documento;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
 
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getStatusAtendimentoEnvio() {
        return statusAtendimentoEnvio;
    }

    public void setStatusAtendimentoEnvio(String statusAtendimentoEnvio) {
        this.statusAtendimentoEnvio = statusAtendimentoEnvio;
    }
    
}
