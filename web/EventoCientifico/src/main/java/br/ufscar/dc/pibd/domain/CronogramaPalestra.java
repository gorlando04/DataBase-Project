package br.ufscar.dc.pibd.domain;

import java.sql.Time;
import java.util.Date;

import org.postgresql.util.PGTime;

public class CronogramaPalestra {

	private int idAbordagem;
	private int idPalestra;
    private String tipoEvento;
	// tem esses tipos aqui em java?
	private Date dataDaPalestra;
	private Time horaDaPalestra;
	private String duracaoPrevista;
	private int numeroDeSala;
	private String predio;
    
    public CronogramaPalestra(int idAbordagem, int idPalestra) {
        this.idAbordagem = idAbordagem;
		this.idPalestra = idPalestra;
    }

    public CronogramaPalestra(String tipoEvento, Date dataDaPalestra, Time horaDaPalestra, String duracaoPrevista, int numeroDeSala, String predio) {
        
    	this.tipoEvento = tipoEvento;
		this.dataDaPalestra = dataDaPalestra;
		this.horaDaPalestra = horaDaPalestra;
		this.duracaoPrevista = duracaoPrevista;
		this.numeroDeSala = numeroDeSala;
		this.predio = predio;
    }

    public CronogramaPalestra(int idAbordagem, int idPalestra, String tipoEvento, Date dataDaPalestra, PGTime horaDaPalestra, String duracaoPrevista, int numeroDeSala, String predio) {
        this(tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio);
        this.idAbordagem = idAbordagem;
		this.idPalestra = idPalestra;
    }
    
	public int getIdAbordagem() {
		return idAbordagem;
	}
	public void setIdAbordagem(int idAbordagem) {
		this.idAbordagem = idAbordagem;
	}

	public int getIdPalestra() {
		return idPalestra;
	}
	public void setIdPalestra(int idPalestra) {
		this.idPalestra = idPalestra;
	}

	public String getTipoEvento() {
		return tipoEvento;
	}
	public void setTipoEvento(String tipoEvento) {
		this.tipoEvento = tipoEvento;
	}

	public Date getDataDaPalestra() {
		return dataDaPalestra;
	}
	public void setDataDaPalestra(Date dataDaPalestra) {
		this.dataDaPalestra = dataDaPalestra;
	}

	public Time getHoraDaPalestra() {
		return this.horaDaPalestra;
	}
	public void setHoraDaPalestra(PGTime horaDaPalestra) {
		this.horaDaPalestra = horaDaPalestra;
	}

	public String getDuracaoPrevista() {
		return duracaoPrevista;
	}
	public void setDuracaoPrevista(String duracaoPrevista) {
		this.duracaoPrevista = duracaoPrevista;
	}

	public int getNumeroDeSala() {
		return numeroDeSala;
	}
	public void setNumeroDeSala(int numeroDeSala) {
		this.numeroDeSala = numeroDeSala;
	}

	public String getPredio() {
		return predio;
	}
	public void setPredio(String predio) {
		this.predio = predio;
	}
}
