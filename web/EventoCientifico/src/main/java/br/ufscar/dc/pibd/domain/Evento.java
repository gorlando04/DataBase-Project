package br.ufscar.dc.pibd.domain;

public class Evento {
	
	private String sigla;
    private String nomeExtenso; 
	private String pais;
	private String estado;
	private String cidade;
	private String bairro; 
	private String cep;
    private int numero;
	private String logradouro;
	private String complemento;
	
	
	public Evento(String sigla) {
        this.sigla = sigla;
    }

    public Evento(String sigla, String nomeExtenso, String pais, String estado, String cidade, String bairro,
    		String cep, int numero, String logradouro, String complemento) {
    	
    	this.sigla = sigla;
    	this.nomeExtenso = nomeExtenso;
    	this.pais = pais;
        this.estado = estado;
        this.cidade = cidade;
        this.bairro = bairro;
        this.cep = cep;
    	this.numero = numero;
    	this.logradouro = logradouro;
        this.complemento = complemento;
    }
    
    public Evento(String sigla, String nomeExtenso,
    		String cep, int numero, String complemento) {
    	
    	this.sigla = sigla;
    	this.nomeExtenso = nomeExtenso;
        this.cep = cep;
    	this.numero = numero;
        this.complemento = complemento;
    }

	
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public String getNomeExtenso() {
		return nomeExtenso;
	}
	public void setNomeExtenso(String nomeExtenso) {
		this.nomeExtenso = nomeExtenso;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}
	
	
}
