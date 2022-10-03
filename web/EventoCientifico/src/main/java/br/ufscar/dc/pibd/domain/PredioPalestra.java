package br.ufscar.dc.pibd.domain;

public class PredioPalestra {
    private int numeroDeSala;
    private int andar;
    private String predio;
    
    
    public PredioPalestra(int numeroDeSala, int andar, String predio) {
        this.numeroDeSala = numeroDeSala;
        this.andar = andar;
        this.predio = predio;
    }
    public int getNumeroDeSala() {
        return numeroDeSala;
    }

    public void setNumeroDeSala(int numeroDeSala) {
        this.numeroDeSala = numeroDeSala;
    }

    public int getAndar() {
        return andar;
    }
    public void setAndar(int andar) {
        this.andar = andar;
    }

    public String getPredio() {
        return predio;
    }
    public void setPredio(String predio) {
        this.predio = predio;
    }
    
}
