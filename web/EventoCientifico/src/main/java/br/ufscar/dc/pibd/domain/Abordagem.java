package br.ufscar.dc.pibd.domain;

import java.sql.Date;

public class Abordagem {

	private int idAbordagem;
	private int idCompostoPor;
	private String emailPrincipal;
	private Date dataHoraAbordagem;
	private String conteudo;
	private String meioComunicacao1;
	private String meioComunicacao2;
	private String meioComunicacao3;
	
	public Abordagem(int idAbordagem) {
		this.idAbordagem = idAbordagem;
	}
	
	public Abordagem(int idCompostoPor, String emailPrincipal, Date dataHoraAbordagem, String conteudo, String meioComunicacao1, String meioComunicacao2, String meioComunicacao3) {
		this.idCompostoPor = idCompostoPor;
		this.emailPrincipal = emailPrincipal;
		this.dataHoraAbordagem = dataHoraAbordagem;
		this.conteudo = conteudo;
		this.meioComunicacao1 = meioComunicacao1;
		this.meioComunicacao2 = meioComunicacao2;
		this.meioComunicacao3 = meioComunicacao3;
		
	}
	
	public Abordagem(int idCompostoPor, String emailPrincipal, String conteudo, String meioComunicacao1, String meioComunicacao2, String meioComunicacao3) {
		this.idCompostoPor = idCompostoPor;
		this.emailPrincipal = emailPrincipal;
		this.conteudo = conteudo;
		this.meioComunicacao1 = meioComunicacao1;
		this.meioComunicacao2 = meioComunicacao2;
		this.meioComunicacao3 = meioComunicacao3;
		
	}
	
	public int getIdCompostoPor() {
		return idCompostoPor;
	}
	public void setIdCompostoPor(int idCompostoPor) {
		this.idCompostoPor = idCompostoPor;
	}
	public String getEmailPrincipal() {
		return emailPrincipal;
	}
	public void setEmailPrincipal(String emailPrincipal) {
		this.emailPrincipal = emailPrincipal;
	}
	public Date getDataHoraAbordagem() {
		return dataHoraAbordagem;
	}
	public void setDataHoraAbordagem(Date dataHoraAbordagem) {
		this.dataHoraAbordagem = dataHoraAbordagem;
	}
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public String getMeioComunicacao1() {
		return meioComunicacao1;
	}
	public void setMeioComunicacao1(String meioComunicacao1) {
		this.meioComunicacao1 = meioComunicacao1;
	}
	public String getMeioComunicacao2() {
		return meioComunicacao2;
	}
	public void setMeioComunicacao2(String meioComunicacao2) {
		this.meioComunicacao2 = meioComunicacao2;
	}
	public String getMeioComunicacao3() {
		return meioComunicacao3;
	}
	public void setMeioComunicacao3(String meioComunicacao3) {
		this.meioComunicacao3 = meioComunicacao3;
	}
	public int getIdAbordagem() {
		return idAbordagem;
	}
	public void setIdAbordagem(int idAbordagem) {
		this.idAbordagem = idAbordagem;
	}
	
	
	
	
}
